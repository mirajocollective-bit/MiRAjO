DO $$
DECLARE
  v_course_id uuid;
  v_mod_id    uuid;
BEGIN

INSERT INTO courses (slug, title, description, price)
VALUES (
  'emotional-intelligence',
  'Emotional Intelligence for Entrepreneurs',
  'Emotional intelligence is not a soft skill — it is the skill that makes every other skill work. Six modules covering self-awareness, self-regulation, empathy, social awareness, relationship management, and how EQ shapes your decisions, your team, and your business outcomes.',
  0
)
ON CONFLICT (slug) DO NOTHING;

SELECT id INTO v_course_id FROM courses WHERE slug = 'emotional-intelligence';

-- ============================================================
-- MODULE 1: What Emotional Intelligence Actually Is
-- ============================================================

INSERT INTO modules (course_id, title, position)
VALUES (v_course_id, 'What Emotional Intelligence Actually Is (and Why It Runs Your Business)', 1)
RETURNING id INTO v_mod_id;

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'The Definition Nobody Taught You',
'<p>Most of us grew up hearing that emotions and business do not mix. You were told to be professional, to leave your feelings at the door, to keep it moving. And honestly, a lot of people built careers trying to do exactly that. Then they hit a wall. A client relationship fell apart. A team member quit without warning. A partnership exploded. And no matter how good the spreadsheet looked, the business took a hit because of something that had nothing to do with the numbers.</p>
<p>Emotional intelligence, or EQ, is your ability to recognize, understand, manage, and use emotions — yours and other people''s — in a way that moves you forward rather than backward. That is it. It is not about being soft. It is not about crying in meetings or sharing your feelings with strangers. It is about having enough awareness and skill to navigate human situations without blowing them up or shutting down.</p>
<p>Daniel Goleman, the researcher who brought EQ into mainstream conversation in the 1990s, found that emotional intelligence accounts for nearly 90 percent of what separates high performers from average performers in leadership roles. That number is not an accident. When you are running a business, you are dealing with people every single day. Clients, vendors, employees, partners, investors, the person at the counter who does not smile back. Your ability to read those situations and respond with intention is what determines whether things work or not.</p>
<p>Here is what EQ is not. It is not your personality. You can be an introvert with high EQ. You can be the most extroverted person in the room and have almost no emotional intelligence. It is also not your IQ. Smart people with low EQ make catastrophic decisions regularly. EQ is a skill set. And skill sets can be developed.</p>
<p>There are five core competencies in emotional intelligence: self-awareness, self-regulation, motivation, empathy, and social skills. This course walks through each one, not as a theory exercise, but as a practical toolkit. You are going to look at how each one shows up in your business, in your leadership, in your communication, and in your decisions.</p>
<p>One more thing before we go any further. If you are here, it is probably because you already sense that this matters. Maybe things are working financially but something keeps going sideways relationally. Maybe you lose your temper faster than you want to. Maybe you struggle to read people and it has cost you. Whatever brought you here, that instinct is correct. EQ is the skill underneath every other skill in your business.</p>
<p>You are not starting from zero. You already have emotional intelligence. This course is about understanding what you have, where the gaps are, and how to grow from here.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Write down one business situation in the last 90 days where emotion played a bigger role than you expected. Do not judge it. Just name it.</li>
  <li>Look up Daniel Goleman''s five components of emotional intelligence and write them down in your own words before the next lesson.</li>
  <li>Ask yourself: on a scale of 1 to 10, how emotionally self-aware do you think you are right now? Write the number down. You will revisit it at the end of this course.</li>
</ul>',
NULL, 1);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'EQ vs. IQ — What Actually Drives Business Outcomes',
'<p>You got into this business using your brain. You researched, planned, built systems, made decisions based on logic and data. And that matters. IQ, your intellectual capacity, is a real asset. But here is the thing most business schools never told you: IQ gets you in the room. EQ determines what happens once you are there.</p>
<p>Research from the Harvard Business Review and studies done by TalentSmart consistently show that EQ is the single biggest predictor of performance, more so than technical skill, more so than IQ, more so than experience. People with high EQ earn more, lead better, resolve conflict faster, and build stronger businesses. That is not opinion. That is data.</p>
<p>Think about the last time you made a decision purely on logic and it still backfired. Chances are, the logic was fine. The issue was human. Someone did not buy in. Someone felt excluded from the process. Someone felt threatened by the change. Someone was too proud to admit they did not understand the plan. Those are EQ problems. And they derail logical decisions every day.</p>
<p>The difference between IQ and EQ is essentially the difference between knowing what to do and knowing how to get people to do it with you. IQ tells you the right strategy. EQ tells you how to execute it through and with people. Entrepreneurs who are high IQ but low EQ often build very impressive products that nobody buys, or great teams that fall apart, or strong pitches that do not close. Because the missing piece was always human connection and emotional navigation.</p>
<p>This does not mean you abandon logic. The goal is integration. You want both. You want to be able to look at the numbers and the data and the plan, and also read the room, manage the tension, and communicate in a way that brings people with you. That combination is what makes an entrepreneur formidable.</p>
<p>Here is something worth sitting with. The entrepreneurs who made the biggest impact, not just the richest ones, but the ones who built things that lasted and meant something, they were not just smart. They were connected. They could inspire. They could lead through uncertainty. They could hold a team together when things got hard. That is EQ at work.</p>
<p>You are building a business and a legacy at the same time. IQ builds the business. EQ builds the legacy. You need both, and this course will sharpen the one that most people leave underdeveloped.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Think of someone you admire as a leader or entrepreneur. List three traits you admire. Notice how many of them are EQ traits versus IQ traits.</li>
  <li>Write one area of your business where your logic is sound but the human side keeps breaking down.</li>
  <li>Commit to keeping a short daily note (just three sentences) about an emotional moment in your workday. This builds the observation habit that EQ development requires.</li>
</ul>',
NULL, 2);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'How Low EQ Shows Up in Business (Without You Realizing It)',
'<p>This is the lesson most people do not want to hear. Low emotional intelligence does not look like what you think. It does not always look like a screaming boss or a person who cries at everything. Low EQ often looks polished. It looks like a high-achieving entrepreneur who keeps losing their best employees. It looks like a confident communicator whose clients quietly stop returning. It looks like a person who always has the right answer but somehow always ends up in conflict.</p>
<p>Low EQ shows up in the small things. The email you sent in frustration that burned a bridge. The meeting where you dismissed someone''s concern because you were behind schedule and it seemed irrelevant. The decision you made without asking the people who would be most affected by it, then acted surprised when they pushed back. The feedback you took personally instead of professionally. The partner you lost because you never noticed how much they needed acknowledgment.</p>
<p>In entrepreneurship specifically, low EQ creates a set of very recognizable patterns. You micromanage because you do not trust anyone to care as much as you do. You avoid hard conversations until they explode. You make impulsive decisions when you are stressed, then spend twice as long cleaning them up. You attract the wrong clients because you do not read the red flags early enough. You burn out because you cannot set limits with people, and you do not know why you cannot.</p>
<p>The painful part is that low EQ often coexists with genuine ambition, hard work, and real talent. You can be the hardest working person in the room and still be tanking your own business because you do not know how you come across, or you cannot regulate your stress response, or you do not pick up on what the people around you actually need.</p>
<p>The reason this is hard to see is that EQ blindspots are self-reinforcing. When you are emotionally unaware, the feedback that could help you grow either does not reach you because people have learned not to give it, or it reaches you and you cannot receive it without getting defensive. That cycle is one of the most damaging things that can happen to a growing business.</p>
<p>Here is the good news. Naming it is the first step to changing it. If any of what you just read felt uncomfortable, that is not a sign you are broken. That is a sign your emotional awareness is already working. The discomfort means you are paying attention. The lessons ahead will give you tools to do something about it.</p>
<p>You already took the first step by showing up here. Now let''s build.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Write down one low-EQ pattern you recognize in yourself. Just one. Be honest with yourself. This is private.</li>
  <li>Think of a business relationship that has been tense or stalled. Write one sentence about what the other person might be feeling that you have not fully considered.</li>
  <li>The next time you feel defensive about feedback, pause and write: "What might be true about this?" before responding.</li>
