// POST /api/couples-accept-invite
// Called when Partner B clicks their invite link and creates their account
// Validates token, creates Supabase account, links couple, enrolls Partner B

import { createClient } from '@supabase/supabase-js';

const supabase = createClient(
  process.env.SUPABASE_URL,
  process.env.SUPABASE_SERVICE_ROLE_KEY
);

export default async function handler(req, res) {
  if (req.method !== 'POST') {
    return res.status(405).json({ error: 'Method not allowed' });
  }

  const { token, first_name, last_name } = req.body || {};

  if (!token) {
    return res.status(400).json({ error: 'Missing invite token' });
  }

  // Validate token — must exist, not expired, not already accepted
  const { data: invite, error: inviteError } = await supabase
    .from('couple_invites')
    .select('id, couple_id, partner_b_email, accepted_at, expires_at')
    .eq('token', token)
    .single();

  if (inviteError || !invite) {
    return res.status(404).json({ error: 'Invite not found' });
  }

  if (invite.accepted_at) {
    return res.status(400).json({ error: 'Invite already accepted' });
  }

  if (new Date(invite.expires_at) < new Date()) {
    return res.status(400).json({ error: 'Invite has expired' });
  }

  // Get the couple record
  const { data: couple, error: coupleError } = await supabase
    .from('couples')
    .select('id, course_id')
    .eq('id', invite.couple_id)
    .single();

  if (coupleError || !couple) {
    return res.status(404).json({ error: 'Couple record not found' });
  }

  // Create Partner B's Supabase account if it doesn't exist
  const { data: { users } } = await supabase.auth.admin.listUsers();
  let partnerB = users?.find(u => u.email === invite.partner_b_email);

  if (!partnerB) {
    const { data: created, error: createError } = await supabase.auth.admin.createUser({
      email: invite.partner_b_email,
      email_confirm: true,
      user_metadata: { first_name: first_name || '', last_name: last_name || '' },
    });

    if (createError || !created?.user) {
      console.error('Failed to create Partner B account:', createError);
      return res.status(500).json({ error: 'Failed to create account' });
    }

    partnerB = created.user;
  }

  // Link Partner B to the couple
  const { error: linkError } = await supabase
    .from('couples')
    .update({
      partner_b_user_id: partnerB.id,
      linked_at: new Date().toISOString(),
    })
    .eq('id', couple.id);

  if (linkError) {
    console.error('Failed to link couple:', linkError);
    return res.status(500).json({ error: 'Failed to link partner' });
  }

  // Mark invite as accepted
  await supabase
    .from('couple_invites')
    .update({ accepted_at: new Date().toISOString() })
    .eq('id', invite.id);

  // Enroll Partner B in the course
  await supabase
    .from('enrollments')
    .upsert(
      { user_id: partnerB.id, course_id: couple.course_id },
      { onConflict: 'user_id,course_id' }
    );

  // Generate magic link so Partner B can log straight in
  const { data: magicLink } = await supabase.auth.admin.generateLink({
    type: 'magiclink',
    email: invite.partner_b_email,
    options: {
      redirectTo: `${process.env.SITE_URL}/programs/couples-dashboard`,
    },
  });

  console.log(`Partner B (${invite.partner_b_email}) linked to couple ${couple.id}`);
  res.status(200).json({
    success: true,
    login_url: magicLink?.properties?.action_link || null,
  });
}
