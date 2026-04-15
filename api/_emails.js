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
      body: (n, d = {}) => wrap(
        greet(n) +
        p(`Something happened the moment you hit purchase. You said yes to yourself, and that's not nothing. In a world where it's become genuinely easier to scroll for two hours than to sit with one honest question, making that decision is actually kind of remarkable.`) +
        p(`So, welcome. Let's get into it.`) +
        p(`<strong style="color:#122012;">What you've got waiting for you:</strong><br>25 Days &amp; 25 Nights is structured simply. Each day: a lesson, a journal prompt, and your 10 Non-Negotiables. The nights are yours to reflect. Repeat for 25 days. The work is not complicated. It just asks you to actually do it. (I know. Revolutionary.)`) +
        p(`Inside you'll find video, written content, and the kind of questions that have a way of following you around long after you close the tab. That's a feature, not a bug.`) +
        p(`<strong style="color:#122012;">First step: set your password.</strong><br>Click the button below to choose your password and land straight in your course dashboard. This link is for you only and works once, so use it now.`) +
        btn('Set Your Password &amp; Start', d.setup_link || LOGIN) +
        p(`Once your password is set, you'll log in at <a href="${LOGIN}" style="color:#256B42;">${LOGIN.replace('https://', '')}</a> using your email and password any time.`) +
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
        p(`The real question is whether you're actually doing the work: the Non-Negotiables, the journal, not just watching the videos.`) +
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

  'module-2-complete': [
    {
      step: 1, delayDays: 0,
      subject: "Module 2 done. You're building momentum.",
      body: (n) => wrap(
        greet(n) +
        p(`Two modules in. That means you're past the point where most people stop.`) +
        p(`Module 2 is where the framework starts to feel personal. What you're learning now isn't abstract anymore. It's about you specifically.`) +
        p(`Keep that going. Module 3 is waiting.`) +
        btn('Continue to Module 3', LOGIN)
      ),
    },
  ],

  'module-3-complete': [
    {
      step: 1, delayDays: 0,
      subject: "Halfway through. Don't slow down now.",
      body: (n) => wrap(
        greet(n) +
        p(`Three modules done. You're at the halfway point.`) +
        p(`This is exactly where the work either starts to land or starts to feel like effort. If it's feeling hard, that's not a sign something is wrong. That's a sign you're actually doing it.`) +
        p(`Two modules left. Go finish what you started.`) +
        btn('Keep Going', LOGIN)
      ),
    },
  ],

  'module-4-complete': [
    {
      step: 1, delayDays: 0,
      subject: "One module left. Finish it.",
      body: (n) => wrap(
        greet(n) +
        p(`Four modules down. One to go.`) +
        p(`You've done the hard part. The last module is where it all comes together. Don't leave it sitting unfinished.`) +
        p(`You're closer than you think.`) +
        btn('Go to Module 5', LOGIN)
      ),
    },
  ],

  'module-5-complete': [
    {
      step: 1, delayDays: 0,
      subject: "All five modules. Now do the 25 days.",
      body: (n) => wrap(
        greet(n) +
        p(`You've completed all five modules. The full framework is in your hands now.`) +
        p(`But the framework is not the finish line. The 25 Days are. That's where everything you've learned stops being something you know and starts being something you live.`) +
        p(`Log in and keep going.`) +
        btn('Continue the Course', LOGIN)
      ),
    },
  ],

  // ── COUPLES IN ENTREPRENEURSHIP ──────────────────────────────

  'enrolled-couples-cie': [
    {
      step: 1, delayDays: 0,
      subject: "You're in. Here is what happens next.",
      body: (n, d) => wrap(
        greet(n) +
        p(`You just made a decision most couples never make. You said: we are going to look at this honestly, together. That is not a small thing.`) +
        p(`Here is how the next few days go:`) +
        p(`<strong style="color:#B82038;">Log in and build your profile.</strong><br>Takes about five minutes. This is yours alone: your background, your family situation, where the business is, and what you are hoping this does for you both. Your partner completes theirs separately, so be honest.`) +
        p(`<strong style="color:#B82038;">Invite your partner.</strong><br>From your dashboard, enter their email. They will get everything they need to create their account and complete their side of things at their own pace.`) +
        p(`<strong style="color:#B82038;">Start Module 1 together or separately.</strong><br>It is always available from day one. It sets up everything that comes next, including the Partnership Diagnostic.`) +
        p(`<strong style="color:#B82038;">Take the Diagnostic privately.</strong><br>You each answer separately and honestly. Your partner will not see your responses. What generates from both sets of answers is your Partnership Report, and that you open together.`) +
        p(`Your report shows exactly where you align, where the gaps are, and which course modules are built around your specific situation. That is where the real work starts.`) +
        btn('Log In and Get Started', `${process.env.SITE_URL || 'https://www.mirajoco.org'}/programs/couples-confirm`) +
        p(`Reply to this email any time. I read every one.`)
      ),
    },
    {
      step: 2, delayDays: 2,
      subject: "Quick check-in on where things stand.",
      body: (n) => wrap(
        greet(n) +
        p(`Just checking in. If your partner has not joined yet, no rush, but the course does not fully open until both of you are in.`) +
        p(`If you have not sent the invite yet, log in and enter their email from your dashboard. It takes less than a minute and they get a clear, friendly email explaining exactly what they are joining.`) +
        p(`If you already sent it, a gentle heads-up their way usually does the trick.`) +
        btn('Go to Your Dashboard', `${process.env.SITE_URL || 'https://www.mirajoco.org'}/programs/couples-confirm`)
      ),
    },
    {
      step: 3, delayDays: 7,
      subject: "Still here when you are both ready.",
      body: (n) => wrap(
        greet(n) +
        p(`A week in and things are still getting started on your end. That happens. Life does not pause for course launches.`) +
        p(`When both of you are ready, everything is waiting. The invite link is still active. The course is still yours. Nothing expires.`) +
        p(`Sometimes one partner needs a little more time to feel ready to do this kind of work. That is worth a conversation in itself: why did you sign up, what are you hoping it does for you both, and what would make it feel like the right time?`) +
        p(`That conversation is actually a good place to start.`) +
        btn('Log In', `${process.env.SITE_URL || 'https://www.mirajoco.org'}/programs/login`)
      ),
    },
  ],

  'invited-couples-cie': [
    {
      step: 1, delayDays: 0,
      subject: (d) => `${d?.partner_name || 'Your partner'} invited you to something they care about.`,
      body: (n, d) => wrap(
        greet(n) +
        p(`${d?.partner_name || 'Your partner'} just enrolled in Couples in Entrepreneurship and they want you in it with them.`) +
        p(`That is worth paying attention to. They did not just buy a course. They said: I want us to be better at this together. That takes some courage to say out loud.`) +
        p(`Here is how it works: you each build your own individual profile separately and honestly, five minutes, completely private. Then you each take The Partnership Diagnostic across four areas: Business, Finances, Family, and Relationship. No shared answers, no pressure to agree on anything.`) +
        p(`Once both of you are done, the system generates your Partnership Report. Your profiles and your answers side by side, showing where you align and where the gaps are. You open that together.`) +
        p(`From there, a course path unlocks built around your specific gaps. Not a generic program. Yours.`) +
        p(`It is not therapy. It is a practical framework for couples who are building something real together and want to do it without quietly grinding each other down in the process.`) +
        btn('Accept Your Invite', d?.invite_url || `${process.env.SITE_URL || 'https://www.mirajoco.org'}/programs/couples-join`) +
        p(`Have questions before you jump in? Reply here. Happy to talk through what this looks like for you both.`)
      ),
    },
    {
      step: 2, delayDays: 3,
      subject: (d) => `${d?.partner_name || 'Your partner'} is ready when you are.`,
      body: (n, d) => wrap(
        greet(n) +
        p(`${d?.partner_name || 'Your partner'} enrolled in Couples in Entrepreneurship a few days ago and your invite is still waiting.`) +
        p(`No pressure, but they are on the other side of this ready to do the work. The report does not generate until both of you complete your side, so they are in a bit of a holding pattern.`) +
        p(`Your side takes less than ten minutes to get started, and everything after that moves at your own pace.`) +
        btn('Join and Get Started', d?.invite_url || `${process.env.SITE_URL || 'https://www.mirajoco.org'}/programs/couples-join`)
      ),
    },
  ],

  'diagnostic-reminder-cie': [
    {
      step: 1, delayDays: 0,
      subject: (d) => `${d?.partner_name || 'Your partner'} finished the diagnostic. Your turn.`,
      body: (n, d) => wrap(
        greet(n) +
        p(`${d?.partner_name || 'Your partner'} just completed The Partnership Diagnostic.`) +
        p(`Your answers are the other half of the picture. Until both sides are in, the report cannot generate and neither of you can see where you actually stand together.`) +
        p(`The diagnostic takes about 15 minutes. You will read through scenarios across Business, Finances, Family, and Relationship, and choose the response that most honestly reflects how you actually handle things, not how you wish you did.`) +
        p(`Your individual answers stay private. What generates from both of yours together is what you will both see.`) +
        btn('Take the Diagnostic Now', `${process.env.SITE_URL || 'https://www.mirajoco.org'}/programs/couples-dashboard`)
      ),
    },
    {
      step: 2, delayDays: 4,
      subject: "The report is waiting on you.",
      body: (n, d) => wrap(
        greet(n) +
        p(`Your partner finished their diagnostic a few days ago. The Partnership Report is built and waiting, it just needs your answers to complete the picture.`) +
        p(`Fifteen minutes. Honest answers. That is all it takes to unlock everything you enrolled for.`) +
        p(`The work you both signed up for starts the moment that report generates.`) +
        btn('Complete the Diagnostic', `${process.env.SITE_URL || 'https://www.mirajoco.org'}/programs/couples-dashboard`)
      ),
    },
  ],

  'report-ready-cie': [
    {
      step: 1, delayDays: 0,
      subject: "Your Partnership Report is ready.",
      body: (n) => wrap(
        greet(n) +
        p(`Both of you finished the diagnostic. Your Partnership Report is ready.`) +
        p(`This is the part you enrolled for. Your profiles side by side, your diagnostic answers compared across Business, Finances, Family, and Relationship. Where you are aligned. Where the gaps are. And which course modules unlock based on what you two specifically need to work on.`) +
        p(`One request: open it together. Not you reading it and summarizing it later, not two separate reads with a debrief. Sit down together and go through it at the same time. What you notice and what your partner notices will be different, and that difference is part of the work.`) +
        p(`There is no good or bad score. There is only where you are starting from.`) +
        btn('Open Your Partnership Report', `${process.env.SITE_URL || 'https://www.mirajoco.org'}/programs/couples-report`)
      ),
    },
    {
      step: 2, delayDays: 2,
      subject: "Did you open it together?",
      body: (n) => wrap(
        greet(n) +
        p(`Your Partnership Report has been ready for a couple of days. If you have not opened it yet, no stress, but it is worth carving out time this week.`) +
        p(`If you did open it: what came up? Most couples are surprised by at least one thing. Sometimes it is a gap they did not expect. Sometimes it is an alignment they had not named. Either way, that moment of seeing it together is usually when the course starts to feel real.`) +
        p(`Your modules are already unlocked based on your results. When you are ready to start working through them, your dashboard is waiting.`) +
        btn('Go to Your Dashboard', `${process.env.SITE_URL || 'https://www.mirajoco.org'}/programs/couples-dashboard`)
      ),
    },
    {
      step: 3, delayDays: 10,
      subject: "Your course is open. Just checking in.",
      body: (n) => wrap(
        greet(n) +
        p(`It has been about ten days since your Partnership Report generated. Wanted to check in.`) +
        p(`Your course path is already built around your specific gaps. The modules are unlocked. Module 1 is always available as your starting point.`) +
        p(`If life got in the way of getting started, that is completely normal. This is not a race. But I do want to make sure you both get what you enrolled for.`) +
        p(`Even one lesson a week moves the needle. The framework builds on itself, so starting small still works.`) +
        btn('Start the Course', `${process.env.SITE_URL || 'https://www.mirajoco.org'}/programs/couples-dashboard`)
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
        p(`That matters more than it sounds. Most couples who feel the friction of building a business together never look at it directly. They manage around it, they avoid the hard conversations, they keep moving and hope the business gets easier before the relationship gets harder.`) +
        p(`You did the opposite. You looked at it. You named it. You worked through it together.`) +
        p(`That does not mean every tension is resolved. But you now have a shared language, a set of agreements you made together, and proof that you can do hard things as a team. That last part matters more over time than you might realize right now.`) +
        p(`If you want to go deeper, coaching is the next step. It is not for everyone, but if you are serious about what you are building together, it might be for you.`) +
        btn('Learn About Coaching', `${process.env.SITE_URL || 'https://www.mirajoco.org'}/coaching`)
      ),
    },
    {
      step: 2, delayDays: 5,
      subject: "Five days out. What is actually different?",
      body: (n) => wrap(
        greet(n) +
        p(`You finished the course five days ago. I want to ask you something honest.`) +
        p(`What is actually different? Not what you planned to change. Not what you talked about changing. What has genuinely shifted in how you and your partner are showing up for each other and the business?`) +
        p(`It does not have to be dramatic. Sometimes it is just one conversation that happened differently. One moment where you pointed to the agreement instead of arguing about what you meant. One time you caught yourself crossing into your partner's lane and stepped back.`) +
        p(`Reply and tell me one thing. I read every reply.`)
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
            headline: 'Critical. The gap is real.',
            body: `You are not imagining it. Something is off: how you make decisions, how you talk about money, how connected you feel, or all of it. The distance between you did not happen overnight. But you named it today, and that is more than most couples ever do.`,
            next: `The next step is not a conversation with your partner. It is this: <a href="https://www.mirajoco.org/couplesinentrepreneurship" style="color:#8B1A2B;">Couples in Entrepreneurship</a> was built for exactly where you are. Eight modules across Business, Finances, Family, and Relationship, built for couples in business who are tired of managing the gap and ready to close it.`,
          },
          yellow: {
            headline: 'Caution. You are drifting.',
            body: `You are not in crisis. But you are not as aligned as you need to be either. The kind of drift you are in tends to get slower and quieter, until one day it is not. You have time to close the gap. But it will not close on its own.`,
            next: `<a href="https://www.mirajoco.org/couplesinentrepreneurship" style="color:#8B1A2B;">Couples in Entrepreneurship</a> gives you the conversations, the frameworks, and the shared agreements to get back in sync before the distance becomes harder to cross.`,
          },
          green: {
            headline: 'Aligned. And worth protecting.',
            body: `You are in a strong place. That does not happen by accident. It takes two people actively choosing it. The couples who stay aligned are the ones who work at it intentionally, not the ones who assume it will hold.`,
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
        p(`Couples in Entrepreneurship is built to give you the structure for those conversations, so they finally happen, in the rest order, with the right framework underneath them.`) +
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
        p(`Couples in Entrepreneurship is $997 for both of you: one purchase, two accounts, lifetime access. It is not cheap. But a single session with a couples therapist who understands business costs more than that and gives you nothing to take home.`) +
        p(`This gives you eight modules, a shared diagnostic, a Partnership Report built on your actual answers, and a course path designed around your specific gaps. Not a generic program. Yours.`) +
        btn('Enroll in Couples in Entrepreneurship', 'https://www.mirajoco.org/couplesinentrepreneurship') +
        p(`If it is not the right time, that is okay. But if it is, do not wait until the gap is wider.`)
      ),
    },
  ],

  'lead-alignment-audit': [
    {
      step: 1, delayDays: 0,
      subject: (d) => d?.result === 'red' ? 'You scored: Disconnected. Here is what that actually means.' : d?.result === 'yellow' ? 'You scored: Drifting. Here is what that actually means.' : 'You scored: Connected. Here is what is next.',
      body: (n, d) => {
        const result = d?.result || 'yellow';
        const copies = {
          red: {
            headline: 'Disconnected. And probably have been for longer than you want to admit.',
            body: `The audit did not tell you anything you did not already know. That question about last week, how you actually spent your time versus what you say you value, you knew the answer before you clicked it. The one about editing yourself around the people in your life. The one about watching your life from a distance instead of being in it. You knew.`,
            next: `What the audit did was give you a number for it. And now you have a choice: name it and keep going the same way, or name it and actually do something about it. <a href="https://www.mirajoco.org/25daysand25nights?offer=audit" style="color:#5A3F9A;">25 Days and 25 Nights</a> was built for exactly this moment. Twenty-five days of daily practice that closes the gap between the life you are describing and the one you are living.`,
          },
          yellow: {
            headline: 'Drifting. And somewhere in those ten questions you felt it.',
            body: `The question about your last big decision probably gave you pause. Or the one about whether the people closest to you actually know what is going on with you. Drifting does not mean falling apart. It means the distance between who you are and who you know you could be keeps widening, and you have mostly stopped fighting it.`,
            next: `That gap does not close on its own. <a href="https://www.mirajoco.org/25daysand25nights?offer=audit" style="color:#5A3F9A;">25 Days and 25 Nights</a> gives you the daily structure to stop drifting and start moving with intention. One honest day at a time.`,
          },
          green: {
            headline: 'Connected. More than most people who take this.',
            body: `That is not an accident. You are intentional. You think about this. The question the audit probably surfaced is not whether you are aligned. It is whether you are building or just maintaining what you already have. There is a difference between living well and living fully.`,
            next: `<a href="https://www.mirajoco.org/25daysand25nights?offer=audit" style="color:#5A3F9A;">25 Days and 25 Nights</a> is for people in your position who are ready to stop coasting on good and start building great. This is not a rescue program. It is a growth one.`,
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
          p(`If you have questions before you jump in, reply to this email. I read every one.`)
        );
      },
    },
    {
      step: 2, delayDays: 3,
      subject: 'That question about your phone. You knew the answer before you clicked it.',
      body: (n) => wrap(
        greet(n) +
        p(`Three days ago you took the Alignment Audit. I want to talk about one question in particular.`) +
        p(`The one about sitting in silence for five minutes without reaching for your phone.`) +
        p(`Most people answer that one before they finish reading it. Because they already know. Not because they are bad at stillness, but because the phone has become the default response to any moment of quiet. The second things get still, we reach. It is automatic.`) +
        p(`That is not a distraction problem. That is a disconnection problem. The noise fills the gap where your own voice would be, and after a while you stop noticing the gap is there.`) +
        p(`25 Days and 25 Nights is built around replacing those defaults. Not with willpower. With structure and daily practice that makes the new behavior the easier one.`) +
        btn('See What Is Inside', 'https://www.mirajoco.org/25daysand25nights?offer=audit')
      ),
    },
    {
      step: 3, delayDays: 7,
      subject: 'One week since your audit. That question about your last big decision.',
      body: (n) => wrap(
        greet(n) +
        p(`A week ago you answered ten questions. I keep thinking about one of them.`) +
        p(`"My last big decision was made for me. Not for how it would look."`) +
        p(`Was that answer honest?`) +
        p(`Not as a judgment. As a real question. Because that one tends to be the hardest to answer accurately. We tell ourselves we are choosing for ourselves long after we have started choosing for the audience, people we may not even respect, whose approval we are still quietly chasing.`) +
        p(`If the audit hit something real, and I think it did, this is the next step. 25 Days and 25 Nights. Your quiz taker discount is still active.`) +
        p(`Awareness without structure is just discomfort with better vocabulary. This gives you both.`) +
        btn('Enroll in 25 Days and 25 Nights', 'https://www.mirajoco.org/25daysand25nights?offer=audit') +
        p(`If it is not the right time, that is okay. But do not let it just sit there.`)
      ),
    },
  ],

  'inactive-nudge': [
    {
      step: 1, delayDays: 0,
      subject: "Your course is still waiting for you.",
      body: (n) => wrap(
        greet(n) +
        p(`You enrolled in 25 Days and 25 Nights and then life happened. I get it.`) +
        p(`But you bought this for a reason. That reason did not go away just because things got busy.`) +
        p(`Ten minutes. That is all Day 1 asks for. Log back in and give yourself ten minutes today.`) +
        btn('Pick Up Where You Left Off', LOGIN)
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
        p(`Grab your certificate. You earned it.`) +
        btn('Get Your Certificate', CERT) +
        p(`Now here is the real question: what happens next?`) +
        p(`The 25 days gave you structure and a foundation. What coaching does is go into the specific places where the structure alone is not enough. The patterns that keep showing up. The decisions you keep circling. The version of yourself you know is there but haven't fully stepped into yet.`) +
        p(`If that sounds like where you are, coaching is the next layer. It is not for everyone. But if the course moved something in you and you want to keep moving, reply to this email and tell me what you are working through. I will tell you honestly whether I think it is a fit.`)
      ),
    },
    {
      step: 2, delayDays: 4,
      subject: "Four days out. What's different?",
      body: (n) => wrap(
        greet(n) +
        p(`Four days since you finished. What's actually different?`) +
        p(`Not what should be different. Not what you planned to change. What is actually different in how you're showing up?`) +
        p(`If the answer is something, keep building on it. If the answer is not much, that is honest and it is worth sitting with.`) +
        p(`Two ways to go deeper from here, depending on where you are:`) +
        p(`<strong style="color:#122012;">If you want 1:1 support:</strong> Coaching is where we get into your specific situation. Not a program. A real conversation about what you are building and what is in the way. <a href="https://www.mirajoco.org/coaching" style="color:#256B42;">Learn more here.</a>`) +
        p(`<strong style="color:#122012;">If you are building with a partner:</strong> Couples in Entrepreneurship takes everything you just did individually and brings it into the relationship and the business. Because the work does not stop at you. <a href="https://www.mirajoco.org/couplesinentrepreneurship" style="color:#256B42;">Learn more here.</a>`) +
        p(`Reply and tell me one thing that has shifted. I read every one.`)
      ),
    },
  ],

};

// Insert a full sequence into the email_queue for a subscriber
// Queue all steps (used internally or for sequences where step 1 is already sent).
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

// Send step 1 immediately via Resend, queue steps 2+ for the daily cron.
// Use this at action trigger points (purchase, completion, etc.).
export async function triggerSequence(supabase, email, sequenceName, firstName = '', extraData = {}) {
  const steps = SEQUENCES[sequenceName];
  if (!steps) { console.error(`[email-queue] Unknown sequence: ${sequenceName}`); return; }

  const step1 = steps.find(s => s.step === 1);
  if (step1) {
    const subject = typeof step1.subject === 'function' ? step1.subject(extraData) : step1.subject;
    const html    = step1.body(firstName, extraData);
    const sent = await fetch('https://api.resend.com/emails', {
      method:  'POST',
      headers: { 'Authorization': `Bearer ${process.env.RESEND_API_KEY}`, 'Content-Type': 'application/json' },
      body:    JSON.stringify({ from: 'Miranda J <mirandaj@mirajoco.org>', to: email, subject, html }),
    });
    if (!sent.ok) console.error(`[trigger-sequence] Resend error for ${sequenceName} step 1 to ${email}`);
    // Record step 1 as sent so the cron does not resend it
    await supabase.from('email_queue').upsert(
      { email, first_name: firstName, sequence: sequenceName, step: 1,
        send_after: new Date().toISOString(), extra_data: extraData,
        sent_at: new Date().toISOString() },
      { onConflict: 'email,sequence,step', ignoreDuplicates: true }
    );
  }

  // Queue follow-up steps for the cron
  const followUps = steps.filter(s => s.step > 1);
  if (followUps.length) {
    const now = new Date();
    const rows = followUps.map(({ step, delayDays }) => {
      const sendAfter = new Date(now);
      sendAfter.setDate(sendAfter.getDate() + delayDays);
      return { email, first_name: firstName, sequence: sequenceName, step, send_after: sendAfter.toISOString(), extra_data: extraData };
    });
    const { error } = await supabase
      .from('email_queue')
      .upsert(rows, { onConflict: 'email,sequence,step', ignoreDuplicates: true });
    if (error) console.error(`[trigger-sequence] Failed to queue follow-ups for ${sequenceName}:`, error.message);
  }
}