</ul>',
NULL, 3);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Your EQ Baseline — Where Are You Starting From?',
'<p>Before you can grow, you need to know where you are starting. Not as a judgment, not as a label, but as a baseline. A baseline is just information. It tells you what you are working with and where to put your energy.</p>
<p>Most people have a rough sense of their EQ. They know they struggle with patience. They know they tend to shut down when things get emotional. They know they read people well in one-on-one settings but lose the thread in group dynamics. What most people have not done is actually pause and map it out. This lesson is that pause.</p>
<p>There are four areas to assess right now. The first is self-awareness. How well do you know your own emotional triggers? Do you recognize your patterns in real time, or do you only see them in the rearview mirror? The second is self-regulation. When you are under pressure, what do you do? Do you slow down and respond deliberately, or do you react fast and deal with the damage later? The third is social awareness. Can you read a room? Do you notice what people are feeling, not just what they are saying? Can you pick up on tension before it becomes a problem? The fourth is relationship management. How do you handle conflict? How do you influence and inspire? How do you recover when a relationship takes a hit?</p>
<p>In each of those four areas, give yourself a number from one to five. One means it is a consistent struggle. Five means it is a consistent strength. This is not a formal assessment. It is a starting point for honest self-reflection.</p>
<p>Write those numbers down somewhere you will see them. Then write one sentence about what a five would actually look like in your business for each area. What would you be doing differently? What results would you be getting? Who would notice?</p>
<p>The gap between where you are and where a five looks like is your EQ curriculum. Everything in the next five modules is designed to close that gap, one area at a time.</p>
<p>One thing to keep in mind. EQ development is not a straight line. You will not master self-awareness in one module and then never have to think about it again. These competencies interact with each other. Growing your self-awareness makes self-regulation easier. Improving self-regulation gives you more capacity for empathy. Building empathy improves every relationship in your business. It works as a system.</p>
<p>You are not fixing yourself. You are developing a skill set that will change how you lead, how you sell, how you build, and how you sustain a business that actually lasts. Let''s get into it.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Rate yourself 1 to 5 in self-awareness, self-regulation, social awareness, and relationship management. Write the numbers down.</li>
  <li>For your lowest score, write two sentences about what it looks like when that area is working against you in your business.</li>
  <li>Set one intention for this course. One specific thing you want to be different in your business by the time you finish Module 6.</li>
</ul>',
NULL, 4);

-- ============================================================
-- MODULE 2: Self-Awareness
-- ============================================================

INSERT INTO modules (course_id, title, position)
VALUES (v_course_id, 'Self-Awareness — Knowing How You Actually Show Up', 2)
RETURNING id INTO v_mod_id;

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'The Gap Between Who You Think You Are and How You Actually Land',
'<p>This is one of the hardest lessons in this entire course, and it is worth sitting with it before you rush to the next one. There is a gap between who you think you are and how you actually land with other people. For most people, that gap is bigger than they realize. And in business, that gap is expensive.</p>
<p>You might think you come across as confident and decisive. Other people might experience you as dismissive and hard to approach. You might think you are passionate and driven. Other people might feel like you run right over them. You might think you are calm and steady. Other people might read your silence as coldness or indifference. None of these perceptions are about who you are at your core. They are about the gap between your intent and your impact.</p>
<p>Self-awareness starts with understanding that those two things — intent and impact — are not the same. Your intent is what you meant to do. Your impact is what actually happened. High EQ does not mean your intent is always perfect. It means you care about understanding your impact and you are willing to look honestly at the difference.</p>
<p>Here is why this matters so much in entrepreneurship. You are not just leading yourself. You are leading clients, customers, team members, partners, vendors. Every interaction you have creates an experience of working with you. And the experience people have of working with you determines whether they come back, whether they refer you, whether they follow you, whether they trust you with their money and their time. If there is a gap between who you think you are and who you actually are in the room, that gap is running your business whether you know it or not.</p>
<p>Building real self-awareness requires getting feedback, which is uncomfortable. It requires paying attention to patterns, which takes discipline. It requires being willing to sit with something unflattering about yourself without either defending yourself into the ground or collapsing into shame. That middle space, where you can just observe yourself honestly, is where real growth happens.</p>
<p>One practical tool: start noticing what happens in your body before you react. Before you respond to a difficult email. Before you snap at someone. Before you shut down in a meeting. There is a physical signal before every emotional reaction. Tension in your chest. Tightness in your throat. Heat in your face. That signal is your early warning system. Self-awareness begins with learning to read your own body before your mouth or your behavior does the talking.</p>
<p>You cannot change what you cannot see. The entire point of this module is to help you see more clearly.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Ask one person you trust in your business one question: "What is one thing about how I communicate that sometimes makes it harder to work with me?" Write down their answer without defending it.</li>
  <li>For the next three days, notice your physical stress signals. Write down what happens in your body when you feel challenged or threatened.</li>
  <li>At the end of each workday this week, write one sentence: "Today, my impact on someone was..."</li>
