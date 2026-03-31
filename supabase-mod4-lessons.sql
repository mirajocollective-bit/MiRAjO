-- Module 4: Your 25 Days and 25 Nights — 25 lessons
-- Run AFTER supabase-modules-2-5.sql

-- DAY 1
INSERT INTO lessons (module_id, title, content, video_url, position)
SELECT m.id, 'Day 1',
$$<p>The first day will look different for everyone. You may have had the best sleep of your life and planned everything perfectly. Or you may have had an argument that left you drained and wondering if today is even the right time to start. Right now, pause. Start with something. Whatever you can do today is enough.</p>
<p>Remember, there is something waiting for you, and there are elements in the world that will test you. Pass the test as often as you can. Stay calm and focus only on today. Focus on finding your silence.</p>
<div class="day-meta">
<p><strong>Focus of the Day:</strong> Creating space for silence and awareness</p>
<p><strong>Current of the Day:</strong> The Current of Stillness</p>
<p><strong>Reminder:</strong> Strength is born in silence. Clarity comes when the noise fades.</p>
<p><strong>Daily Non-Negotiables:</strong> Complete all 10 as best you can. Allow quiet moments between them. Notice what feels uncomfortable and what feels peaceful.</p>
</div>
<h3>Check-In</h3>
<ul>
<li>What did I notice when I slowed down?</li>
<li>Where did silence feel uncomfortable?</li>
<li>What did I reach for when I felt the urge to fill the quiet?</li>
</ul>
<p><strong>Journal Prompt:</strong> When was the last time I let myself pause long enough to actually hear my own thoughts?</p>
<p><em>You only needed to begin, and you did. Stay here. Stay present. Let today count all by itself.</em></p>$$,
NULL, 1
FROM modules m JOIN courses c ON m.course_id = c.id
WHERE c.slug = '25-days-and-25-nights' AND m.position = 4;

-- DAY 2
INSERT INTO lessons (module_id, title, content, video_url, position)
SELECT m.id, 'Day 2',
$$<p>Yesterday you practiced silence. Today, you'll start to hear how loud everything really is. The world rarely stays quiet when you decide to listen. Notifications, conversations, thoughts, and emotions will all compete for your attention.</p>
<p>Do not fight the noise. Notice it. Let it show you how often your peace gets interrupted and how quickly your mind reaches for distraction. This awareness is the first layer of discipline. It is not about control, it is about recognition.</p>
<div class="day-meta">
<p><strong>Focus of the Day:</strong> Recognizing distractions and observing your reactions</p>
<p><strong>Current of the Day:</strong> The Current of Flowing Energy</p>
<p><strong>Reminder:</strong> Life expands when you give, and life replenishes when you receive.</p>
<p><strong>Daily Non-Negotiables:</strong> Complete all 10. Be aware of when you are fully present and when you are going through the motions. Energy follows attention.</p>
</div>
<h3>Check-In</h3>
<ul>
<li>What distracted me most today?</li>
<li>How did I react when my peace was interrupted?</li>
<li>Where did I notice my energy flowing without intention?</li>
</ul>
<p><strong>Journal Prompt:</strong> What noise in my life do I keep calling normal, even though it drains me?</p>
<p><em>Awareness is strength. Every time you notice the noise, you weaken its hold. You are learning to see clearly again.</em></p>$$,
NULL, 2
FROM modules m JOIN courses c ON m.course_id = c.id
WHERE c.slug = '25-days-and-25-nights' AND m.position = 4;

-- DAY 3
INSERT INTO lessons (module_id, title, content, video_url, position)
SELECT m.id, 'Day 3',
$$<p>By now, you've felt moments of quiet and moments of noise. Today is about what those moments reveal. When life slows down, the reflection starts to appear. Not the version of you that others describe, but the one who has been observing it all.</p>
<p>Judgment is one of those habits that shows up quietly. Some days you spend hours comparing, measuring, or checking if you're ahead or behind. Today is about stepping out of that loop. Reflection is not judgment. It's information. You cannot see clearly when you're constantly grading yourself or anyone else.</p>
<p>Be proud of yourself for showing up today. No comparisons, no scoreboard, no evaluation. Just truth. Just presence.</p>
<div class="day-meta">
<p><strong>Focus of the Day:</strong> Recognizing judgment in yourself and others without attaching to it</p>
<p><strong>Current of the Day:</strong> The Current of Choice</p>
<p><strong>Reminder:</strong> Every decision you make shapes the world you step into tomorrow.</p>
<p><strong>Daily Non-Negotiables:</strong> Complete all 10 with honesty. Pay attention to where judgment appears — toward yourself or anyone else. Replace it with curiosity instead of criticism.</p>
</div>
<h3>Check-In</h3>
<ul>
<li>When did I catch myself judging today?</li>
<li>Was that judgment toward myself, someone else, or both?</li>
<li>What truth might exist underneath that judgment?</li>
</ul>
<p><strong>Journal Prompt:</strong> If I looked at myself and others with full compassion today, what would change?</p>
<p><em>You are not your judgments. You are the one noticing them. Awareness is what creates freedom.</em></p>$$,
NULL, 3
FROM modules m JOIN courses c ON m.course_id = c.id
WHERE c.slug = '25-days-and-25-nights' AND m.position = 4;

