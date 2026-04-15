// POST /api/couples-invite
// Called after purchase when Partner A submits Partner B's email
// Creates invite token and sends invite email immediately via Resend

import { createClient } from '@supabase/supabase-js';
import { queueSequence, SEQUENCES } from './_emails.js';

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

  // Send invite email immediately via Resend
  const step1 = SEQUENCES['invited-couples-cie'][0];
  const subject = step1.subject({ partner_name: partnerName });
  const html = step1.body('', { partner_name: partnerName, invite_url: inviteUrl });

  const emailRes = await fetch('https://api.resend.com/emails', {
    method: 'POST',
    headers: {
      'Authorization': `Bearer ${process.env.RESEND_API_KEY}`,
      'Content-Type': 'application/json',
    },
    body: JSON.stringify({
      from: 'Miranda J <mirandaj@mirajoco.org>',
      to: partnerBEmail,
      subject,
      html,
    }),
  });

  if (!emailRes.ok) {
    const err = await emailRes.text();
    console.error('Invite email send error:', err);
    return res.status(500).json({ error: 'Failed to send invite email' });
  }

  // Also queue the follow-up reminder (step 2, 2 days later) — skip step 1 since already sent
  const followUpSteps = SEQUENCES['invited-couples-cie'].slice(1);
  if (followUpSteps.length) {
    const now = new Date();
    const rows = followUpSteps.map(({ step, delayDays }) => {
      const sendAfter = new Date(now);
      sendAfter.setDate(sendAfter.getDate() + delayDays);
      return {
        email: partnerBEmail,
        first_name: '',
        sequence: 'invited-couples-cie',
        step,
        send_after: sendAfter.toISOString(),
        extra_data: { partner_name: partnerName, invite_url: inviteUrl },
      };
    });
    await supabase.from('email_queue').upsert(rows, { onConflict: 'email,sequence,step', ignoreDuplicates: true });
  }

  console.log(`Invite sent to ${partnerBEmail} for couple ${couple.id}`);
  res.status(200).json({ success: true });
}
