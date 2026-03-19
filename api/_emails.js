// Course email sequences — content + queue helper
// Sends via Resend. Queue populated on enrollment/completion events.

const LOGIN = 'https://www.mirajoco.org/programs/login';
const CERT  = 'https://www.mirajoco.org/programs/certificate';
const LOGO  = 'https://www.mirajoco.org/img/Where%20Authenticity%20is%20the%20new%20blue%20check%20(250%20x%20150%20px)%20(800%20x%20312%20px)%20(450%20x%2070%20px)%20(Logo)%20(1).png';

function wrap(content) {
  return `<!DOCTYPE html><html><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1"></head>
<body style="margin:0;padding:0;background:#F9F6F0;">
<table width="100%" cellpadding="0" cellspacing="0" border="0" style="background:#F9F6F0;">
<tr><td align="center" style="padding:48px 20px 40px;">
<table width="100%" cellpadding="0" cellspacing="0" border="0" style="max-width:560px;background:#ffffff;border-radius:12px;overflow:hidden;box-shadow:0 2px 24px rgba(18,32,18,0.07);">
<tr><td style="padding:40px 48px 0;text-align:left;">
<img src="${LOGO}" alt="MiRAjO" width="160" style="display:block;width:160px;height:auto;margin-bottom:36px;" />
</td></tr>
<tr><td style="padding:0 48px 48px;">
${content}
<p style="margin:36px 0 4px;font-size:17px;color:#122012;font-family:Georgia,serif;font-style:italic;">Miranda J</p>
<p style="margin:0 0 0;font-size:12px;color:#999;font-family:sans-serif;">MiRAjO Collective &nbsp;|&nbsp; <a href="https://www.mirajoco.org" style="color:#999;text-decoration:none;">mirajoco.org</a></p>
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
      subject: "You're in. Welcome to the work.",
      body: (n) => wrap(
        greet(n) +
        p(`Something happened the moment you hit purchase. You said yes to yourself — and that's not nothing. In a world where it's become genuinely easier to scroll for two hours than to sit with one honest question, making that decision is actually kind of remarkable.`) +
        p(`So, welcome. Let's get into it.`) +
        p(`<strong style="color:#122012;">What you've got waiting for you:</strong><br>25 Days &amp; 25 Nights is structured simply. Each day: a lesson, a journal prompt, and your 10 Non-Negotiables. The nights are yours to reflect. Repeat for 25 days. The work is not complicated — it just asks you to actually do it. (I know. Revolutionary.)`) +
        p(`Inside you'll find video, written content, and the kind of questions that have a way of following you around long after you close the tab. That's a feature, not a bug.`) +
        p(`<strong style="color:#122012;">How to get in:</strong><br>We don't use passwords here — passwords are overrated and nobody remembers them anyway. We use magic links instead. Here's how it works:`) +
        `<table cellpadding="0" cellspacing="0" border="0" style="margin:0 0 22px;"><tr><td style="padding:0;">` +
        `<p style="font-size:15px;line-height:1.9;color:#1a2a1a;margin:0 0 6px;font-family:Georgia,serif;">1. Click the button below — it takes you to the login page.</p>` +
        `<p style="font-size:15px;line-height:1.9;color:#1a2a1a;margin:0 0 6px;font-family:Georgia,serif;">2. Enter the email address you used to purchase.</p>` +
        `<p style="font-size:15px;line-height:1.9;color:#1a2a1a;margin:0 0 6px;font-family:Georgia,serif;">3. Check your inbox for an email from Miranda J — click that link.</p>` +
        `<p style="font-size:15px;line-height:1.9;color:#1a2a1a;margin:0 0 0;font-family:Georgia,serif;">4. You're in your dashboard. That's it.</p>` +
        `</td></tr></table>` +
        btn('Start Day 1', LOGIN) +
        p(`<strong style="color:#122012;">One thing to know:</strong> Magic links are single-use and expire quickly, so keep this email open when you click through. Once you're logged in, your session stays active — so as long as you don't clear your browser, you won't need to log in again for a good while.`) +
        p(`The only question worth asking today is: <em>what am I actually here for?</em>`) +
        p(`Day 1 has the beginning of that answer. Go find it.`)
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
