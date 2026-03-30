-- Money Moves notification log
-- Prevents duplicate budget/goal/weekly emails from being sent
-- Run this in Supabase SQL Editor

create table if not exists mm_notification_log (
  id         uuid primary key default gen_random_uuid(),
  key        text not null,        -- unique key per event, e.g. "budget-{userId}-{catId}-alert"
  user_id    uuid references auth.users(id) on delete cascade,
  sent_at    timestamptz not null default now()
);

-- Fast lookup by key
create index if not exists mm_notification_log_key_idx on mm_notification_log(key);
create index if not exists mm_notification_log_user_idx on mm_notification_log(user_id);

-- Service role only — no user-facing RLS needed (cron writes, users never query this)
alter table mm_notification_log enable row level security;
