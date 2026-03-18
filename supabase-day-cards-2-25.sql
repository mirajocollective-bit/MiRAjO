-- DAY QUOTE CARDS — Days 2–25
-- Day 1 already done. Run each day's two steps in order.
-- Colors: purple #1a0a2e (regular) | navy #0a1628 (rest days) | green gradient (Day 25)

-- ═══ DAY 2 ═══
UPDATE lessons SET content = replace(content,
  '<p><em>Awareness is strength. Every time you notice the noise, you weaken its hold. You are learning to see clearly again.</em></p>', '')
WHERE position = 2 AND module_id = (SELECT m.id FROM modules m JOIN courses c ON m.course_id = c.id WHERE c.slug = '25-days-and-25-nights' AND m.position = 4);

UPDATE lessons SET content = $$<div style="background:#1a0a2e;border-radius:14px;padding:40px 36px;margin-bottom:32px;text-align:center;border:1px solid rgba(255,255,255,0.08);box-shadow:0 0 40px rgba(90,63,154,0.3),inset 0 1px 0 rgba(255,255,255,0.05)"><p style="font-family:'Playfair Display',serif;font-style:italic;font-size:32px;color:#ffffff;line-height:1.75;margin:0;max-width:520px;display:inline-block">"Awareness is strength. Every time you notice the noise, you weaken its hold. You are learning to see clearly again."</p></div>$$ || content
WHERE position = 2 AND module_id = (SELECT m.id FROM modules m JOIN courses c ON m.course_id = c.id WHERE c.slug = '25-days-and-25-nights' AND m.position = 4);

-- ═══ DAY 3 ═══
UPDATE lessons SET content = replace(content,
  '<p><em>You are not your judgments. You are the one noticing them. Awareness is what creates freedom.</em></p>', '')
WHERE position = 3 AND module_id = (SELECT m.id FROM modules m JOIN courses c ON m.course_id = c.id WHERE c.slug = '25-days-and-25-nights' AND m.position = 4);

UPDATE lessons SET content = $$<div style="background:#1a0a2e;border-radius:14px;padding:40px 36px;margin-bottom:32px;text-align:center;border:1px solid rgba(255,255,255,0.08);box-shadow:0 0 40px rgba(90,63,154,0.3),inset 0 1px 0 rgba(255,255,255,0.05)"><p style="font-family:'Playfair Display',serif;font-style:italic;font-size:32px;color:#ffffff;line-height:1.75;margin:0;max-width:520px;display:inline-block">"You are not your judgments. You are the one noticing them. Awareness is what creates freedom."</p></div>$$ || content
WHERE position = 3 AND module_id = (SELECT m.id FROM modules m JOIN courses c ON m.course_id = c.id WHERE c.slug = '25-days-and-25-nights' AND m.position = 4);

-- ═══ DAY 4 ═══
UPDATE lessons SET content = replace(content,
  '<p><em>Peace starts when nothing owns you. Let today be the day you begin to live light.</em></p>', '')
WHERE position = 4 AND module_id = (SELECT m.id FROM modules m JOIN courses c ON m.course_id = c.id WHERE c.slug = '25-days-and-25-nights' AND m.position = 4);

UPDATE lessons SET content = $$<div style="background:#1a0a2e;border-radius:14px;padding:40px 36px;margin-bottom:32px;text-align:center;border:1px solid rgba(255,255,255,0.08);box-shadow:0 0 40px rgba(90,63,154,0.3),inset 0 1px 0 rgba(255,255,255,0.05)"><p style="font-family:'Playfair Display',serif;font-style:italic;font-size:32px;color:#ffffff;line-height:1.75;margin:0;max-width:520px;display:inline-block">"Peace starts when nothing owns you. Let today be the day you begin to live light."</p></div>$$ || content
WHERE position = 4 AND module_id = (SELECT m.id FROM modules m JOIN courses c ON m.course_id = c.id WHERE c.slug = '25-days-and-25-nights' AND m.position = 4);

