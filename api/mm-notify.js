// Money Moves notification worker
// Handles: budget alerts, weekly summaries, goal milestones
// Called daily by Vercel cron — weekly summary only fires on Mondays
import { createClient } from '@supabase/supabase-js';

const supabase = createClient(
  process.env.SUPABASE_URL,
  process.env.SUPABASE_SERVICE_ROLE_KEY
);

const LOGO = 'https://www.mirajoco.org/img/Where%20Authenticity%20is%20the%20new%20blue%20check%20(250%20x%20150%20px)%20(800%20x%20312%20px)%20(450%20x%2070%20px)%20(Logo)%20(1).png';
const DASHBOARD = 'https://www.mirajoco.org/tools/money-moves/dashboard';

// ── Email helpers ──────────────────────────────────────────────────────────

function wrap(content) {
  return `<!DOCTYPE html><html><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1"></head>
<body style="margin:0;padding:0;background:#F9F6F0;">
<table width="100%" cellpadding="0" cellspacing="0" border="0" style="background:#F9F6F0;">
<tr><td align="center" style="padding:48px 20px 40px;">
<table width="100%" cellpadding="0" cellspacing="0" border="0" style="max-width:560px;background:#ffffff;border-radius:12px;overflow:hidden;box-shadow:0 2px 24px rgba(18,32,18,0.07);">
<tr><td style="padding:40px 48px 0;text-align:left;">
<img src="${LOGO}" alt="MiRAjO" width="160" style="display:block;width:160px;height:auto;margin-bottom:12px;" />
<p style="font-size:11px;font-weight:700;letter-spacing:3px;text-transform:uppercase;color:#C4A245;margin:0 0 28px;font-family:sans-serif;">MONEY MOVES</p>
</td></tr>
<tr><td style="padding:0 48px 48px;">
${content}
<p style="margin:36px 0 4px;font-size:17px;color:#122012;font-family:Georgia,serif;font-style:italic;">Miranda J</p>
<p style="margin:0;font-size:12px;color:#999;font-family:sans-serif;">Money Moves by MiRAjO &nbsp;|&nbsp; <a href="https://www.mirajoco.org" style="color:#999;text-decoration:none;">mirajoco.org</a></p>
</td></tr>
</table>
</td></tr>
</table>
</body></html>`;
}

function p(text) {
  return `<p style="font-size:16px;line-height:1.9;color:#1a2a1a;margin:0 0 20px;font-family:Georgia,serif;">${text}</p>`;
}

function btn(text, url) {
  return `<p style="margin:4px 0 28px;"><a href="${url}" style="display:inline-block;padding:14px 32px;background:#256B42;color:#ffffff;text-decoration:none;border-radius:6px;font-size:14px;font-weight:600;font-family:sans-serif;letter-spacing:0.3px;">${text}</a></p>`;
}

function statRow(label, value, color = '#256B42') {
  return `<tr>
    <td style="padding:10px 16px;font-size:14px;color:#555;font-family:sans-serif;border-bottom:1px solid #f0ebe0;">${label}</td>
    <td style="padding:10px 16px;font-size:14px;font-weight:700;color:${color};font-family:sans-serif;border-bottom:1px solid #f0ebe0;text-align:right;">${value}</td>
  </tr>`;
}

// ── Personality-mode copy ──────────────────────────────────────────────────

