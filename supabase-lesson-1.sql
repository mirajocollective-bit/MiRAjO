-- Insert Module 1
INSERT INTO modules (course_id, title, position)
VALUES (
  (SELECT id FROM courses WHERE slug = '25-days-and-25-nights'),
  'Welcome to Your Journey',
  1
);

-- Insert Welcome Lesson
INSERT INTO lessons (module_id, title, content, video_url, position)
VALUES (
  (SELECT id FROM modules WHERE title = 'Welcome to Your Journey'),
  'Welcome — A New Definition of You',
  '<p>This program is the container for a single, profound truth: <strong>transformation is never easy, but it is always worth it.</strong></p>

<h3>The Transformation That Awaits</h3>

<p>Before we ask for a moment of your time, know what awaits on the other side of this journey.</p>

<p>By the second week, you will begin to feel stronger, clearer, and more focused. By the third week, you will notice deep changes in how you respond to challenges. Where you once reacted, you will now choose.</p>

<p>You will begin to experience revelation. Insights will come in silence, answers will surface that you were not chasing, and the words you speak will start to carry weight. As you align, your words will move from empty talk to creative force. <em>The things you say will begin to become tangible.</em></p>

<p>These 25 days and 25 nights are not only about discipline. They are about positioning yourself. By living these days fully, you are sending a signal to the universe: <strong>I am ready. I am open. I will receive.</strong></p>

<blockquote>The real transformation is not in what you do. It is in who you decide to become while you are doing it.</blockquote>

<h3>A Note from Miranda</h3>

<p>I am Miranda Johnson, and I am simply Miranda.</p>

<p>For years, I believed the titles and opinions others gave me. That was the real battle — not the opinions, but how quickly I accepted someone else''s version of me.</p>

<p>As you move through your 25 Days and 25 Nights, you will hear your own set of stories. Some are so familiar that you might even defend them. Where do you find the good? The truth that actually belongs to you?</p>

<p>I am a woman to be admired — not because I never fall, but because I go in to come out every single time. <strong>This program is for anyone ready to stop borrowing other people''s opinions and start remembering their own truth.</strong></p>

<h3>Your 10% Investment</h3>

<p>This program is about alignment — alignment with your body, your mind, your spirit, and with the natural laws that govern true success. If you commit and stay the course, the success you desire must come, because these are nature''s laws.</p>

<p>Most of us give energy away all day and then wonder why we feel empty. For the next 25 days you will pay yourself back first. You will give yourself 10 percent of every day. That is a fixed investment of <strong>2 hours and 40 minutes.</strong></p>

<p>For 25 days, this becomes the foundation of your life. Everything else will adjust around it.</p>

<blockquote>You already give more than this away to people, distractions, and work that drains you. For the next 25 days, you are simply giving that energy back to yourself.</blockquote>

<h3>Your Daily Blueprint</h3>

<ul>
  <li><strong>Movement — 90 minutes</strong> spread across 3 sessions</li>
  <li><strong>Meditation — 60 minutes</strong> morning and evening</li>
  <li><strong>Flexibility & Strength — 35 minutes</strong> yoga, stretching, and strength training</li>
  <li><strong>Journaling & Reflection — 10 to 15 minutes</strong></li>
</ul>

<h3>Your Daily Focus</h3>

<ul>
  <li>Commit to the <strong>10 Non-Negotiables</strong> — your daily disciplines</li>
  <li>Reflect on one of the <strong>7 Currents of Nature''s Law</strong> — your guiding philosophy</li>
  <li>Capture your reflections in a journal — writing, voice, or video</li>
</ul>

<p>Over the next 25 days you will push your limits, face resistance, and experience emotions you may not expect. You will laugh, you may cry, you may feel anger or even want to disconnect. <strong>This is normal. The resistance is part of the process.</strong></p>

<p style="font-size:18px;font-weight:600;color:#3D2B72;margin-top:32px;">This is your decision point. Commit to yourself now. Let''s begin.</p>',
  'https://youtu.be/jTzOpLabqHk',
  1
);