-- ═══ DAY 5 (no closing note — using line from content) ═══
UPDATE lessons SET content = $$<div style="background:#1a0a2e;border-radius:14px;padding:40px 36px;margin-bottom:32px;text-align:center;border:1px solid rgba(255,255,255,0.08);box-shadow:0 0 40px rgba(90,63,154,0.3),inset 0 1px 0 rgba(255,255,255,0.05)"><p style="font-family:'Playfair Display',serif;font-style:italic;font-size:32px;color:#ffffff;line-height:1.75;margin:0;max-width:520px;display:inline-block">"This is your shake-it-off moment. Let this reflection prepare you for what comes next."</p></div>$$ || content
WHERE position = 5 AND module_id = (SELECT m.id FROM modules m JOIN courses c ON m.course_id = c.id WHERE c.slug = '25-days-and-25-nights' AND m.position = 4);

-- ═══ DAY 6 — REST (navy) ═══
UPDATE lessons SET content = replace(content,
  '<p><em>See you tomorrow.</em></p>', '')
WHERE position = 6 AND module_id = (SELECT m.id FROM modules m JOIN courses c ON m.course_id = c.id WHERE c.slug = '25-days-and-25-nights' AND m.position = 4);

UPDATE lessons SET content = $$<div style="background:#0a1628;border-radius:14px;padding:40px 36px;margin-bottom:32px;text-align:center;border:1px solid rgba(255,255,255,0.08);box-shadow:0 0 40px rgba(10,50,100,0.3),inset 0 1px 0 rgba(255,255,255,0.05)"><p style="font-family:'Playfair Display',serif;font-style:italic;font-size:32px;color:#ffffff;line-height:1.75;margin:0;max-width:520px;display:inline-block">"See you tomorrow."</p></div>$$ || content
WHERE position = 6 AND module_id = (SELECT m.id FROM modules m JOIN courses c ON m.course_id = c.id WHERE c.slug = '25-days-and-25-nights' AND m.position = 4);

-- ═══ DAY 7 ═══
UPDATE lessons SET content = replace(content,
  '<p><em>Ease is not giving up. It is knowing when to let life meet you halfway.</em></p>', '')
WHERE position = 7 AND module_id = (SELECT m.id FROM modules m JOIN courses c ON m.course_id = c.id WHERE c.slug = '25-days-and-25-nights' AND m.position = 4);

UPDATE lessons SET content = $$<div style="background:#1a0a2e;border-radius:14px;padding:40px 36px;margin-bottom:32px;text-align:center;border:1px solid rgba(255,255,255,0.08);box-shadow:0 0 40px rgba(90,63,154,0.3),inset 0 1px 0 rgba(255,255,255,0.05)"><p style="font-family:'Playfair Display',serif;font-style:italic;font-size:32px;color:#ffffff;line-height:1.75;margin:0;max-width:520px;display:inline-block">"Ease is not giving up. It is knowing when to let life meet you halfway."</p></div>$$ || content
WHERE position = 7 AND module_id = (SELECT m.id FROM modules m JOIN courses c ON m.course_id = c.id WHERE c.slug = '25-days-and-25-nights' AND m.position = 4);

-- ═══ DAY 8 ═══
UPDATE lessons SET content = replace(content,
  '<p><em>Intention is energy with direction. When you get it right, everything else starts to move on its own.</em></p>', '')
WHERE position = 8 AND module_id = (SELECT m.id FROM modules m JOIN courses c ON m.course_id = c.id WHERE c.slug = '25-days-and-25-nights' AND m.position = 4);

UPDATE lessons SET content = $$<div style="background:#1a0a2e;border-radius:14px;padding:40px 36px;margin-bottom:32px;text-align:center;border:1px solid rgba(255,255,255,0.08);box-shadow:0 0 40px rgba(90,63,154,0.3),inset 0 1px 0 rgba(255,255,255,0.05)"><p style="font-family:'Playfair Display',serif;font-style:italic;font-size:32px;color:#ffffff;line-height:1.75;margin:0;max-width:520px;display:inline-block">"Intention is energy with direction. When you get it right, everything else starts to move on its own."</p></div>$$ || content
WHERE position = 8 AND module_id = (SELECT m.id FROM modules m JOIN courses c ON m.course_id = c.id WHERE c.slug = '25-days-and-25-nights' AND m.position = 4);

