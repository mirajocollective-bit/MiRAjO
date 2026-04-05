// api/newsletter-stats.js — subscriber count + recent broadcasts
import { Resend } from 'resend';

const resend = new Resend(process.env.RESEND_API_KEY);

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

  try {
    const [contactsRes, broadcastsRes] = await Promise.all([
      resend.contacts.list({ audienceId: process.env.RESEND_AUDIENCE_ID }),
      resend.broadcasts.list(),
    ]);

    const contacts = contactsRes.data?.data || [];
    const broadcasts = broadcastsRes.data?.data || [];

    const activeCount = contacts.filter(c => !c.unsubscribed).length;

    return res.status(200).json({
      subscribers: activeCount,
      total: contacts.length,
      broadcasts: broadcasts.slice(0, 10).map(b => ({
        id: b.id,
        name: b.name,
        subject: b.subject,
        status: b.status,
        created_at: b.created_at,
      })),
    });
  } catch (err) {
    console.error('[newsletter-stats]', err.message);
    return res.status(500).json({ error: err.message });
  }
}
