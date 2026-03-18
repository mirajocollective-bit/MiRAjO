-- Journal entries table
-- Run in Supabase SQL editor

CREATE TABLE IF NOT EXISTS journal_entries (
  id           uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id      uuid REFERENCES auth.users(id) ON DELETE CASCADE,
  lesson_id    uuid REFERENCES lessons(id) ON DELETE CASCADE,
  content      text NOT NULL DEFAULT '',
  updated_at   timestamptz DEFAULT now(),
  UNIQUE(user_id, lesson_id)
);

ALTER TABLE journal_entries ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users manage own journal entries"
  ON journal_entries FOR ALL
  USING (auth.uid() = user_id)
  WITH CHECK (auth.uid() = user_id);