-- ═══ DAY 9 ═══
UPDATE lessons SET content = replace(content,
  '<p><em>Energy does not disappear. It transfers. Make sure it moves through you, not just out of you.</em></p>', '')
WHERE position = 9 AND module_id = (SELECT m.id FROM modules m JOIN courses c ON m.course_id = c.id WHERE c.slug = '25-days-and-25-nights' AND m.position = 4);

UPDATE lessons SET content = $$<div style="background:#1a0a2e;border-radius:14px;padding:40px 36px;margin-bottom:32px;text-align:center;border:1px solid rgba(255,255,255,0.08);box-shadow:0 0 40px rgba(90,63,154,0.3),inset 0 1px 0 rgba(255,255,255,0.05)"><p style="font-family:'Playfair Display',serif;font-style:italic;font-size:32px;color:#ffffff;line-height:1.75;margin:0;max-width:520px;display:inline-block">"Energy does not disappear. It transfers. Make sure it moves through you, not just out of you."</p></div>$$ || content
WHERE position = 9 AND module_id = (SELECT m.id FROM modules m JOIN courses c ON m.course_id = c.id WHERE c.slug = '25-days-and-25-nights' AND m.position = 4);

-- ═══ DAY 10 ═══
UPDATE lessons SET content = replace(content,
  '<p><em>Purpose is not hidden. It is simply waiting for you to get quiet enough to hear it again.</em></p>', '')
WHERE position = 10 AND module_id = (SELECT m.id FROM modules m JOIN courses c ON m.course_id = c.id WHERE c.slug = '25-days-and-25-nights' AND m.position = 4);

UPDATE lessons SET content = $$<div style="background:#1a0a2e;border-radius:14px;padding:40px 36px;margin-bottom:32px;text-align:center;border:1px solid rgba(255,255,255,0.08);box-shadow:0 0 40px rgba(90,63,154,0.3),inset 0 1px 0 rgba(255,255,255,0.05)"><p style="font-family:'Playfair Display',serif;font-style:italic;font-size:32px;color:#ffffff;line-height:1.75;margin:0;max-width:520px;display:inline-block">"Purpose is not hidden. It is simply waiting for you to get quiet enough to hear it again."</p></div>$$ || content
WHERE position = 10 AND module_id = (SELECT m.id FROM modules m JOIN courses c ON m.course_id = c.id WHERE c.slug = '25-days-and-25-nights' AND m.position = 4);

-- ═══ DAY 11 ═══
UPDATE lessons SET content = replace(content,
  '<p><em>Integration is not about effort. It is about awareness. You are already different. Let that be enough today.</em></p>', '')
WHERE position = 11 AND module_id = (SELECT m.id FROM modules m JOIN courses c ON m.course_id = c.id WHERE c.slug = '25-days-and-25-nights' AND m.position = 4);

UPDATE lessons SET content = $$<div style="background:#1a0a2e;border-radius:14px;padding:40px 36px;margin-bottom:32px;text-align:center;border:1px solid rgba(255,255,255,0.08);box-shadow:0 0 40px rgba(90,63,154,0.3),inset 0 1px 0 rgba(255,255,255,0.05)"><p style="font-family:'Playfair Display',serif;font-style:italic;font-size:32px;color:#ffffff;line-height:1.75;margin:0;max-width:520px;display:inline-block">"Integration is not about effort. It is about awareness. You are already different. Let that be enough today."</p></div>$$ || content
WHERE position = 11 AND module_id = (SELECT m.id FROM modules m JOIN courses c ON m.course_id = c.id WHERE c.slug = '25-days-and-25-nights' AND m.position = 4);

-- ═══ DAY 12 — REST (navy) ═══
UPDATE lessons SET content = replace(content,
  '<p><strong>Mini Reminder:</strong> <em>Your peace is progress too.</em></p>', '')
