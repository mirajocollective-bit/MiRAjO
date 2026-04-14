// api/mm-admin-fix-sub.js
// Admin-only: look up a user's Stripe subscription by email and sync it
// into mm_subscriptions so they can access the dashboard.
import Stripe from 'stripe';
import { createClient } from '@supabase/supabase-js';

const stripe   = new Stripe(process.env.STRIPE_SECRET_KEY);
const supabase = createClient(process.env.SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

function checkAuth(req) {
  const token = (req.headers.authorization || '').replace('Bearer ', '').trim();
  return token && token === process.env.ADMIN_PASSWORD;
}

export default async function handler(req, res) {
  res.setHeader('Access-Control-Allow-Origin', 'https://www.mirajoco.org');
  res.setHeader('Access-Control-Allow-Methods', 'POST, OPTIONS');
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type, Authorization');
  if (req.method === 'OPTIONS') return res.status(200).end();
  if (req.method !== 'POST') return res.status(405).json({ error: 'Method not allowed' });
  if (!checkAuth(req)) return res.status(401).json({ error: 'Unauthorized' });

  const { email } = req.body || {};
  if (!email) return res.status(400).json({ error: 'email is required' });

  const normalized = email.trim().toLowerCase();

  // ── 1. Find Supabase user ──────────────────────────────────────────────────
  const { data: { users }, error: listErr } = await supabase.auth.admin.listUsers({ perPage: 1000 });
  if (listErr) return res.status(500).json({ error: listErr.message });

  const sbUser = users.find(u => u.email?.toLowerCase() === normalized);
  if (!sbUser) return res.status(404).json({ error: `No Supabase user found for ${normalized}` });

  // ── 2. Find Stripe customer(s) by email ───────────────────────────────────
  const customers = await stripe.customers.list({ email: normalized, limit: 5 });
  if (!customers.data.length) {
    return res.status(404).json({ error: `No Stripe customer found for ${normalized}` });
  }

  // ── 3. Find their most recent active/trialing subscription ────────────────
  let bestSub = null;
  for (const customer of customers.data) {
    const subs = await stripe.subscriptions.list({
      customer: customer.id,
      status: 'all',
      limit: 5,
    });
    for (const sub of subs.data) {
      if (['active', 'trialing', 'past_due'].includes(sub.status)) {
        if (!bestSub || sub.created > bestSub.created) bestSub = sub;
      }
    }
  }

  if (!bestSub) {
    return res.status(404).json({ error: `No active/trialing Stripe subscription found for ${normalized}` });
  }

  const custId   = typeof bestSub.customer === 'string' ? bestSub.customer : bestSub.customer.id;
  const plan     = bestSub.metadata?.plan    || 'individual';
  const billing  = bestSub.metadata?.billing || 'monthly';
  const periodEnd = new Date(bestSub.current_period_end * 1000).toISOString();

  // ── 4. Upsert mm_subscriptions ────────────────────────────────────────────
  const { error: upsertErr } = await supabase.from('mm_subscriptions').upsert({
    user_id:                sbUser.id,
    stripe_customer_id:     custId,
    stripe_subscription_id: bestSub.id,
    plan,
    billing,
    status:     bestSub.status,
    period_end: periodEnd,
    updated_at: new Date().toISOString(),
  }, { onConflict: 'user_id' });

  if (upsertErr) return res.status(500).json({ error: upsertErr.message });

  // ── 5. Make sure they have a household (provision if missing) ─────────────
  const { data: existingMember } = await supabase
    .from('mm_members')
    .select('household_id')
    .eq('user_id', sbUser.id)
    .eq('status', 'active')
    .limit(1);

  if (!existingMember?.length) {
    const { data: hh } = await supabase
      .from('mm_households')
      .insert({ owner_id: sbUser.id, name: 'My Household' })
      .select('id')
      .single();

    if (hh) {
      await supabase.from('mm_members').insert({
        household_id: hh.id,
        user_id:      sbUser.id,
        email:        sbUser.email,
        role:         'owner',
        status:       'active',
      });
      await supabase.from('mm_preferences').upsert({
        user_id:          sbUser.id,
        personality_mode: 'mom',
        updated_at:       new Date().toISOString(),
      }, { onConflict: 'user_id' });
    }
  }

  console.log(`mm-admin-fix-sub: fixed ${normalized} → sub ${bestSub.id} (${bestSub.status})`);

  return res.status(200).json({
    success: true,
    user_id:         sbUser.id,
    email:           sbUser.email,
    stripe_sub_id:   bestSub.id,
    stripe_status:   bestSub.status,
    period_end:      periodEnd,
    had_household:   !!existingMember?.length,
  });
}
