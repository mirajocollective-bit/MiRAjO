// Daily cron: find enrolled 25D25N users with no progress in 3+ days → apply inactive-nudge tag in Kit
import { createClient } from '@supabase/supabase-js';
import { addTag } from './_kit.js';

const supabase = createClient(
  process.env.SUPABASE_URL,
  process.env.SUPABASE_SERVICE_ROLE_KEY
);

export default async function handler(req, res) {
  const auth = req.headers.authorization;
  if (process.env.CRON_SECRET && auth !== `Bearer ${process.env.CRON_SECRET}`) {
    return res.status(401).json({ error: 'Unauthorized' });
  }

  try {
    const { data: users, error } = await supabase.rpc('get_inactive_25d25n_users');
    if (error) throw error;

    if (!users || users.length === 0) {
      return res.status(200).json({ tagged: 0, message: 'No inactive users found' });
    }

    let tagged = 0;
    for (const user of users) {
      if (!user.email) continue;
      const ok = await addTag(user.email, 'inactive-nudge');
      if (ok) tagged++;
    }

    console.log(`[inactive-nudge] Tagged ${tagged}/${users.length} users`);
    return res.status(200).json({ tagged, total: users.length });

  } catch (err) {
    console.error('[inactive-nudge]', err.message);
    return res.status(500).json({ error: err.message });
  }
}
