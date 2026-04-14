import Stripe from 'stripe';
import { createClient } from '@supabase/supabase-js';

const stripe   = new Stripe(process.env.STRIPE_SECRET_KEY);
const supabase = createClient(process.env.SUPABASE_URL, process.env.SUPABASE_SERVICE_ROLE_KEY);

export default async function handler(req, res) {
  if (req.method !== 'POST') return res.status(405).json({ error: 'Method not allowed' });

  const token = req.headers.authorization?.replace('Bearer ', '');
  if (!token) return res.status(401).json({ error: 'Unauthorized' });

  const { data: { user }, error: authErr } = await supabase.auth.getUser(token);
  if (authErr || !user) return res.status(401).json({ error: 'Unauthorized' });

  const { session_id } = req.body || {};
  if (!session_id) return res.status(400).json({ error: 'Missing session_id' });

  let session;
  try {
    session = await stripe.checkout.sessions.retrieve(session_id, {
      expand: ['subscription'],
    });
  } catch (err) {
    console.error('mm-verify-checkout: Stripe retrieve error', err.message);
    return res.status(400).json({ error: 'Invalid session_id' });
  }

  if (session.status !== 'complete') {
    return res.status(200).json({ verified: false, reason: 'payment_incomplete' });
  }

  const sub = session.subscription;
  if (!sub) {
    return res.status(200).json({ verified: false, reason: 'no_subscription' });
  }

  const plan      = sub.metadata?.plan    || session.metadata?.plan    || 'individual';
  const billing   = sub.metadata?.billing || session.metadata?.billing || 'monthly';
  const periodEnd = new Date(sub.current_period_end * 1000).toISOString();
  const custId    = typeof sub.customer === 'string' ? sub.customer : sub.customer?.id;

  const { error: upsertErr } = await supabase.from('mm_subscriptions').upsert({
    user_id:                user.id,
    stripe_customer_id:     custId,
    stripe_subscription_id: sub.id,
    plan,
    billing,
    status:     sub.status,
    period_end: periodEnd,
    updated_at: new Date().toISOString(),
  }, { onConflict: 'user_id' });

  if (upsertErr) {
    console.error('mm-verify-checkout: Supabase upsert error', upsertErr);
    return res.status(500).json({ error: upsertErr.message });
  }

  console.log(`mm-verify-checkout: subscription confirmed for ${user.email} (${sub.id})`);
  return res.status(200).json({ verified: true });
}
