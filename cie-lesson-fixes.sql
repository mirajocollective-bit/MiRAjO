-- CIE Lesson 1 content fixes
-- 1. "The diagnostic is next" → "comes at the end of this module"
-- 2. "Each of you: take 60 seconds" → solo framing (they're reading privately)

UPDATE lessons
SET content = REPLACE(
  REPLACE(
    content,
    '<p>The diagnostic is next. Take it privately. Be honest. Your partner will not see your individual answers — only the shared picture they create together.</p>',
    '<p>The diagnostic comes at the end of this module. Take it privately. Be honest. Your partner will not see your individual answers — only the shared picture they create together.</p>'
  ),
  '<p>Each of you: take 60 seconds and write down one thing you are hoping to walk away from this course with. Do not share it with each other yet. Hold it. You will come back to it.</p>',
  '<p>Write down one thing you are hoping to walk away from this course with. Do not share it yet. Hold it. You will come back to it.</p>'
)
WHERE module_id = '7da97dc1-3004-4072-bc19-009482600d36'
  AND position = 1;