WHERE position = 12 AND module_id = (SELECT m.id FROM modules m JOIN courses c ON m.course_id = c.id WHERE c.slug = '25-days-and-25-nights' AND m.position = 4);

UPDATE lessons SET content = $$<div style="background:#0a1628;border-radius:14px;padding:40px 36px;margin-bottom:32px;text-align:center;border:1px solid rgba(255,255,255,0.08);box-shadow:0 0 40px rgba(10,50,100,0.3),inset 0 1px 0 rgba(255,255,255,0.05)"><p style="font-family:'Playfair Display',serif;font-style:italic;font-size:32px;color:#ffffff;line-height:1.75;margin:0;max-width:520px;display:inline-block">"Your peace is progress too."</p></div>$$ || content
WHERE position = 12 AND module_id = (SELECT m.id FROM modules m JOIN courses c ON m.course_id = c.id WHERE c.slug = '25-days-and-25-nights' AND m.position = 4);

-- ═══ DAY 13 ═══
UPDATE lessons SET content = replace(content,
  '<p><em>Stillness is not a break from life. It is how you live it.</em></p>', '')
WHERE position = 13 AND module_id = (SELECT m.id FROM modules m JOIN courses c ON m.course_id = c.id WHERE c.slug = '25-days-and-25-nights' AND m.position = 4);

UPDATE lessons SET content = $$<div style="background:#1a0a2e;border-radius:14px;padding:40px 36px;margin-bottom:32px;text-align:center;border:1px solid rgba(255,255,255,0.08);box-shadow:0 0 40px rgba(90,63,154,0.3),inset 0 1px 0 rgba(255,255,255,0.05)"><p style="font-family:'Playfair Display',serif;font-style:italic;font-size:32px;color:#ffffff;line-height:1.75;margin:0;max-width:520px;display:inline-block">"Stillness is not a break from life. It is how you live it."</p></div>$$ || content
WHERE position = 13 AND module_id = (SELECT m.id FROM modules m JOIN courses c ON m.course_id = c.id WHERE c.slug = '25-days-and-25-nights' AND m.position = 4);

-- ═══ DAY 14 ═══
UPDATE lessons SET content = replace(content,
  '<p><em>Intention lives in what you do and what you say. Speak it, move it, and let it guide you forward.</em></p>', '')
WHERE position = 14 AND module_id = (SELECT m.id FROM modules m JOIN courses c ON m.course_id = c.id WHERE c.slug = '25-days-and-25-nights' AND m.position = 4);

UPDATE lessons SET content = $$<div style="background:#1a0a2e;border-radius:14px;padding:40px 36px;margin-bottom:32px;text-align:center;border:1px solid rgba(255,255,255,0.08);box-shadow:0 0 40px rgba(90,63,154,0.3),inset 0 1px 0 rgba(255,255,255,0.05)"><p style="font-family:'Playfair Display',serif;font-style:italic;font-size:32px;color:#ffffff;line-height:1.75;margin:0;max-width:520px;display:inline-block">"Intention lives in what you do and what you say. Speak it, move it, and let it guide you forward."</p></div>$$ || content
WHERE position = 14 AND module_id = (SELECT m.id FROM modules m JOIN courses c ON m.course_id = c.id WHERE c.slug = '25-days-and-25-nights' AND m.position = 4);

-- ═══ DAY 15 ═══
UPDATE lessons SET content = replace(content,
  '<p><em>Flow will never chase you. It waits for you to stop swimming against yourself.</em></p>', '')
WHERE position = 15 AND module_id = (SELECT m.id FROM modules m JOIN courses c ON m.course_id = c.id WHERE c.slug = '25-days-and-25-nights' AND m.position = 4);

UPDATE lessons SET content = $$<div style="background:#1a0a2e;border-radius:14px;padding:40px 36px;margin-bottom:32px;text-align:center;border:1px solid rgba(255,255,255,0.08);box-shadow:0 0 40px rgba(90,63,154,0.3),inset 0 1px 0 rgba(255,255,255,0.05)"><p style="font-family:'Playfair Display',serif;font-style:italic;font-size:32px;color:#ffffff;line-height:1.75;margin:0;max-width:520px;display:inline-block">"Flow will never chase you. It waits for you to stop swimming against yourself."</p></div>$$ || content
WHERE position = 15 AND module_id = (SELECT m.id FROM modules m JOIN courses c ON m.course_id = c.id WHERE c.slug = '25-days-and-25-nights' AND m.position = 4);

