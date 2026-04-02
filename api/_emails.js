// Course email sequences — content + queue helper
// Sends via Resend. Queue populated on enrollment/completion events.

const LOGIN = 'https://www.mirajoco.org/programs/login';
const CERT  = 'https://www.mirajoco.org/programs/certificate';
const LOGO  = 'https://www.mirajoco.org/img/logo-horizontal.png';

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

  // ── COUPLES IN ENTREPRENEURSHIP ──────────────────────────────

  'enrolled-couples-cie': [
    {
      step: 1, delayDays: 0,
      subject: "You're in. Now let's get your partner in too.",
      body: (n, d) => wrap(
        greet(n) +
        p(`You just made a decision most couples never make. You said: we are going to look at this honestly, together. That takes courage and it takes love.`) +
        p(`Here is what happens next.`) +
        p(`<strong style="color:#122012;">Step 1: Log in and get your bearings.</strong><br>Use the button below to access your dashboard. You will find The Partnership Diagnostic waiting for you. Complete your side privately. Your partner will not see your answers.`) +
        p(`<strong style="color:#122012;">Step 2: Invite your partner.</strong><br>After you log in, you will be prompted to enter your partner's email. They will receive their own invite and complete the diagnostic separately.`) +
        p(`<strong style="color:#122012;">Step 3: See your Partnership Report together.</strong><br>Once both of you have finished, your report generates automatically. That is where the real work begins.`) +
        btn('Log In and Get Started', `${process.env.SITE_URL || 'https://www.mirajoco.org'}/programs/couples-confirm`) +
        p(`If you have any questions at all, reply to this email. I read every one.`)
      ),
    },
    {
      step: 2, delayDays: 2,
      subject: "Your partner hasn't joined yet.",
      body: (n) => wrap(
        greet(n) +
        p(`You enrolled two days ago and your partner has not joined yet. That is okay. But the course cannot begin until both of you are in.`) +
        p(`If you have not sent the invite, log in now and enter their email. It takes less than a minute.`) +
        p(`If you already sent it, it might be worth a gentle nudge their way.`) +
        btn('Log In to Invite Your Partner', `${process.env.SITE_URL || 'https://www.mirajoco.org'}/programs/couples-confirm`)
      ),
    },
    {
      step: 3, delayDays: 5,
      subject: "Still waiting on your partner.",
      body: (n) => wrap(
        greet(n) +
        p(`Five days in and your partner has not yet accepted their invite. The course is ready. The work is ready. The only thing missing is the two of you inside it together.`) +
        p(`Sometimes one partner moves faster than the other. That is not a problem. It is information. Talk to them about why you signed up and what you are hoping this does for you both.`) +
        p(`When they are ready, their invite link is still active. Log in to resend it if needed.`) +
        btn('Log In', `${process.env.SITE_URL || 'https://www.mirajoco.org'}/programs/login`)
      ),
    },
  ],

  'invited-couples-cie': [
    {
      step: 1, delayDays: 0,
      subject: (d) => `${d?.partner_name || 'Your partner'} invited you to something important.`,
      body: (n, d) => wrap(
        greet(n) +
        p(`${d?.partner_name || 'Your partner'} just enrolled in Couples in Entrepreneurship and they want you in it with them.`) +
        p(`That is not a small thing. They did not just buy a course. They said: I want us to be better at this together. Together being the operative word.`) +
        p(`Here is what the course is:`) +
        p(`You each complete The Partnership Diagnostic privately. No shared answers, no pressure. Then the system generates your Partnership Report which shows you exactly where you are aligned and where you are not across four areas: Money, Business, Family, and Relationship.`) +
        p(`From there, a joint course path opens up built specifically around your gaps. Not a generic program. Yours.`) +
        p(`It is not therapy. It is infrastructure for couples who are building something serious.`) +
        btn('Accept Your Invite', d?.invite_url || `${process.env.SITE_URL || 'https://www.mirajoco.org'}/programs/couples-join`) +
        p(`If you have questions before you jump in, reply here. I am happy to talk through what this looks like for you both.`)
      ),
    },
    {
      step: 2, delayDays: 2,
      subject: "A quick reminder from your partner.",
      body: (n, d) => wrap(
        greet(n) +
        p(`${d?.partner_name || 'Your partner'} is waiting on the other side of this.`) +
        p(`They enrolled in Couples in Entrepreneurship and invited you two days ago. The course cannot generate your Partnership Report until both of you are in.`) +
        p(`It takes less than five minutes to set up your account and get started on your side of the diagnostic. Everything else moves at your pace.`) +
        btn('Join Now', d?.invite_url || `${process.env.SITE_URL || 'https://www.mirajoco.org'}/programs/couples-join`)
      ),
    },
  ],

  'report-ready-cie': [
    {
      step: 1, delayDays: 0,
      subject: "Your Partnership Report is ready.",
      body: (n) => wrap(
        greet(n) +
        p(`Both of you have completed The Partnership Diagnostic. Your Partnership Report is ready.`) +
        p(`This is the moment. Find time to open it together, not separately. What you are about to see is where you align, where you do not, and what the course is going to help you build between those two things.`) +
        p(`Do not read it and then summarize it to each other later. Sit down together. Open it together. That is the beginning of the work.`) +
        btn('View Your Partnership Report', `${process.env.SITE_URL || 'https://www.mirajoco.org'}/programs/couples-dashboard`)
      ),
    },
  ],

  'couples-cie-complete': [
    {
      step: 1, delayDays: 0,
      subject: "You built something together.",
      body: (n) => wrap(
        greet(n) +
        p(`You finished. Both of you.`) +
        p(`That matters more than it sounds. Most couples who feel the friction of building a business together never look at it directly. They manage around it, they avoid the hard conversations, they hope the business gets easier before the relationship gets harder.`) +
        p(`You did the opposite. You looked at it. You named it. You worked through it together.`) +
        p(`That does not mean every tension is resolved. But you now have a shared language for it, a framework to return to, and proof that you can do hard things as a team.`) +
        p(`If you want to go deeper, one-on-one coaching with me is the next step. It is not for everyone. But if you are serious about what you are building and who you are building it with, it might be for you.`) +
        btn('Learn About Coaching', `${process.env.SITE_URL || 'https://www.mirajoco.org'}/coaching`)
      ),
    },
    {
      step: 2, delayDays: 4,
      subject: "Four days out. What changed?",
      body: (n) => wrap(
        greet(n) +
        p(`It has been four days since you finished the course. I want to ask you something honest.`) +
        p(`What is actually different? Not what you planned to change. Not what you talked about changing. What has genuinely shifted in how you and your partner are showing up for each other and for the business?`) +
        p(`Reply to this email and tell me one thing. I read every reply.`)
      ),
    },
  ],

  // ── LEAD MAGNETS ─────────────────────────────────────────────────

  'lead-couples-scorecard': [
    {
      step: 1, delayDays: 0,
      subject: (d) => d?.result === 'red' ? 'Your score says: Critical. Here is what that means.' : d?.result === 'yellow' ? 'Your score says: Caution. Here is what that means.' : 'Your score says: Aligned. Here is what that means.',
      body: (n, d) => {
        const result = d?.result || 'yellow';
        const copies = {
          red: {
            headline: 'Critical — The gap is real.',
            body: `You are not imagining it. Something is off — in how you make decisions, how you talk about money, how connected you feel, or all of it. The distance between you did not happen overnight. But you named it today, and that is more than most couples ever do.`,
            next: `The next step is not a conversation with your partner. It is this: <a href="https://www.mirajoco.org/couplesinentrepreneurship" style="color:#8B1A2B;">Couples in Entrepreneurship</a> was built for exactly where you are. Eight modules across Business, Finances, Family, and Relationship — built for couples in business who are tired of managing the gap and ready to close it.`,
          },
          yellow: {
            headline: 'Caution — You are drifting.',
            body: `You are not in crisis. But you are not as aligned as you need to be either. The kind of drift you are in tends to get slower and quieter — until one day it is not. You have time to close the gap. But it will not close on its own.`,
            next: `<a href="https://www.mirajoco.org/couplesinentrepreneurship" style="color:#8B1A2B;">Couples in Entrepreneurship</a> gives you the conversations, the frameworks, and the shared agreements to get back in sync before the distance becomes harder to cross.`,
          },
          green: {
            headline: 'Aligned — And worth protecting.',
            body: `You are in a strong place. That does not happen by accident — it takes two people actively choosing it. The couples who stay aligned are the ones who work at it intentionally, not the ones who assume it will hold.`,
            next: `<a href="https://www.mirajoco.org/couplesinentrepreneurship" style="color:#8B1A2B;">Couples in Entrepreneurship</a> is not just for couples in trouble. It is for couples who want to stay where you are and keep building from it.`,
          },
        };
        const c = copies[result];
        return wrap(
          greet(n) +
          p(`You took the Couples Alignment Scorecard today. Here is what your results actually mean.`) +
          p(`<strong style="color:#122012;">${c.headline}</strong>`) +
          p(c.body) +
          p(c.next) +
          btn('Learn About Couples in Entrepreneurship', 'https://www.mirajoco.org/couplesinentrepreneurship') +
          p(`If you have questions about whether this is right for you and your partner, reply to this email. I read every one.`)
        );
      },
    },
    {
      step: 2, delayDays: 3,
      subject: 'The one thing couples in business avoid most.',
      body: (n) => wrap(
        greet(n) +
        p(`You took the scorecard a few days ago. I want to share something I have seen again and again working with couples in business.`) +
        p(`The thing that creates the most distance between partners is not fighting. It is the conversations they keep almost having and then not having. The thing that stays unsaid because the timing is never right, or because they are not sure how to say it, or because they are afraid of what it will open up.`) +
        p(`Those almost-conversations accumulate. And the weight of them is heavier than the conversation itself ever would have been.`) +
        p(`Couples in Entrepreneurship is built to give you the structure for those conversations — so they finally happen, in the right order, with the right framework underneath them.`) +
        btn('See What Is Inside', 'https://www.mirajoco.org/couplesinentrepreneurship')
      ),
    },
    {
      step: 3, delayDays: 7,
      subject: 'One week since your scorecard. Still thinking about it?',
      body: (n) => wrap(
        greet(n) +
        p(`If you are still here, you are still thinking about it.`) +
        p(`That is how it works. The scorecard surfaced something you already knew was there. The question is what you do with it.`) +
        p(`Couples in Entrepreneurship is $997 for both of you — one purchase, two accounts, lifetime access. It is not cheap. But a single session with a couples therapist who understands business costs more than that and gives you nothing to take home.`) +
        p(`This gives you eight modules, a shared diagnostic, a Partnership Report built on your actual answers, and a course path designed around your specific gaps. Not a generic program. Yours.`) +
        btn('Enroll in Couples in Entrepreneurship', 'https://www.mirajoco.org/couplesinentrepreneurship') +
        p(`If it is not the right time, that is okay. But if it is — do not wait until the gap is wider.`)
      ),
    },
  ],

  'lead-alignment-audit': [
    {
      step: 1, delayDays: 0,
      subject: (d) => d?.result === 'red' ? 'Your score says: Disconnected. Here is what that means.' : d?.result === 'yellow' ? 'Your score says: Drifting. Here is what that means.' : 'Your score says: Connected. Here is what that means.',
      body: (n, d) => {
        const result = d?.result || 'yellow';
        const copies = {
          red: {
            headline: 'Disconnected — You have been running on empty.',
            body: `This feeling has a name. It is not a personality flaw and it is not permanent — but it is real, and it has been real for a while. You are not lost. You just have not had the structure to find your way back to yourself.`,
            next: `<a href="https://www.mirajoco.org/25daysand25nights?offer=audit" style="color:#5A3F9A;">25 Days and 25 Nights</a> was built for exactly this. One day at a time, one practice at a time — reconnecting to the life that is actually yours.`,
          },
          yellow: {
            headline: 'Drifting — You know something feels off.',
            body: `You have moments of clarity. You know what you want in theory. But the gap between where you are and where you want to be feels wider than it should. That gap does not close by itself.`,
            next: `<a href="https://www.mirajoco.org/25daysand25nights?offer=audit" style="color:#5A3F9A;">25 Days and 25 Nights</a> gives you the daily structure to stop drifting and start moving with intention.`,
          },
          green: {
            headline: 'Connected — And ready to go deeper.',
            body: `You are self-aware, intentional, and moving in the right direction. The question is whether you are building with the same intentionality you live with.`,
            next: `<a href="https://www.mirajoco.org/25daysand25nights?offer=audit" style="color:#5A3F9A;">25 Days and 25 Nights</a> will push you further. This is for people who are ready to stop settling for good and start building great.`,
          },
        };
        const c = copies[result];
        return wrap(
          greet(n) +
          p(`You took the Alignment Audit today. Here is what your results actually mean.`) +
          p(`<strong style="color:#122012;">${c.headline}</strong>`) +
          p(c.body) +
          p(c.next) +
          btn('Learn About 25 Days and 25 Nights', 'https://www.mirajoco.org/25daysand25nights?offer=audit') +
          p(`If you have questions before you jump in, reply to this email. I am happy to talk through what this looks like for you.`)
        );
      },
    },
    {
      step: 2, delayDays: 3,
      subject: 'Why you feel like you are living someone else\'s life.',
      body: (n) => wrap(
        greet(n) +
        p(`You took the Alignment Audit a few days ago. I want to tell you something I did not put in the results page.`) +
        p(`The disconnection you are feeling is rarely about not knowing what you want. It is about not trusting what you know.`) +
        p(`You outsourced your own awareness — maybe gradually, maybe all at once. To other people's opinions. To what makes sense on paper. To what you are supposed to want at this stage of your life. And now there is a gap between the life you are living and the one that actually fits you.`) +
        p(`That gap closes one day at a time. Not in a weekend. Not in a single breakthrough moment. One day at a time, with the right structure underneath you.`) +
        p(`That is what 25 Days and 25 Nights is built to give you.`) +
        btn('See What Is Inside', 'https://www.mirajoco.org/25daysand25nights?offer=audit')
      ),
    },
    {
      step: 3, delayDays: 7,
      subject: 'One week since your audit. What has changed?',
      body: (n) => wrap(
        greet(n) +
        p(`It has been a week since your Alignment Audit. I am curious — has anything shifted for you since then?`) +
        p(`Sometimes just naming the disconnection is enough to start the movement. Sometimes it sits there and nothing changes until something pushes you to actually do something about it.`) +
        p(`If you are in the second group, here is the push: 25 Days and 25 Nights is $597. One time. Lifetime access. Daily video lessons, journal prompts, and the Non-Negotiables practice that will actually change your daily defaults — not just your awareness of them.`) +
        p(`Awareness without structure is just discomfort with better vocabulary. This gives you both.`) +
        btn('Enroll in 25 Days and 25 Nights', 'https://www.mirajoco.org/25daysand25nights?offer=audit') +
        p(`If it is not the right time, that is okay. But if the audit hit something real — this is the next step.`)
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
export async function queueSequence(supabase, email, sequenceName, firstName = '', extraData = {}) {
  const steps = SEQUENCES[sequenceName];
  if (!steps) { console.error(`[email-queue] Unknown sequence: ${sequenceName}`); return; }

  const now = new Date();
  const rows = steps.map(({ step, delayDays }) => {
    const sendAfter = new Date(now);
    sendAfter.setDate(sendAfter.getDate() + delayDays);
    return { email, first_name: firstName, sequence: sequenceName, step, send_after: sendAfter.toISOString(), extra_data: extraData };
  });

  const { error } = await supabase
    .from('email_queue')
    .upsert(rows, { onConflict: 'email,sequence,step', ignoreDuplicates: true });

  if (error) console.error(`[email-queue] Failed to queue ${sequenceName} for ${email}:`, error.message);
}