-- DAY 4
INSERT INTO lessons (module_id, title, content, video_url, position)
SELECT m.id, 'Day 4',
$$<p>Every change requires an exchange. Something old must make room for something new. That can be uncomfortable, especially when the old thing has been part of your identity for a long time.</p>
<p>Detach yourself from ideas that no longer serve you. Step away from the belief that you must have this person, place, or thing in order to be okay. If you are not well, nothing you pour into will be well.</p>
<p>Release is not loss. It's freedom. When you let go, you stop feeding what drains you and start nourishing what strengthens you.</p>
<div class="day-meta">
<p><strong>Focus of the Day:</strong> Letting go of attachments that control your peace</p>
<p><strong>Current of the Day:</strong> The Current of Release</p>
<p><strong>Reminder:</strong> Letting go opens the way forward. Control is a trap. Freedom is in trust.</p>
<p><strong>Daily Non-Negotiables:</strong> Complete all 10. Pay attention to the things that pull at your energy — conversations, routines, or thoughts that leave you heavy. Practice stepping back before reacting.</p>
</div>
<h3>Check-In</h3>
<ul>
<li>What am I still trying to control?</li>
<li>What have I convinced myself I need that may be holding me back?</li>
<li>How did it feel to release even one small thing today?</li>
</ul>
<p><strong>Journal Prompt:</strong> Where in my life have I confused control with care?</p>
<p><em>Peace starts when nothing owns you. Let today be the day you begin to live light.</em></p>$$,
NULL, 4
FROM modules m JOIN courses c ON m.course_id = c.id
WHERE c.slug = '25-days-and-25-nights' AND m.position = 4;

-- DAY 5
INSERT INTO lessons (module_id, title, content, video_url, position)
SELECT m.id, 'Day 5',
$$<p>You made it through the first four days, and now it is time to pause. Not because the work is done, but because this is where you start to see what it has all been teaching you.</p>
<p>Each Current exists for a reason. They are not theories. They are truths that live in nature. Stillness helps you hear what is real beneath the noise. Flowing Energy reminds you that life is exchange. Choice connects to karma — every decision you make sends something back to you. Release frees you from what tries to own you.</p>
<p>You might also notice your routines shifting. Maybe you scrolled again or skipped something. That is part of the work. Notice it without guilt. This is your shake-it-off moment. Let this reflection prepare you for what comes next.</p>
<div class="day-meta">
<p><strong>Focus of the Day:</strong> Connecting the first four Currents and preparing for realignment</p>
<p><strong>Currents in Focus:</strong> Stillness, Flowing Energy, Choice, Release</p>
<p><strong>Daily Non-Negotiables:</strong> Complete all 10. Move slowly. Notice what feels steady and what still pulls at you.</p>
</div>
<h3>Check-In</h3>
<ul>
<li>Which Current felt most natural?</li>
<li>Which one challenged me?</li>
<li>What habits or thoughts need adjustment?</li>
</ul>
<h3>Journal Prompts</h3>
<ul>
<li><strong>Stillness:</strong> Where did I create quiet today and what did I hear beneath the noise?</li>
<li><strong>Flowing Energy:</strong> What did I give and what did I receive — how did it affect my energy?</li>
<li><strong>Choice:</strong> What decision today will shape tomorrow and was it aligned with who I am becoming?</li>
<li><strong>Release:</strong> What attachment did I loosen, or what do I need to release next?</li>
</ul>$$,
NULL, 5
FROM modules m JOIN courses c ON m.course_id = c.id
WHERE c.slug = '25-days-and-25-nights' AND m.position = 4;

-- DAY 6: Rest Day 1
INSERT INTO lessons (module_id, title, content, video_url, position)
SELECT m.id, 'Day 6: Rest Day',
$$<p>You opened this expecting another deep message, didn't you?</p>
<p>Guess what. There isn't one.</p>
<p>Close this tab. Step away. Go do absolutely nothing productive. No meditation. No journaling. No catching up. No "just one more task."</p>
<p>The work is to stop.</p>
<p>That's it.</p>
<p><em>See you tomorrow.</em></p>$$,
NULL, 6
FROM modules m JOIN courses c ON m.course_id = c.id
WHERE c.slug = '25-days-and-25-nights' AND m.position = 4;

