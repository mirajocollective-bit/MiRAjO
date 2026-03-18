// Course email sequences — content + queue helper
// Sends via Resend. Queue populated on enrollment/completion events.

const LOGIN = 'https://www.mirajoco.org/programs/login';
const CERT  = 'https://www.mirajoco.org/programs/certificate';

function wrap(content) {
  return `<!DOCTYPE html><html><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1"></head>
<body style="margin:0;padding:0;background:#ffffff;">
<table width="100%" cellpadding="0" cellspacing="0" border="0">
<tr><td align="center" style="padding:40px 20px;">
<table width="100%" cellpadding="0" cellspacing="0" border="0" style="max-width:560px;">
<tr><td>
<p style="font-size:11px;letter-spacing:3px;text-transform:uppercase;color:#9DC4A8;margin:0 0 40px;font-family:sans-serif;">MiRAjO</p>
${content}
<p style="margin:40px 0 4px;font-size:17px;color:#122012;font-family:Georgia,serif;font-style:italic;">Miranda J</p>
<p style="margin:0 0 40px;font-size:12px;color:#888;font-family:sans-serif;">MiRAjO Collective &nbsp;|&nbsp; <a href="https://www.mirajoco.org" style="color:#888;text-decoration:none;">mirajoco.org</a></p>
</td></tr>
</table>
</td></tr>
</table>
</body></html>`;
}

function p(text) {
  return `<p style="font-size:16px;line-height:1.9;color:#1a2a1a;margin:0 0 22px;font-family:Georgia,serif;">${text}</p>`;
}

function btn(text, url) {
  return `<p style="margin:4px 0 32px;"><a href="${url}" style="display:inline-block;padding:14px 32px;background:#256B42;color:#ffffff;text-decoration:none;border-radius:6px;font-size:14px;font-weight:600;font-family:sans-serif;letter-spacing:0.3px;">${text}</a></p>`;
}

function greet(firstName) {
  return p(firstName ? `Hey ${firstName},` : `Hey,`);
}

export const SEQUENCES = {

  'enrolled-25d25n': [
    {
      step: 1, delayDays: 0,
      subject: "You're in. Here's what happens next.",
      body: (n) => wrap(
        greet(n) +
        p(`You made a decision. That already puts you ahead of most people.`) +
        p(`Your 25 Days &amp; 25 Nights course is ready.`) +
        btn('Start Day 1', LOGIN) +
        p(`Each day has a lesson, a journal prompt, and your 10 Non-Negotiables to track. The work is not optional. That's the whole point.`) +
        p(`Day 1 is waiting. Start today.`)
      ),
    },
    {
      step: 2, delayDays: 3,
      subject: "Three days in. How honest are you being?",
      body: (n) => wrap(
        greet(n) +
        p(`The first few days are easy. You're motivated, it's new.`) +
        p(`The real question is whether you're actually doing the work — the Non-Negotiables, the journal, not just watching the videos.`) +
        p(`This program only works if you work it. Log back in and stay honest with yourself.`) +
        btn('Continue the Work', LOGIN)
      ),
    },
    {
      step: 3, delayDays: 8,
      subject: "One week. What have you planted?",
      body: (n) => wrap(
        greet(n) +
        p(`You've had the course for a week.`) +
        p(`A seed planted in bad soil still doesn't grow, no matter how good the seed is. Where you're putting your attention right now is the soil.`) +
        p(`If you've been showing up: good. Keep going. If you've been avoiding it: that's information too.`) +
        btn('Back to the Course', LOGIN)
      ),
    },
    {
      step: 4, delayDays: 15,
      subject: "Halfway. Most people quit here.",
      body: (n) => wrap(
        greet(n) +
        p(`You are at the midpoint. This is exactly where momentum either compounds or collapses.`) +
        p(`The people who finish this program are not the ones who feel the most motivated. They're the ones who decided they were finishing it regardless.`) +
        p(`The next lesson is waiting.`) +
        btn('Keep Going', LOGIN)
      ),
    },
    {
      step: 5, delayDays: 22,
      subject: "Three days left. Don't you dare stop now.",
      body: (n) => wrap(
        greet(n) +
        p(`You have three days. Everything you've built over the last 22 days is sitting right here.`) +
        p(`You don't get to come this close and walk away. That's not how this works.`) +
        p(`Finish it.`) +
        btn('Finish the Course', LOGIN)
      ),
    },
  ],

  'module-1-complete': [
    {
      step: 1, delayDays: 0,
      subject: "Module 1 done. Now the real work starts.",
      body: (n) => wrap(
        greet(n) +
        p(`You've watched the videos. You know the framework now.`) +
        p(`Knowing it is not the same as living it. That's what Modules 2 through 5 are for.`) +
        p(`The 25 Days are where this either becomes real or stays theory. Don't let it stay theory.`) +
        btn('Go to Module 2', LOGIN)
      ),
    },
  ],

  'course-25d25n-complete': [
    {
      step: 1, delayDays: 0,
      subject: "You finished. Most people don't.",
      body: (n) => wrap(
        greet(n) +
        p(`25 days. 25 nights. You did the work.`) +
        p(`That's not a small thing. Most people who buy programs like this never finish them. You're not most people.`) +
        p(`The question now is: what are you going to do with what you know?`) +
        p(`A seed has been planted. Water it. Protect it. Give it time.`) +
        btn('Get Your Certificate', CERT)
      ),
    },
    {
      step: 2, delayDays: 4,
      subject: "Four days out. What's different?",
      body: (n) => wrap(
        greet(n) +
        p(`Four days since you finished. What's actually different?`) +
        p(`Not what should be different. Not what you planned to change. What is actually different in how you're showing up?`) +
        p(`If the answer is nothing, that's the work. Start there.`) +
        p(`Reply to this email and tell me one thing you've done differently. I read every reply.`)
      ),
    },
  ],

};

// Insert a full sequence into the email_queue for a subscriber
export async function queueSequence(supabase, email, sequenceName, firstName = '') {
  const steps = SEQUENCES[sequenceName];
  if (!steps) { console.error(`[email-queue] Unknown sequence: ${sequenceName}`); return; }

  const now = new Date();
  const rows = steps.map(({ step, delayDays }) => {
    const sendAfter = new Date(now);
    sendAfter.setDate(sendAfter.getDate() + delayDays);
    return { email, first_name: firstName, sequence: sequenceName, step, send_after: sendAfter.toISOString() };
  });

  const { error } = await supabase
    .from('email_queue')
    .upsert(rows, { onConflict: 'email,sequence,step', ignoreDuplicates: true });

  if (error) console.error(`[email-queue] Failed to queue ${sequenceName} for ${email}:`, error.message);
}