-- ═══ DAY 16 ═══
UPDATE lessons SET content = replace(content,
  '<p><em>Release is not about loss. It is about trusting that what is meant for you will not need to be chased.</em></p>', '')
WHERE position = 16 AND module_id = (SELECT m.id FROM modules m JOIN courses c ON m.course_id = c.id WHERE c.slug = '25-days-and-25-nights' AND m.position = 4);

UPDATE lessons SET content = $$<div style="background:#1a0a2e;border-radius:14px;padding:40px 36px;margin-bottom:32px;text-align:center;border:1px solid rgba(255,255,255,0.08);box-shadow:0 0 40px rgba(90,63,154,0.3),inset 0 1px 0 rgba(255,255,255,0.05)"><p style="font-family:'Playfair Display',serif;font-style:italic;font-size:32px;color:#ffffff;line-height:1.75;margin:0;max-width:520px;display:inline-block">"Release is not about loss. It is about trusting that what is meant for you will not need to be chased."</p></div>$$ || content
WHERE position = 16 AND module_id = (SELECT m.id FROM modules m JOIN courses c ON m.course_id = c.id WHERE c.slug = '25-days-and-25-nights' AND m.position = 4);

-- ═══ DAY 17 ═══
UPDATE lessons SET content = replace(content,
  '<p><em>Alignment is not a goal. It is how you live when you finally stop ignoring yourself.</em></p>', '')
WHERE position = 17 AND module_id = (SELECT m.id FROM modules m JOIN courses c ON m.course_id = c.id WHERE c.slug = '25-days-and-25-nights' AND m.position = 4);

UPDATE lessons SET content = $$<div style="background:#1a0a2e;border-radius:14px;padding:40px 36px;margin-bottom:32px;text-align:center;border:1px solid rgba(255,255,255,0.08);box-shadow:0 0 40px rgba(90,63,154,0.3),inset 0 1px 0 rgba(255,255,255,0.05)"><p style="font-family:'Playfair Display',serif;font-style:italic;font-size:32px;color:#ffffff;line-height:1.75;margin:0;max-width:520px;display:inline-block">"Alignment is not a goal. It is how you live when you finally stop ignoring yourself."</p></div>$$ || content
WHERE position = 17 AND module_id = (SELECT m.id FROM modules m JOIN courses c ON m.course_id = c.id WHERE c.slug = '25-days-and-25-nights' AND m.position = 4);

-- ═══ DAY 18 — REST (navy) ═══
UPDATE lessons SET content = replace(content,
  '<p><strong>Mini Reminder:</strong> <em>Rest is a reset. The plan for Day 25 will reveal itself when you are calm enough to hear it.</em></p>', '')
WHERE position = 18 AND module_id = (SELECT m.id FROM modules m JOIN courses c ON m.course_id = c.id WHERE c.slug = '25-days-and-25-nights' AND m.position = 4);

UPDATE lessons SET content = $$<div style="background:#0a1628;border-radius:14px;padding:40px 36px;margin-bottom:32px;text-align:center;border:1px solid rgba(255,255,255,0.08);box-shadow:0 0 40px rgba(10,50,100,0.3),inset 0 1px 0 rgba(255,255,255,0.05)"><p style="font-family:'Playfair Display',serif;font-style:italic;font-size:32px;color:#ffffff;line-height:1.75;margin:0;max-width:520px;display:inline-block">"Rest is a reset. The plan for Day 25 will reveal itself when you are calm enough to hear it."</p></div>$$ || content
WHERE position = 18 AND module_id = (SELECT m.id FROM modules m JOIN courses c ON m.course_id = c.id WHERE c.slug = '25-days-and-25-nights' AND m.position = 4);

