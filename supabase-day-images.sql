-- Day opening quotes: personal note at top in cursive, no day number
-- Run in Supabase SQL editor

-- DAY 1
-- Step 1: remove previous card if added
UPDATE lessons SET content = replace(content,
$$<div style="background:linear-gradient(135deg,#122012,#1E4226);border-radius:16px;padding:44px 36px;margin-bottom:36px;text-align:center;border:1px solid rgba(196,162,69,0.25)">
  <div style="font-family:'Instrument Serif',serif;font-size:56px;color:#C4A245;line-height:1;margin-bottom:16px;letter-spacing:-1px">Day 1</div>
  <div style="width:48px;height:1px;background:#C4A245;margin:0 auto 20px;opacity:0.5"></div>
  <div style="font-family:'Plus Jakarta Sans',sans-serif;font-size:16px;color:rgba(242,235,217,0.85);font-style:italic;line-height:1.8;max-width:380px;margin:0 auto">You only needed to begin, and you did. Stay here. Stay present. Let today count all by itself.</div>
</div>$$,
  ''
)
WHERE position = 1
AND module_id = (SELECT m.id FROM modules m JOIN courses c ON m.course_id = c.id WHERE c.slug = '25-days-and-25-nights' AND m.position = 4);

-- Step 2: prepend the cursive opening note
UPDATE lessons SET content =
$$<div style="text-align:center;padding:32px 24px 24px;margin-bottom:8px;border-bottom:1px solid rgba(196,162,69,0.2)">
  <p style="font-family:'Dancing Script',cursive;font-size:26px;color:#C4A245;line-height:1.7;margin:0;max-width:480px;display:inline-block">You only needed to begin, and you did. Stay here. Stay present. Let today count all by itself.</p>
</div>$$ || content
WHERE position = 1
AND module_id = (SELECT m.id FROM modules m JOIN courses c ON m.course_id = c.id WHERE c.slug = '25-days-and-25-nights' AND m.position = 4);
