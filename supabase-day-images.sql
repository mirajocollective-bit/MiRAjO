-- Day images: prepend hero image to each day lesson
-- Run in Supabase SQL editor as images are added

-- DAY 1
UPDATE lessons SET content = '<img src="/img/day-1.png" alt="Day 1" style="width:100%;border-radius:12px;margin-bottom:28px;display:block;">' || content
WHERE position = 1
AND module_id = (SELECT m.id FROM modules m JOIN courses c ON m.course_id = c.id WHERE c.slug = '25-days-and-25-nights' AND m.position = 4);