</ul>',
NULL, 1);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Knowing Your Triggers Before They Know You',
'<p>A trigger is not a weakness. It is a signal. It means something important to you is being touched, threatened, or overlooked. The problem is not that you have triggers. Every human being has them. The problem is when your triggers run you instead of inform you.</p>
<p>In business, an unexamined trigger can cost you a client in a single conversation. It can shut down a team member who had a genuinely good idea but delivered it in a way that hit a nerve. It can cause you to make a high-stakes decision from a defensive place instead of a strategic one. Knowing your triggers is not about eliminating emotion. It is about not letting a reaction from three weeks ago, or three years ago, show up in today''s meeting and make decisions for you.</p>
<p>Common entrepreneurial triggers include being questioned about your expertise or credentials, especially if you are a self-taught founder or come from a background where you had to fight to be taken seriously. Another common one is being dismissed or talked over, particularly for women and people from marginalized communities who have experienced that kind of treatment repeatedly. Uncertainty and lack of control are major triggers for action-oriented entrepreneurs who built everything by staying in motion. Public failure or the perception of failure. Being compared unfavorably to someone else. These are not small things. These touch real experiences and real wounds.</p>
<p>The key is the space between stimulus and response. Viktor Frankl, the psychiatrist and Holocaust survivor, wrote that between stimulus and response there is a space, and in that space lies our freedom. That space is what EQ training expands. The more aware you are of your triggers, the more space you have to choose your response instead of just reacting.</p>
<p>Here is a practice that works. When something sets you off, ask yourself three questions. What just happened? What story am I telling about it? What would I do if I was not triggered right now? That third question is the one that gives you access to your own best judgment instead of your most reactive state.</p>
<p>Triggers often point to values. If you get triggered when someone questions your professionalism, you probably value respect and recognition deeply. If you get triggered when plans change without notice, you probably value reliability and preparation deeply. Neither of those values is wrong. The trigger is just telling you something important is at stake. The job is to learn to receive that information without it hijacking your behavior.</p>
<p>You know your business better than anyone. Start knowing yourself with the same level of detail.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>List your top three business triggers. Be specific: not just "disrespect" but "when a client ignores my advice and then complains about the outcome."</li>
  <li>For each trigger, write the story you typically tell yourself when it happens. Then write an alternative story that is also plausible.</li>
  <li>The next time a trigger fires, pause before responding. Even if it is just ten seconds. Write about what happened in your journal that evening.</li>
</ul>',
NULL, 2);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Emotional Patterns That Are Running in the Background',
'<p>Patterns are the behaviors you repeat without choosing to repeat them. They are grooved in by years of experience, by what worked in the past, by what kept you safe, by what the people who raised you modeled. In your personal life, patterns show up in your relationships. In your business, patterns show up in your leadership, your communication, your decision-making, and how you handle pressure.</p>
<p>What makes patterns hard to see is that they feel normal. They feel like just the way things are, or just who you are, because they have been there so long. But normal does not mean effective. And patterns from ten years ago may not serve you in the business you are building today.</p>
<p>Some common emotional patterns in entrepreneurs. The over-commitment pattern: you say yes to everything because saying no feels like failure or like you are not working hard enough, and then you burn out or deliver below your standard and wonder why you are exhausted. The avoidance pattern: you have a conversation you need to have but you keep putting it off because conflict feels unsafe, so small problems compound into large ones. The control pattern: you cannot delegate because deep down you are afraid that if someone else does it, it will not be done right, or worse, that it will be done right and that will mean you are not as necessary as you thought. The approval pattern: you adjust your pricing, your offers, your language, your position based on what you think other people want to hear, and you end up attracting the wrong clients and feeling unseen.</p>
<p>None of these patterns make you a bad person or a bad entrepreneur. They are almost always survival strategies that made sense at some point. But they need to be examined, because an unexamined pattern will run your business into the ground while you are busy wondering why nothing is sticking.</p>
<p>The way to identify your patterns is to look for repetition. If the same type of problem keeps showing up with different people and in different situations, that is a pattern worth examining. If you keep hiring the same type of person who disappoints you in the same type of way, that is a pattern. If you keep losing clients at the same point in the relationship cycle, that is a pattern. The common thread is you. Not as a villain, but as a participant. And participants can change.</p>
<p>Start by naming one pattern. Just one. Write it out without editorializing. "I tend to avoid giving critical feedback until a situation becomes unbearable" is enough. You do not have to know why yet. You just have to see it. Seeing it is the beginning.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Identify one pattern that has shown up in your business more than once. Write it as a simple "I tend to..." statement.</li>
  <li>Look at where that pattern may have come from. Not to assign blame, just to understand. Write two sentences about its origin.</li>
  <li>Write down one way this pattern has protected you, and one way it has cost you. Patterns always have both.</li>
</ul>',
NULL, 3);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Building a Daily Self-Awareness Practice',
'<p>You can learn everything in this course and still see very little change if you do not build a consistent practice around it. Self-awareness is not a one-time insight. It is a daily discipline. And the good news is that it does not have to be complicated or time-consuming. A few minutes of honest reflection, done consistently, will do more for your EQ than a weekend workshop you attend once and never revisit.</p>
<p>There are three core practices that work for entrepreneurs specifically, because they are short, they are grounded in real experience, and they do not require you to sit still for an hour a day if that is not your lifestyle.</p>
<p>The first is the end-of-day check-in. Before you close your laptop or step away from work, take three to five minutes to answer three questions. What was the highest-emotion moment of my day? How did I respond? What would I do differently if I had that moment again? That is it. Three questions, five minutes, done daily. Over time, this builds an extraordinary map of your emotional patterns, your triggers, your best responses, and your gaps.</p>
<p>The second practice is the pre-meeting intention. Before any significant meeting or conversation, take sixty seconds to ask: what do I want this person to feel during and after this conversation? That single question shifts your orientation from broadcasting to connecting. It moves you from thinking about what you want to say to thinking about what the other person needs to receive.</p>
<p>The third practice is the physical check-in. At least twice during your workday, just stop and notice how you feel physically. Tight shoulders. Shallow breathing. Clenched jaw. These are signals. Not problems to solve, just data. When you notice your body is tense, you can make a conscious choice about whether to power through or to take two minutes to reset before the next interaction.</p>
<p>Self-awareness built through consistent practice has a compounding effect. The more you practice noticing, the faster you notice in real time. You go from recognizing a pattern two days later, to recognizing it two hours later, to catching it in the moment. That progression is what changes behavior. And changed behavior is what changes outcomes.</p>
<p>Your business is a reflection of who you are in it. Building self-awareness is one of the most high-leverage investments you can make, not just in yourself, but in the business you are building.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Start the end-of-day check-in today. Use a notebook, a notes app, whatever you will actually use. Answer the three questions before you go to sleep.</li>
  <li>Before your next significant meeting, take sixty seconds to set an intention about how you want the other person to feel.</li>
  <li>Set a phone alarm for midday labeled "check in." When it goes off, just notice: how does my body feel right now?</li>
</ul>',
NULL, 4);

-- ============================================================
-- MODULE 3: Self-Regulation
-- ============================================================

