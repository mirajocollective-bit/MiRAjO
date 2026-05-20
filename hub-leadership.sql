DO $$
DECLARE
  v_course_id uuid;
  v_mod_id    uuid;
BEGIN

INSERT INTO courses (slug, title, description, price)
VALUES (
  'leadership-style',
  'Leadership Style for Entrepreneurs',
  'Leadership is not a title. It is a decision you make every day. Six modules covering what your leadership style actually is, how to lead a team without becoming the bottleneck, how to communicate so people actually follow, how to make decisions under pressure, how to build a culture people stay in, and how to lead yourself first.',
  0
)
ON CONFLICT (slug) DO NOTHING;

SELECT id INTO v_course_id FROM courses WHERE slug = 'leadership-style';

-- ============================================================
-- MODULE 1: What Kind of Leader Are You Actually
-- ============================================================

INSERT INTO modules (course_id, title, position)
VALUES (v_course_id, 'What Kind of Leader Are You Actually (Honest Assessment)', 1)
RETURNING id INTO v_mod_id;

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Stop Leading Like Someone Else',
'<p>Most entrepreneurs step into leadership by accident. You built something, it grew, and suddenly you had people looking to you for answers. Nobody handed you a manual. You watched how your boss used to run things, or you tried to do the opposite of your worst manager, or you just winged it and hoped nobody noticed. And here you are.</p>
<p>The first problem is that a lot of us are leading like someone we are not. We put on a version of leadership that does not fit our personality, our values, or the kind of business we are actually building. You end up exhausted because you are performing leadership instead of practicing it. And your team feels it, even if they cannot name it.</p>
<p>Before you can grow as a leader, you have to get honest about who you already are. Not who you wish you were. Not who the business needs. Who you actually are right now, with all your habits, your defaults, your strengths, and your blind spots. That is the real starting point.</p>
<p>Think about the last time things got hard in your business. Maybe a team member dropped the ball on something critical. Maybe a client pushed back. Maybe cash flow got tight. How did you respond? Not how did you think you responded. How did you actually respond? That moment, when the pressure hit, is when your real leadership style shows itself.</p>
<p>The LeadLoud framework starts here, with self-awareness, because a leader who does not know themselves cannot lead others well. You cannot give what you do not have clarity on. You cannot improve what you will not look at honestly.</p>
<p>This lesson is not about making you feel good or bad about where you are. It is about giving you a clear picture so you can actually move forward. The goal is not perfection. The goal is alignment, leading in a way that is actually you, sustainable, and effective for the people who depend on you.</p>
<p>Your leadership style is not fixed. It is a set of patterns you have developed over time, and patterns can change when you decide to change them. But first you have to see them clearly.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Write down three situations in the last 60 days where you had to lead through something difficult. For each one, write one sentence about how you actually handled it, not how you wanted to handle it.</li>
  <li>Ask someone on your team or a trusted advisor to describe your leadership in three words. Write them down without defending yourself.</li>
  <li>Identify one default behavior you fall back on when you are stressed (going quiet, micromanaging, overpromising, avoiding). Just name it. You will work with it in the next lesson.</li>
</ul>',
NULL, 1);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'The Four Patterns Most Entrepreneurs Lead From',
'<p>Leadership research has documented styles for decades, but most of those frameworks were built for corporate executives managing hundreds of people in bureaucratic structures. You are building a business. That is a different game. The patterns that matter most for entrepreneurs fall into four categories: the Visionary, the Executor, the Connector, and the Stabilizer.</p>
<p>The Visionary leads from the future. They are energized by what could be. They think in big pictures, they inspire people with where things are going, and they are excellent at rallying energy around an idea. The challenge for the Visionary is staying present, following through on the details, and not leaving their team behind while they sprint ahead into the next idea.</p>
<p>The Executor leads from results. They are energized by getting things done. They are disciplined, consistent, and they measure what matters. They hold people accountable and they are excellent at building systems. The challenge for the Executor is making space for the people side of leadership, recognizing that a team is not just a machine to run efficiently, and that relationships and culture matter as much as output.</p>
<p>The Connector leads from relationships. They are energized by people. They are excellent at creating trust, reading the room, and making people feel seen and valued. Their teams are often loyal and committed. The challenge for the Connector is making hard calls, having difficult conversations, and not letting their desire to keep people happy override what the business actually needs.</p>
<p>The Stabilizer leads from structure. They are energized by order and clarity. They are excellent at building processes, managing risk, and creating environments where people know exactly what is expected. The challenge for the Stabilizer is adapting when things change quickly, leaning into ambiguity, and not letting the need for control slow the business down.</p>
<p>Most entrepreneurs are a blend of two of these, with one being dominant and one being a secondary style. The dominant style is your default. The secondary style is what you pull from when the situation demands it. The other two are your growth edges.</p>
<p>None of these patterns is better than the others. Each one has strengths that your business needs at different stages. The work is knowing which one you default to, understanding what that costs you, and intentionally developing the others.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Read through the four patterns again. Write down which one sounds most like you on a normal day. Then write down which one sounds most like you under pressure. If they are different, that gap is worth paying attention to.</li>
  <li>Think about a decision you made in the last 90 days that did not go well. Looking at your dominant pattern, how did that style contribute to the outcome?</li>
  <li>Choose one leader you admire, inside or outside your industry. Identify which pattern they lead from primarily. Then identify what you can learn from their approach without trying to become them.</li>
</ul>',
NULL, 2);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'What Your Team Actually Needs From You',
'<p>Here is something that trips up a lot of entrepreneurial leaders. You think leadership is about what you bring. Your vision, your energy, your standards. And those things matter. But effective leadership is also about what your team needs, and those two things are not always the same.</p>
<p>You might be a Visionary who is brilliant at painting the picture of where you are going, but your team is sitting there asking where the process is, what success looks like this week, and what they should prioritize right now. You might be an Executor who is excellent at holding the line on standards, but your team is craving recognition, connection, and a sense that they matter beyond what they produce.</p>
<p>The leaders who build strong teams learn to read the gap between what they naturally give and what their team actually needs. That does not mean becoming someone you are not. It means being flexible enough to stretch toward what the situation demands.</p>
<p>A team in an early-stage startup often needs a Visionary and a Connector. They need to believe in what they are building and feel like they belong. A team that is scaling and adding new people fast often needs a Stabilizer and an Executor. They need systems, clarity, and consistent standards so the growth does not create chaos.</p>
<p>As your business grows, your leadership has to grow with it. The style that got you from zero to your first hire is not necessarily the style that will get you from five people to twenty. Leadership is not a fixed destination. It is a practice that evolves alongside your business.</p>
<p>You also have to think about individual people on your team. One person thrives with autonomy and gets frustrated by check-ins. Another person needs regular guidance and feels unsupported without it. Same role, different people, different leadership approach required. The entrepreneurs who figure this out early have much less turnover and much more output.</p>
<p>This is not about manipulation or playing games with people. It is about paying attention. Really paying attention to who you have, what they need, and how you can meet them there without abandoning your own standards and non-negotiables.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>List every person currently on your team (paid or unpaid). For each person, write one word describing what they seem to need most from you as their leader (clarity, recognition, autonomy, direction, etc.).</li>
  <li>Think about a time when someone left your team or disengaged. Looking back, what did they need that they were not getting?</li>
  <li>Identify one person on your team right now whose needs are different from yours, and write one specific thing you can do differently this week to lead them better.</li>
