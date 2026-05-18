import { Resend } from 'resend';

const resend = new Resend(process.env.RESEND_API_KEY);

function escapeHtml(str) {
  return String(str)
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;')
    .replace(/'/g, '&#039;');
}

export default async function handler(req, res) {
  res.setHeader('Access-Control-Allow-Origin', 'https://www.mirajoco.org');
  res.setHeader('Access-Control-Allow-Methods', 'POST, OPTIONS');
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type');

  if (req.method === 'OPTIONS') return res.status(200).end();
  if (req.method !== 'POST') return res.status(405).json({ error: 'Method not allowed' });

  const { name, org, email, type, message } = req.body || {};

  if (!name || !org || !email) {
    return res.status(400).json({ error: 'Missing required fields' });
  }

  const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  if (!emailRegex.test(email)) {
    return res.status(400).json({ error: 'Invalid email address' });
  }

  const safeName = escapeHtml(name);
  const safeOrg  = escapeHtml(org);
  const safeEmail = escapeHtml(email);
  const safeType  = type ? escapeHtml(type) : '';
  const safeMessage = message ? escapeHtml(message).replace(/\n/g, '<br>') : '';
  const firstName = safeName.split(' ')[0];

  try {
    await resend.emails.send({
      from: 'MiRAjO <programs@mirajoco.org>',
      to: 'mirandaj@mirajoco.org',
      subject: `Hub Demo Request — ${safeName} / ${safeOrg}`,
      reply_to: email,
      html: `
        <div style="font-family:sans-serif;max-width:600px;margin:0 auto;padding:32px;">
          <h2 style="color:#122012;margin-bottom:4px;">New Hub Demo Request</h2>
          <p style="color:#5A6E58;font-size:13px;margin-bottom:28px;">Via mirajoco.org/platform</p>
          <table style="width:100%;border-collapse:collapse;">
            <tr>
              <td style="padding:12px 0;border-bottom:1px solid #eee;font-size:11px;text-transform:uppercase;letter-spacing:1px;color:#888;width:28%;">Name</td>
              <td style="padding:12px 0;border-bottom:1px solid #eee;font-size:15px;color:#122012;">${safeName}</td>
            </tr>
            <tr>
              <td style="padding:12px 0;border-bottom:1px solid #eee;font-size:11px;text-transform:uppercase;letter-spacing:1px;color:#888;">Organization</td>
              <td style="padding:12px 0;border-bottom:1px solid #eee;font-size:15px;color:#122012;">${safeOrg}</td>
            </tr>
            <tr>
              <td style="padding:12px 0;border-bottom:1px solid #eee;font-size:11px;text-transform:uppercase;letter-spacing:1px;color:#888;">Email</td>
              <td style="padding:12px 0;border-bottom:1px solid #eee;font-size:15px;color:#122012;"><a href="mailto:${safeEmail}" style="color:#256B42;">${safeEmail}</a></td>
            </tr>
            ${safeType ? `<tr>
              <td style="padding:12px 0;border-bottom:1px solid #eee;font-size:11px;text-transform:uppercase;letter-spacing:1px;color:#888;">Org Type</td>
              <td style="padding:12px 0;border-bottom:1px solid #eee;font-size:15px;color:#122012;">${safeType}</td>
            </tr>` : ''}
            ${safeMessage ? `<tr>
              <td style="padding:12px 16px 12px 0;font-size:11px;text-transform:uppercase;letter-spacing:1px;color:#888;vertical-align:top;">Message</td>
              <td style="padding:12px 0;font-size:15px;color:#122012;line-height:1.7;">${safeMessage}</td>
            </tr>` : ''}
          </table>
          <div style="margin-top:28px;padding:16px 20px;background:#EBF7F0;border-radius:8px;">
            <p style="font-size:13px;color:#5A6E58;margin:0;">Reply directly to this email to reach ${safeName} at <strong>${safeEmail}</strong></p>
          </div>
        </div>
      `,
    });

    await resend.emails.send({
      from: 'Miranda Johnson <mirandaj@mirajoco.org>',
      to: email,
      subject: `We got your request, ${firstName}`,
      html: `
        <div style="font-family:sans-serif;max-width:560px;margin:0 auto;padding:40px 32px;">
          <p style="font-size:17px;color:#122012;line-height:1.7;margin-bottom:20px;">Hi ${firstName},</p>
          <p style="font-size:16px;color:#3A4E38;line-height:1.75;margin-bottom:20px;">Thank you for your interest in the MiRAjO Hub. I received your request and will be in touch within 48 hours to set up a time to walk you through everything.</p>
          <p style="font-size:16px;color:#3A4E38;line-height:1.75;margin-bottom:20px;">The Hub packages assessments, courses, financial tools, and coaching resources into one licensed environment your members can access anytime. I look forward to showing you how it works for ${safeOrg}.</p>
          <p style="font-size:16px;color:#3A4E38;line-height:1.75;margin-bottom:40px;">If anything is time-sensitive, feel free to reply directly to this email.</p>
          <p style="font-size:16px;color:#122012;font-weight:600;">Miranda Johnson</p>
          <p style="font-size:13px;color:#888;margin-top:4px;">MiRAjO Collective &nbsp;&middot;&nbsp; <a href="https://www.mirajoco.org/platform" style="color:#256B42;">mirajoco.org/platform</a></p>
        </div>
      `,
    });

    return res.status(200).json({ ok: true });

  } catch (err) {
    console.error('[demo-request] Error:', err.message);
    return res.status(500).json({ error: 'Failed to send request' });
  }
}