INSERT INTO modules (course_id, title, position)
VALUES (v_course_id, 'Self-Regulation — Stopping the Reaction Before It Costs You', 3)
RETURNING id INTO v_mod_id;

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'What Happens in Your Brain When You Lose It',
'<p>Before we talk about how to regulate your emotions, you need to understand what happens biologically when you do not. Because this is not a willpower problem. It is a brain function problem. And knowing that changes how you approach it.</p>
<p>Your brain has a system called the amygdala, which is the part responsible for processing threat. When you perceive something as threatening, whether it is a lion chasing you or a client who just questioned your invoice, the amygdala fires. It sends a signal that triggers your fight, flight, or freeze response. Your stress hormones spike. Your heart rate increases. Blood flows away from your prefrontal cortex, the rational thinking part of your brain, and toward your muscles and your survival systems.</p>
<p>In a real physical threat, this is exactly what you want. In a business meeting, it is a disaster. Because when your prefrontal cortex goes offline, your access to nuanced thinking, empathy, problem-solving, and long-range strategy goes with it. What is left is reactive, blunt, and driven entirely by survival instinct. This is why smart people say things they regret. This is why experienced entrepreneurs make decisions they know are wrong five minutes later. The brain is running a survival program in a situation that does not actually require survival.</p>
<p>The term for this is amygdala hijack, and Daniel Goleman described it as one of the central challenges of emotional intelligence. You cannot stop the initial hijack. The signal fires faster than conscious thought. What you can do is learn to recognize it and create enough of a pause to let your prefrontal cortex come back online before you respond.</p>
<p>The physical signs of an amygdala hijack are recognizable if you know what to look for. Your heartbeat speeds up. Your jaw tightens. Your face gets warm. Your breathing gets shallow. You might feel a surge of energy that wants to go somewhere, or a shutdown impulse that wants to go quiet. Those are your signals. They are not weaknesses. They are information.</p>
<p>Once you can recognize those signals in real time, you have a window. Not a big one, but enough. Enough to pause. Enough to breathe. Enough to ask yourself whether the way you are about to respond is the response you would choose if you were calm. That window is where self-regulation lives.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>The next time you feel your stress response starting, name it out loud or in writing. "I am being triggered right now." Naming it engages your prefrontal cortex.</li>
  <li>Learn and practice box breathing: inhale for four counts, hold for four, exhale for four, hold for four. Use it as a reset when you feel the hijack starting.</li>
  <li>Write a short list of your personal hijack signals. What does your body do first when you are starting to lose it?</li>
</ul>',
NULL, 1);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Responding vs. Reacting — The Skill That Changes Everything',
'<p>There is a difference between responding and reacting, and it is one of the most important distinctions in emotional intelligence. A reaction is immediate and unfiltered. It comes from whatever emotional state you are in right now. A response is intentional. It takes in the situation, considers the options, and chooses an action aligned with who you want to be and where you want things to go.</p>
<p>Reactions are not always wrong. If a car is coming at you, you want to react. But in business, most situations are not emergencies, even when they feel like them. Most of the moments that trigger a reaction from us are situations where a thoughtful response would serve us significantly better.</p>
<p>Here is what the reactive cycle looks like in practice. Someone says something that lands wrong. Your body registers it as a threat. Your emotions spike. You say or do the first thing that comes to your mind. And then you deal with whatever that created. The reactive cycle is fast, feels satisfying in the moment, and is often costly in the aftermath.</p>
<p>Here is what the response cycle looks like. Someone says something that lands wrong. Your body registers it as a threat. You recognize the signal. You pause, even briefly. You ask yourself what is actually happening here and what outcome you want. You choose your words or your action from that place. That cycle takes more time in the moment and almost always produces better results.</p>
<p>Building the response habit takes repetition. It will not happen overnight. You will catch yourself after the fact at first, then you will catch yourself during, then eventually you will catch it before you open your mouth. That progression is normal and worth celebrating at every stage.</p>
<p>One useful tool is what some coaches call the "and then what" question. When you feel the pull to react, ask yourself: and then what? If I say this, then what? If I send this email right now, then what? Following that chain even one or two steps forward almost always slows down the reaction enough to make room for a response.</p>
<p>This is not about suppressing your emotions. You are allowed to be angry. You are allowed to be frustrated. You are allowed to feel every emotion that comes up in the course of running a business. The question is not whether you feel it. The question is what you do with it. Your emotions are data. The question is whether you let them drive or whether you drive.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Write down one situation from the past month where you reacted instead of responded. What would a response have looked like instead?</li>
  <li>Practice the "and then what" question this week. When you feel a strong reactive impulse, follow the chain two steps forward before you act.</li>
  <li>Pick one communication channel where you will implement a twenty-four-hour rule for emotionally loaded messages. Draft it, wait, then decide whether to send.</li>
</ul>',
NULL, 2);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Managing Stress Without Burning Down Your Business',
'<p>Stress is one of the biggest EQ killers in entrepreneurship. Not because stress is inherently bad, a certain amount of stress sharpens focus and drives performance. But chronic, unmanaged stress eats your emotional intelligence from the inside. It narrows your thinking. It reduces your patience. It compromises your decision-making. It makes everything feel more personal than it is.</p>
<p>Entrepreneurship is a pressure cooker. You have financial stress, team stress, client stress, market stress, and the deeply personal stress of having built something that feels like an extension of yourself. The line between your identity and your business often gets blurred, which means any threat to the business feels like a threat to you. That blurring makes emotional regulation significantly harder.</p>
<p>The first thing to name here is that managing stress is not the same as eliminating stress. You are not going to eliminate the pressures of running a business. What you can do is build the capacity to process stress in ways that do not compromise your judgment, your relationships, or your health.</p>
<p>Physical self-care is not a luxury. It is an EQ strategy. Sleep deprivation reduces your ability to regulate emotion by up to 60 percent. Regular movement helps process the cortisol and adrenaline that stress pumps into your system. Nutrition affects brain chemistry in ways that are directly tied to mood and decision-making. These are not soft recommendations. They are biological realities that affect how well you can lead.</p>
<p>Beyond the physical, you need outlets for processing. Whether that is a coach, a trusted peer, a journal, or a faith practice, you need somewhere to put the weight that accumulates in entrepreneurship. When you have no outlet, the pressure builds and eventually comes out sideways, in the wrong meeting, toward the wrong person, at the wrong time.</p>
<p>One of the most effective stress management tools for entrepreneurs is a "stress inoculation" practice. This means intentionally rehearsing high-pressure situations in low-stakes environments. It means thinking through worst-case scenarios not to catastrophize, but to realize they are survivable. It means building a track record of handling hard things so that when the next hard thing comes, your nervous system has evidence that you can manage it.</p>
<p>You will handle stress better when you are honest about it. Not in a way that undermines your leadership, but in a way that keeps you connected to reality. Stress ignored becomes stress expressed sideways. Stress acknowledged becomes information you can work with.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Identify your current top three stress sources in your business. Write them down and mark each one as in your control, partially in your control, or outside your control.</li>
  <li>This week, add one physical stress-relief practice to your daily routine. Even a ten-minute walk counts.</li>
  <li>Find one person you can be honest with about the pressures of your business. Not to complain, but to process. Schedule time to talk.</li>