-- DAY 7
INSERT INTO lessons (module_id, title, content, video_url, position)
SELECT m.id, 'Day 7',
$$<p>Ease is when you stop letting life feel like one long notification. You are not supposed to jump at every ping, every thought, or every emotion. Everything that happens should not shake you.</p>
<p>Ease is learning that you do not need to be petty, prove a point, or match energy. It is knowing when to push back from the table and walk away. It is not silence in meditation anymore. It is silence in motion. The same stillness you practiced alone now shows up in how you move through the world.</p>
<p>Ease is where peace becomes power. It is where you understand that control is not leadership and stillness is not weakness.</p>
<p>And there is something beautiful in Ease. You learn that you can lean. You can find places that let you float for a while. Maybe you lean on someone you trust. Maybe it is playful time, childlike energy, laughter, or quiet with your pet. Whatever it is, it reminds you that you do not always have to hold it all together.</p>
<div class="day-meta">
<p><strong>Focus of the Day:</strong> Practice Ease in motion. Let peace lead you instead of force.</p>
<p><strong>Current in Focus:</strong> The Current of Ease</p>
<p><strong>Daily Non-Negotiables:</strong> Keep your routine light. Move gently, eat with presence, and allow rest when your body asks for it.</p>
</div>
<h3>Check-In</h3>
<ul>
<li>Where did I respond instead of react today?</li>
<li>Where did I choose peace over proving?</li>
<li>Who or what felt safe to lean on?</li>
</ul>
<p><strong>Journal Prompt:</strong> What does leaning look like for me when I stop trying to carry it all?</p>
<p><em>Ease is not giving up. It is knowing when to let life meet you halfway.</em></p>$$,
NULL, 7
FROM modules m JOIN courses c ON m.course_id = c.id
WHERE c.slug = '25-days-and-25-nights' AND m.position = 4;

-- DAY 8
INSERT INTO lessons (module_id, title, content, video_url, position)
SELECT m.id, 'Day 8',
$$<p>Intention is one of the most misunderstood words. People think it means wanting something or hoping it works out. It is not that. Intention is the decision behind your decision. It is the quiet "why" that shapes everything you do.</p>
<p>When you walk into a room, your intention gets there first. People feel it before you speak. When you start a task, your intention decides how it ends. If you do something out of fear, guilt, or pressure, the result carries that same energy. But when you act with clarity and purpose, everything aligns faster and feels lighter.</p>
<p>Science calls it coherence — when your thoughts, emotions, and actions move in the same direction. Your body responds. Your nervous system calms. Your focus sharpens. That is the power of clear intention.</p>
<p>Today, do not rush to say yes or no to anything. Pause first. Ask yourself, "What is my intention behind this?" Be honest. Sometimes it will reveal motives you did not notice before.</p>
<p>Intention is not about being perfect. It is about being aware enough to know when your energy is off and correcting it before it spreads.</p>
<div class="day-meta">
<p><strong>Focus of the Day:</strong> Move with purpose. Know why you do what you do.</p>
<p><strong>Current in Focus:</strong> The Current of Intention</p>
<p><strong>Daily Non-Negotiables:</strong> Do less but do it with meaning. Choose one action and give it your full focus. Notice how your energy feels before and after.</p>
</div>
<h3>Check-In</h3>
<ul>
<li>What did I give my full attention to today, and was it worth it?</li>
<li>Did I do anything just to please, prove, or avoid?</li>
<li>What felt aligned with my real goals, and what pulled me off track?</li>
<li>How did my body react when my intention was clear versus when it was unclear?</li>
</ul>
<p><strong>Journal Prompt:</strong> Where in my life am I acting out of habit instead of intention?</p>
<p><em>Intention is energy with direction. When you get it right, everything else starts to move on its own.</em></p>$$,
NULL, 8
FROM modules m JOIN courses c ON m.course_id = c.id
WHERE c.slug = '25-days-and-25-nights' AND m.position = 4;

-- DAY 9
INSERT INTO lessons (module_id, title, content, video_url, position)
SELECT m.id, 'Day 9',
$$<p>Energy is always moving. The question is whether it is moving through you or draining from you.</p>
<p>You know that tired feeling after helping everyone else, fixing their problems, or trying to keep the peace? That is not generosity. That is energy loss. Flow does not mean giving until you collapse. Flow means staying part of the circulation.</p>
<p>Even your body knows this law. Your heart pumps, your lungs exchange air, your cells trade oxygen for carbon dioxide. You are built to give and receive. When one part holds too much or gives too little, the system starts to break down.</p>
<p>Try this today: give something small that costs you nothing but attention, and receive something without apologizing for it. Do not explain it. Do not justify it. Just notice how it feels.</p>
<div class="day-meta">
<p><strong>Focus of the Day:</strong> Keep energy moving through giving and receiving.</p>
<p><strong>Current in Focus:</strong> The Current of Flowing Energy</p>
<p><strong>Daily Non-Negotiables:</strong> Give one thing with intention and receive one thing without guilt. Do not overextend. Do not overthink. Just notice the exchange.</p>
</div>
<h3>Check-In</h3>
<ul>
<li>What gave me energy today?</li>
<li>What drained me?</li>
<li>Did I allow anyone or anything to pour back into me?</li>
<li>Where did I try to control the flow instead of trusting it?</li>
</ul>
<p><strong>Journal Prompt:</strong> Where in my life am I holding too tightly to energy that needs to move?</p>
<p><em>Energy does not disappear. It transfers. Make sure it moves through you, not just out of you.</em></p>$$,
NULL, 9
FROM modules m JOIN courses c ON m.course_id = c.id
WHERE c.slug = '25-days-and-25-nights' AND m.position = 4;

