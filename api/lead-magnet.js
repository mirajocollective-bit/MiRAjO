// api/lead-magnet.js
// Handles email capture for both lead magnets:
//   type = 'couples-scorecard'  → CIE funnel
//   type = 'alignment-audit'    → 25D25N funnel
//
// Subscribes to Kit (ConvertKit) with custom fields:
//   scorecard_type   = 'couples-scorecard' | 'alignment-audit'
//   scorecard_result = 'red' | 'yellow' | 'green'
//   scorecard_score  = numeric score as string
//
// Miranda: in Kit, create custom fields named scorecard_type, scorecard_result, scorecard_score
// Then set up automations: if scorecard_type = 'couples-scorecard' AND scorecard_result = 'red' → add tag + send sequence

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

  const FORM_ID = process.env.KIT_LEAD_MAGNET_FORM_ID || '9186169';
  const API_SECRET = process.env.CONVERTKIT_API_SECRET;

  if (!API_SECRET) {
    console.error('Missing CONVERTKIT_API_SECRET');
    return res.status(500).json({ error: 'Configuration error' });
  }

  const payload = {
    api_secret: API_SECRET,
    email: email.trim().toLowerCase(),
    first_name: (firstName || '').trim(),
    fields: {
      scorecard_type:   type,
      scorecard_result: result,
      scorecard_score:  String(score || '')
    }
  };

  try {
    const kitRes = await fetch(`https://api.convertkit.com/v3/forms/${FORM_ID}/subscribe`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(payload)
    });

    if (!kitRes.ok) {
      const errText = await kitRes.text();
      console.error('Kit subscribe error:', errText);
      // Still return success to user — don't block results page on Kit errors
    }

    return res.status(200).json({ ok: true, result });

  } catch (err) {
    console.error('lead-magnet API error:', err);
    // Return success anyway — don't block results on network errors
    return res.status(200).json({ ok: true, result });
  }
}
