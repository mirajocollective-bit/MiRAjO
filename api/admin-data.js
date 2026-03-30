// api/admin-data.js — aggregated data for admin dashboard
import { createClient } from '@supabase/supabase-js';
import Stripe from 'stripe';

const supabase = createClient(
  process.env.SUPABASE_URL,
  process.env.SUPABASE_SERVICE_ROLE_KEY
);

function checkAuth(req) {
  const auth = req.headers.authorization || '';
  const token = auth.replace('Bearer ', '').trim();
  return token && token === process.env.ADMIN_PASSWORD;
}

export default async function handler(req, res) {
  res.setHeader('Access-Control-Allow-Origin', 'https://www.mirajoco.org');
  res.setHeader('Access-Control-Allow-Methods', 'GET, OPTIONS');
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type, Authorization');

  if (req.method === 'OPTIONS') return res.status(200).end();
  if (req.method !== 'GET') return res.status(405).json({ error: 'Method not allowed' });
  if (!checkAuth(req)) return res.status(401).json({ error: 'Unauthorized' });

  try {
    const now = new Date();
    const weekAgo = new Date(now);
    weekAgo.setDate(weekAgo.getDate() - 7);

    // All leads (step 1 of lead magnet sequences)
    const { data: leads } = await supabase
      .from('email_queue')
      .select('email, first_name, sequence, step, send_after, sent_at, extra_data')
      .in('sequence', ['lead-couples-scorecard', 'lead-alignment-audit'])
      .eq('step', 1)
      .order('send_after', { ascending: false })
      .limit(100);

    // Full email queue (recent 150 rows across all sequences)
    const { data: emailQueue } = await supabase
      .from('email_queue')
      .select('email, first_name, sequence, step, send_after, sent_at')
      .order('send_after', { ascending: false })
      .limit(150);

    // Enrollments
    const { data: enrollments } = await supabase
      .from('enrollments')
      .select('user_id, course_slug, enrolled_at')
      .order('enrolled_at', { ascending: false })
      .limit(50);

    // Try to get user emails for enrollments
    let userEmails = {};
    if (enrollments && enrollments.length > 0) {
      const userIds = enrollments.map(e => e.user_id);
      const { data: users } = await supabase.auth.admin.listUsers();
      if (users?.users) {
        users.users.forEach(u => { userEmails[u.id] = u.email; });
      }
    }

    // Health checks
    const health = { supabase: 'ok', resend: 'ok', stripe: 'ok' };

    // Test Supabase
    const { error: sbError } = await supabase.from('email_queue').select('count').limit(1);
    if (sbError) health.supabase = 'error';

    // Check env keys
    if (!process.env.RESEND_API_KEY) health.resend = 'missing key';
    if (!process.env.STRIPE_SECRET_KEY) health.stripe = 'missing key';

    // Test Stripe
    if (process.env.STRIPE_SECRET_KEY) {
      try {
        const stripe = new Stripe(process.env.STRIPE_SECRET_KEY);
        await stripe.products.list({ limit: 1 });
      } catch {
        health.stripe = 'error';
      }
    }

    // Compute summary stats
    const leadsThisWeek = (leads || []).filter(l =>
      new Date(l.send_after) >= weekAgo
    ).length;

    const emailsSentToday = (emailQueue || []).filter(e => {
      if (!e.sent_at) return false;
      const d = new Date(e.sent_at);
      return d.toDateString() === now.toDateString();
    }).length;

    const emailsPending = (emailQueue || []).filter(e =>
      !e.sent_at && new Date(e.send_after) > now
    ).length;

    return res.status(200).json({
      summary: {
        totalLeads: (leads || []).length,
        leadsThisWeek,
        totalEnrollments: (enrollments || []).length,
        emailsSentToday,
        emailsPending,
      },
      leads: leads || [],
      emailQueue: emailQueue || [],
      enrollments: (enrollments || []).map(e => ({
        ...e,
        email: userEmails[e.user_id] || e.user_id,
      })),
      health,
      timestamp: now.toISOString(),
    });

  } catch (err) {
    console.error('[admin-data] Error:', err.message);
    return res.status(500).json({ error: err.message });
  }
}
