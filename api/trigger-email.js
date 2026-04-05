import { createClient } from '@supabase/supabase-js';
import { queueSequence } from './_emails.js';

const supabase = createClient(
  process.env.SUPABASE_URL,
  process.env.SUPABASE_SERVICE_ROLE_KEY
);

const SEQUENCE_MAP = {
  'module-1-complete':      'module-1-complete',
  'course-25d25n-complete': 'course-25d25n-complete',
};

const ALLOWED_TAGS = Object.keys(SEQUENCE_MAP);

export default async function handler(req, res) {
  if (req.method !== 'POST') return res.status(405).end();

  const token = (req.headers['authorization'] || '').replace('Bearer ', '').trim();
  if (!token) return res.status(401).json({ error: 'Unauthorized' });

  const { data: { user }, error: authErr } = await supabase.auth.getUser(token);
  if (authErr || !user) return res.status(401).json({ error: 'Unauthorized' });

  const { tag, firstName } = req.body;
  const email = user.email;

  if (!tag) return res.status(400).json({ error: 'Missing tag' });
  if (!ALLOWED_TAGS.includes(tag)) return res.status(400).json({ error: 'Unknown tag' });

  const sequenceName = SEQUENCE_MAP[tag];
  if (sequenceName) {
    await queueSequence(supabase, email, sequenceName, firstName || '');
  }

  res.status(200).json({ success: true });
}
