-- ══════════════════════════════════════════════════════
-- CIE: MISSING TABLES — Run in Supabase SQL Editor
-- Safe to run even if some tables already exist.
-- ══════════════════════════════════════════════════════


-- ── 1. couple_invites ─────────────────────────────────
CREATE TABLE IF NOT EXISTS couple_invites (
  id              uuid DEFAULT gen_random_uuid() PRIMARY KEY,
  couple_id       uuid NOT NULL REFERENCES couples(id) ON DELETE CASCADE,
  partner_b_email text NOT NULL,
  token           uuid DEFAULT gen_random_uuid() UNIQUE,
  expires_at      timestamptz DEFAULT now() + interval '7 days',
  accepted_at     timestamptz,
  created_at      timestamptz DEFAULT now()
);

ALTER TABLE couple_invites ENABLE ROW LEVEL SECURITY;

DO $$ BEGIN
  CREATE POLICY "Partners can read their invites"
    ON couple_invites FOR SELECT
    USING (couple_id IN (
      SELECT id FROM couples
      WHERE partner_a_user_id = auth.uid() OR partner_b_user_id = auth.uid()
    ));
EXCEPTION WHEN duplicate_object THEN NULL; END $$;


-- ── 2. partner_profiles ───────────────────────────────
CREATE TABLE IF NOT EXISTS partner_profiles (
  id                      uuid DEFAULT gen_random_uuid() PRIMARY KEY,
  couple_id               uuid NOT NULL REFERENCES couples(id) ON DELETE CASCADE,
  user_id                 uuid NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  age_range               text,
  cultural_backgrounds    text[],
  faith_influence         text,
  political_importance    text,
  time_together           text,
  relationship_status     text,
  family_structure        text,
  business_stage          text,
  business_role           text,
  years_building_together text,
  long_term_vision        text,
  risk_tolerance          text,
  both_full_time          text,
  public_visibility       text,
  primary_income          text,
  debt_level              text,
  savings_runway          text,
  money_alignment         text,
  financial_stressor      text,
  biggest_challenge       text,
  course_goal             text[],
  completed_at            timestamptz,
  updated_at              timestamptz DEFAULT now(),
  UNIQUE(couple_id, user_id)
);

ALTER TABLE partner_profiles ENABLE ROW LEVEL SECURITY;

DO $$ BEGIN
  CREATE POLICY "Users manage own profile"
    ON partner_profiles FOR ALL
    USING (user_id = auth.uid())
    WITH CHECK (user_id = auth.uid());
EXCEPTION WHEN duplicate_object THEN NULL; END $$;

DO $$ BEGIN
  CREATE POLICY "Partners can read each other profile"
    ON partner_profiles FOR SELECT
    USING (couple_id IN (
      SELECT id FROM couples
      WHERE partner_a_user_id = auth.uid() OR partner_b_user_id = auth.uid()
    ));
EXCEPTION WHEN duplicate_object THEN NULL; END $$;


-- ── 3. diagnostic_completion ──────────────────────────
CREATE TABLE IF NOT EXISTS diagnostic_completion (
  id           uuid DEFAULT gen_random_uuid() PRIMARY KEY,
  couple_id    uuid NOT NULL REFERENCES couples(id) ON DELETE CASCADE,
  user_id      uuid NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  completed_at timestamptz DEFAULT now(),
  UNIQUE(couple_id, user_id)
);

ALTER TABLE diagnostic_completion ENABLE ROW LEVEL SECURITY;

DO $$ BEGIN
  CREATE POLICY "Users can insert own completion"
    ON diagnostic_completion FOR INSERT
    WITH CHECK (auth.uid() = user_id);
EXCEPTION WHEN duplicate_object THEN NULL; END $$;

DO $$ BEGIN
  CREATE POLICY "Partners can see couple completion"
    ON diagnostic_completion FOR SELECT
    USING (couple_id IN (
      SELECT id FROM couples
      WHERE partner_a_user_id = auth.uid() OR partner_b_user_id = auth.uid()
    ));
EXCEPTION WHEN duplicate_object THEN NULL; END $$;


-- ── 4. partnership_reports ────────────────────────────
CREATE TABLE IF NOT EXISTS partnership_reports (
  id               uuid DEFAULT gen_random_uuid() PRIMARY KEY,
  couple_id        uuid NOT NULL REFERENCES couples(id) ON DELETE CASCADE,
  unlocked_domains text[],
  report_data      jsonb,
  generated_at     timestamptz DEFAULT now(),
  UNIQUE(couple_id)
);

ALTER TABLE partnership_reports ENABLE ROW LEVEL SECURITY;

DO $$ BEGIN
  CREATE POLICY "Partners can read their report"
    ON partnership_reports FOR SELECT
    USING (couple_id IN (
      SELECT id FROM couples
      WHERE partner_a_user_id = auth.uid() OR partner_b_user_id = auth.uid()
    ));
EXCEPTION WHEN duplicate_object THEN NULL; END $$;


-- ── 5. diagnostic_answers (if not already run) ────────
CREATE TABLE IF NOT EXISTS diagnostic_answers (
  id              uuid DEFAULT gen_random_uuid() PRIMARY KEY,
  couple_id       uuid NOT NULL REFERENCES couples(id) ON DELETE CASCADE,
  user_id         uuid NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  domain          text NOT NULL CHECK (domain IN ('business','finances','family','relationship')),
  scenario_key    text NOT NULL,
  selected_option text NOT NULL CHECK (selected_option IN ('A','B','C','D')),
  score           int  NOT NULL CHECK (score BETWEEN 1 AND 4),
  answered_at     timestamptz DEFAULT now(),
  UNIQUE(couple_id, user_id, scenario_key)
);

ALTER TABLE diagnostic_answers ENABLE ROW LEVEL SECURITY;

DO $$ BEGIN
  CREATE POLICY "Users manage own diagnostic answers"
    ON diagnostic_answers FOR ALL
    USING (user_id = auth.uid())
    WITH CHECK (user_id = auth.uid());
EXCEPTION WHEN duplicate_object THEN NULL; END $$;


-- ── 6. diagnostic_notes (if not already run) ─────────
CREATE TABLE IF NOT EXISTS diagnostic_notes (
  id         uuid DEFAULT gen_random_uuid() PRIMARY KEY,
  couple_id  uuid NOT NULL REFERENCES couples(id) ON DELETE CASCADE,
  user_id    uuid NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  domain     text NOT NULL CHECK (domain IN ('business','finances','family','relationship')),
  note_text  text,
  updated_at timestamptz DEFAULT now(),
  UNIQUE(couple_id, user_id, domain)
);

ALTER TABLE diagnostic_notes ENABLE ROW LEVEL SECURITY;

DO $$ BEGIN
  CREATE POLICY "Users manage own diagnostic notes"
    ON diagnostic_notes FOR ALL
    USING (user_id = auth.uid())
    WITH CHECK (user_id = auth.uid());
EXCEPTION WHEN duplicate_object THEN NULL; END $$;
