-- Non-Negotiables completion tracking table
-- Run in Supabase SQL editor

CREATE TABLE IF NOT EXISTS nonneg_completions (
  id              uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id         uuid REFERENCES auth.users(id) ON DELETE CASCADE,
  lesson_id       uuid REFERENCES lessons(id) ON DELETE CASCADE,
  completed_items integer[] DEFAULT '{}',
  updated_at      timestamptz DEFAULT now(),
  UNIQUE(user_id, lesson_id)
);

ALTER TABLE nonneg_completions ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users manage own nonneg completions"
  ON nonneg_completions FOR ALL
  USING (auth.uid() = user_id)
  WITH CHECK (auth.uid() = user_id);