</ul>',
NULL, 3);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Building Your Leadership Baseline',
'<p>You have done the honest work of looking at your default style, understanding the patterns, and thinking about your team. Now it is time to build your baseline, a clear, simple picture of where you are starting from.</p>
<p>A leadership baseline is not a performance review. It is not about grading yourself. It is about having a reference point. Six months from now, you want to be able to look back and see how you have grown. But that only works if you know where you started.</p>
<p>There are five areas worth measuring honestly right now. First, self-awareness. Do you know your defaults, your triggers, and your patterns? Second, communication. Do the people you lead consistently understand what you need from them and why? Third, decision-making. Do you make calls with appropriate speed and confidence, or do you stall, overconsult, or swing between extremes? Fourth, culture. Does your team feel safe, respected, and motivated? Fifth, self-leadership. Are you taking care of yourself well enough to lead others sustainably?</p>
<p>Give yourself a 1 to 5 on each of these, where 1 is consistently struggling and 5 is consistently strong. Do not aim for all fives. Aim for honesty. The areas where you are a 2 or 3 right now, those are where you will find the most growth over the next six modules.</p>
<p>Your baseline also includes what you want your leadership legacy to be. Not what you want your business to accomplish, specifically what kind of leader do you want the people around you to remember you as. That question cuts through a lot of the noise. When you know who you want to be as a leader, it gives you a filter for the hard decisions.</p>
<p>The LeadLoud framework is built on the idea that leadership is one of the most intimate things you will ever do in business. You are asking people to trust you with their time, their effort, and in some cases their livelihood. That deserves your full attention and your honest commitment to growing into the leader they need.</p>
<p>Close this module by writing your leadership statement. Two or three sentences that capture who you are as a leader right now and who you are committed to becoming. Keep it honest. Keep it yours.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Rate yourself 1 to 5 in each of the five areas: self-awareness, communication, decision-making, culture, and self-leadership. Write a sentence next to each one explaining the rating.</li>
  <li>Write your leadership legacy statement. What do you want people to say about you as a leader, not about your business results, but about you as a person who led?</li>
  <li>Identify the one area from your baseline where a small improvement would make the biggest immediate difference for your team. Circle it. That is your first growth priority.</li>
</ul>',
NULL, 4);

-- ============================================================
-- MODULE 2: Leading a Team Without Becoming the Bottleneck
-- ============================================================

INSERT INTO modules (course_id, title, position)
VALUES (v_course_id, 'Leading a Team Without Becoming the Bottleneck', 2)
RETURNING id INTO v_mod_id;

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'How You Became the Problem',
'<p>Let''s be direct about something that most leadership content is too polite to say clearly. If everything in your business runs through you, if every decision, every approval, every piece of work has to pass through your hands before it can move forward, you are not leading your team. You are controlling it. And that control is slowing everything down.</p>
<p>The bottleneck problem usually does not come from bad intentions. It comes from the fact that you built this thing. You care about it more than anyone else does. You know it better than anyone else does. And you have been burned before by delegating something and having it come back wrong, late, or not done at all. So you stopped delegating. Or you delegated and then hovered. Or you delegated and then redid the work yourself when it did not meet your standard.</p>
<p>The result is the same in every case. Your team stops trying to solve problems because they know you will jump in. They stop making decisions because they know you will change them. They stop developing because there is no room to grow when you are doing everything. And you end up burned out, resentful, and wondering why you cannot find good people.</p>
<p>This is one of the hardest things to hear when you have built something from nothing. But your involvement in every detail is not protecting your business. It is limiting it. The business can only grow as big as your personal capacity allows if you stay in the bottleneck.</p>
<p>Getting out of the bottleneck is not about caring less. It is about leading differently. It is about building systems, developing trust, setting clear standards, and then having the discipline to let your people work within those standards without constant intervention.</p>
<p>The first step is acknowledging that you have been the problem, at least part of the problem. Not because you are a bad leader, but because you have been leading from fear or from a definition of quality that requires your personal touch on everything. That has to change if you want to grow.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Write a list of every decision or task that has to come through you before it can move forward. Be thorough. Include the small stuff.</li>
  <li>Put a star next to every item on that list that someone else could handle if they had the right information, training, or authority. That starred list is your delegation opportunity.</li>
  <li>Identify the one bottleneck on your list that, if you removed yourself from it, would create the most immediate relief for your team. That is where you start.</li>
</ul>',
NULL, 1);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'The Difference Between Delegation and Dumping',
'<p>A lot of entrepreneurs tried delegation once, it went badly, and they decided delegation does not work. What they actually experienced was not delegation. It was dumping.</p>
<p>Dumping is when you hand something to someone without context, without standards, without adequate resources, and without support, and then judge the result against your internal expectations that you never communicated. That is not delegation. That is setup for failure.</p>
<p>Real delegation has four components. First, clarity. The person needs to understand exactly what success looks like. Not a general direction, a specific outcome. What does done look like? What are the non-negotiables? What decisions can they make on their own and what decisions require a check-in?</p>
<p>Second, capacity. Does the person you are delegating to actually have the time, the skills, and the tools to do this? If not, either adjust the timeline, provide the training, or find someone else. Delegating to someone who cannot succeed is not delegation. It is blame-shifting.</p>
<p>Third, authority. This one trips a lot of leaders up. You cannot give someone responsibility without giving them the authority to carry it out. If they have to ask permission for every micro-decision, they are not actually doing the work. They are just executing your instructions, which means all the thinking is still coming from you.</p>
<p>Fourth, accountability. There needs to be a clear structure for when and how you will review progress and results. This is not micromanagement. This is leadership. Micromanagement is checking in every hour because you do not trust the person. Accountability is agreeing upfront on what the check-in schedule looks like and what reporting they will provide.</p>
<p>When delegation works, it feels like multiplication. You are getting outcomes you could not have achieved alone. When delegation fails, it usually means one of these four components was missing. Go back to the list and figure out which one.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Choose one task or responsibility you have been holding that you want to delegate. Write out the four components for it: what does success look like, does the person have capacity, what authority do you need to give them, and what is the accountability structure?</li>
  <li>Have an honest conversation with the person you are delegating to. Not an email, a real conversation. Make sure they understand the outcome, the authority, and the check-in plan.</li>
  <li>Give yourself a specific date to fully step back from this responsibility. Write it down and share it with your team.</li>