</ul>',
NULL, 3);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Building Emotional Limits That Protect Your Performance',
'<p>Emotional limits are one of the most misunderstood concepts in leadership. A lot of people think limits mean walls. They mean keeping people out, being cold or distant, not letting things affect you. That is not what this is. Emotional limits are about knowing where you end and where someone else begins. They are about knowing what you will and will not allow in your professional space, and being able to hold that without guilt or apology.</p>
<p>For entrepreneurs, poor emotional limits often look like this. You absorb every client''s urgency as your own emergency. You take every piece of negative feedback personally and carry it around for days. You allow team members or clients to contact you at any hour and then wonder why you can never fully decompress. You say yes to requests that violate your values or your capacity because you do not want to disappoint anyone. You lose yourself in other people''s problems and have nothing left for your own priorities.</p>
<p>Building emotional limits starts with clarity about your own values and needs. What do you need to do your best work? What conditions allow you to be the kind of leader, communicator, and decision-maker you want to be? Those conditions are not optional extras. They are operational requirements. And your emotional limits protect them.</p>
<p>Practical limits in business look like specific things. Not checking email after 8 PM so you can actually rest. Having a clear process for handling client complaints so you are not absorbing them as personal attacks each time. Being able to say "let me think about that and get back to you" instead of committing in the moment under social pressure. Leaving a meeting that has turned toxic and following up when things are calmer. These are not dramatic declarations. They are small, specific choices that protect your capacity to lead well.</p>
<p>One thing worth naming is that setting limits will feel uncomfortable at first, especially if you have built your business on being available and accommodating. Some people will push back. Some will be surprised. A few might be temporarily unhappy. That discomfort is not a sign that you are doing it wrong. It is almost always a sign that you are doing it right.</p>
<p>Your emotional health is a business asset. When you protect it, you protect your ability to serve your clients, lead your team, and make decisions that reflect your actual values. That is not selfish. That is sustainable leadership.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Write one emotional limit you have been meaning to set but have been avoiding. What specifically would that limit look like in practice?</li>
  <li>Identify one area where someone else''s stress or urgency regularly becomes yours. What is one small thing you can do this week to create more separation there?</li>
  <li>Practice saying "I''ll think about it and follow up" this week instead of committing under pressure. Notice how it feels and what happens next.</li>
</ul>',
NULL, 4);

-- ============================================================
-- MODULE 4: Empathy and Social Awareness
-- ============================================================

INSERT INTO modules (course_id, title, position)
VALUES (v_course_id, 'Empathy and Social Awareness — Reading the Room in Business', 4)
RETURNING id INTO v_mod_id;

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'What Empathy Actually Is (It Is Not Agreement)',
'<p>Let''s clear something up right now, because this misconception holds a lot of entrepreneurs back from developing this skill. Empathy is not agreement. Empathy is not sympathy. Empathy is not weakness. And empathy does not mean you take on other people''s problems or let people walk all over you.</p>
<p>Empathy is the ability to understand what another person is experiencing from their point of view. That is it. You do not have to agree with them. You do not have to feel what they feel. You do not have to fix it or rescue them. You just have to understand it well enough to respond in a way that accounts for it.</p>
<p>In business, that capacity is an extraordinary competitive advantage. When you can understand what your client is actually worried about underneath the surface complaint, you can address the real issue instead of the stated one. When you can read what your team member is actually feeling underneath the pushback, you can have the right conversation instead of a defensive one. When you can sense what a potential partner is weighing before they say it out loud, you can shape your pitch around what actually matters to them.</p>
<p>Empathy operates on three levels. The first is cognitive empathy, knowing what someone is thinking or how they see a situation. The second is emotional empathy, sensing what someone is feeling and being moved by it. The third is compassionate empathy, understanding someone''s experience and choosing to do something about it. As an entrepreneur, you need all three, in different situations and in different combinations.</p>
<p>Some people are naturally high in emotional empathy and get overwhelmed by it, absorbing other people''s distress and losing their own clarity. Others are naturally high in cognitive empathy but come across as cold because they understand the logic of someone''s situation without connecting to the feeling. Building full empathy means developing the areas that do not come as naturally.</p>
<p>One of the most powerful things you can do is ask better questions and then actually listen to the answers. Not listening for where you will get back in, not listening with your fix already loaded. Listening to understand. When someone feels genuinely understood, something shifts in the dynamic. Trust goes up. Defense goes down. Possibility opens up. That shift is created by empathy, and it is one of the most powerful tools in business.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>In your next significant conversation with a client or team member, focus on listening to understand rather than listening to respond. Afterward, write down what you learned that you did not know before.</li>
  <li>Think of someone in your business who is frustrating you right now. Write three sentences about what the world might look like from their perspective.</li>
  <li>Practice reflecting back what someone says before offering your own perspective. "What I hear you saying is..." Then check if you got it right.</li>
</ul>',
NULL, 1);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Social Awareness — Reading What Is Not Being Said',
'<p>The most important communication in any business situation often has nothing to do with the words being spoken. It is in the pause before someone answers. The slight shift in body language when a topic comes up. The energy change in a room when a decision is announced. The way someone''s voice drops when they are saying yes but meaning no. Social awareness is the ability to read those signals and factor them into your understanding of the situation.</p>
<p>This is a skill that can absolutely be developed, and it starts with paying attention differently. Most of us listen with our agenda in play. We are thinking about what we want to say next, how we want to come across, what we want to get out of this interaction. Social awareness asks you to set that aside long enough to genuinely observe the person in front of you.</p>
<p>In client relationships, social awareness means noticing when someone''s enthusiasm has quietly shifted to doubt even though they are still nodding along. It means recognizing when a client is not asking for more service, they are asking for more reassurance. It means seeing the difference between a client who is unhappy and a client who is disengaging, because those require very different responses.</p>
<p>In team settings, social awareness means picking up on group dynamics before they become problems. Who defers to whom in the room, and is that healthy? Who goes quiet when a certain person speaks, and why? Is there a tension between two team members that is affecting the whole group? These things are always visible if you are paying attention. They are invisible when you are only tracking the task.</p>
<p>There are things that get in the way of social awareness. Being too focused on your own performance in the room. Stress, which narrows your perception. Moving too fast. Underestimating the importance of informal moments, the conversation before the meeting starts, the way someone says goodbye, the look someone gives when they think no one is watching.</p>
<p>Start paying attention to what is not being said. Body language, tone, silence, hesitation, and even excessive enthusiasm can all be signals. You do not have to become a psychoanalyst. You just have to slow down enough to notice.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>In your next team meeting or client call, spend the first five minutes just observing. Resist the urge to set the agenda or fill silence immediately. Notice what you pick up.</li>
  <li>After the meeting, write down three things you noticed that were not in the words spoken. What might those signals mean?</li>
  <li>Ask one person in your business a genuinely open-ended question this week. Something like: "How is this actually feeling for you?" Then stop talking and listen.</li>
</ul>',
NULL, 2);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Cultural and Contextual Awareness in Business Relationships',
'<p>Social awareness does not exist in a vacuum. People bring their entire history, culture, context, and set of experiences into every professional interaction. Understanding that is not political. It is practical. If you want to communicate effectively, build strong relationships, and lead diverse teams and client bases, you have to understand that not everyone reads the room the same way you do.</p>
<p>This is especially true if you are building a business that serves people across different backgrounds, communities, or industries. What signals respect in one context signals weakness in another. What reads as confidence in one culture reads as arrogance in another. What feels like directness to you might feel like hostility to someone else. These are not personality conflicts. They are contextual differences. And the entrepreneur who understands that leads better and sells better.</p>
<p>Cultural awareness in the context of EQ does not mean becoming an expert in every culture. It means staying genuinely curious about other people''s experience instead of assuming everyone operates from the same defaults you do. It means asking more questions and making fewer assumptions. It means recognizing when your frame of reference might not be universal.</p>
<p>For entrepreneurs who have had to code-switch, meaning adjust your communication style based on who is in the room, in order to be taken seriously, you already know this on a deep level. You have had to develop social awareness as a survival skill. The work here is to channel that skill intentionally rather than reactively, and to extend the same awareness to others that you have needed from others.</p>
<p>Generational context matters too. A millennial employee and a Gen X client may bring completely different assumptions about communication, feedback, authority, and collaboration. A new entrepreneur and a twenty-year business owner may interpret the same situation through completely different filters. Neither is wrong. Both are relevant.</p>
<p>The goal of cultural and contextual awareness is not to pretend you have no defaults. It is to know what your defaults are and to stay flexible enough to expand them when the situation calls for it. That flexibility is a form of respect. And it builds the kind of trust that makes business relationships durable.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Think of one relationship in your business where a cultural or contextual difference might be creating friction that you have not named. Write two sentences about what might be happening from their perspective.</li>
  <li>This week, before a significant interaction with someone from a different background or generation, take two minutes to think about how their experience might shape their expectations of the conversation.</li>
  <li>Read or listen to one piece of content this month created by an entrepreneur from a background different from yours. Notice what perspective it opens for you.</li>
