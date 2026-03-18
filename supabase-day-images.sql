-- Day opening quotes: white text on dark purple "screen" box
-- Run all steps in order in Supabase SQL editor

-- DAY 1
-- Step 1: remove previous cursive quote block from top
UPDATE lessons SET content = replace(content,
$$<div style="text-align:center;padding:32px 24px 24px;margin-bottom:8px;border-bottom:1px solid rgba(196,162,69,0.2)">
  <p style="font-family:'Dancing Script',cursive;font-size:26px;color:#C4A245;line-height:1.7;margin:0;max-width:480px;display:inline-block">You only needed to begin, and you did. Stay here. Stay present. Let today count all by itself.</p>
</div>$$,
  ''
)
WHERE position = 1
AND module_id = (SELECT m.id FROM modules m JOIN courses c ON m.course_id = c.id WHERE c.slug = '25-days-and-25-nights' AND m.position = 4);

-- Step 2: remove closing note from bottom (both italic and plain variations)
UPDATE lessons SET content = replace(content,
  '<p><em>You only needed to begin, and you did. Stay here. Stay present. Let today count all by itself.</em></p>',
  ''
)
WHERE position = 1
AND module_id = (SELECT m.id FROM modules m JOIN courses c ON m.course_id = c.id WHERE c.slug = '25-days-and-25-nights' AND m.position = 4);

UPDATE lessons SET content = replace(content,
  'You only needed to begin, and you did. Stay here. Stay present. Let today count all by itself.',
  ''
)
WHERE position = 1
AND module_id = (SELECT m.id FROM modules m JOIN courses c ON m.course_id = c.id WHERE c.slug = '25-days-and-25-nights' AND m.position = 4);

-- Step 3: prepend the screen-style quote box
UPDATE lessons SET content =
$$<div style="background:#1a0a2e;border-radius:14px;padding:40px 36px;margin-bottom:32px;text-align:center;border:1px solid rgba(255,255,255,0.08);box-shadow:0 0 40px rgba(90,63,154,0.3),inset 0 1px 0 rgba(255,255,255,0.05)">
  <p style="font-family:'Dancing Script',cursive;font-size:32px;color:#ffffff;line-height:1.75;margin:0;max-width:500px;display:inline-block">"You only needed to begin, and you did. Stay here. Stay present. Let today count all by itself."</p>
</div>$$ || content
WHERE position = 1
AND module_id = (SELECT m.id FROM modules m JOIN courses c ON m.course_id = c.id WHERE c.slug = '25-days-and-25-nights' AND m.position = 4);
