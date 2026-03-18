-- Email queue for course sequences sent via Resend
-- Run in Supabase SQL editor

CREATE TABLE IF NOT EXISTS email_queue (
  id         uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  email      text NOT NULL,
  first_name text DEFAULT '',
  sequence   text NOT NULL,
  step       integer NOT NULL,
  send_after timestamptz NOT NULL,
  sent_at    timestamptz,
  created_at timestamptz DEFAULT now(),
  UNIQUE(email, sequence, step)
);

ALTER TABLE email_queue ENABLE ROW LEVEL SECURITY;
-- No public policies — service role only
