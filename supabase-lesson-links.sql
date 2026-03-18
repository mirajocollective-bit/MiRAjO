-- Lesson hyperlinks: link "Current of the Day/Night/Focus" text in Module 4 days
-- to the corresponding Module 2 lesson via jumpToLesson(modulePos, lessonPos)
-- Run in Supabase SQL editor after supabase-mod4-lessons.sql

-- DAY 1: The Current of Stillness → Module 2, Lesson 1
UPDATE lessons SET content = replace(content,
  '<p><strong>Current of the Day:</strong> The Current of Stillness</p>',
  '<p><strong>Current of the Day:</strong> <a href="#" onclick="jumpToLesson(2,1); return false;" class="current-link">The Current of Stillness</a></p>'
)
WHERE position = 1
AND module_id = (SELECT m.id FROM modules m JOIN courses c ON m.course_id = c.id WHERE c.slug = '25-days-and-25-nights' AND m.position = 4);

-- DAY 2: The Current of Flowing Energy → Module 2, Lesson 2
UPDATE lessons SET content = replace(content,
  '<p><strong>Current of the Day:</strong> The Current of Flowing Energy</p>',
  '<p><strong>Current of the Day:</strong> <a href="#" onclick="jumpToLesson(2,2); return false;" class="current-link">The Current of Flowing Energy</a></p>'
)
WHERE position = 2
AND module_id = (SELECT m.id FROM modules m JOIN courses c ON m.course_id = c.id WHERE c.slug = '25-days-and-25-nights' AND m.position = 4);

-- DAY 3: The Current of Choice → Module 2, Lesson 3
UPDATE lessons SET content = replace(content,
  '<p><strong>Current of the Day:</strong> The Current of Choice</p>',
  '<p><strong>Current of the Day:</strong> <a href="#" onclick="jumpToLesson(2,3); return false;" class="current-link">The Current of Choice</a></p>'
)
WHERE position = 3
AND module_id = (SELECT m.id FROM modules m JOIN courses c ON m.course_id = c.id WHERE c.slug = '25-days-and-25-nights' AND m.position = 4);

-- DAY 4: The Current of Release → Module 2, Lesson 6
UPDATE lessons SET content = replace(content,
  '<p><strong>Current of the Day:</strong> The Current of Release</p>',
  '<p><strong>Current of the Day:</strong> <a href="#" onclick="jumpToLesson(2,6); return false;" class="current-link">The Current of Release</a></p>'
)
WHERE position = 4
AND module_id = (SELECT m.id FROM modules m JOIN courses c ON m.course_id = c.id WHERE c.slug = '25-days-and-25-nights' AND m.position = 4);

-- DAY 5: Currents in Focus (multiple) → link each individually
UPDATE lessons SET content = replace(content,
  '<p><strong>Currents in Focus:</strong> Stillness, Flowing Energy, Choice, Release</p>',
  '<p><strong>Currents in Focus:</strong> <a href="#" onclick="jumpToLesson(2,1); return false;" class="current-link">Stillness</a>, <a href="#" onclick="jumpToLesson(2,2); return false;" class="current-link">Flowing Energy</a>, <a href="#" onclick="jumpToLesson(2,3); return false;" class="current-link">Choice</a>, <a href="#" onclick="jumpToLesson(2,6); return false;" class="current-link">Release</a></p>'
)
WHERE position = 5
AND module_id = (SELECT m.id FROM modules m JOIN courses c ON m.course_id = c.id WHERE c.slug = '25-days-and-25-nights' AND m.position = 4);

-- DAY 7: The Current of Ease → Module 2, Lesson 4
UPDATE lessons SET content = replace(content,
  '<p><strong>Current in Focus:</strong> The Current of Ease</p>',
  '<p><strong>Current in Focus:</strong> <a href="#" onclick="jumpToLesson(2,4); return false;" class="current-link">The Current of Ease</a></p>'
)
WHERE position = 7
AND module_id = (SELECT m.id FROM modules m JOIN courses c ON m.course_id = c.id WHERE c.slug = '25-days-and-25-nights' AND m.position = 4);

-- DAY 8: The Current of Intention → Module 2, Lesson 5
UPDATE lessons SET content = replace(content,
  '<p><strong>Current in Focus:</strong> The Current of Intention</p>',
  '<p><strong>Current in Focus:</strong> <a href="#" onclick="jumpToLesson(2,5); return false;" class="current-link">The Current of Intention</a></p>'
)
WHERE position = 8
AND module_id = (SELECT m.id FROM modules m JOIN courses c ON m.course_id = c.id WHERE c.slug = '25-days-and-25-nights' AND m.position = 4);

-- DAY 9: The Current of Flowing Energy → Module 2, Lesson 2
UPDATE lessons SET content = replace(content,
  '<p><strong>Current in Focus:</strong> The Current of Flowing Energy</p>',
  '<p><strong>Current in Focus:</strong> <a href="#" onclick="jumpToLesson(2,2); return false;" class="current-link">The Current of Flowing Energy</a></p>'
)
WHERE position = 9
AND module_id = (SELECT m.id FROM modules m JOIN courses c ON m.course_id = c.id WHERE c.slug = '25-days-and-25-nights' AND m.position = 4);

-- DAY 10: The Current of Purpose → Module 2, Lesson 7
UPDATE lessons SET content = replace(content,
  '<p><strong>Current in Focus:</strong> The Current of Purpose</p>',
  '<p><strong>Current in Focus:</strong> <a href="#" onclick="jumpToLesson(2,7); return false;" class="current-link">The Current of Purpose</a></p>'
)
WHERE position = 10
AND module_id = (SELECT m.id FROM modules m JOIN courses c ON m.course_id = c.id WHERE c.slug = '25-days-and-25-nights' AND m.position = 4);

