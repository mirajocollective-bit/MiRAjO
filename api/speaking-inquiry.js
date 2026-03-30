// api/speaking-inquiry.js
// Receives speaking/media inquiries from the media kit page

import { Resend } from 'resend';

const resend = new Resend(process.env.RESEND_API_KEY);

export default async function handler(req, res) {
  res.setHeader('Access-Control-Allow-Origin', 'https://www.mirajoco.org');
  res.setHeader('Access-Control-Allow-Methods', 'POST, OPTIONS');
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type');

  if (req.method === 'OPTIONS') return res.status(200).end();
  if (req.method !== 'POST') return res.status(405).json({ error: 'Method not allowed' });

  const { name, email, organization, eventType, eventDate, message } = req.body || {};

  if (!name || !email || !eventType || !message) {
    return res.status(400).json({ error: 'Missing required fields' });
  }

  const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  if (!emailRegex.test(email)) {
    return res.status(400).json({ error: 'Invalid email address' });
  }

  try {
    // Notify Miranda
    await resend.emails.send({
      from: 'MiRAjO <programs@mirajoco.org>',
      to: 'mirandaj@mirajoco.org',
      subject: `New Speaking Inquiry — ${name}${organization ? ' / ' + organization : ''}`,
      reply_to: email,
      html: `
        <div style="font-family:sans-serif;max-width:600px;margin:0 auto;padding:32px;">
          <h2 style="color:#122012;margin-bottom:4px;">New Speaking Inquiry</h2>
          <p style="color:#5A6E58;font-size:13px;margin-bottom:28px;">Via mirajoco.org/media-kit</p>
          <table style="width:100%;border-collapse:collapse;">
            <tr>
              <td style="padding:12px 0;border-bottom:1px solid #eee;font-size:11px;text-transform:uppercase;letter-spacing:1px;color:#888;width:28%;">Name</td>
              <td style="padding:12px 0;border-bottom:1px solid #eee;font-size:15px;color:#122012;">${name}</td>
            </tr>
            <tr>
              <td style="padding:12px 0;border-bottom:1px solid #eee;font-size:11px;text-transform:uppercase;letter-spacing:1px;color:#888;">Email</td>
              <td style="padding:12px 0;border-bottom:1px solid #eee;font-size:15px;color:#122012;"><a href="mailto:${email}" style="color:#339158;">${email}</a></td>
            </tr>
            ${organization ? `<tr>
              <td style="padding:12px 0;border-bottom:1px solid #eee;font-size:11px;text-transform:uppercase;letter-spacing:1px;color:#888;">Organization</td>
              <td style="padding:12px 0;border-bottom:1px solid #eee;font-size:15px;color:#122012;">${organization}</td>
            </tr>` : ''}
            <tr>
              <td style="padding:12px 0;border-bottom:1px solid #eee;font-size:11px;text-transform:uppercase;letter-spacing:1px;color:#888;">Event Type</td>
              <td style="padding:12px 0;border-bottom:1px solid #eee;font-size:15px;color:#122012;">${eventType}</td>
            </tr>
            ${eventDate ? `<tr>
              <td style="padding:12px 0;border-bottom:1px solid #eee;font-size:11px;text-transform:uppercase;letter-spacing:1px;color:#888;">Event Date</td>
              <td style="padding:12px 0;border-bottom:1px solid #eee;font-size:15px;color:#122012;">${eventDate}</td>
            </tr>` : ''}
            <tr>
              <td style="padding:12px 16px 12px 0;font-size:11px;text-transform:uppercase;letter-spacing:1px;color:#888;vertical-align:top;">Message</td>
              <td style="padding:12px 0;font-size:15px;color:#122012;line-height:1.7;">${message.replace(/\n/g, '<br>')}</td>
            </tr>
          </table>
          <div style="margin-top:28px;padding:16px 20px;background:#EBF7F0;border-radius:8px;">
            <p style="font-size:13px;color:#5A6E58;margin:0;">Reply directly to this email to reach ${name} at <strong>${email}</strong></p>
          </div>
        </div>
      `,
    });

    // Acknowledgement to inquirer
    await resend.emails.send({
      from: 'Miranda Johnson <mirandaj@mirajoco.org>',
      to: email,
      subject: 'Got your inquiry — Miranda Johnson',
      html: `
        <div style="font-family:sans-serif;max-width:560px;margin:0 auto;padding:40px 32px;">
          <p style="font-size:17px;color:#122012;line-height:1.7;margin-bottom:20px;">Hi ${name},</p>
          <p style="font-size:16px;color:#3A4E38;line-height:1.75;margin-bottom:20px;">Thank you for reaching out. I received your speaking inquiry and I will be back in touch within 48 hours to discuss the details.</p>
          <p style="font-size:16px;color:#3A4E38;line-height:1.75;margin-bottom:20px;">If something is time-sensitive, feel free to reply directly to this email.</p>
          <p style="font-size:16px;color:#3A4E38;line-height:1.75;margin-bottom:40px;">Looking forward to the conversation.</p>
          <p style="font-size:16px;color:#122012;font-weight:600;">Miranda Johnson</p>
          <p style="font-size:13px;color:#888;margin-top:4px;">MiRAjO Collective &middot; <a href="https://www.mirajoco.org/media-kit" style="color:#339158;">mirajoco.org/media-kit</a></p>
        </div>
      `,
    });

    return res.status(200).json({ ok: true });

  } catch (err) {
    console.error('[speaking-inquiry] Error:', err.message);
    return res.status(500).json({ error: 'Failed to send inquiry' });
  }
}
