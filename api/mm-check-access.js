import { createClient } from '@supabase/supabase-js';

const supabase = createClient(
  process.env.SUPABASE_URL,
  process.env.SUPABASE_SERVICE_ROLE_KEY
);

export default async function handler(req, res) {
  if (req.method !== 'GET') return res.status(405).json({ error: 'Method not allowed' });

  const authHeader = req.headers.authorization || '';
  const token = authHeader.replace('Bearer ', '');
  if (!token) return res.status(401).json({ access: false, reason: 'no_token' });

  const { data: { user }, error } = await supabase.auth.getUser(token);
  if (error || !user) return res.status(401).json({ access: false, reason: 'invalid_token' });

  const { data: sub } = await supabase
    .from('mm_subscriptions')
    .select('status, period_end, stripe_subscription_id')
    .eq('user_id', user.id)
    .maybeSingle();

  // Real Stripe subscribers (non-pending ID): trust status — Stripe updates it to
  // past_due/canceled when payment fails, so period_end is irrelevant for them.
  const isPending     = !sub || sub.stripe_subscription_id === 'pending';
  const realSubActive = !isPending && sub && ['active', 'trialing'].includes(sub.status);

  // Trial/manual accounts ('pending' ID): status='active' + period_end not yet passed.
  const trialActive = isPending && sub && sub.status === 'active' && new Date(sub.period_end) >= new Date();

  if (!realSubActive && !trialActive) {
    return res.status(200).json({ access: false, reason: 'no_subscription' });
  }

  return res.status(200).json({ access: true });
}
