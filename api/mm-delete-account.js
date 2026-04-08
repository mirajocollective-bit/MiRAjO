import { createClient } from '@supabase/supabase-js';

const supabase = createClient(
  process.env.SUPABASE_URL,
  process.env.SUPABASE_SERVICE_ROLE_KEY
);

export default async function handler(req, res) {
  if (req.method !== 'POST') {
    return res.status(405).json({ error: 'Method not allowed' });
  }

  const { email, password } = req.body || {};
  if (!email || !password) {
    return res.status(400).json({ error: 'Email and password are required.' });
  }

  // Verify credentials using anon client
  const anonClient = createClient(
    process.env.SUPABASE_URL,
    process.env.SUPABASE_ANON_KEY
  );
  const { data: signInData, error: signInError } = await anonClient.auth.signInWithPassword({ email, password });
  if (signInError || !signInData?.user) {
    return res.status(401).json({ error: 'Invalid email or password.' });
  }

  const userId = signInData.user.id;

  // Delete subscriptions
  await supabase.from('mm_subscriptions').delete().eq('user_id', userId);

  // Delete member records
  await supabase.from('mm_members').delete().eq('user_id', userId);

  // Delete households owned by this user
  await supabase.from('mm_households').delete().eq('owner_id', userId);

  // Delete the auth user
  const { error: deleteError } = await supabase.auth.admin.deleteUser(userId);
  if (deleteError) {
    return res.status(500).json({ error: 'Account deletion failed. Please contact info@mirajoco.org.' });
  }

  return res.status(200).json({ success: true });
}
