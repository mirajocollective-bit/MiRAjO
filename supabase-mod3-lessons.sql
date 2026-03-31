-- Module 3: Before You Begin — 1 lesson
-- Run AFTER supabase-modules-2-5.sql

INSERT INTO lessons (module_id, title, content, video_url, position)
SELECT m.id, 'Your Starting Point',
$$<p>This is your starting point. Before you begin Day 1, pause to recognize that this moment matters.</p>
<h3>Your Three Starting Actions</h3>
<ol>
<li><strong>What is today's date?</strong> Write it down and hold it. This is the day you chose to show up for yourself.</li>
<li><strong>What intention are you setting for these 25 days?</strong> Be specific. Not "I want to feel better" — what do you actually want to walk away with?</li>
<li><strong>Upload a photo or short personal note that represents your beginning.</strong> It could be a picture of yourself, a place, a symbol, or something that holds meaning right now.</li>
</ol>
<p>Say this out loud before you continue:</p>
<blockquote><em>"I am ready to show up for myself for the next 25 days."</em></blockquote>
<p>How does that feel to say?</p>$$,
NULL, 1
FROM modules m JOIN courses c ON m.course_id = c.id
WHERE c.slug = '25-days-and-25-nights' AND m.position = 3;