</ul>',
NULL, 2);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Building Systems So You Are Not the System',
'<p>The deep reason most entrepreneurs become the bottleneck is that they are the system. The knowledge lives in their head. The process lives in their habits. The standards live in their gut. None of it is written down, documented, or transferable. So of course everything has to run through them. They are the only place where the information exists.</p>
<p>Building systems means externalizing the knowledge so that other people can access it, follow it, and deliver consistent results without needing you in the room. This feels like extra work when you are already stretched thin, and it is, in the short term. But it is the most important work you can do if you want your business to scale.</p>
<p>Start with your most repeated processes. The things that happen over and over, client onboarding, order fulfillment, social media posting, invoicing, team check-ins. For each process, create a simple document or checklist that captures the steps, the standards, the tools used, and who is responsible for what. It does not have to be perfect. A messy documented process is infinitely better than a perfect undocumented one.</p>
<p>Video is your friend here. If something is hard to document in writing, record a quick screen share or walkthrough. A five-minute video of you doing a process once can replace hundreds of answers to the same question over the coming year.</p>
<p>The mindset shift is from "I need to do this right" to "I need to build this so others can do it right." That shift changes how you approach every repeated task. Instead of just doing it, you are also capturing it.</p>
<p>Systems also reduce the emotional labor of leadership. When standards are written down, you do not have to have the same corrective conversation fifteen times. You point to the standard. The standard is the authority, not you personally. That takes a lot of heat out of feedback conversations.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Identify three processes in your business that happen regularly and live entirely in your head. Pick the one that causes the most friction when it is not done right.</li>
  <li>Spend thirty minutes documenting that process. Write the steps, the tools, the standards, and who owns it. Do not aim for a perfect document. Aim for a usable one.</li>
  <li>Share the document with the person responsible for that process and ask them to do it once following the document. Then ask them what was unclear or missing. Update accordingly.</li>
</ul>',
NULL, 3);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Trusting Your Team Enough to Lead Them',
'<p>Here is the real conversation underneath all of this. A lot of entrepreneurial leaders do not fully trust their teams. Not because the team is untrustworthy. Because the leader has not done the work of building trust, or they have been hurt before, or their standards are so high that no one could ever fully meet them.</p>
<p>Trust is not something you extend blindly. It is something you build intentionally, in both directions. You earn their trust by being clear, consistent, fair, and honest. They earn your trust by delivering, communicating proactively, and showing they care about the work as much as the paycheck.</p>
<p>But trust has to start somewhere, and as the leader, you have to go first. That does not mean handing over the keys to someone who has not demonstrated reliability. It means giving people the opportunity to demonstrate reliability, and then actually responding to what they show you, not what your fear tells you to expect.</p>
<p>Think about the people on your team right now. Are there people who have consistently shown up and delivered, but you are still holding tight to the work because you are afraid of what happens if they drop it? If so, the issue is not trust in them. It is trust in yourself that you can handle whatever happens if things go wrong.</p>
<p>Building a team that runs well without your constant presence requires that you be willing to let things be imperfect in the short term so people can develop in the long term. Someone will make a mistake. Something will be done differently than you would have done it. That is the cost of growth, for you and for them.</p>
<p>When you lead from trust, your team rises to it. People work harder and smarter when they feel trusted and respected. They take ownership. They bring their full creativity to the work. They stay. When you lead from suspicion or control, people do exactly what is required and nothing more, because why go the extra mile for someone who does not believe in them?</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Think about one person on your team you have been holding at a distance, not fully trusting with responsibility. Write down honestly why. Is it something they have done, or is it something in you?</li>
  <li>Have a conversation with that person this week where you explicitly acknowledge what they have done well and extend a new level of trust or responsibility. Be specific about what you are trusting them with.</li>
  <li>Create a thirty-day commitment for yourself: you will not redo or override someone else''s work without first having a direct conversation with them about the standard. Write it down where you will see it.</li>
</ul>',
NULL, 4);

-- ============================================================
-- MODULE 3: Communication That Actually Gets People to Move
-- ============================================================

INSERT INTO modules (course_id, title, position)
VALUES (v_course_id, 'Communication That Actually Gets People to Move', 3)
RETURNING id INTO v_mod_id;

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'The Communication Gap Nobody Talks About',
'<p>You said it. They heard something different. They did something else entirely. And now you are frustrated, they are confused, and the work is not where it needs to be. This is the communication gap. And it happens in every team, at every stage, more often than most leaders want to admit.</p>
<p>The communication gap is not primarily about vocabulary or clarity, though those matter. It is about the difference between what you mean and what lands. What you mean comes from your context, your priorities, your assumptions about what people already know, your history with the work, and your vision for the outcome. What lands is filtered through their context, their assumptions, their current workload, their relationship with you, and how they receive information.</p>
<p>Most leaders communicate as if everyone else is operating from the same context they are. They give instructions that make complete sense to them but are missing three or four key pieces of information that the listener would need to execute well. Then when the outcome is wrong, they assume the person was not listening or did not care, when the real issue was the communication.</p>
<p>The gap gets wider in high-pressure situations. When you are stressed, you communicate in shorthand. You assume people can fill in the blanks. You send a two-sentence message when you needed to send eight sentences. The person on the receiving end does not want to bother you with questions, so they make their best guess, and the guess is wrong.</p>
<p>Good communication in a business setting is not about being a great public speaker. It is about being precise, consistent, and intentional about how you transfer information and expectations. It is also about creating a culture where people feel safe asking for clarification instead of guessing.</p>
<p>If your team is regularly missing the mark on work that you communicated verbally or via message, the first question to ask is not "why aren''t they listening?" It is "am I giving them everything they need to succeed?"</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Recall a recent situation where someone on your team did not deliver what you expected. Write out what you told them. Then write out what you actually needed them to know. Identify the gap.</li>
  <li>Commit to one new communication habit this week: before you send any instruction for a significant task, ask yourself, "Does this person have everything they need to do this without coming back to ask me a basic question?"</li>
  <li>Create a simple check-in norm for your team. When they receive a task or assignment, they confirm back to you: what they are doing, by when, and what they will do if they run into a problem. Practice this with one person this week.</li>
