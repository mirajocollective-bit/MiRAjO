-- Money Moves — Missing columns migration
-- Run this in Supabase SQL Editor

-- Recurring transaction per-occurrence overrides (move/delete single occurrences)
ALTER TABLE mm_transactions
  ADD COLUMN IF NOT EXISTS recur_exceptions jsonb DEFAULT '[]'::jsonb;

-- Second day-of-month for "twice monthly" recurring transactions
ALTER TABLE mm_transactions
  ADD COLUMN IF NOT EXISTS recur_second_date integer;

-- Index for fast lookup when expanding recurring transactions
CREATE INDEX IF NOT EXISTS mm_txn_recurring_idx
  ON mm_transactions (household_id, is_recurring)
  WHERE is_recurring = true;
