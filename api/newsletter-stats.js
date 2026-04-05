// api/newsletter-stats.js — subscriber count + recent broadcasts
export default async function handler(req, res) {
  res.setHeader('Access-Control-Allow-Origin', 'https://www.mirajoco.org');
  res.setHeader('Access-Control-Allow-Methods', 'GET, OPTIONS');
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type, Authorization');

  if (req.method === 'OPTIONS') return res.status(200).end();
  if (req.method !== 'GET') return res.status(405).json({ error: 'Method not allowed' });

  const auth = (req.headers['authorization'] || '').replace('Bearer ', '').trim();
  if (auth !== process.env.ADMIN_PASSWORD) {
    return res.status(401).json({ error: 'Unauthorized' });
  }

  const key = process.env.RESEND_API_KEY;
  const audienceId = process.env.RESEND_AUDIENCE_ID;
  const headers = { 'Authorization': `Bearer ${key}`, 'Content-Type': 'application/json' };

  try {
    // Paginate through all contacts to get accurate count
    let total = 0;
    let active = 0;
    let cursor = null;
    let hasMore = true;

    while (hasMore) {
      const url = cursor
        ? `https://api.resend.com/audiences/${audienceId}/contacts?cursor=${cursor}`
        : `https://api.resend.com/audiences/${audienceId}/contacts`;

      const r = await fetch(url, { headers });
      const data = await r.json();

      const contacts = data.data || [];
      total += contacts.length;
      active += contacts.filter(c => !c.unsubscribed).length;
      hasMore = data.has_more || false;
      cursor = contacts.length > 0 ? contacts[contacts.length - 1].id : null;
      if (!hasMore) break;
    }

    // Get recent broadcasts
    const broadcastsRes = await fetch('https://api.resend.com/broadcasts', { headers });
    const broadcastsData = await broadcastsRes.json();
    const broadcasts = (broadcastsData.data || []).slice(0, 10).map(b => ({
      id: b.id,
      name: b.name,
      subject: b.subject,
      status: b.status,
      created_at: b.created_at,
    }));

    return res.status(200).json({ subscribers: active, total, broadcasts });

  } catch (err) {
    console.error('[newsletter-stats]', err.message);
    return res.status(500).json({ error: err.message });
  }
}