-- DAY 10
INSERT INTO lessons (module_id, title, content, video_url, position)
SELECT m.id, 'Day 10',
$$<p>Purpose is the reason you act or exist. It's not something you find once and keep forever. It's something that calls you over and over until you finally listen.</p>
<p>Most people do not lose their purpose. They get talked out of it. They trade it for comfort, approval, or security. They start listening to the outside world more than their inner one, and before long, they call that survival.</p>
<p>But purpose does not disappear. It waits. It reappears in conversations that energize you, in frustrations that prompt you to make a change, or in ideas that will not leave you alone. Purpose will always try to bring you home to what matters most. The test is whether you will listen this time.</p>
<div class="day-meta">
<p><strong>Focus of the Day:</strong> Reconnecting to what drives you from within, not from outside noise.</p>
<p><strong>Current in Focus:</strong> The Current of Purpose</p>
<p><strong>Daily Non-Negotiables:</strong> Spend time with yourself. No distractions. Ask what keeps pulling at you. Listen before you plan. Then take one action that aligns with what feels right, even if it's small.</p>
</div>
<h3>Check-In</h3>
<ul>
<li>What do I keep circling back to, no matter how many times I stop?</li>
<li>Where have I ignored my own pull to stay comfortable or accepted?</li>
<li>When was the last time I felt truly alive, and what was I doing?</li>
<li>What truth keeps following me even when I try to walk away?</li>
</ul>
<p><strong>Journal Prompt:</strong> If I stopped listening to fear or opinion, what would I admit I'm meant to do?</p>
<p><em>Purpose is not hidden. It is simply waiting for you to get quiet enough to hear it again.</em></p>$$,
NULL, 10
FROM modules m JOIN courses c ON m.course_id = c.id
WHERE c.slug = '25-days-and-25-nights' AND m.position = 4;

-- DAY 11
INSERT INTO lessons (module_id, title, content, video_url, position)
SELECT m.id, 'Day 11',
$$<p>You have now moved through all seven Currents. You have sat in silence, learned to release, practiced ease, set intention, made choices, allowed flow, and touched purpose. That is real progress.</p>
<p>This is not a finish line. It is where awareness begins to show up without effort. Integration is when the work starts to live inside of you. You notice yourself reacting differently, thinking before speaking, or feeling calm where you used to tense up.</p>
<p>Change does not always feel dramatic. Sometimes it is just less noise in your head or more space in your day. Science says that every time you make a conscious decision, your brain creates a new pathway. The more you repeat it, the stronger it gets. You are rewiring.</p>
<div class="day-meta">
<p><strong>Focus of the Day:</strong> Notice what has shifted and what feels more natural now.</p>
<p><strong>Current in Focus:</strong> All Currents — Integration</p>
<p><strong>Daily Non-Negotiables:</strong> Stay consistent with your day. Pay attention to how you respond and what feels lighter than before.</p>
</div>
<h3>Check-In</h3>
<ul>
<li>What feels easier today than it used to?</li>
<li>Which Current comes most naturally to me?</li>
<li>What pattern keeps showing up?</li>
<li>How does my energy feel compared to when I started?</li>
</ul>
<p><strong>Journal Prompt:</strong> If I am more aware today than yesterday, what truth am I finally ready to accept?</p>
<p><em>Integration is not about effort. It is about awareness. You are already different. Let that be enough today.</em></p>$$,
NULL, 11
FROM modules m JOIN courses c ON m.course_id = c.id
WHERE c.slug = '25-days-and-25-nights' AND m.position = 4;

-- DAY 12: Rest Day 2
INSERT INTO lessons (module_id, title, content, video_url, position)
SELECT m.id, 'Day 12: Rest Day',
$$<p>You made it through another round. Your only assignment today is to rest.</p>
<p>Not productive rest. Not "I will rest after I finish this." Real rest. The kind where you let your brain float for a bit and your body catch up.</p>
<p>If you need permission, here it is. You can nap, stare at the ceiling, or do absolutely nothing that could ever be labeled as improvement. You have earned a day where nothing needs to make sense or move forward.</p>
<p>Think of it as a system update. You do not panic when your phone restarts. You wait, you breathe, and you trust it is loading something better. The same thing applies here.</p>
<p><strong>Mini Reminder:</strong> <em>Your peace is progress too.</em></p>$$,
NULL, 12
FROM modules m JOIN courses c ON m.course_id = c.id
WHERE c.slug = '25-days-and-25-nights' AND m.position = 4;