-- ═══ DAY 19 ═══
UPDATE lessons SET content = replace(content,
  '<p><em>Purpose does not appear. It reveals itself when you stop looking for it and start living it.</em></p>', '')
WHERE position = 19 AND module_id = (SELECT m.id FROM modules m JOIN courses c ON m.course_id = c.id WHERE c.slug = '25-days-and-25-nights' AND m.position = 4);

UPDATE lessons SET content = $$<div style="background:#1a0a2e;border-radius:14px;padding:40px 36px;margin-bottom:32px;text-align:center;border:1px solid rgba(255,255,255,0.08);box-shadow:0 0 40px rgba(90,63,154,0.3),inset 0 1px 0 rgba(255,255,255,0.05)"><p style="font-family:'Playfair Display',serif;font-style:italic;font-size:32px;color:#ffffff;line-height:1.75;margin:0;max-width:520px;display:inline-block">"Purpose does not appear. It reveals itself when you stop looking for it and start living it."</p></div>$$ || content
WHERE position = 19 AND module_id = (SELECT m.id FROM modules m JOIN courses c ON m.course_id = c.id WHERE c.slug = '25-days-and-25-nights' AND m.position = 4);

-- ═══ DAY 20 ═══
UPDATE lessons SET content = replace(content,
  '<p><em>Choice is not about perfection. It is about awareness. Keep choosing what matches your peace.</em></p>', '')
WHERE position = 20 AND module_id = (SELECT m.id FROM modules m JOIN courses c ON m.course_id = c.id WHERE c.slug = '25-days-and-25-nights' AND m.position = 4);

UPDATE lessons SET content = $$<div style="background:#1a0a2e;border-radius:14px;padding:40px 36px;margin-bottom:32px;text-align:center;border:1px solid rgba(255,255,255,0.08);box-shadow:0 0 40px rgba(90,63,154,0.3),inset 0 1px 0 rgba(255,255,255,0.05)"><p style="font-family:'Playfair Display',serif;font-style:italic;font-size:32px;color:#ffffff;line-height:1.75;margin:0;max-width:520px;display:inline-block">"Choice is not about perfection. It is about awareness. Keep choosing what matches your peace."</p></div>$$ || content
WHERE position = 20 AND module_id = (SELECT m.id FROM modules m JOIN courses c ON m.course_id = c.id WHERE c.slug = '25-days-and-25-nights' AND m.position = 4);

-- ═══ DAY 21 ═══
UPDATE lessons SET content = replace(content,
  '<p><em>Ease is how alignment feels when you finally stop chasing what is already yours.</em></p>', '')
WHERE position = 21 AND module_id = (SELECT m.id FROM modules m JOIN courses c ON m.course_id = c.id WHERE c.slug = '25-days-and-25-nights' AND m.position = 4);

UPDATE lessons SET content = $$<div style="background:#1a0a2e;border-radius:14px;padding:40px 36px;margin-bottom:32px;text-align:center;border:1px solid rgba(255,255,255,0.08);box-shadow:0 0 40px rgba(90,63,154,0.3),inset 0 1px 0 rgba(255,255,255,0.05)"><p style="font-family:'Playfair Display',serif;font-style:italic;font-size:32px;color:#ffffff;line-height:1.75;margin:0;max-width:520px;display:inline-block">"Ease is how alignment feels when you finally stop chasing what is already yours."</p></div>$$ || content
WHERE position = 21 AND module_id = (SELECT m.id FROM modules m JOIN courses c ON m.course_id = c.id WHERE c.slug = '25-days-and-25-nights' AND m.position = 4);

-- ═══ DAY 22 (no closing note — using Reflection line from content) ═══
UPDATE lessons SET content = $$<div style="background:#1a0a2e;border-radius:14px;padding:40px 36px;margin-bottom:32px;text-align:center;border:1px solid rgba(255,255,255,0.08);box-shadow:0 0 40px rgba(90,63,154,0.3),inset 0 1px 0 rgba(255,255,255,0.05)"><p style="font-family:'Playfair Display',serif;font-style:italic;font-size:32px;color:#ffffff;line-height:1.75;margin:0;max-width:520px;display:inline-block">"Every day, I decide where my energy flows. I choose peace when I stop feeding what drains me."</p></div>$$ || content
WHERE position = 22 AND module_id = (SELECT m.id FROM modules m JOIN courses c ON m.course_id = c.id WHERE c.slug = '25-days-and-25-nights' AND m.position = 4);

