-- Money Moves: add credit_limit to mm_accounts
ALTER TABLE mm_accounts
  ADD COLUMN IF NOT EXISTS credit_limit numeric(12,2) DEFAULT 0;
