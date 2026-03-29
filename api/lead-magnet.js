// api/lead-magnet.js
// Handles email capture for both lead magnets:
//   type = 'couples-scorecard'  → CIE nurture sequence
//   type = 'alignment-audit'    → 25D25N nurture sequence
//
// Queues a 3-email Resend sequence via Supabase email_queue (same
// system used for enrolled-25d25n, CIE, etc.)

import { createClient } from '@supabase/supabase-js';
import { queueSequence } from './_emails.js';

const supabase = createClient(
  process.env.SUPABASE_URL,
  process.env.SUPABASE_SERVICE_ROLE_KEY
);

const SEQUENCE_MAP = {
  'couples-scorecard': 'lead-couples-scorecard',
  'alignment-audit':   'lead-alignment-audit',
};

export default async function handler(req, res) {
  res.setHeader('Access-Control-Allow-Origin', 'https://www.mirajoco.org');
  res.setHeader('Access-Control-Allow-Methods', 'POST, OPTIONS');
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type');

  if (req.method === 'OPTIONS') return res.status(200).end();
  if (req.method !== 'POST') return res.status(405).json({ error: 'Method not allowed' });

  const { email, firstName, result, score, type } = req.body || {};

  if (!email || !result || !type) {
    return res.status(400).json({ error: 'Missing required fields' });
  }

  const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  if (!emailRegex.test(email)) {
    return res.status(400).json({ error: 'Invalid email address' });
  }

  const sequenceName = SEQUENCE_MAP[type];
  if (!sequenceName) {
    return res.status(400).json({ error: 'Unknown lead magnet type' });
  }

  try {
    await queueSequence(
      supabase,
      email.trim().toLowerCase(),
      sequenceName,
      (firstName || '').trim(),
      { result, score: String(score || ''), type }
    );

    return res.status(200).json({ ok: true, result });

  } catch (err) {
    console.error('[lead-magnet] Error:', err.message);
    // Still return success — don't block results page on server errors
    return res.status(200).json({ ok: true, result });
  }
}
