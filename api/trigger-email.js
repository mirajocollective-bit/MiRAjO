// Adds a tag to a Kit subscriber (creates subscriber if they don't exist)
async function tagSubscriber(email, tag) {
  const apiSecret = process.env.CONVERTKIT_API_SECRET;

  const res = await fetch(`https://api.convertkit.com/v3/tags`, {
    headers: { 'Content-Type': 'application/json' },
  });

  // First get all tags to find the ID
  const tagsRes = await fetch(`https://api.convertkit.com/v3/tags?api_secret=${apiSecret}`);
  const tagsData = await tagsRes.json();
  const tagObj = tagsData.tags?.find(t => t.name === tag);

  if (!tagObj) {
    console.error(`Tag not found: ${tag}`);
    return false;
  }

  // Subscribe with tag
  const subRes = await fetch(`https://api.convertkit.com/v3/tags/${tagObj.id}/subscribe`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ api_secret: apiSecret, email }),
  });

  return subRes.ok;
}

export default async function handler(req, res) {
  if (req.method !== 'POST') return res.status(405).end();

  const { email, tag } = req.body;
  if (!email || !tag) return res.status(400).json({ error: 'Missing email or tag' });

  const allowed = [
    'enrolled-25d25n',
    'module-1-complete',
    'course-25d25n-complete',
    'inactive-nudge',
  ];

  if (!allowed.includes(tag)) return res.status(400).json({ error: 'Unknown tag' });

  const ok = await tagSubscriber(email, tag);
  if (!ok) return res.status(500).json({ error: 'Failed to tag subscriber' });

  res.status(200).json({ success: true });
}