-- ═══ DAY 23 ═══
UPDATE lessons SET content = replace(content,
  '<p><em>You are no longer preparing for alignment. You are walking in it.</em></p>', '')
WHERE position = 23 AND module_id = (SELECT m.id FROM modules m JOIN courses c ON m.course_id = c.id WHERE c.slug = '25-days-and-25-nights' AND m.position = 4);

UPDATE lessons SET content = $$<div style="background:#1a0a2e;border-radius:14px;padding:40px 36px;margin-bottom:32px;text-align:center;border:1px solid rgba(255,255,255,0.08);box-shadow:0 0 40px rgba(90,63,154,0.3),inset 0 1px 0 rgba(255,255,255,0.05)"><p style="font-family:'Playfair Display',serif;font-style:italic;font-size:32px;color:#ffffff;line-height:1.75;margin:0;max-width:520px;display:inline-block">"You are no longer preparing for alignment. You are walking in it."</p></div>$$ || content
WHERE position = 23 AND module_id = (SELECT m.id FROM modules m JOIN courses c ON m.course_id = c.id WHERE c.slug = '25-days-and-25-nights' AND m.position = 4);

-- ═══ DAY 24 — REST (navy) ═══
UPDATE lessons SET content = replace(content,
  '<p><strong>Mini Reminder:</strong> <em>Nothing is paused. Everything is developing.</em></p>', '')
WHERE position = 24 AND module_id = (SELECT m.id FROM modules m JOIN courses c ON m.course_id = c.id WHERE c.slug = '25-days-and-25-nights' AND m.position = 4);

UPDATE lessons SET content = $$<div style="background:#0a1628;border-radius:14px;padding:40px 36px;margin-bottom:32px;text-align:center;border:1px solid rgba(255,255,255,0.08);box-shadow:0 0 40px rgba(10,50,100,0.3),inset 0 1px 0 rgba(255,255,255,0.05)"><p style="font-family:'Playfair Display',serif;font-style:italic;font-size:32px;color:#ffffff;line-height:1.75;margin:0;max-width:520px;display:inline-block">"Nothing is paused. Everything is developing."</p></div>$$ || content
WHERE position = 24 AND module_id = (SELECT m.id FROM modules m JOIN courses c ON m.course_id = c.id WHERE c.slug = '25-days-and-25-nights' AND m.position = 4);

-- ═══ DAY 25 — FESTIVE (MiRAjO green gradient) ═══
UPDATE lessons SET content = replace(content,
  '<p><em>Day 25 is not the finish line. It is the moment you finally step into what was already waiting for you.</em></p>', '')
WHERE position = 25 AND module_id = (SELECT m.id FROM modules m JOIN courses c ON m.course_id = c.id WHERE c.slug = '25-days-and-25-nights' AND m.position = 4);

UPDATE lessons SET content = $$<div style="background:linear-gradient(135deg,#122012,#1E4226);border-radius:14px;padding:40px 36px;margin-bottom:32px;text-align:center;border:1px solid rgba(196,162,69,0.3);box-shadow:0 0 50px rgba(37,107,66,0.4),inset 0 1px 0 rgba(196,162,69,0.15)"><p style="font-family:'Playfair Display',serif;font-style:italic;font-size:32px;color:#ffffff;line-height:1.75;margin:0;max-width:520px;display:inline-block">"Day 25 is not the finish line. It is the moment you finally step into what was already waiting for you."</p></div>$$ || content
WHERE position = 25 AND module_id = (SELECT m.id FROM modules m JOIN courses c ON m.course_id = c.id WHERE c.slug = '25-days-and-25-nights' AND m.position = 4);
