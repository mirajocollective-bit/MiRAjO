// api/newsletter-test.js — send a test email to a single address
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

  const { subject, html, to } = req.body || {};
  if (!subject || !html || !to) return res.status(400).json({ error: 'subject, html, and to are required' });

  try {
    await resend.emails.send({
      from: 'Miranda Johnson <mirandaj@mirajoco.org>',
      to,
      subject: `[TEST] ${subject}`,
      html,
    });
    return res.status(200).json({ ok: true });
  } catch (err) {
    console.error('[newsletter-test]', err.message);
    return res.status(500).json({ error: err.message });
  }
}
