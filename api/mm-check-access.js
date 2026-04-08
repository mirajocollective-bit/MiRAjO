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

  const isPending = !sub || sub.stripe_subscription_id === 'pending';
  const trialExpired = isPending && sub && new Date(sub.period_end) < new Date();
  const realSubActive = sub && ['active', 'trialing'].includes(sub.status) && sub.stripe_subscription_id !== 'pending';

  if (!realSubActive && (!sub || trialExpired)) {
    return res.status(200).json({ access: false, reason: 'no_subscription' });
  }

  return res.status(200).json({ access: true });
}
