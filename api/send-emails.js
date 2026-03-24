// Daily cron: send all due emails from email_queue via Resend
import { createClient } from '@supabase/supabase-js';
import { SEQUENCES } from './_emails.js';

const supabase = createClient(
  process.env.SUPABASE_URL,
  process.env.SUPABASE_SERVICE_ROLE_KEY
);

async function sendEmail(to, subject, html) {
  const res = await fetch('https://api.resend.com/emails', {
    method: 'POST',
    headers: {
      'Authorization': `Bearer ${process.env.RESEND_API_KEY}`,
      'Content-Type': 'application/json',
    },
    body: JSON.stringify({
      from: 'Miranda J <miranda@mirajoco.org>',
      to,
      subject,
      html,
    }),
  });
  if (!res.ok) {
    const err = await res.text();
    console.error(`[send-emails] Resend error for ${to}:`, err);
  }
  return res.ok;
}

export default async function handler(req, res) {
  const auth = req.headers.authorization;
  if (process.env.CRON_SECRET && auth !== `Bearer ${process.env.CRON_SECRET}`) {
    return res.status(401).json({ error: 'Unauthorized' });
  }

  try {
    const { data: due, error } = await supabase
      .from('email_queue')
      .select('*')
      .is('sent_at', null)
      .lte('send_after', new Date().toISOString())
      .order('send_after', { ascending: true });

    if (error) throw error;
    if (!due || due.length === 0) return res.status(200).json({ sent: 0 });

    let sent = 0;
    for (const item of due) {
      const steps = SEQUENCES[item.sequence];
      const step = steps?.find(s => s.step === item.step);
      if (!step) continue;

      const extraData = item.extra_data || {};
      const subject = typeof step.subject === 'function' ? step.subject(extraData) : step.subject;
      const ok = await sendEmail(item.email, subject, step.body(item.first_name || '', extraData));
      if (ok) {
        await supabase
          .from('email_queue')
          .update({ sent_at: new Date().toISOString() })
          .eq('id', item.id);
        sent++;
      }
    }

    console.log(`[send-emails] Sent ${sent}/${due.length}`);
    return res.status(200).json({ sent, total: due.length });

  } catch (err) {
    console.error('[send-emails]', err.message);
    return res.status(500).json({ error: err.message });
  }
}