-- DAY 13: The Current of Stillness → Module 2, Lesson 1
UPDATE lessons SET content = replace(content,
  '<p><strong>Current in Focus:</strong> The Current of Stillness</p>',
  '<p><strong>Current in Focus:</strong> <a href="#" onclick="jumpToLesson(2,1); return false;" class="current-link">The Current of Stillness</a></p>'
)
WHERE position = 13
AND module_id = (SELECT m.id FROM modules m JOIN courses c ON m.course_id = c.id WHERE c.slug = '25-days-and-25-nights' AND m.position = 4);

-- DAY 14: The Current of Intention → Module 2, Lesson 5
UPDATE lessons SET content = replace(content,
  '<p><strong>Current in Focus:</strong> The Current of Intention</p>',
  '<p><strong>Current in Focus:</strong> <a href="#" onclick="jumpToLesson(2,5); return false;" class="current-link">The Current of Intention</a></p>'
)
WHERE position = 14
AND module_id = (SELECT m.id FROM modules m JOIN courses c ON m.course_id = c.id WHERE c.slug = '25-days-and-25-nights' AND m.position = 4);

-- DAY 15: The Current of Flowing Energy → Module 2, Lesson 2 (inline mention + focus line)
UPDATE lessons SET content = replace(
  replace(content,
    '<p><strong>Current in Focus:</strong> The Current of Flowing Energy</p>',
    '<p><strong>Current in Focus:</strong> <a href="#" onclick="jumpToLesson(2,2); return false;" class="current-link">The Current of Flowing Energy</a></p>'
  ),
  'The Current of Flowing Energy teaches that giving and receiving must stay balanced.',
  '<a href="#" onclick="jumpToLesson(2,2); return false;" class="current-link">The Current of Flowing Energy</a> teaches that giving and receiving must stay balanced.'
)
WHERE position = 15
AND module_id = (SELECT m.id FROM modules m JOIN courses c ON m.course_id = c.id WHERE c.slug = '25-days-and-25-nights' AND m.position = 4);

-- DAY 16: The Current of Release → Module 2, Lesson 6
UPDATE lessons SET content = replace(content,
  '<p><strong>Current in Focus:</strong> The Current of Release</p>',
  '<p><strong>Current in Focus:</strong> <a href="#" onclick="jumpToLesson(2,6); return false;" class="current-link">The Current of Release</a></p>'
)
WHERE position = 16
AND module_id = (SELECT m.id FROM modules m JOIN courses c ON m.course_id = c.id WHERE c.slug = '25-days-and-25-nights' AND m.position = 4);

-- DAY 19: The Current of Purpose → Module 2, Lesson 7
UPDATE lessons SET content = replace(content,
  '<p><strong>Current in Focus:</strong> The Current of Purpose</p>',
  '<p><strong>Current in Focus:</strong> <a href="#" onclick="jumpToLesson(2,7); return false;" class="current-link">The Current of Purpose</a></p>'
)
WHERE position = 19
AND module_id = (SELECT m.id FROM modules m JOIN courses c ON m.course_id = c.id WHERE c.slug = '25-days-and-25-nights' AND m.position = 4);

-- DAY 20: The Current of Choice → Module 2, Lesson 3 (inline mention + focus line)
UPDATE lessons SET content = replace(
  replace(content,
    '<p><strong>Current in Focus:</strong> The Current of Choice</p>',
    '<p><strong>Current in Focus:</strong> <a href="#" onclick="jumpToLesson(2,3); return false;" class="current-link">The Current of Choice</a></p>'
  ),
  'The Current of Choice reminds you that nothing in life is neutral.',
  '<a href="#" onclick="jumpToLesson(2,3); return false;" class="current-link">The Current of Choice</a> reminds you that nothing in life is neutral.'
)
WHERE position = 20
AND module_id = (SELECT m.id FROM modules m JOIN courses c ON m.course_id = c.id WHERE c.slug = '25-days-and-25-nights' AND m.position = 4);

-- DAY 21: The Current of Ease → Module 2, Lesson 4
UPDATE lessons SET content = replace(content,
  '<p><strong>Current in Focus:</strong> The Current of Ease</p>',
  '<p><strong>Current in Focus:</strong> <a href="#" onclick="jumpToLesson(2,4); return false;" class="current-link">The Current of Ease</a></p>'
)
WHERE position = 21
AND module_id = (SELECT m.id FROM modules m JOIN courses c ON m.course_id = c.id WHERE c.slug = '25-days-and-25-nights' AND m.position = 4);

-- DAY 22: The Current of Flowing Energy → Module 2, Lesson 2
UPDATE lessons SET content = replace(content,
  '<p><strong>Current in Focus:</strong> The Current of Flowing Energy</p>',
  '<p><strong>Current in Focus:</strong> <a href="#" onclick="jumpToLesson(2,2); return false;" class="current-link">The Current of Flowing Energy</a></p>'
)
WHERE position = 22
AND module_id = (SELECT m.id FROM modules m JOIN courses c ON m.course_id = c.id WHERE c.slug = '25-days-and-25-nights' AND m.position = 4);

-- DAY 23: The Current of Alignment and Purpose → Module 2, Lesson 7 (Purpose)
UPDATE lessons SET content = replace(content,
  '<p><strong>Current in Focus:</strong> The Current of Alignment and Purpose</p>',
  '<p><strong>Current in Focus:</strong> <a href="#" onclick="jumpToLesson(2,7); return false;" class="current-link">The Current of Alignment and Purpose</a></p>'
)
WHERE position = 23
AND module_id = (SELECT m.id FROM modules m JOIN courses c ON m.course_id = c.id WHERE c.slug = '25-days-and-25-nights' AND m.position = 4);
