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
  let partnerB = null;
  const { data: created, error: createError } = await supabase.auth.admin.createUser({
    email: invite.partner_b_email,
    email_confirm: true,
    user_metadata: { first_name: first_name || '', last_name: last_name || '' },
  });

  if (createError) {
    // User already exists — find them by paging through listUsers
    if (createError.message?.toLowerCase().includes('already')) {
      let found = null;
      let page = 1;
      while (!found) {
        const { data: { users }, error: listErr } = await supabase.auth.admin.listUsers({ page, perPage: 100 });
        if (listErr || !users?.length) break;
        found = users.find(u => u.email === invite.partner_b_email) || null;
        if (found || users.length < 100) break;
        page++;
      }
      if (!found) {
        console.error('Could not locate existing Partner B account:', invite.partner_b_email);
        return res.status(500).json({ error: 'Failed to locate account' });
      }
      partnerB = found;
    } else {
      console.error('Failed to create Partner B account:', createError);
      return res.status(500).json({ error: 'Failed to create account' });
    }
  } else {
    partnerB = created?.user;
  }

  if (!partnerB) {
    return res.status(500).json({ error: 'Failed to create account' });
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
  // redirectTo points to /programs/confirm?cie=1 — confirm.html handles
  // PKCE code exchange and routes CIE users to the couples dashboard
  const { data: magicLink } = await supabase.auth.admin.generateLink({
    type: 'magiclink',
    email: invite.partner_b_email,
    options: {
      redirectTo: `${process.env.SITE_URL}/programs/confirm?cie=1`,
    },
  });

  console.log(`Partner B (${invite.partner_b_email}) linked to couple ${couple.id}`);
  res.status(200).json({
    success: true,
    login_url: magicLink?.properties?.action_link || null,
  });
}
