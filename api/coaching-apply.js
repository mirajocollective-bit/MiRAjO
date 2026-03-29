// api/coaching-apply.js
// Receives 90 Days to Clear applications and emails them to Miranda

import { Resend } from 'resend';

const resend = new Resend(process.env.RESEND_API_KEY);

export default async function handler(req, res) {
  res.setHeader('Access-Control-Allow-Origin', 'https://www.mirajoco.org');
  res.setHeader('Access-Control-Allow-Methods', 'POST, OPTIONS');
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type');

  if (req.method === 'OPTIONS') return res.status(200).end();
  if (req.method !== 'POST') return res.status(405).json({ error: 'Method not allowed' });

  const { name, email, situation, whynow } = req.body || {};

  if (!name || !email || !situation || !whynow) {
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
      subject: `New 90 Days to Clear Application — ${name}`,
      html: `
        <div style="font-family:sans-serif;max-width:600px;margin:0 auto;padding:32px;">
          <h2 style="color:#122012;margin-bottom:8px;">New Coaching Application</h2>
          <p style="color:#5A6E58;margin-bottom:32px;font-size:14px;">90 Days to Clear — Founding Cohort</p>

          <table style="width:100%;border-collapse:collapse;">
            <tr>
              <td style="padding:12px 0;border-bottom:1px solid #eee;font-size:12px;text-transform:uppercase;letter-spacing:1px;color:#888;width:30%;">Name</td>
              <td style="padding:12px 0;border-bottom:1px solid #eee;font-size:15px;color:#122012;">${name}</td>
            </tr>
            <tr>
              <td style="padding:12px 0;border-bottom:1px solid #eee;font-size:12px;text-transform:uppercase;letter-spacing:1px;color:#888;">Email</td>
              <td style="padding:12px 0;border-bottom:1px solid #eee;font-size:15px;color:#122012;"><a href="mailto:${email}" style="color:#C4724A;">${email}</a></td>
            </tr>
            <tr>
              <td style="padding:12px 16px 12px 0;border-bottom:1px solid #eee;font-size:12px;text-transform:uppercase;letter-spacing:1px;color:#888;vertical-align:top;">Situation</td>
              <td style="padding:12px 0;border-bottom:1px solid #eee;font-size:15px;color:#122012;line-height:1.6;">${situation.replace(/\n/g, '<br>')}</td>
            </tr>
            <tr>
              <td style="padding:12px 16px 12px 0;font-size:12px;text-transform:uppercase;letter-spacing:1px;color:#888;vertical-align:top;">Why now</td>
              <td style="padding:12px 0;font-size:15px;color:#122012;line-height:1.6;">${whynow.replace(/\n/g, '<br>')}</td>
            </tr>
          </table>

          <div style="margin-top:32px;padding:20px;background:#F2EBD9;border-radius:8px;">
            <p style="font-size:13px;color:#5A6E58;margin:0;">Reply directly to this email to reach ${name} at <strong>${email}</strong></p>
          </div>
        </div>
      `,
      reply_to: email,
    });

    // Send acknowledgement to applicant
    await resend.emails.send({
      from: 'Miranda Johnson <mirandaj@mirajoco.org>',
      to: email,
      subject: 'I received your application — Miranda Johnson',
      html: `
        <div style="font-family:sans-serif;max-width:560px;margin:0 auto;padding:40px 32px;">
          <p style="font-size:17px;color:#122012;line-height:1.7;margin-bottom:20px;">Hi ${name},</p>
          <p style="font-size:16px;color:#3A4E38;line-height:1.75;margin-bottom:20px;">I got your application for 90 Days to Clear. Thank you for being honest about where you are — that takes something.</p>
          <p style="font-size:16px;color:#3A4E38;line-height:1.75;margin-bottom:20px;">I personally review every application and I'll be back in touch within 48 hours. In the meantime, if something urgent comes up you can reply directly to this email.</p>
          <p style="font-size:16px;color:#3A4E38;line-height:1.75;margin-bottom:40px;">Talk soon.</p>
          <p style="font-size:16px;color:#122012;font-weight:600;">Miranda Johnson</p>
          <p style="font-size:13px;color:#888;margin-top:4px;">MiRAjO Collective &middot; <a href="https://www.mirajoco.org/coaching" style="color:#C4724A;">mirajoco.org/coaching</a></p>
        </div>
      `,
    });

    return res.status(200).json({ ok: true });

  } catch (err) {
    console.error('[coaching-apply] Error:', err.message);
    return res.status(500).json({ error: 'Failed to send application' });
  }
}
