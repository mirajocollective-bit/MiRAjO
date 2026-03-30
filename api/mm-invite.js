// Money Moves — family member invite
// Called from settings.html Family section
// Requires: active session (user must be household owner on family plan)
import { createClient } from '@supabase/supabase-js';

const supabase = createClient(
  process.env.SUPABASE_URL,
  process.env.SUPABASE_SERVICE_ROLE_KEY
);

export default async function handler(req, res) {
  if (req.method !== 'POST') {
    return res.status(405).json({ error: 'Method not allowed' });
  }

  const { inviterUserId, inviteeEmail } = req.body || {};
  if (!inviterUserId || !inviteeEmail) {
    return res.status(400).json({ error: 'inviterUserId and inviteeEmail are required' });
  }

  const email = inviteeEmail.trim().toLowerCase();

  // Verify inviter has an active family plan
  const { data: sub } = await supabase
    .from('mm_subscriptions')
    .select('plan, status')
    .eq('user_id', inviterUserId)
    .single();

  if (!sub || sub.status !== 'active') {
    return res.status(403).json({ error: 'No active subscription' });
  }
  if (sub.plan !== 'family') {
    return res.status(403).json({ error: 'Family plan required to invite members' });
  }

  // Get inviter's household
  const { data: member } = await supabase
    .from('mm_members')
    .select('household_id, role')
    .eq('user_id', inviterUserId)
    .eq('status', 'active')
    .order('created_at', { ascending: true })
    .limit(1)
    .single();

  if (!member) {
    return res.status(404).json({ error: 'Household not found' });
  }
  if (member.role !== 'owner') {
    return res.status(403).json({ error: 'Only the household owner can invite members' });
  }

  const householdId = member.household_id;

  // Check member count (family plan: max 6 members)
  const { count } = await supabase
    .from('mm_members')
    .select('id', { count: 'exact', head: true })
    .eq('household_id', householdId)
    .in('status', ['active', 'invited']);

  if (count >= 6) {
    return res.status(400).json({ error: 'Household is at the 6-member limit' });
  }

  // Check if this email is already a member or has a pending invite
  const { data: existing } = await supabase
    .from('mm_members')
    .select('id, status')
    .eq('household_id', householdId)
    .eq('email', email)
    .limit(1);

  if (existing && existing.length > 0) {
    const status = existing[0].status;
    if (status === 'active') return res.status(400).json({ error: 'This person is already a member' });
    if (status === 'invited') return res.status(400).json({ error: 'An invite is already pending for this email' });
  }

  // Find or create the invitee's Supabase auth user
  let inviteeUserId;
  const { data: existingUser } = await supabase
    .from('auth.users')
    .select('id')
    .eq('email', email)
    .limit(1);

  if (existingUser && existingUser.length > 0) {
    inviteeUserId = existingUser[0].id;
  } else {
    const { data: invited, error: inviteErr } = await supabase.auth.admin.inviteUserByEmail(email, {
      data: { product: 'money-moves' },
      redirectTo: `${process.env.SITE_URL}/tools/money-moves/confirm`,
    });
    if (inviteErr) {
      console.error('[mm-invite] Supabase invite error:', inviteErr.message);
      return res.status(500).json({ error: inviteErr.message });
    }
    inviteeUserId = invited.user.id;
  }

  // Add to household as invited member
  const { error: memberErr } = await supabase.from('mm_members').upsert({
    household_id: householdId,
    user_id:      inviteeUserId,
    email,
    role:   'member',
    status: 'invited',
  }, { onConflict: 'household_id,user_id' });

  if (memberErr) {
    console.error('[mm-invite] Member insert error:', memberErr.message);
    return res.status(500).json({ error: memberErr.message });
  }

  // Send invite email via Resend
  const { data: household } = await supabase
    .from('mm_households')
    .select('name')
    .eq('id', householdId)
    .single();

  const householdName = household?.name || 'their household';
  const LOGO = 'https://www.mirajoco.org/img/Where%20Authenticity%20is%20the%20new%20blue%20check%20(250%20x%20150%20px)%20(800%20x%20312%20px)%20(450%20x%2070%20px)%20(Logo)%20(1).png';
  const loginUrl = `${process.env.SITE_URL}/tools/money-moves/login`;

  const html = `<!DOCTYPE html><html><head><meta charset="utf-8"></head>
<body style="margin:0;padding:0;background:#F9F6F0;">
<table width="100%" cellpadding="0" cellspacing="0" border="0" style="background:#F9F6F0;">
<tr><td align="center" style="padding:48px 20px 40px;">
<table width="100%" cellpadding="0" cellspacing="0" border="0" style="max-width:560px;background:#ffffff;border-radius:12px;overflow:hidden;box-shadow:0 2px 24px rgba(18,32,18,0.07);">
<tr><td style="padding:40px 48px 0;text-align:left;">
<img src="${LOGO}" alt="MiRAjO" width="160" style="display:block;width:160px;height:auto;margin-bottom:12px;" />
<p style="font-size:11px;font-weight:700;letter-spacing:3px;text-transform:uppercase;color:#C4A245;margin:0 0 28px;font-family:sans-serif;">MONEY MOVES</p>
</td></tr>
<tr><td style="padding:0 48px 48px;">
<p style="font-size:16px;line-height:1.9;color:#1a2a1a;margin:0 0 20px;font-family:Georgia,serif;">You have been invited to join <strong>${householdName}</strong> on Money Moves by MiRAjO — a budget calendar built for families and households who want to manage money together.</p>
<p style="font-size:16px;line-height:1.9;color:#1a2a1a;margin:0 0 20px;font-family:Georgia,serif;">Click below to set up your account. You will get a magic link — no password needed.</p>
<p style="margin:4px 0 28px;"><a href="${loginUrl}" style="display:inline-block;padding:14px 32px;background:#256B42;color:#ffffff;text-decoration:none;border-radius:6px;font-size:14px;font-weight:600;font-family:sans-serif;letter-spacing:0.3px;">Accept Invite &amp; Log In</a></p>
<p style="font-size:14px;line-height:1.8;color:#888;margin:0;font-family:sans-serif;">Once you log in, you will have access to the shared household calendar, budget, and accounts.</p>
<p style="margin:36px 0 4px;font-size:17px;color:#122012;font-family:Georgia,serif;font-style:italic;">Miranda J</p>
<p style="margin:0;font-size:12px;color:#999;font-family:sans-serif;">Money Moves by MiRAjO &nbsp;|&nbsp; <a href="https://www.mirajoco.org" style="color:#999;text-decoration:none;">mirajoco.org</a></p>
</td></tr>
</table>
</td></tr>
</table>
</body></html>`;

  const emailRes = await fetch('https://api.resend.com/emails', {
    method: 'POST',
    headers: {
      Authorization: `Bearer ${process.env.RESEND_API_KEY}`,
      'Content-Type': 'application/json',
    },
    body: JSON.stringify({
      from: 'Miranda J <mirandaj@mirajoco.org>',
      to: email,
      subject: `You have been invited to ${householdName} on Money Moves`,
      html,
    }),
  });

  if (!emailRes.ok) {
    const err = await emailRes.text();
    console.error('[mm-invite] Resend error:', err);
    // Don't fail — they're in the DB, email is cosmetic
  }

  console.log(`[mm-invite] Invited ${email} to household ${householdId}`);
  return res.status(200).json({ success: true });
}
