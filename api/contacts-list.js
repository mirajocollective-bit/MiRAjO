// api/contacts-list.js — paginated, filtered contacts for CRM
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

  const { search, source, city, state, tag, page = '1' } = req.query;
  const pageSize = 50;
  const offset = (parseInt(page) - 1) * pageSize;

  let query = supabase
    .from('contacts')
    .select('*', { count: 'exact' })
    .order('created_at', { ascending: false })
    .range(offset, offset + pageSize - 1);

  if (search) {
    query = query.or(`email.ilike.%${search}%,first_name.ilike.%${search}%,last_name.ilike.%${search}%`);
  }
  if (source) query = query.eq('source', source);
  if (city)   query = query.ilike('city', `%${city}%`);
  if (state)  query = query.eq('state', state);
  if (tag)    query = query.contains('tags', [tag]);

  const { data, count, error } = await query;

  if (error) {
    console.error('[contacts-list]', error.message);
    return res.status(500).json({ error: error.message });
  }

  // Get filter options for dropdowns
  const { data: sources } = await supabase
    .from('contacts')
    .select('source')
    .not('source', 'is', null)
    .order('source');

  const { data: states } = await supabase
    .from('contacts')
    .select('state')
    .not('state', 'is', null)
    .order('state');

  const uniqueSources = [...new Set((sources || []).map(r => r.source).filter(Boolean))];
  const uniqueStates  = [...new Set((states  || []).map(r => r.state).filter(Boolean))];

  return res.status(200).json({
    contacts: data || [],
    total: count || 0,
    page: parseInt(page),
    pageSize,
    filters: { sources: uniqueSources, states: uniqueStates },
  });
}
