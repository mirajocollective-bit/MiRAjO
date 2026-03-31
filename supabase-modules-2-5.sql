-- Run this first: Insert Modules 2, 3, 4, 5
-- Make sure the 25-days-and-25-nights course already exists before running

INSERT INTO modules (course_id, title, position)
SELECT id, 'Resources', 2 FROM courses WHERE slug = '25-days-and-25-nights';

INSERT INTO modules (course_id, title, position)
SELECT id, 'Before You Begin', 3 FROM courses WHERE slug = '25-days-and-25-nights';

INSERT INTO modules (course_id, title, position)
SELECT id, 'Your 25 Days and 25 Nights', 4 FROM courses WHERE slug = '25-days-and-25-nights';

INSERT INTO modules (course_id, title, position)
SELECT id, 'You''ve Earned This!', 5 FROM courses WHERE slug = '25-days-and-25-nights';
