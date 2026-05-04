// api/sync-resend-contacts.js — pull all Resend audience contacts into contacts table
import { createClient } from '@supabase/supabase-js';

const supabase = createClient(
  process.env.SUPABASE_URL,
  process.env.SUPABASE_SERVICE_ROLE_KEY
);

function checkAuth(req) {
  const token = (req.headers.authorization || '').replace('Bearer ', '').trim();
  return token && token === process.env.ADMIN_PASSWORD;
}

export default async function handler(req, res) {
  res.setHeader('Access-Control-Allow-Origin', 'https://www.mirajoco.org');
  res.setHeader('Access-Control-Allow-Methods', 'POST, OPTIONS');
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type, Authorization');

  if (req.method === 'OPTIONS') return res.status(200).end();
  if (req.method !== 'POST') return res.status(405).json({ error: 'Method not allowed' });
  if (!checkAuth(req)) return res.status(401).json({ error: 'Unauthorized' });

  const apiKey     = process.env.RESEND_API_KEY;
  const audienceId = process.env.RESEND_AUDIENCE_ID;

  if (!apiKey || !audienceId) {
    return res.status(500).json({ error: 'Resend credentials not configured' });
  }

  try {
    const response = await fetch(`https://api.resend.com/audiences/${audienceId}/contacts`, {
      headers: { Authorization: `Bearer ${apiKey}` },
    });

    if (!response.ok) {
      const body = await response.text();
      throw new Error(`Resend API error: ${response.status} — ${body}`);
    }

    const { data: resendContacts } = await response.json();

    if (!resendContacts || resendContacts.length === 0) {
      return res.status(200).json({ imported: 0, skipped: 0, total: 0 });
    }

    // Map Resend fields to contacts table
    const rows = resendContacts
      .filter(c => c.email)
      .map(c => ({
        email:      c.email.trim().toLowerCase(),
        first_name: (c.first_name || '').trim(),
        last_name:  (c.last_name  || '').trim(),
        source:     'resend',
        tags:       [],
      }));

    // Upsert in batches of 100 — don't overwrite richer data already in contacts
    let imported = 0;
    let skipped  = 0;

    for (let i = 0; i < rows.length; i += 100) {
      const batch = rows.slice(i, i + 100);
      const { data, error } = await supabase
        .from('contacts')
        .upsert(batch, { onConflict: 'email', ignoreDuplicates: true })
        .select('id');

      if (error) {
        console.error('[sync-resend] batch error:', error.message);
        skipped += batch.length;
      } else {
        imported += (data || []).length;
        skipped  += batch.length - (data || []).length;
      }
    }

    return res.status(200).json({ imported, skipped, total: rows.length });

  } catch (err) {
    console.error('[sync-resend]', err.message);
    return res.status(500).json({ error: err.message });
  }
}