</ul>',
NULL, 1);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Saying Hard Things Without Losing People',
'<p>This is the lesson most entrepreneurs avoid. You can learn all the communication frameworks in the world, but if you cannot have hard conversations, none of it matters.</p>
<p>A hard conversation is any conversation where the truth you need to share might create discomfort. That includes giving critical feedback, addressing a performance issue, telling a client something they do not want to hear, saying no to a request that is not right for your business, and letting someone go when the fit is not working. Most people, including most leaders, avoid these conversations as long as possible. And the delay makes everything worse.</p>
<p>The longer you wait to have a hard conversation, the more it costs you. It costs in relationship quality, because resentment builds when things are left unsaid. It costs in team performance, because a standard that is not enforced is not actually a standard. And it costs you personally, because carrying conversations you have not had is one of the heaviest things a leader can do.</p>
<p>The first principle of hard conversations is that they are an act of respect, not cruelty. When you tell someone the truth about their performance, you are treating them as a capable adult who can handle feedback and grow from it. When you avoid that truth, you are saying, consciously or not, that you do not believe they can handle it. Which is actually the more disrespectful position.</p>
<p>Start with what is true and what you have observed. Not what you assume, not what you have heard secondhand. What you have directly witnessed. Stick to behavior and impact: here is what happened, here is the effect it had. Then be direct about what needs to change and what the stakes are if it does not.</p>
<p>You do not have to be cruel to be direct. You can be kind and honest at the same time. But you cannot be unclear and call it kindness. Soft language, excessive hedging, burying the point under compliments, those are not kind. They are confusing. The person leaves the conversation not sure whether there is actually a problem, and nothing changes.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Identify one hard conversation you have been avoiding. Write down what you need to say, in plain direct language, no softening, no hedging. This is just for you, not to be sent anywhere.</li>
  <li>Schedule that conversation within the next five business days. Put it on the calendar. Tell the person you need to connect with them.</li>
  <li>After the conversation, note what happened. Was it as hard as you expected? What would you do differently next time? Build your own framework from real experience.</li>
</ul>',
NULL, 2);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Listening as a Leadership Strategy',
'<p>Most leaders think they are better listeners than they are. Listening is treated as the passive part of communication, the thing you do while waiting for your turn to talk. But real listening is one of the most active and most powerful leadership tools you have.</p>
<p>When you genuinely listen to someone, you get information that you cannot get any other way. You learn what is actually happening on the ground, not the filtered version that comes through status updates. You learn what is frustrating your team, what is confusing them, and what opportunities they see that you might be missing. You learn who they are as people, which makes you a better leader for them.</p>
<p>Leaders who do not listen well make decisions based on incomplete information. They miss early warning signs of problems because the people who saw those signs did not feel heard when they tried to raise them. They lose good people because those people did not feel seen or valued. Listening is not soft. It is strategic.</p>
<p>Real listening means you are present. Your phone is down, your attention is on the person in front of you, and you are not composing your response while they are still talking. It means you ask follow-up questions that go deeper rather than pivoting back to what you want to say. It means you sit with discomfort when someone tells you something you do not want to hear, instead of deflecting or defending.</p>
<p>It also means you listen to what is not being said. The person who used to bring up ideas in every meeting and has stopped. The team member whose enthusiasm has gone flat. The client who responds to your emails with one sentence when they used to write paragraphs. The silence is communication too, and leaders who are paying attention catch it.</p>
<p>The practical side of this: create structures for listening. Regular one-on-ones where the agenda is theirs, not yours. Team meetings where there is dedicated time for people to surface concerns or ideas. Anonymous feedback channels if your culture needs that safety valve. Listening does not just happen. You have to build it into how you lead.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>In your next one-on-one conversation with a team member, commit to listening for the first ten minutes without redirecting to your own agenda. Just ask, "What''s on your mind?" and follow where they go.</li>
  <li>Identify one person on your team or in your business who you have not genuinely listened to in a while. Schedule time with them this week specifically to hear what is going on for them.</li>
  <li>After your next team meeting, write down two or three things you learned from listening that you would not have known if you had just been talking. This builds the habit of noticing the value of listening.</li>
</ul>',
NULL, 3);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Communication Rhythms That Keep Teams Aligned',
'<p>Alignment does not happen from one good conversation. It is maintained through consistent, repeated communication rhythms. The teams that stay aligned are the teams where information flows regularly, expectations are refreshed often, and problems are surfaced before they become crises.</p>
<p>A communication rhythm is a set of regular touchpoints that are predictable and purposeful. The most common and most useful ones for entrepreneurial teams are the daily standup or check-in, the weekly team meeting, the monthly one-on-one, and the quarterly direction conversation. Each one serves a different purpose and operates at a different altitude.</p>
<p>The daily check-in is short, ten to fifteen minutes, and answers three questions: what did you accomplish yesterday, what are you working on today, and is there anything blocking you? It keeps the team coordinated, surfaces blockers early, and creates daily accountability without turning into a long meeting.</p>
<p>The weekly team meeting is where you review progress against goals, address challenges, share relevant updates, and reinforce priorities. It should be focused and have a consistent structure so people know what to expect. A team meeting with no agenda is almost always a waste of time.</p>
<p>The monthly one-on-one is your individual connection with each team member. This is where you check on how they are doing, give and receive feedback, talk about their development, and deal with anything that did not fit into the regular meeting cadence. These conversations build the relationship that makes everything else work better.</p>
<p>The quarterly direction conversation is where you zoom out. Where are we relative to where we said we would be? What is shifting? What are we prioritizing in the next ninety days? This is the alignment reset that keeps everyone pointed in the same direction even as the day-to-day changes.</p>
<p>Put these on the calendar and treat them as commitments, not as optional. The leaders who cancel their one-on-ones and push back their team meetings when things get busy are the leaders whose teams drift. Consistent rhythms build trust and keep your team from having to guess where they stand.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Look at your calendar right now and identify which of these four rhythms you are currently doing consistently, which ones are sporadic, and which ones do not exist yet.</li>
  <li>Choose one rhythm that is missing or inconsistent and put it on the calendar for the next four weeks. Start with whatever feels most urgent given your team''s current state.</li>
  <li>Send your team a message that outlines what your regular communication touchpoints will be going forward. Make it a commitment, not a suggestion.</li>
</ul>',
NULL, 4);

-- ============================================================
-- MODULE 4: Decision-Making Under Pressure
-- ============================================================

