-- Together Work for Module 6 faith-based supplementary lessons
-- Run after cie-lessons-mod6-faith.sql

UPDATE lessons SET together_work =
'<p>You both answered the faith_influence question in your profile. Now say it out loud to each other.</p>
<p>Take turns finishing this sentence: "In our business, faith shows up for me when..."</p>
<p>Then answer this one together: where does it feel absent right now, and does that bother either of you? Just name it. No fixing needed today.</p>'
WHERE module_id = 'b579bb90-abe5-4363-bb73-f12cfcd34ee9'
  AND position = 6;

UPDATE lessons SET together_work =
'<p>Read your covenant sentence to each other. The one you wrote at the end of this lesson.</p>
<p>If it feels true, say so. If it feels like something you are still working toward, say that instead. Both are honest. Both are useful.</p>
<p>Then put it somewhere you will both see it. Not framed on a wall unless that is you. Somewhere real. A note in your phone. A sticky on the bathroom mirror. Wherever "both of you will actually see it" actually means.</p>'
WHERE module_id = 'b579bb90-abe5-4363-bb73-f12cfcd34ee9'
  AND position = 7;