</ul>',
NULL, 3);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Organizational Empathy — Reading the Emotional Climate of Your Business',
'<p>There is a concept called organizational empathy, and it is one of the highest-level skills in this module. It is the ability to sense and understand the emotional climate of your business as a whole. Not just individual relationships, but the overall energy, morale, trust level, and psychological safety of the entire team or organization.</p>
<p>Most entrepreneurs focus intensely on external metrics. Revenue, conversion, retention, growth. These are important. But there are internal metrics that drive all of those numbers, and they are almost entirely emotional. How safe do people feel to speak up? How connected do team members feel to the mission? How much trust exists between different roles or departments? Is there an energy of possibility in your business, or an energy of exhaustion and survival?</p>
<p>The emotional climate of a business is set largely by the leader. Not intentionally, not consciously most of the time, but absolutely. Your energy is contagious. Your stress is felt. Your confidence steadies people. Your anxiety unsettles them. This is not pressure to be perfect. It is information about how much your internal state matters at a structural level.</p>
<p>Reading the emotional climate of your business requires getting honest information, which means creating conditions where people actually tell you the truth. Most teams do not tell the leader the truth, not because they are deceptive, but because experience has taught them that the truth is not safe to say. If you want accurate information about the emotional climate of your business, you have to actively create safety for honesty.</p>
<p>That looks like asking specific questions rather than general ones. Not "how is everything going?" but "what is the one thing that would make your work feel easier right now?" Not "any concerns?" but "what worries you about this plan that we have not talked about yet?" Specific questions signal that you actually want real answers. And real answers are what you need to lead well.</p>
<p>You cannot fix what you cannot see. And you cannot see the emotional climate of your business if you are only looking at the surface. Go deeper. Ask more. Create more safety. Listen without defending. The information you get will change how you lead and what you build.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>On a scale of 1 to 10, rate the current emotional climate of your business or team. What is driving that number?</li>
  <li>Ask one team member or close collaborator this week: "What is one thing about how things are going here that you think I might not know or might be underestimating?" Then just listen.</li>
  <li>Identify one thing you do regularly that affects the emotional climate of your business. Decide whether to keep it or change it.</li>
</ul>',
NULL, 4);

-- ============================================================
-- MODULE 5: Relationship Management
-- ============================================================

INSERT INTO modules (course_id, title, position)
VALUES (v_course_id, 'Relationship Management — Leading, Selling, and Communicating Better', 5)
RETURNING id INTO v_mod_id;

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'The Relationship Between Trust and Business Growth',
'<p>Everything in business runs on trust. Every sale, every partnership, every team dynamic, every client relationship. Trust is not a soft ideal. It is the operating system of commerce. And it is built through emotional intelligence more than through any other single factor.</p>
<p>Think about the businesses you personally choose to return to. Not just because they are the cheapest or the most convenient, but because you trust them. You trust them to do what they said. You trust them to be honest when something goes wrong. You trust that they actually care whether things work out for you. That trust was built through hundreds of small moments that communicated consistency, reliability, and genuine concern for your experience.</p>
<p>Building trust as an entrepreneur requires three things. Competence, which is the belief that you can actually do what you say you can do. Integrity, which is the alignment between what you say and what you do, over time and especially under pressure. And warmth, which is the sense that you genuinely care about the people you serve and work with, not just as transactions but as human beings.</p>
<p>Competence is table stakes. Most people who hire you or buy from you assume some level of competence. What differentiates you in a crowded market is integrity and warmth. And both of those are EQ competencies.</p>
<p>Integrity in leadership and in client relationships means being willing to have hard conversations early instead of letting problems compound. It means admitting when you were wrong without over-explaining or over-apologizing. It means following through on small commitments, because small commitments are what large trust is built from.</p>
<p>Warmth is expressed through attention. Remembering what someone told you last time. Following up after a difficult conversation to check in. Acknowledging the human being behind the professional. These are not complicated things. They take very little time. And they create a disproportionate amount of trust.</p>
<p>Trust, once built, gives you an extraordinary amount of relational capital. It means clients come back and refer others. It means team members give you the benefit of the doubt when things are hard. It means partners bring you into conversations you would never have access to otherwise. Building it is one of the highest-return investments you can make in your business.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Identify one relationship in your business where trust is lower than it needs to be. Write one sentence about why. Write one sentence about what you could do this week to start rebuilding it.</li>
  <li>Pick one small commitment you have been slow to follow through on. Follow through on it this week before doing anything else.</li>
  <li>In your next client interaction, find one moment to acknowledge something personal or human about their situation before moving to business. Notice what shifts.</li>
</ul>',
NULL, 1);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Conflict Resolution That Does Not Wreck the Relationship',
'<p>Conflict is not the problem. Avoided conflict is the problem. When you avoid conflict, the issue does not go away. It grows. It gets more complicated. It involves more people. It damages the relationship more than a direct early conversation would have. Learning to move toward conflict, at the right time and in the right way, is one of the most powerful EQ skills you can develop.</p>
<p>The entrepreneur who manages conflict well is not the one who never has conflict. It is the one who knows how to address tension early, honestly, and in a way that leaves the relationship stronger rather than fractured.</p>
<p>There is a framework for productive conflict that works in almost every business context. It starts with separating the person from the problem. The issue is not that your client is difficult. The issue is that the project scope was not clearly defined and now there is disagreement about deliverables. Those are very different conversations. One attacks a person. The other addresses a situation. Stay in the situation.</p>
<p>The second piece is listening before advocating. Most people go into conflict conversations with their argument fully formed and their position defended. That approach rarely works. What works is asking the other person to share their experience first, genuinely listening to understand it, and then sharing your own. When people feel heard, they are significantly more open to hearing back.</p>
<p>The third piece is focusing on what is possible rather than what happened. You cannot change what already occurred. What you can do is decide together where to go from here. Keeping the conversation oriented toward the future rather than relitigating the past moves things forward faster and with less damage.</p>
<p>One thing that makes conflict harder is when it carries old emotional weight. When this conflict reminds you of every other time someone dismissed you or took advantage of you or did not appreciate your work. When that happens, the current conflict becomes much bigger than it actually is. Part of self-awareness in conflict is recognizing when you are fighting this situation versus fighting a pattern. Those require different tools.</p>
<p>Conflict handled well is a relationship strengthener. It proves that you can navigate hard things together. That proof is part of what makes business relationships durable enough to survive the inevitable challenges that come with building something real.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Identify one conflict or tension in your business that you have been avoiding. Write what specifically you are afraid will happen if you address it.</li>
  <li>Plan the first sentence of the conversation you need to have. Make it about the situation, not the person.</li>
  <li>Practice the "listen first" approach in a low-stakes conversation this week to build the habit before you need it in a high-stakes one.</li>
