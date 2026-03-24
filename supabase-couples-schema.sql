-- ═══════════════════════════════════════════════════════════════
-- COUPLES IN ENTREPRENEURSHIP — SUPABASE SCHEMA
-- Run this in Supabase SQL Editor
-- ═══════════════════════════════════════════════════════════════


-- ═══ 1. ADD unlock_domain TO MODULES (for adaptive path logic) ═══
-- Nullable — only used by couples course adaptive modules
alter table modules add column if not exists unlock_domain text;
-- Values: 'finances', 'business', 'roles', 'family', 'intimacy', 'communication'
-- NULL = always unlocked (foundation module)


-- ═══ 2. COUPLES — links two users as a couple ═══
create table if not exists couples (
  id                  uuid primary key default gen_random_uuid(),
  course_id           uuid references courses(id) on delete cascade,
  partner_a_user_id   uuid references auth.users(id) on delete cascade,
  partner_b_user_id   uuid references auth.users(id),  -- null until invite accepted
  stripe_session_id   text,
  created_at          timestamptz default now(),
  linked_at           timestamptz  -- set when partner_b accepts invite
);


-- ═══ 3. COUPLE INVITES — partner B invite token ═══
create table if not exists couple_invites (
  id                uuid primary key default gen_random_uuid(),
  couple_id         uuid references couples(id) on delete cascade,
  partner_b_email   text not null,
  token             text unique not null default encode(gen_random_bytes(32), 'hex'),
  created_at        timestamptz default now(),
  expires_at        timestamptz default now() + interval '7 days',
  accepted_at       timestamptz
);


-- ═══ 4. DIAGNOSTIC RESPONSES — each partner's private answers ═══
create table if not exists diagnostic_responses (
  id            uuid primary key default gen_random_uuid(),
  user_id       uuid references auth.users(id) on delete cascade,
  couple_id     uuid references couples(id) on delete cascade,
  domain        text not null,        -- 'business' | 'finances' | 'family' | 'relationship'
  question_key  text not null,        -- e.g. 'business_vision', 'finances_security'
  response      text,
  created_at    timestamptz default now(),
  unique(user_id, couple_id, question_key)
);


-- ═══ 5. DIAGNOSTIC COMPLETION — flag when a partner finishes ═══
create table if not exists diagnostic_completion (
  id            uuid primary key default gen_random_uuid(),
  user_id       uuid references auth.users(id) on delete cascade,
  couple_id     uuid references couples(id) on delete cascade,
  completed_at  timestamptz default now(),
  unique(user_id, couple_id)
);


-- ═══ 6. PARTNERSHIP REPORTS — generated alignment report ═══
create table if not exists partnership_reports (
  id                uuid primary key default gen_random_uuid(),
  couple_id         uuid references couples(id) on delete cascade unique,
  generated_at      timestamptz default now(),
  alignment_data    jsonb,   -- per-domain: { business: 'aligned'|'partial'|'misaligned', ... }
  modules_unlocked  jsonb    -- array of module IDs unlocked for this couple
);


-- ═══ ROW LEVEL SECURITY ═══
alter table couples enable row level security;
alter table couple_invites enable row level security;
alter table diagnostic_responses enable row level security;
alter table diagnostic_completion enable row level security;
alter table partnership_reports enable row level security;

-- Couples: each partner can see their own couple record
create policy "Partners can view their couple"
  on couples for select
  using (auth.uid() = partner_a_user_id or auth.uid() = partner_b_user_id);

create policy "Service role can insert couples"
  on couples for insert with check (true);

create policy "Service role can update couples"
  on couples for update using (true);

-- Couple invites: service role only (webhook creates these)
create policy "Service role manages invites"
  on couple_invites for all using (true);

-- Diagnostic responses: users can only see their own answers (private)
create policy "Users see own diagnostic responses"
  on diagnostic_responses for select
  using (auth.uid() = user_id);

create policy "Users insert own diagnostic responses"
  on diagnostic_responses for insert
  with check (auth.uid() = user_id);

create policy "Users update own diagnostic responses"
  on diagnostic_responses for update
  using (auth.uid() = user_id);

-- Diagnostic completion: users see their own, service role writes
create policy "Users see own diagnostic completion"
  on diagnostic_completion for select
  using (auth.uid() = user_id);

create policy "Service role manages diagnostic completion"
  on diagnostic_completion for insert with check (true);

-- Partnership reports: both partners can see their report
create policy "Partners can view their report"
  on partnership_reports for select
  using (
    exists (
      select 1 from couples c
      where c.id = couple_id
      and (c.partner_a_user_id = auth.uid() or c.partner_b_user_id = auth.uid())
    )
  );

create policy "Service role inserts partnership reports"
  on partnership_reports for insert with check (true);


-- ═══ INSERT COUPLES IN ENTREPRENEURSHIP COURSE ═══
insert into courses (slug, title, description, price)
values (
  'couples-in-entrepreneurship',
  'Couples in Entrepreneurship',
  'The operating system for couples building something serious. Find your alignments, close your gaps, and build together.',
  997
)
on conflict (slug) do nothing;


-- ═══ INSERT MODULES ═══
-- Module 1: Foundation — everyone does this (no unlock_domain)
-- Modules 2-7: Adaptive — unlock based on Partnership Report gaps
-- Module 8: Closing — everyone does this (no unlock_domain)

with course as (
  select id from courses where slug = 'couples-in-entrepreneurship'
)
insert into modules (course_id, title, position, unlock_domain)
values
  ((select id from course), 'The Cost of Misalignment',  1, null),
  ((select id from course), 'The Financial Playbook',    2, 'finances'),
  ((select id from course), 'The Game Plan',             3, 'business'),
  ((select id from course), 'Who Runs What',             4, 'roles'),
  ((select id from course), 'The Life Architecture',     5, 'family'),
  ((select id from course), 'Protect What You Built',    6, 'intimacy'),
  ((select id from course), 'Getting on the Same Page',  7, 'communication'),
  ((select id from course), 'The Win',                   8, null)
on conflict do nothing;