-- DAY 13
INSERT INTO lessons (module_id, title, content, video_url, position)
SELECT m.id, 'Day 13',
$$<p>You have already learned how to sit in silence. Now the real work is to keep your stillness when life starts moving again.</p>
<p>Stillness is not about hiding from noise. It is about staying centered while the world spins. It is what you bring into your morning meeting, your commute, your kitchen, and your conversations. When something goes wrong today, notice your reaction. You will feel the pull to respond fast, fix it, or defend yourself. That is where stillness gets tested. Choose to pause. The moment between reaction and response is where peace lives.</p>
<p>Stillness in motion looks like grace. It sounds like patience. It feels like quiet confidence. If the day feels heavy, take one deep breath and remind yourself you do not have to match the chaos. You are not the storm. You are the calm before it.</p>
<div class="day-meta">
<p><strong>Focus of the Day:</strong> Keep stillness steady even while life moves.</p>
<p><strong>Current in Focus:</strong> The Current of Stillness</p>
<p><strong>Daily Non-Negotiables:</strong> Move through your normal day with awareness. Notice your breathing, tone, and energy in every setting. Protect your peace like it is oxygen.</p>
</div>
<h3>Check-In</h3>
<ul>
<li>Where did I keep calm when I normally would not?</li>
<li>What helped me hold stillness in the middle of motion?</li>
<li>Who or what tried to pull me out of peace today?</li>
<li>What moment am I proud of for handling differently?</li>
</ul>
<p><strong>Journal Prompt:</strong> Where did I bring calm today instead of waiting to find it?</p>
<p><em>Stillness is not a break from life. It is how you live it.</em></p>$$,
NULL, 13
FROM modules m JOIN courses c ON m.course_id = c.id
WHERE c.slug = '25-days-and-25-nights' AND m.position = 4;

-- DAY 14
INSERT INTO lessons (module_id, title, content, video_url, position)
SELECT m.id, 'Day 14',
$$<p>By now you know intention is not a quote or a post-it note. It is not the thing you say before you do something. It is the reason behind what you do.</p>
<p>Living with intention means you stop moving on autopilot. You speak on purpose. You eat, rest, and even think with awareness of what you are feeding. Every small choice either adds peace or drains it.</p>
<p>Watch your mouth. Be mindful of the words you use, their meaning, and how they directly affect you. Words like "busy" often mean chaotic, not productive. Any word that works against your goals, even if it feels factual in the moment, is worth replacing.</p>
<p>Do not confuse busy with purposeful. One gets you tired. The other gets you results.</p>
<div class="day-meta">
<p><strong>Focus of the Day:</strong> Move and speak with purpose, not habit.</p>
<p><strong>Current in Focus:</strong> The Current of Intention</p>
<p><strong>Daily Non-Negotiables:</strong> Choose one area to practice awareness today. Pay close attention to your words and actions. Speak only what supports your direction.</p>
</div>
<h3>Check-In</h3>
<ul>
<li>What did I do today with full awareness?</li>
<li>What words shaped my energy?</li>
<li>What area still runs on autopilot?</li>
<li>Did I act and speak like the person I am becoming?</li>
</ul>
<p><strong>Journal Prompt:</strong> If every word and action builds my future, what am I building today?</p>
<p><em>Intention lives in what you do and what you say. Speak it, move it, and let it guide you forward.</em></p>$$,
NULL, 14
FROM modules m JOIN courses c ON m.course_id = c.id
WHERE c.slug = '25-days-and-25-nights' AND m.position = 4;

-- DAY 15
INSERT INTO lessons (module_id, title, content, video_url, position)
SELECT m.id, 'Day 15',
$$<p>Flow sounds easy until you realize how much you fight it. You have been taught to force things, chase people, and fix what is already breaking. That is not flow. That is exhaustion disguised as progress.</p>
<p>The Current of Flowing Energy teaches that giving and receiving must stay balanced. You cannot give what you do not have. You cannot receive what you are not open to.</p>
<p>Here is your practice: before you say yes, pause. Ask yourself if this will feed your peace or drain it. That one question can save you from a hundred tiny regrets. Energy moves like water. It finds the easiest path. When you hold too tightly, it slows. When you stay open, it flows.</p>
<div class="day-meta">
<p><strong>Focus of the Day:</strong> Let your energy move without forcing it.</p>
<p><strong>Current in Focus:</strong> The Current of Flowing Energy</p>
<p><strong>Daily Non-Negotiables:</strong> Pause before giving your time or attention. Choose one area where you will give less and receive more.</p>
</div>
<h3>Check-In</h3>
<ul>
<li>Where did I give my energy freely today?</li>
<li>What or who gave something back?</li>
<li>Where did I notice a leak?</li>
<li>What changed when I stopped forcing it?</li>
</ul>
<p><strong>Journal Prompt:</strong> Where does my energy flow easily and where does it feel stuck?</p>
<p><em>Flow will never chase you. It waits for you to stop swimming against yourself.</em></p>$$,
NULL, 15
FROM modules m JOIN courses c ON m.course_id = c.id
WHERE c.slug = '25-days-and-25-nights' AND m.position = 4;

