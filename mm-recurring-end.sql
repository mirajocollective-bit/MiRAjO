-- Money Moves: add recurring end condition columns to mm_transactions
-- Run in Supabase SQL Editor

ALTER TABLE mm_transactions ADD COLUMN IF NOT EXISTS recur_end_type   text;           -- date | count | amount
ALTER TABLE mm_transactions ADD COLUMN IF NOT EXISTS recur_end_count  integer;        -- stop after N occurrences
ALTER TABLE mm_transactions ADD COLUMN IF NOT EXISTS recur_end_amount numeric(10,2);  -- stop after cumulative total
