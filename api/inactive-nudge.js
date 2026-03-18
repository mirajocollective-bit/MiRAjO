// Daily cron: find enrolled 25D25N users with no progress in 3+ days → apply inactive-nudge tag in Kit
const { createClient } = require('@supabase/supabase-js');

const supabase = createClient(
  process.env.SUPABASE_URL,
  process.env.SUPABASE_SERVICE_ROLE_KEY
);

module.exports = async function handler(req, res) {
  // Vercel cron sends Authorization: Bearer {CRON_SECRET}
  const auth = req.headers.authorization;
  if (process.env.CRON_SECRET && auth !== `Bearer ${process.env.CRON_SECRET}`) {
    return res.status(401).json({ error: 'Unauthorized' });
  }

  try {
    // Get inactive users via Supabase RPC
    const { data: users, error } = await supabase.rpc('get_inactive_25d25n_users');
    if (error) throw error;

    if (!users || users.length === 0) {
      return res.status(200).json({ tagged: 0, message: 'No inactive users found' });
    }

    // Fetch Kit tags to get inactive-nudge tag ID
    const tagsRes = await fetch(
      `https://api.convertkit.com/v3/tags?api_secret=${process.env.CONVERTKIT_API_SECRET}`
    );
    const tagsData = await tagsRes.json();
    const nudgeTag = tagsData.tags?.find(t => t.name === 'inactive-nudge');
    if (!nudgeTag) throw new Error('inactive-nudge tag not found in Kit');

    // Apply tag to each inactive user
    let tagged = 0;
    for (const user of users) {
      if (!user.email) continue;
      const r = await fetch(
        `https://api.convertkit.com/v3/tags/${nudgeTag.id}/subscribe`,
        {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify({
            api_secret: process.env.CONVERTKIT_API_SECRET,
            email: user.email
          })
        }
      );
      if (r.ok) tagged++;
    }

    console.log(`[inactive-nudge] Tagged ${tagged}/${users.length} users`);
    return res.status(200).json({ tagged, total: users.length });

  } catch (err) {
    console.error('[inactive-nudge]', err.message);
    return res.status(500).json({ error: err.message });
  }
};
