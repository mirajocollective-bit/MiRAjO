// api/get-reviews.js
// Returns approved (visible) reviews for a given course.

import { createClient } from '@supabase/supabase-js';

const supabase = createClient(
  process.env.SUPABASE_URL,
  process.env.SUPABASE_ANON_KEY
);

export default async function handler(req, res) {
  if (req.method !== 'GET') return res.status(405).json({ error: 'Method not allowed' });

  const course = req.query.course || '25-days-and-25-nights';

  const { data, error } = await supabase
    .from('reviews')
    .select('id, name, rating, body, created_at')
    .eq('course', course)
    .eq('visible', true)
    .order('created_at', { ascending: false })
    .limit(20);

  if (error) {
    console.error('[get-reviews] Query failed:', error.message);
    return res.status(500).json({ error: error.message });
  }

  res.setHeader('Cache-Control', 's-maxage=300, stale-while-revalidate');
  return res.status(200).json({ reviews: data || [] });
}
