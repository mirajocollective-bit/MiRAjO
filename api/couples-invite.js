// POST /api/couples-invite
// Called after purchase when Partner A submits Partner B's email
// Creates invite token and sends Partner B an invite email via Kit

import { createClient } from '@supabase/supabase-js';
import { addTag } from './_kit.js';
import { queueSequence } from './_emails.js';

const supabase = createClient(
  process.env.SUPABASE_URL,
  process.env.SUPABASE_SERVICE_ROLE_KEY
);

export default async function handler(req, res) {
  if (req.method !== 'POST') {
    return res.status(405).json({ error: 'Method not allowed' });
  }

  const { partner_a_user_id, partner_b_email, partner_a_first_name } = req.body || {};

  if (!partner_a_user_id || !partner_b_email) {
    return res.status(400).json({ error: 'Missing required fields' });
  }

  // Find the couple record for partner A
  const { data: couple, error: coupleError } = await supabase
    .from('couples')
    .select('id, partner_b_user_id')
    .eq('partner_a_user_id', partner_a_user_id)
    .is('partner_b_user_id', null)
    .single();

  if (coupleError || !couple) {
    return res.status(404).json({ error: 'Couple record not found' });
  }

  // Create the invite token
  const { data: invite, error: inviteError } = await supabase
    .from('couple_invites')
    .insert({
      couple_id: couple.id,
      partner_b_email: partner_b_email.toLowerCase().trim(),
    })
    .select('token')
    .single();

  if (inviteError || !invite) {
    console.error('Invite creation error:', inviteError);
    return res.status(500).json({ error: 'Failed to create invite' });
  }

  const inviteUrl = `${process.env.SITE_URL}/programs/couples-join?token=${invite.token}&from=${encodeURIComponent(partner_a_first_name || '')}`;

  const partnerBEmail = partner_b_email.toLowerCase().trim();
  const partnerName = partner_a_first_name || 'Your partner';

  // Tag partner B in Kit
  await addTag(partnerBEmail, 'invited-couples-cie', {
    first_name: '',
    fields: { partner_name: partnerName, invite_url: inviteUrl },
  });

  // Queue invite email sequence for Partner B
  await queueSequence(supabase, partnerBEmail, 'invited-couples-cie', '', {
    partner_name: partnerName,
    invite_url: inviteUrl,
  });

  console.log(`Invite sent to ${partnerBEmail} for couple ${couple.id}`);
  res.status(200).json({ success: true });
}
