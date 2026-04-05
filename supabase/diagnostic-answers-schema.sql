-- New scenario-based diagnostic answers table
-- Replaces the old text-based diagnostic_responses for the CIE course

CREATE TABLE IF NOT EXISTS diagnostic_answers (
  id             uuid DEFAULT gen_random_uuid() PRIMARY KEY,
  couple_id      uuid NOT NULL REFERENCES couples(id) ON DELETE CASCADE,
  user_id        uuid NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  domain         text NOT NULL CHECK (domain IN ('business','finances','family','relationship')),
  scenario_key   text NOT NULL,
  selected_option text NOT NULL CHECK (selected_option IN ('A','B','C','D')),
  score          int  NOT NULL CHECK (score BETWEEN 1 AND 4),
  answered_at    timestamptz DEFAULT now(),
  UNIQUE(couple_id, user_id, scenario_key)
);

ALTER TABLE diagnostic_answers ENABLE ROW LEVEL SECURITY;

-- Users can read and write their own answers
CREATE POLICY "Users manage own diagnostic answers"
  ON diagnostic_answers FOR ALL
  USING (user_id = auth.uid())
  WITH CHECK (user_id = auth.uid());

-- Notes per domain (optional, private to user)
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

CREATE POLICY "Users manage own diagnostic notes"
  ON diagnostic_notes FOR ALL
  USING (user_id = auth.uid())
  WITH CHECK (user_id = auth.uid());
