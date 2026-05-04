// api/contacts-import.js — bulk import contacts from parsed CSV
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

  const { contacts } = req.body || {};
  if (!Array.isArray(contacts) || contacts.length === 0) {
    return res.status(400).json({ error: 'No contacts provided' });
  }

  // Sanitize and validate
  const rows = contacts
    .filter(c => c.email && /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(c.email.trim()))
    .map(c => ({
      email:         c.email.trim().toLowerCase(),
      first_name:    (c.first_name || '').trim(),
      last_name:     (c.last_name  || '').trim(),
      phone:         (c.phone      || '').trim(),
      city:          (c.city       || '').trim(),
      state:         (c.state      || '').trim(),
      country:       (c.country    || '').trim(),
      source:        (c.source     || 'eventbrite').trim(),
      event_attended:(c.event_attended || '').trim(),
      event_date:    (c.event_date || '').trim(),
      tags:          c.tags || [],
    }));

  if (rows.length === 0) {
    return res.status(400).json({ error: 'No valid email addresses found' });
  }

  // Upsert in batches of 100
  let imported = 0;
  let skipped = 0;
  const batchSize = 100;

  for (let i = 0; i < rows.length; i += batchSize) {
    const batch = rows.slice(i, i + batchSize);
    const { data, error } = await supabase
      .from('contacts')
      .upsert(batch, { onConflict: 'email', ignoreDuplicates: false })
      .select('id');

    if (error) {
      console.error('[contacts-import] batch error:', error.message);
      skipped += batch.length;
    } else {
      imported += (data || []).length;
    }
  }

  return res.status(200).json({ imported, skipped, total: rows.length });
}