-- DAY 16
INSERT INTO lessons (module_id, title, content, video_url, position)
SELECT m.id, 'Day 16',
$$<p>Letting go always sounds peaceful until it is your turn. This is where the work gets real.</p>
<p>Release is not just about walking away from people or things. It is about loosening your grip on the version of yourself that kept everything together. The one who said yes to too much. The one who thought control was safety. The one who believed peace meant silence instead of freedom.</p>
<p>When you practice release, you are not losing. You are trading. You trade force for flow. You trade control for trust. You trade fear for space.</p>
<p>Do not get caught in the story that everything needs closure. Some things end quietly because they are no longer meant to continue. That is your sign, not your failure.</p>
<div class="day-meta">
<p><strong>Focus of the Day:</strong> Trust the space that release creates.</p>
<p><strong>Current in Focus:</strong> The Current of Release</p>
<p><strong>Daily Non-Negotiables:</strong> Do not chase or fix today. Let things unfold naturally. Say less. Hold less.</p>
</div>
<h3>Check-In</h3>
<ul>
<li>What am I still holding that no longer fits?</li>
<li>What am I afraid will happen if I let go?</li>
<li>What space has opened because of release?</li>
<li>What peace came when I stopped forcing?</li>
</ul>
<p><strong>Journal Prompt:</strong> What would freedom look like if I stopped trying to control everything?</p>
<p><em>Release is not about loss. It is about trusting that what is meant for you will not need to be chased.</em></p>$$,
NULL, 16
FROM modules m JOIN courses c ON m.course_id = c.id
WHERE c.slug = '25-days-and-25-nights' AND m.position = 4;

-- DAY 17
INSERT INTO lessons (module_id, title, content, video_url, position)
SELECT m.id, 'Day 17',
$$<p>You have been learning, testing, and adjusting for more than two weeks now. Today is about paying attention to what sticks when life gets loud.</p>
<p>Alignment is not perfection. It is noticing when something feels off and fixing it before it grows roots. It is the moment you hear yourself saying something that does not sound like you anymore, and you stop mid-sentence. It is realizing peace is not found; it is maintained.</p>
<p>Most people lose alignment because they chase what looks good instead of what feels right. When you are aligned, you move different. You react slower, breathe deeper, and recover faster.</p>
<div class="day-meta">
<p><strong>Focus of the Day:</strong> Stay aware of what supports your peace and what pulls you from it.</p>
<p><strong>Current in Focus:</strong> All Currents — Alignment</p>
<p><strong>Daily Non-Negotiables:</strong> Move through your day with awareness. When something feels tense or forced, pause. Adjust before it becomes a spiral.</p>
</div>
<h3>Check-In</h3>
<ul>
<li>What threw me off today and how did I respond?</li>
<li>What helped me return to calm?</li>
<li>What no longer fits but I still try to hold?</li>
<li>What area of my life feels most aligned right now?</li>
</ul>
<p><strong>Journal Prompt:</strong> What does staying aligned look like in real time, not just in reflection?</p>
<p><em>Alignment is not a goal. It is how you live when you finally stop ignoring yourself.</em></p>$$,
NULL, 17
FROM modules m JOIN courses c ON m.course_id = c.id
WHERE c.slug = '25-days-and-25-nights' AND m.position = 4;

-- DAY 18: Rest Day 3
INSERT INTO lessons (module_id, title, content, video_url, position)
SELECT m.id, 'Day 18: Rest Day',
$$<p>You are in your third Rest Day. At this point, you might feel like you should be doing something. That's your mind trying to keep control. Don't listen.</p>
<p>Today is still about rest, but it is also about gentle awareness. Let your thoughts wander to what completion might look like for you. Day 25 is yours to design. What would feel like closure, celebration, or a new beginning? You do not need to plan it today. Just feel it out.</p>
<p>If you catch yourself overthinking, laugh a little. The old you would be scheduling the next ten steps. The new you knows rest has value. Growth does not need to be loud.</p>
<p>So rest. Let your body exhale. Let your mind dream. Let yourself think about what it will mean when you finish this — without pressure, just curiosity.</p>
<p><strong>Mini Reminder:</strong> <em>Rest is a reset. The plan for Day 25 will reveal itself when you are calm enough to hear it.</em></p>$$,
NULL, 18
FROM modules m JOIN courses c ON m.course_id = c.id
WHERE c.slug = '25-days-and-25-nights' AND m.position = 4;