INSERT INTO modules (course_id, title, position)
VALUES (v_course_id, 'Decision-Making Under Pressure', 4)
RETURNING id INTO v_mod_id;

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Why Pressure Breaks Most Leaders'' Decision-Making',
'<p>Every leader can make decent decisions when things are calm, when there is time, information is clear, and the stakes feel manageable. The test of a leader is what happens when none of those things are true. When the situation is urgent, information is incomplete, and every option has a real cost. That is when most people''s decision-making falls apart.</p>
<p>Under pressure, the brain defaults to one of a few patterns. Some people freeze. They overthink, gather more information, consult more people, delay longer than the situation allows, and end up making the decision too late or not at all. Some people react. They make fast, impulsive calls based on emotion rather than analysis, and then have to spend as much time cleaning up the aftermath as they would have spent making a better decision in the first place. Some people defer. They push the decision to someone else, which often means it does not get made at all or gets made by the wrong person.</p>
<p>None of these is good leadership. But all of them are understandable human responses to pressure. The goal is not to eliminate the pressure response. The goal is to have enough awareness and enough practice that you can catch yourself in the pattern and make a better call.</p>
<p>The foundation of good decision-making under pressure is having your values and priorities clear before the pressure hits. When you know what you stand for, when you have your non-negotiables articulated, a lot of the decision analysis becomes much simpler. You filter options through your values and your priorities, and suddenly the number of real options is much smaller.</p>
<p>Another foundation is understanding your personal pressure pattern. Are you a freezer, a reactor, or a deferrer? Most people have a dominant pattern, and it shows up most reliably under the highest pressure. Knowing your pattern is not an excuse for it. It is a warning system. When you feel the pressure rising, you can watch for your pattern and interrupt it before it takes over.</p>
<p>Great decisions under pressure are not usually brilliant or creative. They are often just the decision that a clear-headed person with good values would have made, made with the right speed, communicated with confidence, and executed with commitment. The goal is not to be the smartest person in the room. The goal is to be the clearest.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Think about the last high-pressure decision you made. Honestly assess which pattern you fell into: freezing, reacting, or deferring. Write a sentence about what it cost you.</li>
  <li>Write down your top five non-negotiables as a business leader. These are the things you will not compromise on, ever, regardless of the pressure or the opportunity. Keep this list where you can see it.</li>
  <li>The next time you feel pressure building around a decision, before you do anything else, ask yourself: "What is the cost of waiting versus the cost of deciding now?" Write down the answer before you decide your next move.</li>
</ul>',
NULL, 1);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'A Framework for Decisions You Cannot Afford to Get Wrong',
'<p>Not all decisions are equal. Some decisions are reversible. You try something, see how it goes, and adjust. These decisions should be made fast, by the person closest to the work, without a lot of escalation. Treating reversible decisions like they are high-stakes causes unnecessary slowdown and signals to your team that you do not trust them.</p>
<p>Some decisions are irreversible. Or close enough to irreversible that the cost of being wrong is very high. These are the decisions that deserve more deliberate thinking. A major hire. A pivot in your business model. A significant financial commitment. Ending a partnership. The mistake most entrepreneurs make is spending too much time on low-stakes reversible decisions and not enough time on high-stakes irreversible ones.</p>
<p>Here is a simple framework for the decisions that matter most. First, define the decision clearly. What exactly are you deciding? Often the decision feels murky because it has not been properly scoped. Write it as a single clear question.</p>
<p>Second, identify your options. Not just the obvious two or three. Push yourself to find at least one option you have not yet considered. The best decision is sometimes not the first two you thought of.</p>
<p>Third, clarify the criteria. What does a good outcome look like? What are you optimizing for? Speed? Cost? Team morale? Long-term positioning? Your criteria should be rooted in your values and your current priorities. The criteria for a decision made when you are cash-tight are different from the criteria made when you have runway.</p>
<p>Fourth, test each option against your criteria and your non-negotiables. Which option best fits what you are optimizing for, without violating anything you said you would not compromise on?</p>
<p>Fifth, make the call and communicate it clearly. Explain the reasoning. Your team does not need you to be infallible. They need you to be clear and honest about why you are going in a particular direction.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Identify a decision you currently have pending in your business that feels heavy. Apply the five-step framework to it: define the decision, list your options, clarify your criteria, test each option, then make the call.</li>
  <li>Write out how you will communicate your decision to the people it affects. Focus on the reasoning, not just the outcome.</li>
  <li>Create a personal rule for decision speed: decisions that can be reversed in less than thirty days should be made within twenty-four hours. Write this rule down and commit to it.</li>
</ul>',
NULL, 2);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'When to Trust Your Gut and When to Slow Down',
'<p>Entrepreneurship rewards people who move fast. The market moves, opportunities close, and the leaders who are decisive tend to outperform the ones who deliberate indefinitely. But speed without judgment is just recklessness. The question is not how to always be fast or always be slow. It is how to know which mode a specific decision calls for.</p>
<p>Gut instinct is real and it has legitimate value. When you have deep experience in an area, your gut is often synthesizing thousands of data points that your conscious mind cannot process quickly enough. An experienced entrepreneur who gets a bad feeling about a partnership has usually been trained by years of experience to recognize patterns that signal trouble. That instinct is worth something.</p>
<p>But gut instinct can also be fear in disguise. It can be bias. It can be the voice of past trauma telling you not to trust something that is actually good, because something similar went wrong before. Not every uncomfortable feeling is wisdom. Sometimes discomfort is just the price of growth.</p>
<p>The way to tell the difference is to ask the gut to be specific. When you get a strong feeling about a decision, stop and ask: what specifically is making me feel this way? If you can name concrete, observable reasons, your gut is probably tracking something real. If you cannot name anything specific and it is just a vague sense of dread, that is worth examining more carefully before you let it drive a major call.</p>
<p>There are also situations where your gut should be explicitly overridden. Decisions that involve bias against a person or group. Decisions made in exhaustion or high emotional states. Decisions that affect other people''s lives significantly. These deserve more than your gut. They deserve analysis, consultation, and intentionality.</p>
<p>The goal is calibrated judgment. Fast when speed serves the outcome. Slow when deliberateness reduces the risk. Trusting your gut when it is grounded in experience. Questioning your gut when it might be fear or bias. That calibration gets better with practice and with honest reflection on your decisions over time.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Write down a decision you have made primarily from gut instinct in the last six months. Was the outcome good? What was the gut actually tracking? Try to name it specifically.</li>
  <li>Write down a decision you have made that you knew was wrong but made anyway for external reasons (pressure from others, sunk cost, fear). What did that cost you?</li>
  <li>Create a personal rule for when you will explicitly seek outside input before deciding. What types of decisions, what stakes, what circumstances automatically trigger you to consult someone else before moving forward?</li>