</ul>',
NULL, 2);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'EQ in Sales — Why People Buy From People They Feel Understood By',
'<p>Selling is one of the most emotional transactions in business, from both sides. The buyer is trying to decide whether you are trustworthy, whether your solution is right for them, and whether the risk of making this decision is worth it. The seller, you, is trying to communicate value, build connection, and move someone to yes. When EQ is high, that process feels like a conversation. When EQ is low, it feels like a presentation.</p>
<p>The biggest shift you can make in your sales process is moving from persuasion to understanding. Most sales training teaches you to talk about your product: the features, the benefits, the results. And those things matter. But they come second. What comes first is making the person in front of you feel genuinely understood. When someone feels understood, their guard comes down. Their trust goes up. And they become significantly more open to what you have to offer.</p>
<p>Understand before you offer. Before you pitch anything, find out what the person is actually dealing with. Not the surface problem, the real one. Ask questions that invite depth. "What has this been costing you, not just in money but in time and energy?" "What have you tried before and why did it not work?" "What would it actually mean for your life or your business if this got resolved?" The answers to those questions give you everything you need to present your offer in a way that speaks directly to their real experience.</p>
<p>High-EQ selling also requires that you pay attention to fit. Not every client is your client. Not every buyer is ready, qualified, or aligned with what you do. Recognizing that and being honest about it, even when it means not making the sale, builds a reputation for integrity that brings better clients over time.</p>
<p>Rejection in sales often triggers the same emotional patterns we talked about in Module 2. The entrepreneur who takes every no personally will burn out fast and stop selling. The entrepreneur who can hear a no, process it without internalizing it as a verdict on their worth, and keep going is the one who eventually wins the market. That capacity is EQ.</p>
<p>Your ability to make people feel heard, understood, and genuinely served is your greatest sales asset. Train that alongside your product knowledge, and your conversion will reflect it.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>In your next sales conversation, spend the first half of the time asking questions instead of presenting. Write down what you learned about the person that you would not have discovered otherwise.</li>
  <li>Write out the three depth questions from this lesson and memorize them. Use them with the next prospect you talk to.</li>
  <li>After a sales conversation that did not close, write: "What this person was really looking for was..." Fill in the blank honestly. Use that to refine your approach.</li>
</ul>',
NULL, 3);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Giving and Receiving Feedback Without Wrecking the Relationship',
'<p>Feedback is one of the highest-EQ interactions in any business relationship. Done well, it accelerates growth, strengthens trust, and makes teams stronger. Done poorly, it damages relationships, shuts people down, and creates cultures where no one tells the truth. The ability to give and receive feedback skillfully is not a nice-to-have in leadership. It is a core competency.</p>
<p>Giving feedback well starts before you say a word. It starts with checking your own emotional state. Are you giving this feedback to help the person grow, or are you venting frustration? Are you coming from a place of genuine care for their development, or from irritation that they did not do what you expected? The person receiving your feedback can feel the difference, even if they cannot name it.</p>
<p>The most effective feedback is specific, behavioral, and future-oriented. Not "you are always disorganized" but "the report that came in on Thursday was missing the client data we discussed, and that caused a delay. Let''s talk about what would help you get that right next time." One is a character judgment. The other is a specific situation with a path forward. The first shuts people down. The second opens a conversation.</p>
<p>Timing matters significantly. Feedback given in the heat of a difficult moment is rarely received well, even if it is accurate. Feedback given privately, calmly, and at a time when the person has the emotional capacity to receive it lands differently. If something needs to be addressed urgently, address the immediate situation and then have the deeper conversation later.</p>
<p>Receiving feedback is harder for most entrepreneurs than giving it. This is because entrepreneurs have so much of their identity wrapped up in their business that criticism of the work feels like criticism of the self. Building the capacity to receive feedback gracefully, without defensiveness, without shutdown, without immediate counter-arguments, is one of the most powerful things you can do for your own development.</p>
<p>When feedback comes, try this: breathe first. Then ask one clarifying question before you respond. Then say "thank you" genuinely, even if it stings. Then decide later, not in the moment, what to do with what you heard. You do not have to agree with every piece of feedback. But you do have to be able to hear it without making the person sorry they said it.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Think of a piece of feedback you have been holding back from a team member or client. Rewrite it using the specific, behavioral, future-oriented formula from this lesson.</li>
  <li>The next time you receive feedback that stings, practice the sequence: breathe, ask one question, thank them. Write about how it went.</li>
  <li>Ask someone you trust: "What is something I do that makes it harder for people to give me feedback?" Then listen without defending.</li>
</ul>',
NULL, 4);

-- ============================================================
-- MODULE 6: EQ in Business Decisions
-- ============================================================

INSERT INTO modules (course_id, title, position)
VALUES (v_course_id, 'EQ in Business Decisions — When Emotion and Strategy Have to Work Together', 6)
RETURNING id INTO v_mod_id;

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'How Emotions Actually Shape Your Business Decisions',
'<p>Here is something the strategy books rarely tell you. Every business decision you make is emotional. Even the ones that feel purely logical. The data you choose to look at, the options you consider and the ones you rule out before they even reach the table, the risk level you are comfortable with, the timeline you choose, all of these are shaped by your emotional state, your past experiences, your fears, and your values.</p>
<p>This is not a flaw in your decision-making. It is how human beings work. The neuroscientist Antonio Damasio did extensive research on people who had suffered damage to the emotional centers of their brains, leaving their rational thinking completely intact. What he found was that these people could not make decisions at all. They could lay out the options and analyze the tradeoffs endlessly, but without emotion to give weight to the outcomes, they could not choose. Emotion is not the enemy of good decisions. It is a necessary ingredient.</p>
<p>The problem is not that emotions are involved in your decisions. The problem is when they are involved without your awareness. When fear is making your choices while you tell yourself it is logic. When ego is driving a decision while you dress it up in strategy. When grief over a lost business relationship is making you gun-shy about a new one that is actually healthy. Those are emotions making decisions through you rather than with you.</p>
<p>The goal of EQ in decision-making is not to eliminate emotion from the process. It is to make your emotions conscious so they can inform your decisions rather than hijack them. A decision made with both emotional intelligence and analytical rigor will almost always outperform one made from either alone.</p>
<p>One of the most important questions you can ask before any significant business decision is: what emotion is most present for me right now in relation to this choice? And is that emotion pointing me toward something real, or is it steering me based on something from the past? That one question, asked honestly, changes everything.</p>
<p>We will spend the rest of this module building out specific tools for integrating emotion and strategy in the four decision areas where EQ matters most: hiring, partnerships, pricing, and scaling.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Think of a major decision you made in the past year. Write down what emotion was most present for you at the time. How did that emotion shape the choice you made?</li>
  <li>Before your next significant decision, write: "The emotion most present for me right now is..." and "What is this emotion pointing me toward?" Answer both questions honestly.</li>
  <li>Identify one area of your business where you think you have been making decisions from fear. Write what a decision from clarity would look like instead.</li>
