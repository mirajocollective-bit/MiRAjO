// Money Moves — Stripe Customer Portal session
// Returns a short-lived URL for the subscriber to manage their plan
import Stripe from 'stripe';
import { createClient } from '@supabase/supabase-js';

const stripe   = new Stripe(process.env.STRIPE_SECRET_KEY);
const supabase = createClient(
  process.env.SUPABASE_URL,
  process.env.SUPABASE_SERVICE_ROLE_KEY
);

export default async function handler(req, res) {
  if (req.method !== 'POST') return res.status(405).end();

  const token = (req.headers['authorization'] || '').replace('Bearer ', '').trim();
  if (!token) return res.status(401).json({ error: 'Unauthorized' });

  const { data: { user }, error: authErr } = await supabase.auth.getUser(token);
  if (authErr || !user) return res.status(401).json({ error: 'Unauthorized' });

  const userId = user.id;

  const { data: sub } = await supabase
    .from('mm_subscriptions')
    .select('stripe_customer_id, status')
    .eq('user_id', userId)
    .single();

  if (!sub?.stripe_customer_id) {
    return res.status(404).json({ error: 'No subscription found' });
  }

  const session = await stripe.billingPortal.sessions.create({
    customer:   sub.stripe_customer_id,
    return_url: `${process.env.SITE_URL}/tools/money-moves/settings`,
  });

  return res.status(200).json({ url: session.url });
}
