-- MiRAjO Subscribers Table
-- Run this once in Supabase SQL Editor (Dashboard > SQL Editor > New Query)
-- Tracks every email capture across the site with its source.

CREATE TABLE IF NOT EXISTS subscribers (
  id          UUID        DEFAULT gen_random_uuid() PRIMARY KEY,
  email       TEXT        NOT NULL,
  first_name  TEXT        NOT NULL DEFAULT '',
  source      TEXT        NOT NULL,
  created_at  TIMESTAMPTZ DEFAULT NOW()
);

-- Prevent duplicate (same email from same source)
CREATE UNIQUE INDEX IF NOT EXISTS subscribers_email_source_idx
  ON subscribers (email, source);

-- Row level security — only service role can read/write
ALTER TABLE subscribers ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Service role full access" ON subscribers
  FOR ALL
  USING (auth.role() = 'service_role');

-- Handy view: breakdown by source
CREATE OR REPLACE VIEW subscriber_summary AS
SELECT
  source,
  COUNT(*)                          AS total,
  COUNT(DISTINCT email)             AS unique_emails,
  MIN(created_at)::DATE             AS first_signup,
  MAX(created_at)::DATE             AS latest_signup
FROM subscribers
GROUP BY source
ORDER BY total DESC;