-- DAY 19
INSERT INTO lessons (module_id, title, content, video_url, position)
SELECT m.id, 'Day 19',
$$<p>By now, you have seen what discipline and peace look like when they work together. Today is not about learning something new. It is about remembering why you started.</p>
<p>Purpose is not waiting for a sign or a title. It shows up in how you show up. It is in how you treat people, how you handle stress, and how you speak to yourself when no one is watching.</p>
<p>You may think purpose needs to be something grand or public. It doesn't. It is quiet most days. It is the decision to keep showing up for what matters, even when no one claps.</p>
<p>If you have ever wondered what your purpose is, look at what keeps finding you. The things, people, or ideas that never leave your mind are not random. They are reminders. Not everyone or everything that started with you will finish with you. Purpose filters your path so that what stays is strong enough to walk beside you.</p>
<div class="day-meta">
<p><strong>Focus of the Day:</strong> See purpose in what you already do.</p>
<p><strong>Current in Focus:</strong> The Current of Purpose</p>
<p><strong>Daily Non-Negotiables:</strong> Move through your day with attention. Notice where you naturally give your best energy and where you withdraw it. Both tell you something about purpose.</p>
</div>
<h3>Check-In</h3>
<ul>
<li>What gives my day meaning, even when it is hard?</li>
<li>What do I keep returning to, no matter how much I try to avoid it?</li>
<li>Where am I giving energy that no longer serves my direction?</li>
<li>What feels steady and natural when I do it?</li>
</ul>
<p><strong>Journal Prompt:</strong> If purpose is already in me, what part of my life proves it?</p>
<p><em>Purpose does not appear. It reveals itself when you stop looking for it and start living it.</em></p>$$,
NULL, 19
FROM modules m JOIN courses c ON m.course_id = c.id
WHERE c.slug = '25-days-and-25-nights' AND m.position = 4;

-- DAY 20
INSERT INTO lessons (module_id, title, content, video_url, position)
SELECT m.id, 'Day 20',
$$<p>Every choice you make shapes something. Your peace, your focus, your progress, or your delay. You do not need to overthink it, but you do need to stop pretending choices do not count.</p>
<p>The Current of Choice reminds you that nothing in life is neutral. You are always directing energy somewhere. You are either building what you say you want or staying stuck where it feels safe.</p>
<p>Choice is not about right or wrong. It is about awareness. The moment you act from awareness, life responds. You cannot speak about growth and still live in contradiction. You cannot ask for peace and keep entertaining chaos. Every choice you make reflects what you truly believe, not what you say you want.</p>
<p><strong>Reflection:</strong> Choice is not pressure. It is a privilege. The freedom to choose means the courage to live with what follows.</p>
<div class="day-meta">
<p><strong>Focus of the Day:</strong> Make choices from awareness, not reaction.</p>
<p><strong>Current in Focus:</strong> The Current of Choice</p>
<p><strong>Daily Non-Negotiables:</strong> Be intentional in three areas today: what you commit to, what you release, and how you speak to yourself.</p>
</div>
<h3>Check-In</h3>
<ul>
<li>What choice today supports who I am becoming?</li>
<li>What did I agree to that I already knew was a no?</li>
<li>How did my decisions affect my peace?</li>
<li>What small choice can I make differently tomorrow?</li>
</ul>
<p><strong>Journal Prompt:</strong> If every decision is a seed, what am I planting today?</p>
<p><em>Choice is not about perfection. It is about awareness. Keep choosing what matches your peace.</em></p>$$,
NULL, 20
FROM modules m JOIN courses c ON m.course_id = c.id
WHERE c.slug = '25-days-and-25-nights' AND m.position = 4;

-- DAY 21
INSERT INTO lessons (module_id, title, content, video_url, position)
SELECT m.id, 'Day 21',
$$<p>Ease is presence. It is the quiet rhythm of things working as they should. It is breath that comes naturally, energy that lasts, and clarity that no longer needs to be forced.</p>
<p>Ease shows up when you allow things to be simple. When you trust what you have built and stop interrupting what is already moving in your favor. Today is about letting that be enough. Move at a pace that feels natural. Let your body and mind agree on what effort looks like. Let life meet you halfway.</p>
<p>You have earned the right to be calm while everything still moves. That is not luck or timing. That is what happens when preparation and peace finally align.</p>
<p><strong>Reflection:</strong> Ease does not need to be justified. You are allowed to receive what flows smoothly without expecting struggle to follow.</p>
<div class="day-meta">
<p><strong>Focus of the Day:</strong> Allow life to move with you, not against you.</p>
<p><strong>Current in Focus:</strong> The Current of Ease</p>
<p><strong>Daily Non-Negotiables:</strong> Do your work, stay aware, but keep your energy steady. If something feels heavy, it is not for today.</p>
</div>
<h3>Check-In</h3>
<ul>
<li>What felt simple and natural today?</li>
<li>What flowed because I trusted it to?</li>
<li>Where did I interrupt my own peace?</li>
<li>What part of life is starting to feel lighter?</li>
</ul>
<p><strong>Journal Prompt:</strong> What does ease look like when I stop expecting it to end?</p>
<p><em>Ease is how alignment feels when you finally stop chasing what is already yours.</em></p>$$,
NULL, 21
FROM modules m JOIN courses c ON m.course_id = c.id
WHERE c.slug = '25-days-and-25-nights' AND m.position = 4;

