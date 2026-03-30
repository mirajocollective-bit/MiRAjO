import Stripe from 'stripe';
import { createClient } from '@supabase/supabase-js';

const stripe  = new Stripe(process.env.STRIPE_SECRET_KEY);
const supabase = createClient(
  process.env.SUPABASE_URL,
  process.env.SUPABASE_SERVICE_ROLE_KEY
);

// Default accounts seeded for every new household
const DEFAULT_ACCOUNTS = [
  { name: 'Checking', type: 'checking', current_balance: 0, color: '#256B42', sort_order: 0 },
  { name: 'Savings',  type: 'savings',  current_balance: 0, color: '#C4A245', sort_order: 1 },
];

// Default categories seeded for every new household
const DEFAULT_CATEGORIES = [
  { name: 'Salary',            type: 'income',  color: '#6DC48A' },
  { name: 'Freelance',         type: 'income',  color: '#6DC48A' },
  { name: 'Side Hustle',       type: 'income',  color: '#6DC48A' },
  { name: 'Investments',       type: 'income',  color: '#6DC48A' },
  { name: 'Other Income',      type: 'income',  color: '#6DC48A' },
  { name: 'Housing',           type: 'expense', color: '#C4A245' },
  { name: 'Food & Groceries',  type: 'expense', color: '#C4A245' },
  { name: 'Transportation',    type: 'expense', color: '#C4A245' },
  { name: 'Utilities',         type: 'expense', color: '#C4A245' },
  { name: 'Healthcare',        type: 'expense', color: '#C4A245' },
  { name: 'Entertainment',     type: 'expense', color: '#C4A245' },
  { name: 'Clothing',          type: 'expense', color: '#C4A245' },
  { name: 'Education',         type: 'expense', color: '#C4A245' },
  { name: 'Savings Transfer',  type: 'expense', color: '#C4A245' },
  { name: 'Business',          type: 'expense', color: '#C4A245' },
  { name: 'Other',             type: 'expense', color: '#C4A245' },
];

export const config = { api: { bodyParser: false } };

async function getRawBody(req) {
  return new Promise((resolve, reject) => {
    const chunks = [];
    req.on('data', (chunk) => chunks.push(chunk));
    req.on('end',  () => resolve(Buffer.concat(chunks)));
    req.on('error', reject);
  });
}

export default async function handler(req, res) {
  if (req.method !== 'POST') {
    return res.status(405).json({ error: 'Method not allowed' });
  }

  const rawBody = await getRawBody(req);
  const sig     = req.headers['stripe-signature'];

  let event;
  try {
    event = stripe.webhooks.constructEvent(rawBody, sig, process.env.MM_STRIPE_WEBHOOK_SECRET);
  } catch (err) {
    console.error('Money Moves webhook signature error:', err.message);
    return res.status(400).json({ error: `Webhook error: ${err.message}` });
  }

  // ── subscription.created → provision account ──────────────────────────────
  if (event.type === 'customer.subscription.created') {
    const subscription = event.data.object;
    const customerId   = subscription.customer;
    const plan         = subscription.metadata?.plan    || 'individual';
    const billing      = subscription.metadata?.billing || 'monthly';
    const periodEnd    = new Date(subscription.current_period_end * 1000).toISOString();

    // Get email from Stripe customer
    const customer = await stripe.customers.retrieve(customerId);
    const email    = customer.email;

    if (!email) {
      console.error('Money Moves webhook: no email on Stripe customer', customerId);
      return res.status(200).json({ received: true });
    }

    // Find or create Supabase auth user
    const { data: existingUsers } = await supabase
      .from('auth.users')
      .select('id')
      .eq('email', email)
      .limit(1);

    let userId;
    if (existingUsers && existingUsers.length > 0) {
      userId = existingUsers[0].id;
    } else {
      // Invite user — they'll get a magic link to set up their account
      const { data: invited, error: inviteErr } = await supabase.auth.admin.inviteUserByEmail(email, {
        data: { product: 'money-moves' },
        redirectTo: `${process.env.SITE_URL}/tools/money-moves/confirm`,
      });
      if (inviteErr) {
        console.error('Money Moves invite error:', inviteErr);
        return res.status(500).json({ error: inviteErr.message });
      }
      userId = invited.user.id;
    }

    // Record subscription
    await supabase.from('mm_subscriptions').upsert({
      user_id:                userId,
      stripe_customer_id:     customerId,
      stripe_subscription_id: subscription.id,
      plan,
      billing,
      status:     'active',
      period_end: periodEnd,
      updated_at: new Date().toISOString(),
    }, { onConflict: 'user_id' });

    // Create household
    const { data: household, error: hhErr } = await supabase
      .from('mm_households')
      .insert({ owner_id: userId, name: 'My Household' })
      .select('id')
      .single();

    if (hhErr) {
      console.error('Money Moves household error:', hhErr);
      return res.status(500).json({ error: hhErr.message });
    }

    const householdId = household.id;

    // Add owner as member
    await supabase.from('mm_members').insert({
      household_id: householdId,
      user_id:      userId,
      email,
      role:   'owner',
      status: 'active',
    });

    // Seed default accounts (Checking + Savings)
    const accountRows = DEFAULT_ACCOUNTS.map(a => ({ ...a, household_id: householdId }));
    await supabase.from('mm_accounts').insert(accountRows);

    // Seed default categories
    const categoryRows = DEFAULT_CATEGORIES.map(c => ({ ...c, household_id: householdId }));
    await supabase.from('mm_categories').insert(categoryRows);

    // Create default preferences
    await supabase.from('mm_preferences').upsert({
      user_id:          userId,
      personality_mode: 'mom',
      updated_at:       new Date().toISOString(),
    }, { onConflict: 'user_id' });

    console.log(`Money Moves: provisioned account for ${email} (${plan} / ${billing})`);
  }

  // ── subscription.updated → sync status ───────────────────────────────────
  if (event.type === 'customer.subscription.updated') {
    const subscription = event.data.object;
    const periodEnd    = new Date(subscription.current_period_end * 1000).toISOString();

    await supabase
      .from('mm_subscriptions')
      .update({
        status:     subscription.status,
        period_end: periodEnd,
        updated_at: new Date().toISOString(),
      })
      .eq('stripe_subscription_id', subscription.id);
  }

  // ── subscription.deleted → cancel ─────────────────────────────────────────
  if (event.type === 'customer.subscription.deleted') {
    const subscription = event.data.object;

    await supabase
      .from('mm_subscriptions')
      .update({ status: 'cancelled', updated_at: new Date().toISOString() })
      .eq('stripe_subscription_id', subscription.id);
  }

  return res.status(200).json({ received: true });
}