</ul>',
NULL, 3);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Recovering From Bad Decisions Without Falling Apart',
'<p>Every leader who has led anything meaningful has made bad decisions. Big ones. Decisions that cost money, relationships, opportunities, or all three. The difference between leaders who grow and leaders who stall is not whether they make bad decisions. It is how fast they recover and what they do with what they learn.</p>
<p>Bad decisions hurt. Especially in entrepreneurship, where the consequences are personal. When you make a call that costs you a key team member, or that puts you behind financially, or that damages a relationship you valued, the emotional weight of that is real and it deserves acknowledgment. You do not have to minimize it or rush past it.</p>
<p>But after you have sat with the weight of it, the next move matters more than the decision itself. The leaders who recover well do three things. They assess clearly, without excessive self-criticism or self-protection, what happened and why. They course-correct as quickly as possible, making the best next decision with the information they now have. And they extract the lesson, specifically and honestly, so the same type of mistake is less likely next time.</p>
<p>The leaders who struggle after bad decisions tend to go in one of two directions. They catastrophize, treating a bad decision as evidence that they are not cut out for leadership, spiraling into self-doubt that makes their next several decisions worse. Or they externalize, finding reasons why the bad outcome was someone else''s fault, protecting their ego but never building the self-awareness that would prevent the same mistake again.</p>
<p>Neither of those responses serves you or your team. What your team needs from you after a bad decision is honesty, clarity, and momentum forward. Not a meltdown. Not a cover-up. A clear-eyed acknowledgment of what happened, what you are doing about it, and where you are headed next.</p>
<p>This is one of the things the LeadLoud framework speaks to directly: your leadership is built as much in how you handle failure as in how you handle success. The people watching you lead are not looking for someone who never makes mistakes. They are looking for someone who handles mistakes with integrity and keeps moving.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Write about a significant bad decision you have made as a leader. Be honest about your role in it. What did you miss? What could you have done differently? What did you learn?</li>
  <li>Write down your personal recovery protocol for when things go wrong. What are the steps you commit to taking: how you assess, how you communicate with your team, how you course-correct, and how you move forward?</li>
  <li>The next time something goes wrong on your team, practice saying clearly: "Here is what happened, here is what I am doing about it, and here is what we are doing next." No excessive apology, no blame, no drama. Just clarity and forward motion.</li>
</ul>',
NULL, 4);

-- ============================================================
-- MODULE 5: Building a Culture People Choose to Stay In
-- ============================================================

INSERT INTO modules (course_id, title, position)
VALUES (v_course_id, 'Building a Culture People Choose to Stay In', 5)
RETURNING id INTO v_mod_id;

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Culture Is Not a Poster on the Wall',
'<p>Every business has a culture. Not every business has the culture they want. Culture is what actually happens, how people actually treat each other, what actually gets rewarded, what actually gets tolerated, and what is actually said when the leader is not in the room. It is the lived experience of being on your team, not the stated values or the team outings or the office decor.</p>
<p>The gap between stated culture and lived culture is one of the most expensive gaps in any business. When you say you value honesty but avoid hard conversations, people learn that honesty is aspirational, not operational. When you say you value work-life balance but respond to emails at midnight and expect the same of your team, people learn that boundaries are for other companies. Culture is always being communicated. The question is whether you are communicating it intentionally.</p>
<p>The leader is the primary architect of culture, whether they accept that role or not. Your behavior sets the tone. The decisions you make, especially the hard ones, signal what you actually value. The things you ignore signal what you will tolerate. The things you celebrate signal what you want more of. Every one of these signals is teaching your team who you are and what this company is.</p>
<p>This can feel like a lot of pressure, and it is. But it is also clarifying. You have more influence over your culture than any other factor. External conditions, the market, the competition, the economy, affect your results. But you have the most influence over your culture.</p>
<p>Building a culture people choose to stay in is not primarily about perks and benefits. Those are nice and they help. But people stay for how they feel when they come to work. They stay because they feel respected and trusted. They stay because the work is meaningful and they have room to grow. They stay because they are part of something that reflects their values. Those things come from leadership. They come from you.</p>
<p>The work of culture is daily, not quarterly. It is in how you start meetings, how you give feedback, how you handle mistakes, how you show up when things are hard. It accumulates slowly and it changes slowly. Which is why you have to be deliberate about it constantly.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Write down five words that describe the culture you want on your team. Then write down five words that describe the culture that actually exists right now. Compare the two lists and identify the gaps.</li>
  <li>Think about the last two or three people who left your team or business. If you could ask them honestly, what would they say the culture was really like? What would that tell you?</li>
  <li>Identify one cultural norm that exists on your team right now that you have been tolerating but that does not reflect the culture you want to build. Name what you will do differently starting this week.</li>
</ul>',
NULL, 1);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Psychological Safety Is Not a Soft Topic',
'<p>If there is one thing that most separates high-performing teams from mediocre ones, research is consistent on this point: it is psychological safety. The ability of people on the team to speak up, ask questions, flag problems, and take risks without fear of humiliation, dismissal, or punishment.</p>
<p>Psychological safety does not mean everyone feels comfortable all the time. Growth is uncomfortable. Accountability is uncomfortable. Honest feedback is uncomfortable. Psychological safety means that discomfort happens in an environment of respect and trust, not in an environment of fear.</p>
<p>When psychological safety is low, your team goes quiet. They stop bringing you problems because they have learned that bringing problems leads to being blamed, dismissed, or punished. They stop raising ideas because they have been shot down or ignored before. They start telling you what you want to hear instead of what is actually true. And you end up leading with incomplete and distorted information, making decisions based on a sanitized picture of reality.</p>
<p>This is catastrophic for a growing business. The problems that will sink you are almost always problems that someone on the ground saw coming but did not feel safe enough to surface. The opportunities you miss are often ones that someone on your team had the beginning of an idea about but never said anything because the culture did not make space for incomplete thinking.</p>
<p>Building psychological safety starts with how you respond when someone brings you something uncomfortable. If you react with defensiveness, dismissal, or anger, you are training people to keep their concerns to themselves. If you respond with curiosity, with "tell me more" and "what are you seeing," you are building the safety that makes your team more valuable to you.</p>
<p>You also build it by being honest about your own mistakes and uncertainties. Leaders who project false certainty create teams that are afraid to admit they do not know something. Leaders who model intellectual humility, saying "I am not sure, let me think about that" or "I got that wrong and here is what I am doing differently," create teams that are willing to be human and honest.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Rate your current team''s psychological safety on a scale of 1 to 10. Write down two specific behaviors of yours that are either building or eroding that safety.</li>
  <li>The next time someone on your team brings you a problem or concern, practice responding with one question before you respond with any answer. Ask: "Can you tell me more about what you are seeing?" and actually listen.</li>
  <li>Identify one thing you got wrong in the last thirty days and share it openly with your team. Not with excessive self-criticism. Just honest: "Here is what I tried, here is what I learned." Notice how it shifts the energy in the room.</li>
