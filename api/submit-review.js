// api/submit-review.js
// Saves a course review to Supabase.
// 4-5 stars: auto-approved and visible on site.
// 1-3 stars: saved but hidden, Miranda gets an alert email.

import { createClient } from '@supabase/supabase-js';
import { Resend } from 'resend';

const supabase = createClient(
  process.env.SUPABASE_URL,
  process.env.SUPABASE_SERVICE_ROLE_KEY
);

const resend = new Resend(process.env.RESEND_API_KEY);

export default async function handler(req, res) {
  res.setHeader('Access-Control-Allow-Origin', 'https://www.mirajoco.org');
  res.setHeader('Access-Control-Allow-Methods', 'POST, OPTIONS');
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type');

  if (req.method === 'OPTIONS') return res.status(200).end();
  if (req.method !== 'POST') return res.status(405).json({ error: 'Method not allowed' });

  const { name, email, rating, body, course } = req.body || {};

  if (!name || !body || !rating || rating < 1 || rating > 5) {
    return res.status(400).json({ error: 'Missing required fields' });
  }

  const courseName = course || '25-days-and-25-nights';
  const visible = rating >= 4;

  const { error: insertError } = await supabase.from('reviews').insert({
    name,
    email: email || null,
    rating,
    body,
    course: courseName,
    visible,
  });

  if (insertError) {
    console.error('[submit-review] Insert failed:', insertError.message);
    return res.status(500).json({ error: 'Could not save review' });
  }

  // Alert Miranda for anything 3 stars or below
  if (rating <= 3) {
    const stars = '★'.repeat(rating) + '☆'.repeat(5 - rating);
    const courseLabel = courseName === '25-days-and-25-nights' ? '25 Days and 25 Nights' : courseName;

    try {
      await resend.emails.send({
        from: 'MiRAjO <programs@mirajoco.org>',
        to: 'mirandaj@mirajoco.org',
        subject: `Review needs attention — ${rating} star${rating !== 1 ? 's' : ''} (${courseLabel})`,
        html: `
          <div style="font-family:sans-serif;max-width:560px;margin:0 auto;padding:32px;">
            <h2 style="color:#122012;margin-bottom:4px;">New review submitted</h2>
            <p style="color:#888;font-size:22px;margin:0 0 24px;letter-spacing:2px;">${stars}</p>
            <table style="width:100%;border-collapse:collapse;margin-bottom:24px;">
              <tr>
                <td style="padding:10px 16px 10px 0;border-bottom:1px solid #eee;font-size:12px;text-transform:uppercase;letter-spacing:1px;color:#888;width:80px;">Name</td>
                <td style="padding:10px 0;border-bottom:1px solid #eee;font-size:14px;color:#122012;">${name}</td>
              </tr>
              <tr>
                <td style="padding:10px 16px 10px 0;border-bottom:1px solid #eee;font-size:12px;text-transform:uppercase;letter-spacing:1px;color:#888;">Email</td>
                <td style="padding:10px 0;border-bottom:1px solid #eee;font-size:14px;color:#122012;">${email ? `<a href="mailto:${email}" style="color:#256B42;">${email}</a>` : 'not provided'}</td>
              </tr>
              <tr>
                <td style="padding:10px 16px 10px 0;border-bottom:1px solid #eee;font-size:12px;text-transform:uppercase;letter-spacing:1px;color:#888;">Rating</td>
                <td style="padding:10px 0;border-bottom:1px solid #eee;font-size:14px;color:#122012;">${rating} / 5</td>
              </tr>
              <tr>
                <td style="padding:10px 16px 10px 0;font-size:12px;text-transform:uppercase;letter-spacing:1px;color:#888;">Course</td>
                <td style="padding:10px 0;font-size:14px;color:#122012;">${courseLabel}</td>
              </tr>
            </table>
            <div style="background:#FEF2F2;border-left:4px solid #C4546A;border-radius:6px;padding:16px 20px;">
              <p style="font-size:15px;color:#1a2a1a;line-height:1.7;margin:0;">${body.replace(/\n/g, '<br>')}</p>
            </div>
            <p style="font-size:13px;color:#888;margin-top:24px;">This review is not visible on the site. Reply to ${email || 'the reviewer'} if follow-up is needed.</p>
          </div>
        `,
        reply_to: email || undefined,
      });
    } catch (emailError) {
      console.error('[submit-review] Alert email failed:', emailError.message);
    }
  }

  return res.status(200).json({ ok: true, visible });
}
