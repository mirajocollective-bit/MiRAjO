// api/lead-magnet.js
// Handles email capture for both lead magnets:
//   type = 'couples-scorecard'  → CIE nurture sequence
//   type = 'alignment-audit'    → 25D25N nurture sequence
//
// Queues a 3-email Resend sequence via Supabase email_queue and
// sends a lead notification to programs@mirajoco.org

import { createClient } from '@supabase/supabase-js';
import { Resend } from 'resend';
import { queueSequence, SEQUENCES } from './_emails.js';

const supabase = createClient(
  process.env.SUPABASE_URL,
  process.env.SUPABASE_SERVICE_ROLE_KEY
);

const resend = new Resend(process.env.RESEND_API_KEY);

const SEQUENCE_MAP = {
  'couples-scorecard': 'lead-couples-scorecard',
  'alignment-audit':   'lead-alignment-audit',
};

const MAGNET_LABELS = {
  'couples-scorecard': 'Couples Alignment Scorecard',
  'alignment-audit':   'Alignment Audit',
};

export default async function handler(req, res) {
  res.setHeader('Access-Control-Allow-Origin', 'https://www.mirajoco.org');
  res.setHeader('Access-Control-Allow-Methods', 'POST, OPTIONS');
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type');

  if (req.method === 'OPTIONS') return res.status(200).end();
  if (req.method !== 'POST') return res.status(405).json({ error: 'Method not allowed' });

  const { email, firstName, result, score, type, turnstileToken } = req.body || {};

  if (!email || !result || !type) {
    return res.status(400).json({ error: 'Missing required fields' });
  }

  // Verify Turnstile token
  if (!turnstileToken) {
    return res.status(400).json({ error: 'Security check required' });
  }
  try {
    const tsRes = await fetch('https://challenges.cloudflare.com/turnstile/v0/siteverify', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ secret: process.env.TURNSTILE_SECRET_KEY, response: turnstileToken }),
    });
    const tsData = await tsRes.json();
    if (!tsData.success) {
      return res.status(400).json({ error: 'Security check failed' });
    }
  } catch (err) {
    console.error('[lead-magnet] Turnstile error:', err.message);
    return res.status(400).json({ error: 'Security check error' });
  }

  const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  if (!emailRegex.test(email)) {
    return res.status(400).json({ error: 'Invalid email address' });
  }

  const sequenceName = SEQUENCE_MAP[type];
  if (!sequenceName) {
    return res.status(400).json({ error: 'Unknown lead magnet type' });
  }

  const cleanEmail = email.trim().toLowerCase();
  const cleanName  = (firstName || '').trim();
  const extraData  = { result, score: String(score || ''), type };

  try {
    await queueSequence(supabase, cleanEmail, sequenceName, cleanName, extraData);

    // Send step 1 immediately — don't wait for the 9am cron
    const step1 = SEQUENCES[sequenceName]?.[0];
    if (step1) {
      const subject = typeof step1.subject === 'function' ? step1.subject(extraData) : step1.subject;
      const html    = step1.body(cleanName, extraData);
      await resend.emails.send({
        from:    'Miranda Johnson <mirandaj@mirajoco.org>',
        to:      cleanEmail,
        subject,
        html,
      });
      // Mark step 1 as sent so the cron doesn't send it again
      await supabase
        .from('email_queue')
        .update({ sent_at: new Date().toISOString() })
        .eq('email', cleanEmail)
        .eq('sequence', sequenceName)
        .eq('step', 1);
    }

    // Notify Miranda
    resend.emails.send({
      from: 'Miranda Johnson <mirandaj@mirajoco.org>',
      to: 'mirandaj@mirajoco.org',
      subject: `New lead — ${MAGNET_LABELS[type]}`,
      html: `
        <div style="font-family:sans-serif;max-width:480px;margin:0 auto;padding:32px;">
          <h2 style="color:#122012;margin-bottom:4px;">New Lead</h2>
          <p style="color:#888;font-size:13px;margin-bottom:28px;">${MAGNET_LABELS[type]}</p>
          <table style="width:100%;border-collapse:collapse;">
            <tr>
              <td style="padding:10px 0;border-bottom:1px solid #eee;font-size:12px;text-transform:uppercase;letter-spacing:1px;color:#888;width:30%;">Name</td>
              <td style="padding:10px 0;border-bottom:1px solid #eee;font-size:15px;color:#122012;">${firstName || '—'}</td>
            </tr>
            <tr>
              <td style="padding:10px 0;border-bottom:1px solid #eee;font-size:12px;text-transform:uppercase;letter-spacing:1px;color:#888;">Email</td>
              <td style="padding:10px 0;border-bottom:1px solid #eee;font-size:15px;color:#122012;">${cleanEmail}</td>
            </tr>
            <tr>
              <td style="padding:10px 0;font-size:12px;text-transform:uppercase;letter-spacing:1px;color:#888;">Result</td>
              <td style="padding:10px 0;font-size:15px;color:#122012;text-transform:capitalize;">${result} ${score ? '(score: ' + score + ')' : ''}</td>
            </tr>
          </table>
        </div>
      `,
    }).catch(err => console.error('[lead-magnet] Notify error:', err.message));

    return res.status(200).json({ ok: true, result });

  } catch (err) {
    console.error('[lead-magnet] Error:', err.message);
    // Still return success — don't block results page on server errors
    return res.status(200).json({ ok: true, result });
  }
}
