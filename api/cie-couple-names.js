// POST /api/cie-couple-names
// Returns first names for both partners in a couple.
// Uses service role to read auth.users metadata.

import { createClient } from '@supabase/supabase-js';

const supabase = createClient(
  process.env.SUPABASE_URL,
  process.env.SUPABASE_SERVICE_ROLE_KEY
);

export default async function handler(req, res) {
  if (req.method !== 'POST') return res.status(405).json({ error: 'Method not allowed' });

  const { user_id, couple_id } = req.body || {};
  if (!user_id || !couple_id) return res.status(400).json({ error: 'Missing fields' });

  // Verify user belongs to this couple
  const { data: couple } = await supabase
    .from('couples')
    .select('id, partner_a_user_id, partner_b_user_id')
    .eq('id', couple_id)
    .single();

  if (!couple || (couple.partner_a_user_id !== user_id && couple.partner_b_user_id !== user_id)) {
    return res.status(403).json({ error: 'Unauthorized' });
  }

  const isPartnerA = couple.partner_a_user_id === user_id;
  const partnerId  = isPartnerA ? couple.partner_b_user_id : couple.partner_a_user_id;

  // Fetch partner's auth record using service role
  const { data: partnerData } = await supabase.auth.admin.getUserById(partnerId);
  const partnerName = partnerData?.user?.user_metadata?.first_name || null;

  return res.status(200).json({ partner_name: partnerName });
}
