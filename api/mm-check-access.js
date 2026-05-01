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

  // 'active' status means Stripe (or an admin) has confirmed this is a paying account —
  // trust it regardless of period_end (webhooks update status when payment fails/cancels).
  // 'trialing' accounts still need period_end checked since no payment has been collected yet.
  const hasActive    = sub && sub.status === 'active';
  const hasValidTrial = sub && sub.status === 'trialing' && new Date(sub.period_end) >= new Date();

  if (!hasActive && !hasValidTrial) {
    return res.status(200).json({ access: false, reason: 'no_subscription' });
  }

  return res.status(200).json({ access: true });
}
