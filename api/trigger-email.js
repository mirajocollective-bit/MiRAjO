import { addTag, addToSequence } from './_kit.js';

const SEQUENCE_MAP = {
  'module-1-complete':      '25D25N Module 1',
  'course-25d25n-complete': '25D25N Complete',
};

const ALLOWED_TAGS = [
  'enrolled-25d25n',
  'module-1-complete',
  'course-25d25n-complete',
  'inactive-nudge',
];

export default async function handler(req, res) {
  if (req.method !== 'POST') return res.status(405).end();

  const { email, tag, firstName } = req.body;
  if (!email || !tag) return res.status(400).json({ error: 'Missing email or tag' });
  if (!ALLOWED_TAGS.includes(tag)) return res.status(400).json({ error: 'Unknown tag' });

  await addTag(email, tag);

  const sequenceName = SEQUENCE_MAP[tag];
  if (sequenceName) {
    await addToSequence(email, sequenceName, firstName || '');
  }

  res.status(200).json({ success: true });
}
