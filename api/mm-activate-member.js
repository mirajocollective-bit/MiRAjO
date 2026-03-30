// Money Moves — activate an invited household member
// Called from confirm.html after the invited user's session is established
// The user's access token is passed as Authorization header so we can verify identity
import { createClient } from '@supabase/supabase-js';

const supabase = createClient(
  process.env.SUPABASE_URL,
  process.env.SUPABASE_SERVICE_ROLE_KEY
);

export default async function handler(req, res) {
  if (req.method !== 'POST') {
    return res.status(405).json({ error: 'Method not allowed' });
  }

  const authHeader = req.headers.authorization || '';
  const accessToken = authHeader.replace('Bearer ', '').trim();
  if (!accessToken) {
    return res.status(401).json({ error: 'Missing access token' });
  }

  // Verify the token and get the user
  const { data: { user }, error: userErr } = await supabase.auth.getUser(accessToken);
  if (userErr || !user) {
    return res.status(401).json({ error: 'Invalid or expired token' });
  }

  // Find any pending invites for this user
  const { data: invites, error: fetchErr } = await supabase
    .from('mm_members')
    .select('id, household_id')
    .eq('user_id', user.id)
    .eq('status', 'invited');

  if (fetchErr) {
    console.error('[mm-activate-member] Fetch error:', fetchErr.message);
    return res.status(500).json({ error: fetchErr.message });
  }

  if (!invites || invites.length === 0) {
    // Not an invited member — nothing to do (existing subscriber or owner)
    return res.status(200).json({ activated: false });
  }

  // Activate all pending invites (usually just one)
  const { error: updateErr } = await supabase
    .from('mm_members')
    .update({ status: 'active', updated_at: new Date().toISOString() })
    .eq('user_id', user.id)
    .eq('status', 'invited');

  if (updateErr) {
    console.error('[mm-activate-member] Update error:', updateErr.message);
    return res.status(500).json({ error: updateErr.message });
  }

  // Create preferences record if it doesn't exist yet
  await supabase.from('mm_preferences').upsert({
    user_id:          user.id,
    personality_mode: 'mom',
    updated_at:       new Date().toISOString(),
  }, { onConflict: 'user_id', ignoreDuplicates: true });

  console.log(`[mm-activate-member] Activated ${user.email} in ${invites.length} household(s)`);
  return res.status(200).json({ activated: true, households: invites.map(i => i.household_id) });
}