</ul>',
NULL, 1);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Hiring and People Decisions — The Highest-Stakes EQ Moments',
'<p>Hiring is the highest-stakes decision most business owners make, and it is one of the decisions most influenced by emotion in ways that can be both a strength and a liability. You hire fast because you are overwhelmed and someone shows up who feels like a relief. You hold onto the wrong person for too long because you feel guilty about letting them go or you do not want to have the hard conversation. You pass on the right candidate because something about them made you uncomfortable that had nothing to do with whether they could do the job.</p>
<p>High EQ in hiring means understanding your emotional patterns in the selection process and checking them intentionally. Do you tend to hire people who are like you? That feels comfortable, but it limits perspective and creates blind spots. Do you let enthusiasm override evidence? A candidate who is energetic and confident is exciting to be around, but those qualities do not tell you whether they can execute. Do you ignore red flags because you need to fill the role and this person is here?</p>
<p>The EQ side of hiring also includes how you treat candidates throughout the process. People talk. The experience of interviewing with your company is itself a signal to the market about who you are as a leader. Candidates who feel respected, even if they are not selected, often become referrers, future clients, or advocates. Candidates who feel dismissed or ignored after multiple rounds often share that experience publicly.</p>
<p>People decisions after hiring are equally emotionally loaded. Performance conversations, promotions, role changes, letting someone go. These are moments where emotional avoidance is most expensive. Every week you avoid a necessary people conversation, the situation compounds. The person continues to underperform or misalign. The team adjusts around them in ways that create resentment. The culture quietly shifts to accommodate a problem rather than solve it.</p>
<p>The EQ skill in people decisions is the ability to separate the person from the performance, to hold genuine care for the individual while still making the decision that serves the business and the team. That separation is not cold. It is compassionate and clear at the same time, which is what high-EQ leadership actually looks like.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Write down one pattern in your hiring decisions that you recognize from this lesson. What has it cost you?</li>
  <li>Think about a people decision you have been avoiding. Write: "The reason I have not handled this yet is..." Be honest.</li>
  <li>Create one question you will add to your hiring process specifically designed to surface emotional intelligence in candidates.</li>
</ul>',
NULL, 2);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Pricing, Negotiations, and the Emotions of Money',
'<p>Money conversations are among the most emotionally charged in any business. And for entrepreneurs who built their businesses from scratch, often from a place of financial scarcity or survival, those emotions can run very deep. How you feel about money shapes how you price, how you negotiate, how you handle objections, and how you respond when someone says your work is too expensive.</p>
<p>If you grew up with financial scarcity, you may undercharge because deep down, charging more feels greedy or presumptuous. If you have ever been told no repeatedly, you may pre-emptively lower your price before anyone even asks to avoid the rejection. If you tie your self-worth to your business''s revenue, a difficult negotiation feels like a personal threat rather than a business conversation. These emotional patterns are common and completely understandable. They also need to be named and examined if you are going to run your business from a place of clarity instead of survival.</p>
<p>Pricing your work appropriately is an EQ challenge as much as it is a financial one. Knowing your worth means knowing yourself, your experience, your impact, and what you bring to a client''s situation. It means being able to hold that knowing in a negotiation conversation without crumbling the moment someone pushes back. Pushback is not rejection. Pushback is negotiation. The person who can sit calmly in the discomfort of a pricing conversation and hold their number without apologizing for it will always outperform the person who drops their rate the moment they feel any friction.</p>
<p>On the buyer side of negotiations, EQ means understanding what the other person values, not just what they are saying they want. It means listening for what they are not saying. It means finding trades that create value for both parties rather than purely competing for position. High-EQ negotiators come out of difficult conversations with relationships intact, which is often more valuable long-term than winning any single negotiation.</p>
<p>The deeper work here is separating your self-worth from your financial outcomes. Your revenue is a business metric. It is important and it matters. But it is not a verdict on your value as a person or your worth as an entrepreneur. Building that separation takes time and often requires direct work on your money mindset. The outcome is worth the effort.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Write honestly: what is the emotion I most commonly feel when quoting my prices to a new client? Where might that emotion come from?</li>
  <li>The next time someone pushes back on your pricing, practice pausing before responding. Notice what your body does. Then respond from your clearest self rather than your most anxious one.</li>
  <li>Write the number you actually want to charge for your most important offer. Then write what story you tell yourself about why you cannot charge that. Examine that story.</li>
</ul>',
NULL, 3);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Scaling Your Business Without Losing Yourself',
'<p>This is the final lesson of the course, and it is the one that ties everything together. Because here is the truth about scaling: it is not primarily a systems problem. It is a self problem. The biggest constraint in most growing businesses is not the product, the market, or the funding. It is the founder''s emotional capacity to lead at the next level.</p>
<p>Scaling requires you to let go of things you built, to trust people who will do things differently than you would, to make decisions with incomplete information, to tolerate ambiguity and uncertainty for extended periods of time, and to maintain your own center while a hundred other things are pulling at your attention. Every single one of those requirements is an EQ challenge.</p>
<p>The control that kept your business alive in its early stages becomes a liability at scale. The hands-on involvement that was essential when it was just you starts to become a bottleneck. The perfectionism that produced quality early on starts to slow the team and signal a lack of trust. Growing beyond your current size requires growing beyond your current version of yourself. That is uncomfortable. It is also exactly what this course has been preparing you for.</p>
<p>The self-awareness you have been building means you can see when your patterns are limiting your team''s growth. The self-regulation you have been developing means you can tolerate uncertainty without making reactive decisions that destabilize everything. The empathy you have been expanding means you can lead people through transitions in a way that maintains trust. The relationship management skills you have built mean you can delegate with clarity and accountability rather than with anxiety.</p>
<p>Building a business that is bigger than you requires you to become someone who can hold something bigger than yourself. That development happens from the inside out. It requires honest self-examination, consistent practice, and the willingness to keep growing even when it is uncomfortable.</p>
<p>You started this course by writing down a number for your EQ and an intention for what you wanted to change. Go back to those now. Look at your baseline. Look at your intention. What has shifted? What are you seeing that you did not see before? What are you going to do differently starting tomorrow?</p>
<p>This is not the end of the work. It is the beginning of doing the work with more awareness, more skill, and more intention than you had before. That is the whole point. Not perfection. Progress. Consistent, honest, grounded progress. That is what emotional intelligence looks like in a real business, built by a real person, doing something that actually matters.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Go back to your EQ baseline from Lesson 1.4. Re-rate yourself in each of the four areas. Write down what changed and what still needs work.</li>
  <li>Write one commitment for how you will continue developing your EQ after this course. Make it specific — not just "be more empathetic" but "I will do the end-of-day check-in five days a week for the next ninety days."</li>
  <li>Write a short note to yourself about who you are becoming as a leader and an entrepreneur. Not where you started, but where you are going. Keep it somewhere you will see it.</li>
</ul>',
NULL, 4);

END $$;