-- DAY 22
INSERT INTO lessons (module_id, title, content, video_url, position)
SELECT m.id, 'Day 22',
$$<p>You have learned how to notice your energy. Now it is time to guide it.</p>
<p>Every thought, every word, and every small action carries direction. You are always sending energy somewhere — into a person, a project, a dream, or sometimes into worry. The more aware you become, the more powerful your direction gets.</p>
<p>When your energy moves with focus, life responds faster. You begin to attract what matches your pace, your words, and your habits. Pay attention to where your energy goes today. Who or what receives most of it? Energy that is scattered cannot be built. Energy that is guided cannot fail.</p>
<p><strong>Reflection:</strong> Every day, I decide where my energy flows. I choose peace when I stop feeding what drains me.</p>
<div class="day-meta">
<p><strong>Focus of the Day:</strong> Direct your energy toward what matters most.</p>
<p><strong>Current in Focus:</strong> The Current of Flowing Energy</p>
<p><strong>Daily Non-Negotiables:</strong> Stay mindful of your focus. If your energy starts to scatter, pause and bring it back to one clear priority.</p>
</div>
<h3>Check-In</h3>
<ul>
<li>What received most of my energy today?</li>
<li>Did I feel drained or fulfilled at the end of it?</li>
<li>What shifted when I focused my attention?</li>
<li>What deserves my energy tomorrow?</li>
</ul>
<p><strong>Journal Prompt:</strong> What would change if I treated my energy like a limited resource?</p>$$,
NULL, 22
FROM modules m JOIN courses c ON m.course_id = c.id
WHERE c.slug = '25-days-and-25-nights' AND m.position = 4;

-- DAY 23
INSERT INTO lessons (module_id, title, content, video_url, position)
SELECT m.id, 'Day 23',
$$<p>You are not trying to catch up anymore. You are here. The work is no longer separate from who you are becoming. You are responding to life instead of reacting to it.</p>
<p>Alignment is when your thoughts, actions, and energy match the life you say you want. It is not forced. It is not loud. It is natural. It is quiet confidence that does not need to explain itself.</p>
<p>Today is about noticing how much you have shifted. The way you protect your peace. The way you choose your responses. The habits that now feel normal instead of heavy. Growth is no longer something you chase. It is how you move.</p>
<p><strong>Reflection:</strong> I am not hoping to become aligned. I am already living it.</p>
<div class="day-meta">
<p><strong>Focus of the Day:</strong> Move like someone who trusts where they are going.</p>
<p><strong>Current in Focus:</strong> The Current of Alignment and Purpose</p>
<p><strong>Daily Non-Negotiables:</strong> Carry your peace into every decision. If something feels off, correct it immediately. No waiting. No ignoring.</p>
</div>
<h3>Check-In</h3>
<ul>
<li>What did I handle today with calm instead of urgency?</li>
<li>What habit feels natural that once felt difficult?</li>
<li>Where did I protect my energy without guilt?</li>
<li>What moment confirmed I have changed?</li>
</ul>
<p><strong>Journal Prompt:</strong> What truth about myself feels undeniable today?</p>
<p><em>You are no longer preparing for alignment. You are walking in it.</em></p>$$,
NULL, 23
FROM modules m JOIN courses c ON m.course_id = c.id
WHERE c.slug = '25-days-and-25-nights' AND m.position = 4;

-- DAY 24: Rest Day 4
INSERT INTO lessons (module_id, title, content, video_url, position)
SELECT m.id, 'Day 24: Rest Day',
$$<p>Rest is where everything locks in. It is not a break. It is where what you have been practicing finally matures.</p>
<p>Your mind, body, and spirit are doing work right now without effort. Healing is happening. Alignment is settling. Clarity is forming.</p>
<p>You do not need to think about anything. Today is not about doing. It is about allowing. Rest is not empty. It is intelligent. It is building strength in silence.</p>
<p><strong>Mini Reminder:</strong> <em>Nothing is paused. Everything is developing.</em></p>$$,
NULL, 24
FROM modules m JOIN courses c ON m.course_id = c.id
WHERE c.slug = '25-days-and-25-nights' AND m.position = 4;

-- DAY 25
INSERT INTO lessons (module_id, title, content, video_url, position)
SELECT m.id, 'Day 25',
$$<p>You made it. Not to the end but to the shift. Today is not about reflection. It is about expression. Everything you have learned, released, rebuilt, and reclaimed over these last 24 days now moves into action.</p>
<p>Today is yours. This is the day you do the thing you said you would do when you were ready. The risk you delayed. The idea you kept waiting for the right time. The conversation. The leap. The step forward.</p>
<p>It does not need to be loud. It just needs to be real. Aligned. Chosen. Fully lived. This is not a test. This is proof. Your life responds to movement.</p>
<p><strong>Your Only Task Today:</strong> Do the thing that belongs on the other side of your old self. Bucket list. Bold ask. Quiet commitment. Actual decision. It must be real.</p>
<p><strong>Reflection:</strong> I did not come this far to stay the same. Today I move like someone who knows my power is active.</p>
<p><em>Day 25 is not the finish line. It is the moment you finally step into what was already waiting for you.</em></p>$$,
NULL, 25
FROM modules m JOIN courses c ON m.course_id = c.id
WHERE c.slug = '25-days-and-25-nights' AND m.position = 4;
