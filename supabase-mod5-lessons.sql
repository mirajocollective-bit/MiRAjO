-- Module 5: You've Earned This! — 1 lesson (Day 26 wrap-up)
-- Run AFTER supabase-modules-2-5.sql

INSERT INTO lessons (module_id, title, content, video_url, position)
SELECT m.id, 'Day 26: The Doorway to the Rest of Your Life',
$$<p>Picture this. You have just crossed the finish line. Day 25 is done. You held your commitment. You faced yourself in ways most people never do. And now it is tomorrow. Day 26.</p>
<p>These last 25 days and nights have built something inside you that cannot be undone. It takes 21 days to build a habit, and you just gave yourself 25. You are standing on a foundation that is already stronger than you think. You are not the same person who began. Do not live as if you are.</p>
<h3>Your Four New Commitments</h3>
<h4>1. Prepare for Old Habits to Call You</h4>
<p>Old patterns will call. The foods, the distractions, the reactions, even people from your old ways of being. Do not be surprised. Expect it. Prepare for it. Returning to those habits quickly can even make you feel unwell — that is your body telling you it has changed.</p>
<h4>2. Choose What Stays and What Goes</h4>
<p>You may need to release a friendship that no longer aligns. If you found clarity about a career move, prepare your first step now. Write a list before Day 25 ends — one column for what stays, one for what goes, one for what you will limit, one for what you will expand.</p>
<h4>3. Prepare for Breaks and Recommitment</h4>
<p>It is okay to take a break. You are human. But a break must be short. Wait too long, and you will create another 21-day habit, one that may not serve you. Plan your next reset before Day 25 ends. If you take a break, you already know when you are coming back.</p>
<h4>4. Establish a New Standard</h4>
<p>The 25 days and nights showed you what you are capable of. Now it becomes your new standard.</p>
<ul>
<li>Identify one Non-Negotiable you will keep every day, no matter what.</li>
<li>Choose one Current to focus on for the next month.</li>
<li>Keep your journal going. Even if you cut back the time, do not silence your reflection.</li>
</ul>
<p>Day 25 was the finish line of the challenge. Day 26 is the doorway to the rest of your life. You've Got This!</p>$$,
'https://youtu.be/ludyTHKjf9A', 1
FROM modules m JOIN courses c ON m.course_id = c.id
WHERE c.slug = '25-days-and-25-nights' AND m.position = 5;
