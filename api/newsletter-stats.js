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
  // Contacts imported via CSV don't appear in the contacts API — store base count as env var
  const baseCount = parseInt(process.env.NEWSLETTER_BASE_COUNT || '0', 10);
  const headers = { 'Authorization': `Bearer ${key}`, 'Content-Type': 'application/json' };

  try {
    // Count contacts added via API (new opt-ins from website forms)
    const contactsRes = await fetch(`https://api.resend.com/audiences/${audienceId}/contacts`, { headers });
    const contactsData = await contactsRes.json();
    const apiContacts = Array.isArray(contactsData.data) ? contactsData.data : [];
    const apiActive = apiContacts.filter(c => c.unsubscribed === false).length;

    // Total = bulk-imported base + new API opt-ins
    const total = baseCount + apiContacts.length;
    const subscribers = baseCount + apiActive;

    // Get recent broadcasts
    const broadcastsRes = await fetch('https://api.resend.com/broadcasts', { headers });
    const broadcastsData = await broadcastsRes.json();
    const broadcasts = broadcastsRes.ok
      ? (broadcastsData.data || []).slice(0, 10).map(b => ({
          id: b.id,
          name: b.name,
          subject: b.subject,
          status: b.status,
          created_at: b.created_at,
        }))
      : [];

    return res.status(200).json({ subscribers, total, broadcasts });

  } catch (err) {
    console.error('[newsletter-stats]', err.message);
    return res.status(500).json({ error: err.message });
  }
}
