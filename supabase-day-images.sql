-- Day hero cards: branded card with day number + personal note
-- Replaces the old image approach
-- Run in Supabase SQL editor one day at a time as you approve each

-- DAY 1
-- Step 1: remove old image tag if it was added
UPDATE lessons SET content = replace(content,
  '<img src="/img/day-1.png" alt="Day 1" style="width:100%;border-radius:12px;margin-bottom:28px;display:block;">',
  ''
)
WHERE position = 1
AND module_id = (SELECT m.id FROM modules m JOIN courses c ON m.course_id = c.id WHERE c.slug = '25-days-and-25-nights' AND m.position = 4);

-- Step 2: remove closing note from bottom (it moves into the card)
UPDATE lessons SET content = replace(content,
  '<p><em>You only needed to begin, and you did. Stay here. Stay present. Let today count all by itself.</em></p>',
  ''
)
WHERE position = 1
AND module_id = (SELECT m.id FROM modules m JOIN courses c ON m.course_id = c.id WHERE c.slug = '25-days-and-25-nights' AND m.position = 4);

-- Step 3: prepend the hero card
UPDATE lessons SET content =
$$<div style="background:linear-gradient(135deg,#122012,#1E4226);border-radius:16px;padding:44px 36px;margin-bottom:36px;text-align:center;border:1px solid rgba(196,162,69,0.25)">
  <div style="font-family:'Instrument Serif',serif;font-size:56px;color:#C4A245;line-height:1;margin-bottom:16px;letter-spacing:-1px">Day 1</div>
  <div style="width:48px;height:1px;background:#C4A245;margin:0 auto 20px;opacity:0.5"></div>
  <div style="font-family:'Plus Jakarta Sans',sans-serif;font-size:16px;color:rgba(242,235,217,0.85);font-style:italic;line-height:1.8;max-width:380px;margin:0 auto">You only needed to begin, and you did. Stay here. Stay present. Let today count all by itself.</div>
</div>$$ || content
WHERE position = 1
AND module_id = (SELECT m.id FROM modules m JOIN courses c ON m.course_id = c.id WHERE c.slug = '25-days-and-25-nights' AND m.position = 4);
