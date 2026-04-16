// Adds subscriber to Resend audience (replaces Kit form)
import { Resend } from 'resend';

const resend = new Resend(process.env.RESEND_API_KEY);

export default async function handler(req, res) {
  res.setHeader('Access-Control-Allow-Origin', 'https://www.mirajoco.org');
  res.setHeader('Access-Control-Allow-Methods', 'POST, OPTIONS');
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type');

  if (req.method === 'OPTIONS') return res.status(200).end();
  if (req.method !== 'POST') return res.status(405).json({ error: 'Method not allowed' });

  const { email, first_name, turnstileToken } = req.body || {};

  if (!email) return res.status(400).json({ error: 'Email is required' });

  const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  if (!emailRegex.test(email)) return res.status(400).json({ error: 'Invalid email' });

  // Verify Turnstile token
  if (!turnstileToken) return res.status(400).json({ error: 'Security check required' });
  try {
    const tsRes = await fetch('https://challenges.cloudflare.com/turnstile/v0/siteverify', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ secret: process.env.TURNSTILE_SECRET_KEY, response: turnstileToken }),
    });
    const tsData = await tsRes.json();
    if (!tsData.success) return res.status(400).json({ error: 'Security check failed' });
  } catch (err) {
    console.error('[waitlist] Turnstile error:', err.message);
    return res.status(400).json({ error: 'Security check error' });
  }

  try {
    await resend.contacts.create({
      audienceId: process.env.RESEND_AUDIENCE_ID,
      email,
      firstName: first_name || '',
      unsubscribed: false,
    });
    return res.status(200).json({ success: true });
  } catch (err) {
    console.error('[waitlist] Resend error:', err.message);
    return res.status(500).json({ error: 'Failed to subscribe' });
  }
}