</ul>',
NULL, 2);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Recognition, Standards, and the Balance Between Them',
'<p>Two things that seem like opposites are both essential to a strong culture: high standards and genuine recognition. Leaders often lead heavily toward one and neglect the other, and both extremes create problems.</p>
<p>A culture of high standards without recognition burns people out. When the only feedback people receive is about what is wrong, what is missing, and what is not good enough, they eventually stop caring. The standard becomes something to survive rather than something to aspire to. Your best people, the ones with other options, leave first. The ones who stay do so out of financial necessity, not commitment.</p>
<p>A culture of recognition without high standards creates mediocrity. When everything gets celebrated and nothing gets challenged, you lose the edge that keeps the work excellent. People stop pushing themselves because the feedback environment does not distinguish between outstanding and merely adequate. Your standards drift toward whatever the average person on your team produces, and that is not usually where you want to be.</p>
<p>The balance is a culture where the standard is clear and consistent, and where progress toward that standard is genuinely recognized. People need to know what great looks like, and they need to know when they are achieving it. Specific, sincere recognition, tied to the actual behavior or outcome, is one of the most powerful tools a leader has. It costs nothing but attention.</p>
<p>The word "specific" is doing a lot of work in that last sentence. "Good job" means almost nothing. "The way you handled that client situation this morning, staying calm and finding a real solution, that is exactly the kind of problem-solving I am talking about" means a great deal. It tells the person exactly what you valued and why. It makes them want to do it again.</p>
<p>The cadence of recognition matters too. It should be more frequent than formal reviews or quarterly check-ins. People need real-time feedback, both corrective and affirmative. Build recognition into your regular rhythms, not as a scheduled event but as a genuine practice.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Look back at your last week of leadership. How many times did you give specific recognition to someone on your team? How many times did you give corrective feedback? If the corrective significantly outnumbers the recognitive, adjust your ratio this week.</li>
  <li>Identify someone on your team who has been consistently showing up well but has not been specifically recognized for it recently. Before this day is over, reach out and tell them exactly what you see and why it matters.</li>
  <li>Write down your top three standards for your team. Are they clearly communicated and consistently modeled? If not, what needs to change?</li>
</ul>',
NULL, 3);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'The Culture You Build Outlives Your Presence',
'<p>Here is the leadership test that most people only think about when it is too late. What happens in your business when you are not there? Not on vacation, not in a meeting, not in the building. What does the culture do when the primary culture-setter is absent?</p>
<p>In businesses with a strong, intentional culture, the answer is: it keeps running the way it always runs. People make decisions that reflect the values. They treat each other the way they would if you were watching. The standards hold because people have internalized them, not because they fear consequences.</p>
<p>In businesses where culture is personality-dependent, where the culture is essentially you performing your values, the energy drops when you leave. People wait for direction. Decisions pile up. The quality of how people treat each other loosens. This is a fragile business. It is dependent on you being present, always, to sustain it.</p>
<p>The goal of culture-building is to eventually make yourself replaceable as the culture''s engine. Not to make yourself irrelevant, but to have built something that runs on shared values, shared language, and shared commitment, not on your personal supervision.</p>
<p>This happens through explicit culture work. Naming your values and talking about them constantly. Hiring for cultural fit as well as skill. Recognizing and promoting people who embody the culture. Addressing people quickly who consistently violate it, because a standard that is not enforced tells everyone else that the standard does not actually matter.</p>
<p>It also happens through storytelling. The stories you tell about why you built this, what you believe about people, what success looks like here, what you are proud of. Stories carry culture more powerfully than any values statement. Tell the stories. Repeat them. Let your team tell them back to you.</p>
<p>You are building something that will outlast any particular moment, any particular hire, any particular hard season. The culture you are intentional about now is the foundation that makes that possible.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Ask yourself honestly: if you were gone for two weeks with no access to your team, what would the culture look like when you came back? Be specific about what you think would hold and what would drift.</li>
  <li>Identify one value that is central to how you want your business to operate. Write down three specific stories, from your own experience, that illustrate that value in action. Practice telling one of those stories at your next team gathering.</li>
  <li>Write down one step you will take in the next thirty days to make your culture less dependent on your personal presence. This could be a documented standard, a team ritual, a process for decision-making in your absence, or investing in the development of a team member who can hold the culture.</li>
</ul>',
NULL, 4);

-- ============================================================
-- MODULE 6: Leading Yourself First
-- ============================================================

INSERT INTO modules (course_id, title, position)
VALUES (v_course_id, 'Leading Yourself First — The Foundation Everything Else Sits On', 6)
RETURNING id INTO v_mod_id;

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'You Cannot Pour From an Empty Strategy',
'<p>The personal sustainability of a leader is not a wellness topic. It is a business strategy topic. A leader who is running on empty makes worse decisions, communicates less clearly, tolerates things they should challenge, and misses things they should catch. Your capacity as a leader is directly tied to how well you are leading yourself.</p>
<p>This is one of the hardest things to get entrepreneurial leaders to take seriously, because the ethos of entrepreneurship often glorifies sacrifice and relentless output. Hustle culture tells you that the leaders who win are the ones who sleep the least and grind the hardest. That is not true. The leaders who win over the long term are the ones who build sustainable systems, both in their businesses and in themselves.</p>
<p>Burnout is not a badge of honor. It is a system failure. And unlike a system in your business that you can rebuild after it breaks, burnout damages you in ways that take months or years to undo. The emotional flatness, the loss of creativity, the cynicism, the withdrawal, these are not small inconveniences. They are significant impairments to your leadership.</p>
<p>The question is not whether you are working hard. You are an entrepreneur. Of course you are working hard. The question is whether you are working in a way that is sustainable. Whether you have margin in your life, margin for rest, for relationships, for the things that fill you back up. Without margin, you are spending down a reserve that is not being replenished.</p>
<p>Leading yourself first is not selfish. It is the prerequisite for leading anyone else well. You cannot bring vision, clarity, and steadiness to your team on a sustained basis if you are depleted. You cannot make good decisions when you are exhausted. You cannot build culture when you are burning down from the inside.</p>
<p>This module is not about making you feel guilty about how you are operating. It is about giving you permission and a framework to lead yourself with the same intentionality you bring to leading your business.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Honestly rate your current personal sustainability in four areas: physical (sleep, exercise, eating), mental (clarity, focus, decision fatigue), emotional (connection, support, rest), and relational (quality of your key relationships). Use a 1 to 5 scale for each.</li>
  <li>Identify the one area where depletion is most affecting your leadership right now. Write one specific change you can make this week, not a dramatic overhaul, just one concrete step.</li>
  <li>Block one recurring time in your calendar each week specifically for restoration, not for work, not for catching up, for genuine recovery. Protect it. It is a leadership practice, not a luxury.</li>