const COPY = {

  budgetAlert: {
    mom: (name, cat, pct) => ({
      subject: `${cat} budget check-in — ${pct}% used`,
      body: wrap(
        p(`Hey ${name},`) +
        p(`Baby, I need you to hear me right now. You have used <strong>${pct}%</strong> of your <strong>${cat}</strong> budget for the month — and the month is not over yet. We need to talk about these choices.`) +
        p(`I am not mad. I am just watching the numbers and the numbers are talking to me. Look at what you have left and make the rest of this month count.`) +
        btn('Check My Budget', DASHBOARD)
      ),
    }),
    dad: (name, cat, pct) => ({
      subject: `${cat} is at ${pct}%. Watch it.`,
      body: wrap(
        p(`${name}.`) +
        p(`You are at <strong>${pct}%</strong> on <strong>${cat}</strong>. Watch it.`) +
        p(`You know what to do.`) +
        btn('View Dashboard', DASHBOARD)
      ),
    }),
    spiritual: (name, cat, pct) => ({
      subject: `Your ${cat} energy is approaching its boundary`,
      body: wrap(
        p(`Hey ${name},`) +
        p(`Your <strong>${cat}</strong> spending energy has reached <strong>${pct}%</strong> of its monthly boundary. Pause. Breathe. Realign with the intention you set at the beginning of the month.`) +
        p(`Every dollar is a vote for the life you are building. Cast the remaining votes with care.`) +
        btn('Return to Alignment', DASHBOARD)
      ),
    }),
    wrestling: (name, cat, pct) => ({
      subject: `🚨 ${cat.toUpperCase()} IS AT ${pct}%! THE CROWD IS WATCHING!`,
      body: wrap(
        p(`${name.toUpperCase()}!`) +
        p(`YOUR <strong>${cat.toUpperCase()}</strong> BUDGET IS AT <strong>${pct}%</strong>! THE CROWD IS WATCHING AND THEY WANT TO SEE IF YOU HAVE THE DISCIPLINE TO HOLD YOUR GROUND!`) +
        p(`YOU HAVE WORKED TOO HARD TO BLOW IT NOW. DO NOT LET THE BELT SLIP. GET IN THERE AND MANAGE THAT MONEY!`) +
        btn('GET BACK IN THE RING', DASHBOARD)
      ),
    }),
  },

  budgetOver: {
    mom: (name, cat) => ({
      subject: `${cat} budget went over — let's talk`,
      body: wrap(
        p(`Hey ${name},`) +
        p(`Honey, your <strong>${cat}</strong> budget went over this month. We are not judging — we are adjusting. That is what the budget is for.`) +
        p(`Take a look at what happened and decide what you would do differently next month. That is growth, baby.`) +
        btn('Review & Adjust', DASHBOARD)
      ),
    }),
    dad: (name, cat) => ({
      subject: `Over budget on ${cat}. Handle it.`,
      body: wrap(
        p(`${name}.`) +
        p(`Over budget on <strong>${cat}</strong>. Look at the numbers. Adjust next month.`) +
        btn('View Dashboard', DASHBOARD)
      ),
    }),
    spiritual: (name, cat) => ({
      subject: `${cat} boundary was crossed — time to recalibrate`,
      body: wrap(
        p(`Hey ${name},`) +
        p(`The <strong>${cat}</strong> boundary was crossed this month. Release the judgment — it happened. What matters now is the recalibration. What were you seeking that led you there? Bring that need back within your intention.`) +
        p(`Every month is a new beginning. This one ends soon. The next one is already waiting.`) +
        btn('Recalibrate', DASHBOARD)
      ),
    }),
    wrestling: (name, cat) => ({
      subject: `${cat.toUpperCase()} IS DOWN! BUT THE FIGHT IS NOT OVER!`,
      body: wrap(
        p(`${name.toUpperCase()}!`) +
        p(`<strong>${cat.toUpperCase()}</strong> IS OVER BUDGET! YOU TOOK A HIT! BUT LEGENDS DO NOT STAY DOWN — THEY LEARN THE COMBO, THEY ADJUST THE GAME PLAN, AND THEY COME BACK NEXT MONTH STRONGER!`) +
        p(`GET UP. LOOK AT THE NUMBERS. AND COME OUT SWINGING IN ROUND TWO.`) +
        btn('ROUND TWO STARTS NOW', DASHBOARD)
      ),
    }),
  },

  goalMilestone: {
    mom: (name, goal, pct) => ({
      subject: `Look at you — ${pct}% to "${goal}"! 🎉`,
      body: wrap(
        p(`Hey ${name},`) +
        p(`Baby, look at what you are doing! You are <strong>${pct}%</strong> of the way to your <strong>${goal}</strong> savings goal. I am so proud.`) +
        p(`${pct === 100 ? `You did it. You actually did it. That goal is done.` : `Keep going. You are closer than you think.`}`) +
        btn('See My Goals', DASHBOARD)
      ),
    }),
    dad: (name, goal, pct) => ({
      subject: `Goal update: ${pct}% to "${goal}"`,
      body: wrap(
        p(`${name}.`) +
        p(`<strong>${pct}%</strong> to <strong>${goal}</strong>. ${pct === 100 ? 'Done. Good work.' : 'Keep it up.'}`) +
        btn('View Goals', DASHBOARD)
      ),
    }),
    spiritual: (name, goal, pct) => ({
      subject: `${pct}% toward "${goal}" — the energy is moving`,
      body: wrap(
        p(`Hey ${name},`) +
        p(`You are <strong>${pct}%</strong> aligned with your vision for <strong>${goal}</strong>. The energy you have invested is returning to you.`) +
        p(`${pct === 100 ? `The vision has materialized. Take a moment to receive it fully before you set your next intention.` : `Stay consistent. What you are building is real.`}`) +
        btn('View My Goals', DASHBOARD)
      ),
    }),
    wrestling: (name, goal, pct) => ({
      subject: `${pct}% TO "${goal.toUpperCase()}"! YOU ARE WINNING!`,
      body: wrap(
        p(`${name.toUpperCase()}!`) +
        p(`<strong>${pct}%</strong> TO <strong>${goal.toUpperCase()}</strong>! YOU ARE IN THE RING AND YOU ARE WINNING! ${pct === 100 ? `THE BELT IS YOURS! YOU HIT THE GOAL! THE CROWD IS ON ITS FEET!` : `DO NOT SLOW DOWN! THE FINISH LINE IS IN SIGHT AND THE CROWD KNOWS YOUR NAME!`}`) +
        btn(pct === 100 ? 'CLAIM YOUR WIN' : 'KEEP GOING', DASHBOARD)
      ),
    }),
  },

  weeklySummary: {
    mom: (name, income, expenses, net, topSpend) => ({
      subject: `Your week in numbers, ${name} — let's see how you did`,
      body: wrap(
        p(`Hey ${name},`) +
        p(`Here is your weekly money check-in. I made it pretty so you will actually read it.`) +
        weeklyTable(income, expenses, net, topSpend) +
        p(net >= 0
          ? `You came out ahead this week, baby. That is how you build something.`
          : `A little tight this week — but that is why we track it. Awareness is step one. Adjustment is step two. You have got this.`
        ) +
        btn('See Full Dashboard', DASHBOARD)
      ),
    }),
    dad: (name, income, expenses, net, topSpend) => ({
      subject: `Weekly report — Money Moves`,
      body: wrap(
        p(`${name}.`) +
        p(`Here is the week.`) +
        weeklyTable(income, expenses, net, topSpend) +
        p(net >= 0 ? `Positive week. Keep it that way.` : `Negative week. Find the leak.`) +
        btn('View Dashboard', DASHBOARD)
      ),
    }),
    spiritual: (name, income, expenses, net, topSpend) => ({
      subject: `The week has closed — your financial energy review`,
      body: wrap(
        p(`Hey ${name},`) +
        p(`The week has completed its cycle. Here is where your energy flowed.`) +
        weeklyTable(income, expenses, net, topSpend) +
        p(net >= 0
          ? `You ended the week with more than you began. Honor that. The discipline you practiced is compounding.`
          : `The outflow exceeded the inflow this week. Do not resist this information — let it guide your intention for the week ahead.`
        ) +
        btn('Return to Your Dashboard', DASHBOARD)
      ),
    }),
    wrestling: (name, income, expenses, net, topSpend) => ({
      subject: `WEEKLY SCOREBOARD IS IN — HOW DID YOU DO?`,
      body: wrap(
        p(`${name.toUpperCase()}!`) +
        p(`THE WEEK IS OVER! THE JUDGES HAVE SCORED IT! HERE ARE YOUR NUMBERS!`) +
        weeklyTable(income, expenses, net, topSpend) +
        p(net >= 0
          ? `POSITIVE NET! YOU WON THE WEEK! THE CROWD IS GOING WILD! NOW DO IT AGAIN NEXT WEEK!`
          : `YOU TOOK A HIT THIS WEEK! BUT EVERY CHAMPION HAS A BAD ROUND! STUDY THE TAPE, TIGHTEN UP, AND COME BACK SWINGING!`
        ) +
        btn('BACK TO THE DASHBOARD', DASHBOARD)
      ),
    }),
  },

};

