// api/contacts-duplicates.js — find potential duplicate contacts by name
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
  res.setHeader('Access-Control-Allow-Methods', 'GET, OPTIONS');
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type, Authorization');

  if (req.method === 'OPTIONS') return res.status(200).end();
  if (req.method !== 'GET') return res.status(405).json({ error: 'Method not allowed' });
  if (!checkAuth(req)) return res.status(401).json({ error: 'Unauthorized' });

  // Find contacts with the same first+last name (different emails = potential duplicates)
  const { data, error } = await supabase.rpc('find_duplicate_contacts');

  if (error) {
    // Fallback: manual query if RPC not set up
    const { data: all } = await supabase
      .from('contacts')
      .select('id, email, first_name, last_name, source, created_at')
      .not('first_name', 'is', null)
      .not('last_name', 'is', null)
      .neq('first_name', '')
      .neq('last_name', '');

    // Group by normalized full name
    const groups = {};
    for (const c of (all || [])) {
      const key = `${c.first_name.trim().toLowerCase()} ${c.last_name.trim().toLowerCase()}`;
      if (!groups[key]) groups[key] = [];
      groups[key].push(c);
    }

    const duplicates = Object.values(groups).filter(g => g.length > 1);
    return res.status(200).json({ duplicates, total: duplicates.length });
  }

  return res.status(200).json({ duplicates: data || [], total: (data || []).length });
}