</ul>',
NULL, 1);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Your Mindset Is Running Your Business Whether You Know It or Not',
'<p>Every decision you make, every conversation you have, every culture you build, it all starts in your mind. The beliefs you hold about leadership, about people, about what you deserve, about what is possible, these beliefs are running your business more than your strategy document is.</p>
<p>Most leaders have never explicitly examined their core beliefs about leadership. They inherited them from parents, from managers, from culture, from painful experiences. Some of those beliefs serve them well. Some do not. And the ones that do not are often invisible, operating below the surface, shaping behavior in ways the leader cannot see until they are pointed out.</p>
<p>Common limiting beliefs in entrepreneurial leaders: "If I want something done right, I have to do it myself." That belief keeps you in the bottleneck and stunts your team''s growth. "Needing help is weakness." That belief keeps you isolated and prevents you from accessing support that could accelerate your results. "My worth is tied to my productivity." That belief drives burnout and makes every slow period an identity crisis instead of a natural business cycle.</p>
<p>The work of identifying limiting beliefs is not therapy, though therapy can help. It is inquiry. When you find yourself in a repeated pattern, a habit that keeps producing the same unwanted result, ask yourself: what belief would have to be true for me to keep doing this? What am I telling myself about this situation that keeps pulling me back to this behavior?</p>
<p>Then question the belief. Is it actually true? Is it always true? Where did it come from? Is it serving you? What would be possible if you operated from a different belief?</p>
<p>Mindset work is not about positive thinking or pretending problems are not real. It is about examining the mental model you are operating from and deciding whether that model is the best one available to you. Leaders who do this work grow faster, adapt better, and lead more effectively than those who leave their mental operating system unexamined.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Identify one repeated pattern in your leadership that is not producing the results you want. Write it down as specifically as you can.</li>
  <li>Ask yourself: what belief would have to be true for me to keep doing this? Write the belief down plainly.</li>
  <li>Write down a replacement belief, one that is equally or more true, and that would lead to better results. Post it somewhere you will see it daily for the next thirty days.</li>
</ul>',
NULL, 2);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'The Disciplines That Keep You Sharp',
'<p>You already know the basics: sleep, exercise, nutrition, stress management. This is not a refresher on that. What this lesson is about is the specific disciplines that keep you sharp as a leader, the practices that sustain your judgment, your creativity, your resilience, and your relationships over the long term.</p>
<p>The first discipline is solitude and reflection. Most entrepreneurial leaders are constantly in reactive mode. One thing after another, from morning to night. The problem is that reactive mode is terrible for strategic thinking. The insight that could change the trajectory of your business almost never comes during a rushed task. It comes when you have space to think. Building regular time for quiet reflection, even fifteen minutes a day, is one of the highest-leverage practices a leader can adopt.</p>
<p>The second discipline is learning. Not consuming content passively, but intentional, applied learning. Reading about leadership and business. Listening to people who have done things you have not yet done. Taking what you learn and applying it to a specific situation within the next week so it has a chance to become embedded knowledge rather than just information consumed and forgotten.</p>
<p>The third discipline is honest relationships. Every leader needs people around them who will tell them the truth. Not just people who support them, but people who will push back, challenge their thinking, and name what they see without softening it beyond recognition. These relationships are rare and they require intentional cultivation. Peer groups, mentors, advisors, mastermind communities. Find your people and invest in those relationships.</p>
<p>The fourth discipline is renewal. The things that genuinely restore you. For some people that is physical activity. For some it is creative work. For some it is time in faith community. For some it is time with family. These are not indulgences. They are fuel. Know what restores you and protect time for it, especially when things are most demanding.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Identify which of the four disciplines (solitude, learning, honest relationships, renewal) is most underdeveloped in your life right now.</li>
  <li>Create one concrete practice for that discipline. Make it specific enough to put on your calendar or in your daily routine. Not vague, something you can actually do.</li>
  <li>Think about who in your life will tell you the truth. If you cannot name at least one person, that is an important gap. Identify one relationship you want to invest in for more honesty and depth, and reach out to them this week.</li>
</ul>',
NULL, 3);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'The Leader You Are Becoming',
'<p>You started this course by looking honestly at the leader you are. You have done the work of examining your style, your communication, your decision-making, your culture, and your inner life. Now it is time to look forward. Not with wishful thinking, but with intention.</p>
<p>The leader you are becoming is not a fantasy version of yourself that operates without the constraints of a real business and a real life. It is a more developed version of the person who showed up in the first lesson and worked through everything since. Someone who knows themselves better, leads their team more effectively, communicates with more clarity and courage, makes decisions with more speed and wisdom, builds a culture that people genuinely want to be part of, and takes care of themselves with the same intentionality they bring to their work.</p>
<p>Leadership development is not a sprint. It is not even a marathon. It is more like farming. You do the work of the soil, the seeds, the weather, the seasons, and over time, you harvest. But the harvest is not the end. You plant again. You keep developing. The leaders who stop learning are the leaders whose teams, sooner or later, outgrow them.</p>
<p>The LeadLoud framework is built on the premise that the next generation of leaders, the ones building real businesses and real impact, lead differently than the previous generation did. They lead with transparency instead of performance. They lead with clarity instead of authority. They lead with service instead of status. They earn their place at the front of the room every day, not because of the title on their door, but because of how they show up for the people who depend on them.</p>
<p>That kind of leadership is available to you. It is not reserved for a certain type of person or a certain level of success. It starts with the decision to do the work. You have done some of that work in this course. Keep going.</p>
<p>The world needs leaders who are building something that matters and doing it in a way that reflects who they really are. That is what you are working toward. And it is worth every hard conversation, every examined belief, every leadership practice that feels awkward at first before it becomes natural.</p>
<p>Keep going. Lead well.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Return to the leadership baseline you built in Module 1. Rate yourself again in the five areas: self-awareness, communication, decision-making, culture, and self-leadership. Write down what shifted and what still needs work.</li>
  <li>Write a specific, one-year leadership development commitment. Not a vague aspiration. Three concrete things you will do in the next twelve months to become a better leader.</li>
  <li>Share your leadership commitment with one person who will hold you accountable to it. Not someone who will just cheer you on, someone who will actually ask you how it is going six months from now.</li>
</ul>',
NULL, 4);

END $$;
