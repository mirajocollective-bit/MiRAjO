import { createClient } from '@supabase/supabase-js';

const supabase = createClient(
  process.env.SUPABASE_URL,
  process.env.SUPABASE_SERVICE_ROLE_KEY
);

export default async function handler(req, res) {
  if (req.method !== 'POST') return res.status(405).json({ error: 'Method not allowed' });

  const { email } = req.body || {};
  if (!email) return res.status(400).json({ error: 'Email is required.' });

  // Generate a password recovery link server-side (admin, no PKCE).
  // resetPasswordForEmail routes through Supabase's email service which can
  // expire before delivery and rejects redirectTo URLs with query params.
  // generateLink + Resend gives us a reliable, controlled delivery.
  const { data: linkData, error: linkErr } = await supabase.auth.admin.generateLink({
    type: 'recovery',
    email,
    options: {
      redirectTo: `${process.env.SITE_URL}/tools/money-moves/confirm?setup=1`,
    },
  });

  if (linkErr) {
    // User not found — still return success so we don't leak which emails exist
    console.error('mm-reset-password generateLink error:', linkErr.message);
    return res.status(200).json({ success: true });
  }

  const resetLink = linkData?.properties?.action_link;
  if (!resetLink) {
    console.error('mm-reset-password: no action_link in response');
    return res.status(200).json({ success: true });
  }

  const LOGO = 'https://www.mirajoco.org/img/logo-horizontal.png';

  const html = `<!DOCTYPE html><html><head><meta charset="utf-8"></head>
<body style="margin:0;padding:0;background:#F2EBD9;">
<table width="100%" cellpadding="0" cellspacing="0" border="0" style="background:#F2EBD9;">
<tr><td align="center" style="padding:48px 20px 40px;">
<table width="100%" cellpadding="0" cellspacing="0" border="0" style="max-width:560px;background:#ffffff;border-radius:12px;overflow:hidden;box-shadow:0 2px 24px rgba(18,32,18,0.08);">
<tr><td style="padding:40px 48px 0;text-align:left;">
<img src="${LOGO}" alt="MiRAjO" width="140" style="display:block;width:140px;height:auto;margin-bottom:6px;" />
<p style="font-size:11px;font-weight:700;letter-spacing:3px;text-transform:uppercase;color:#C4A245;margin:0 0 28px;font-family:sans-serif;">MONEY MOVES</p>
</td></tr>
<tr><td style="padding:0 48px 48px;">
<h2 style="font-size:26px;font-weight:400;color:#122012;margin:0 0 16px;font-family:Georgia,serif;">Set your password</h2>
<p style="font-size:15px;line-height:1.8;color:#1E4226;margin:0 0 28px;font-family:sans-serif;">You requested a password reset for your Money Moves account. Click the button below to set a new password.</p>
<p style="margin:0 0 28px;">
  <a href="${resetLink}" style="display:inline-block;padding:15px 36px;background:#122012;color:#F2EBD9;text-decoration:none;border-radius:8px;font-size:14px;font-weight:700;font-family:sans-serif;letter-spacing:0.3px;">Set New Password</a>
</p>
<p style="font-size:13px;line-height:1.7;color:#888;margin:0 0 8px;font-family:sans-serif;">This link expires in 1 hour. If you did not request this, you can safely ignore this email.</p>
<hr style="border:none;border-top:1px solid #e8e0d0;margin:28px 0;">
<p style="font-size:12px;color:#aaa;margin:0;font-family:sans-serif;">Money Moves by MiRAjO &nbsp;·&nbsp; <a href="https://www.mirajoco.org" style="color:#aaa;text-decoration:none;">mirajoco.org</a></p>
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
      subject: 'Set your Money Moves password',
      html,
    }),
  });

  if (!emailRes.ok) {
    const err = await emailRes.text();
    console.error('mm-reset-password Resend error:', err);
    return res.status(500).json({ error: 'Failed to send reset email.' });
  }

  return res.status(200).json({ success: true });
}