function weeklyTable(income, expenses, net, topSpend) {
  const fmt = (n) => n < 0 ? `-$${Math.abs(n).toFixed(2)}` : `$${n.toFixed(2)}`;
  const netColor = net >= 0 ? '#256B42' : '#C0392B';
  let rows = statRow('Income this week', fmt(income), '#256B42')
    + statRow('Expenses this week', fmt(expenses), '#C0392B')
    + statRow('Net', fmt(net), netColor);
  if (topSpend) {
    rows += statRow(`Top spending: ${topSpend.category}`, fmt(topSpend.amount), '#C4A245');
  }
  return `<table width="100%" cellpadding="0" cellspacing="0" border="0" style="border-radius:8px;overflow:hidden;border:1px solid #f0ebe0;margin:0 0 24px;">${rows}</table>`;
}

// ── Resend ─────────────────────────────────────────────────────────────────

async function sendEmail(to, subject, html) {
  const res = await fetch('https://api.resend.com/emails', {
    method: 'POST',
    headers: {
      Authorization: `Bearer ${process.env.RESEND_API_KEY}`,
      'Content-Type': 'application/json',
    },
    body: JSON.stringify({
      from: 'Miranda J <mirandaj@mirajoco.org>',
      to,
      subject,
      html,
    }),
  });
  if (!res.ok) {
    const err = await res.text();
    console.error(`[mm-notify] Resend error for ${to}:`, err);
  }
  return res.ok;
}

