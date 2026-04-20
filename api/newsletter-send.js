// api/newsletter-send.js — create and send/schedule/draft a Resend broadcast
import { Resend } from 'resend';

const resend = new Resend(process.env.RESEND_API_KEY);

export default async function handler(req, res) {
  res.setHeader('Access-Control-Allow-Origin', 'https://www.mirajoco.org');
  res.setHeader('Access-Control-Allow-Methods', 'POST, OPTIONS');
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type, Authorization');

  if (req.method === 'OPTIONS') return res.status(200).end();
  if (req.method !== 'POST') return res.status(405).json({ error: 'Method not allowed' });

  const auth = (req.headers['authorization'] || '').replace('Bearer ', '').trim();
  if (auth !== process.env.ADMIN_PASSWORD) {
    return res.status(401).json({ error: 'Unauthorized' });
  }

  const { subject, html, name, scheduledAt, draftOnly } = req.body || {};
  if (!subject || !html) return res.status(400).json({ error: 'subject and html are required' });

  try {
    const broadcast = await resend.broadcasts.create({
      audienceId: process.env.RESEND_AUDIENCE_ID,
      from: 'Miranda Johnson <mirandaj@mirajoco.org>',
      replyTo: 'mirandaj@mirajoco.org',
      subject,
      html,
      name: name || subject,
    });

    // Draft only — create without sending
    if (draftOnly) {
      return res.status(200).json({ ok: true, id: broadcast.data.id, status: 'draft' });
    }

    // Send now or scheduled
    const sendOptions = scheduledAt ? { scheduledAt } : {};
    await resend.broadcasts.send(broadcast.data.id, sendOptions);

    return res.status(200).json({
      ok: true,
      id: broadcast.data.id,
      status: scheduledAt ? 'scheduled' : 'sent',
      scheduledAt: scheduledAt || null,
    });

  } catch (err) {
    console.error('[newsletter-send]', err.message);
    return res.status(500).json({ error: err.message });
  }
}
