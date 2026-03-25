-- ══════════════════════════════════════════════════════
-- CIE: SCHEMA UPDATES
-- Run in Supabase SQL Editor
-- ══════════════════════════════════════════════════════


-- ── 1. MODULES TABLE: add slug column ──────────────────
ALTER TABLE modules ADD COLUMN IF NOT EXISTS slug text;


-- ── 2. LESSONS TABLE: add together_work column ─────────
ALTER TABLE lessons ADD COLUMN IF NOT EXISTS together_work text;


-- ── 3. UNIQUE CONSTRAINTS ──────────────────────────────

-- diagnostic_responses (required for upsert in submit API)
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_constraint WHERE conname = 'diagnostic_responses_unique'
  ) THEN
    ALTER TABLE diagnostic_responses
      ADD CONSTRAINT diagnostic_responses_unique
      UNIQUE (couple_id, user_id, domain, question_key);
  END IF;
END $$;

-- diagnostic_completion (one row per user per couple)
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_constraint WHERE conname = 'diagnostic_completion_unique'
  ) THEN
    ALTER TABLE diagnostic_completion
      ADD CONSTRAINT diagnostic_completion_unique
      UNIQUE (couple_id, user_id);
  END IF;
END $$;


-- ── 4. CIE COURSE ──────────────────────────────────────
INSERT INTO courses (slug, title, description, price)
VALUES (
  'couples-in-entrepreneurship',
  'Couples in Entrepreneurship',
  'The operating system for couples building something serious together.',
  997
)
ON CONFLICT (slug) DO NOTHING;


-- ── 5. CIE MODULES ─────────────────────────────────────
-- Inserts all 8 modules with slugs and unlock_domain values.
-- Uses a subquery to get the course_id so order does not matter.

INSERT INTO modules (course_id, slug, title, position, unlock_domain)
SELECT
  c.id,
  m.slug,
  m.title,
  m.position,
  m.unlock_domain
FROM courses c
CROSS JOIN (VALUES
  ('the-cost-of-misalignment', 'The Cost of Misalignment',  1, NULL),
  ('the-financial-playbook',   'The Financial Playbook',    2, 'finances'),
  ('the-game-plan',            'The Game Plan',             3, 'business'),
  ('who-runs-what',            'Who Runs What',             4, 'business'),
  ('the-life-architecture',    'The Life Architecture',     5, 'family'),
  ('protect-what-you-built',   'Protect What You Built',    6, 'relationship'),
  ('getting-on-the-same-page', 'Getting on the Same Page',  7, 'relationship'),
  ('the-win',                  'The Win',                   8, NULL)
) AS m(slug, title, position, unlock_domain)
WHERE c.slug = 'couples-in-entrepreneurship'
ON CONFLICT DO NOTHING;


-- ── 6. RLS POLICIES ────────────────────────────────────
-- Only needed if RLS is enabled on these tables and policies
-- were not added in a previous session.
-- If you get "policy already exists" errors, skip this section.

-- diagnostic_responses
ALTER TABLE diagnostic_responses ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can insert their own responses"
  ON diagnostic_responses FOR INSERT
  WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can select responses for their couple"
  ON diagnostic_responses FOR SELECT
  USING (
    couple_id IN (
      SELECT id FROM couples
      WHERE partner_a_user_id = auth.uid()
         OR partner_b_user_id = auth.uid()
    )
  );

-- diagnostic_completion
ALTER TABLE diagnostic_completion ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can insert their own completion"
  ON diagnostic_completion FOR INSERT
  WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can select completion for their couple"
  ON diagnostic_completion FOR SELECT
  USING (
    couple_id IN (
      SELECT id FROM couples
      WHERE partner_a_user_id = auth.uid()
         OR partner_b_user_id = auth.uid()
    )
  );

-- partnership_reports
ALTER TABLE partnership_reports ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Partners can select their report"
  ON partnership_reports FOR SELECT
  USING (
    couple_id IN (
      SELECT id FROM couples
      WHERE partner_a_user_id = auth.uid()
         OR partner_b_user_id = auth.uid()
    )
  );