// ── Main handler ──────────────────────────────────────────────────────────

export default async function handler(req, res) {
  if (req.method !== 'POST' && req.method !== 'GET') {
    return res.status(405).json({ error: 'Method not allowed' });
  }

  const auth = req.headers.authorization;
  if (process.env.CRON_SECRET && auth !== `Bearer ${process.env.CRON_SECRET}`) {
    return res.status(401).json({ error: 'Unauthorized' });
  }

  const today       = new Date();
  const isMonday    = today.getDay() === 1;
  const monthStart  = new Date(today.getFullYear(), today.getMonth(), 1).toISOString();
  const weekAgo     = new Date(today - 7 * 24 * 60 * 60 * 1000).toISOString();

  let sent = 0;
  const errors = [];

  try {
    // Get all active MM subscribers with preferences
    const { data: prefs, error: prefsErr } = await supabase
      .from('mm_preferences')
      .select('user_id, personality_mode, alert_threshold, email_alerts, weekly_summary, goal_alerts');

    if (prefsErr) throw prefsErr;
    if (!prefs || prefs.length === 0) return res.status(200).json({ sent: 0, message: 'No users' });

    // Filter to active subscribers only
    const userIds = prefs.map(p => p.user_id);
    const { data: subs } = await supabase
      .from('mm_subscriptions')
      .select('user_id')
      .in('user_id', userIds)
      .eq('status', 'active');

    const activeIds = new Set((subs || []).map(s => s.user_id));

    // Get user emails from auth
    const emailMap = {};
    const firstNameMap = {};
    for (const uid of activeIds) {
      const { data: u } = await supabase.auth.admin.getUserById(uid);
      if (u?.user?.email) {
        emailMap[uid] = u.user.email;
        const meta = u.user.user_metadata || {};
        firstNameMap[uid] = meta.first_name || meta.name?.split(' ')[0] || 'Friend';
      }
    }

    // Process each user
    for (const pref of prefs) {
      const uid = pref.user_id;
      if (!activeIds.has(uid)) continue;

      const email     = emailMap[uid];
      const firstName = firstNameMap[uid] || 'Friend';
      const mode      = pref.personality_mode || 'mom';
      const threshold = pref.alert_threshold || 80;

      if (!email) continue;

      // Get this user's household
      const { data: member } = await supabase
        .from('mm_members')
        .select('household_id')
        .eq('user_id', uid)
        .eq('status', 'active')
        .order('created_at', { ascending: true })
        .limit(1)
        .single();

      if (!member) continue;
      const hhId = member.household_id;

      // ── Budget alerts ────────────────────────────────────────────
      if (pref.email_alerts) {
        // Get expense categories with budget caps
        const { data: cats } = await supabase
          .from('mm_categories')
          .select('id, name, budget_amount')
          .eq('household_id', hhId)
          .eq('type', 'expense')
          .gt('budget_amount', 0);

        if (cats && cats.length > 0) {
          // Get this month's expense transactions
          const catIds = cats.map(c => c.id);
          const { data: txns } = await supabase
            .from('mm_transactions')
            .select('category_id, amount')
            .eq('household_id', hhId)
            .eq('type', 'expense')
            .in('category_id', catIds)
            .gte('date', monthStart.split('T')[0]);

          // Sum per category
          const spendMap = {};
          for (const t of (txns || [])) {
            spendMap[t.category_id] = (spendMap[t.category_id] || 0) + Number(t.amount);
          }

          for (const cat of cats) {
            const spent  = spendMap[cat.id] || 0;
            const cap    = Number(cat.budget_amount);
            const pct    = Math.round((spent / cap) * 100);

            // Check if we already sent an alert this month for this category+level
            const alertKey = `budget-${uid}-${cat.id}-${pct >= 100 ? 'over' : 'alert'}`;
            const { data: alreadySent } = await supabase
              .from('mm_notification_log')
              .select('id')
              .eq('key', alertKey)
              .gte('sent_at', monthStart)
              .limit(1);

            if (alreadySent && alreadySent.length > 0) continue;

            let copy = null;
            if (pct >= 100) {
              copy = COPY.budgetOver[mode]?.(firstName, cat.name);
            } else if (pct >= threshold) {
              copy = COPY.budgetAlert[mode]?.(firstName, cat.name, pct);
            }

            if (copy) {
              const ok = await sendEmail(email, copy.subject, copy.body);
              if (ok) {
                sent++;
                await supabase.from('mm_notification_log').insert({ key: alertKey, user_id: uid, sent_at: new Date().toISOString() });
              }
            }
          }
        }
      }

      // ── Goal milestones ──────────────────────────────────────────
      if (pref.goal_alerts) {
        const { data: goals } = await supabase
          .from('mm_goals')
          .select('id, name, target_amount, current_amount, celebration_note')
          .eq('household_id', hhId)
          .eq('status', 'active');

        for (const goal of (goals || [])) {
          const pct = Math.round((Number(goal.current_amount) / Number(goal.target_amount)) * 100);
          const milestone = [25, 50, 75, 100].find(m => pct >= m);
          if (!milestone) continue;

          const milestoneKey = `goal-${uid}-${goal.id}-${milestone}`;
          const { data: alreadySent } = await supabase
            .from('mm_notification_log')
            .select('id')
            .eq('key', milestoneKey)
            .limit(1);

          if (alreadySent && alreadySent.length > 0) continue;

          const copy = COPY.goalMilestone[mode]?.(firstName, goal.name, milestone);
          if (copy) {
            const ok = await sendEmail(email, copy.subject, copy.body);
            if (ok) {
              sent++;
              await supabase.from('mm_notification_log').insert({ key: milestoneKey, user_id: uid, sent_at: new Date().toISOString() });
            }
          }
        }
      }

      // ── Weekly summary (Mondays only) ────────────────────────────
      if (pref.weekly_summary && isMonday) {
        const weekKey = `weekly-${uid}-${today.toISOString().split('T')[0]}`;
        const { data: alreadySent } = await supabase
          .from('mm_notification_log')
          .select('id')
          .eq('key', weekKey)
          .limit(1);

        if (!alreadySent || alreadySent.length === 0) {
          const { data: weekTxns } = await supabase
            .from('mm_transactions')
            .select('type, amount, category_id')
            .eq('household_id', hhId)
            .neq('type', 'transfer')
            .gte('date', weekAgo.split('T')[0]);

          let income = 0, expenses = 0;
          const catSpend = {};
          for (const t of (weekTxns || [])) {
            if (t.type === 'income')  income   += Number(t.amount);
            if (t.type === 'expense') {
              expenses += Number(t.amount);
              catSpend[t.category_id] = (catSpend[t.category_id] || 0) + Number(t.amount);
            }
          }

          // Top spending category
          let topSpend = null;
          if (Object.keys(catSpend).length > 0) {
            const topCatId = Object.keys(catSpend).sort((a, b) => catSpend[b] - catSpend[a])[0];
            const { data: topCat } = await supabase
              .from('mm_categories')
              .select('name')
              .eq('id', topCatId)
              .single();
            if (topCat) topSpend = { category: topCat.name, amount: catSpend[topCatId] };
          }

          const net  = income - expenses;
          const copy = COPY.weeklySummary[mode]?.(firstName, income, expenses, net, topSpend);
          if (copy) {
            const ok = await sendEmail(email, copy.subject, copy.body);
            if (ok) {
              sent++;
              await supabase.from('mm_notification_log').insert({ key: weekKey, user_id: uid, sent_at: new Date().toISOString() });
            }
          }
        }
      }
    }

    return res.status(200).json({ sent, errors: errors.length > 0 ? errors : undefined });

  } catch (err) {
    console.error('[mm-notify]', err.message);
    return res.status(500).json({ error: err.message });
  }
}
