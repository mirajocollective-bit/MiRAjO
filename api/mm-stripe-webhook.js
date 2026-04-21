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
    // Always try invite first — works for new users and re-invites unconfirmed users.
    // If the user already has a confirmed account, fall back to a magic link via Resend.
    let userId;
    const { data: invited, error: inviteErr } = await supabase.auth.admin.inviteUserByEmail(email, {
      data: { product: 'money-moves' },
      redirectTo: `${process.env.SITE_URL}/tools/money-moves/confirm?setup=1`,
    });

    if (!inviteErr) {
      userId = invited.user.id;
    } else {
      // User already confirmed — look them up and send a magic link via Resend
      console.log(`Money Moves: user exists (${inviteErr.message}), sending magic link to ${email}`);

      const { data: { users: allUsers } } = await supabase.auth.admin.listUsers({ perPage: 1000 });
      const existingUser = allUsers?.find(u => u.email === email);

      if (!existingUser) {
        console.error('Money Moves: could not locate existing user', email);
        return res.status(200).json({ received: true });
      }
      userId = existingUser.id;

      // Generate a magic link so they can access the account immediately
      const { data: linkData, error: linkErr } = await supabase.auth.admin.generateLink({
        type: 'magiclink',
        email,
        options: { redirectTo: `${process.env.SITE_URL}/tools/money-moves/dashboard?welcome=1` },
      });

      if (!linkErr && linkData?.properties?.action_link) {
        await fetch('https://api.resend.com/emails', {
          method: 'POST',
          headers: { 'Authorization': `Bearer ${process.env.RESEND_API_KEY}`, 'Content-Type': 'application/json' },
          body: JSON.stringify({
            from: 'Miranda J <programs@mirajoco.org>',
            to: email,
            subject: 'Your Money Moves subscription is active',
            html: `<div style="font-family:sans-serif;max-width:520px;margin:0 auto;padding:40px 24px;">
              <img src="https://www.mirajoco.org/img/logo-horizontal.png" alt="MiRAjO" style="height:48px;margin-bottom:32px;">
              <h2 style="font-size:22px;color:#122012;margin:0 0 16px;">Your account is ready.</h2>
              <p style="font-size:15px;color:#3A4E38;line-height:1.75;margin:0 0 24px;">Your Money Moves subscription is active. Click below to access your dashboard — no password needed for this link.</p>
              <a href="${linkData.properties.action_link}" style="display:inline-block;padding:14px 32px;background:#122012;color:#F2EBD9;text-decoration:none;border-radius:8px;font-size:14px;font-weight:700;">Access Money Moves &rarr;</a>
              <p style="font-size:13px;color:#999;margin-top:32px;">This link expires in 24 hours. After that, use <a href="${process.env.SITE_URL}/tools/money-moves/login" style="color:#256B42;">the login page</a> to sign in.</p>
            </div>`,
          }),
        });
        console.log(`Money Moves: magic link sent to existing user ${email}`);
      } else {
        console.error('Money Moves: generateLink failed for', email, linkErr);
      }
    }

    // Record subscription (check first to avoid duplicates)
    const subData = {
      stripe_customer_id:     customerId,
      stripe_subscription_id: subscription.id,
      plan,
      billing,
      status:     'active',
      period_end: periodEnd,
      updated_at: new Date().toISOString(),
    };
    const { data: existingSub } = await supabase
      .from('mm_subscriptions').select('id').eq('user_id', userId).maybeSingle();
    if (existingSub) {
      await supabase.from('mm_subscriptions').update(subData).eq('user_id', userId);
    } else {
      await supabase.from('mm_subscriptions').insert({ user_id: userId, ...subData });
    }

    // Create household only if one doesn't already exist for this user
    const { data: existingHousehold } = await supabase
      .from('mm_households')
      .select('id')
      .eq('owner_id', userId)
      .maybeSingle();

    let householdId;
    if (existingHousehold) {
      householdId = existingHousehold.id;
    } else {
      const { data: household, error: hhErr } = await supabase
        .from('mm_households')
        .insert({ owner_id: userId, name: 'My Household' })
        .select('id')
        .single();

      if (hhErr) {
        console.error('Money Moves household error:', hhErr);
        return res.status(500).json({ error: hhErr.message });
      }
      householdId = household.id;

      // Seed defaults only for new households
      const accountRows = DEFAULT_ACCOUNTS.map(a => ({ ...a, household_id: householdId }));
      await supabase.from('mm_accounts').insert(accountRows);

      const categoryRows = DEFAULT_CATEGORIES.map(c => ({ ...c, household_id: householdId }));
      await supabase.from('mm_categories').insert(categoryRows);
    }

    // Add owner as member (ignore if already exists)
    await supabase.from('mm_members').upsert({
      household_id: householdId,
      user_id:      userId,
      email,
      role:   'owner',
      status: 'active',
    }, { onConflict: 'household_id,user_id', ignoreDuplicates: true });

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
