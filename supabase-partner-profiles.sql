-- ═══════════════════════════════════════════════════════════════
-- PARTNER PROFILES — Individual profile for each CIE partner
-- Run this in Supabase SQL Editor
-- ═══════════════════════════════════════════════════════════════

create table if not exists partner_profiles (
  id                        uuid primary key default gen_random_uuid(),
  user_id                   uuid references auth.users(id) on delete cascade,
  couple_id                 uuid references couples(id) on delete cascade,

  -- Who You Are
  age_range                 text,             -- 'under-25' | '25-34' | '35-44' | '45-54' | '55+'
  cultural_backgrounds      text[],           -- multi-select array
  faith_influence           text,             -- 'low' | 'medium' | 'high'
  political_importance      text,             -- 'low' | 'medium' | 'high'

  -- Your Relationship
  time_together             text,             -- 'under-1' | '1-3' | '3-5' | '5-10' | '10+'
  relationship_status       text,             -- 'dating' | 'engaged' | 'married'
  family_structure          text,             -- 'no-kids' | 'kids-together' | 'stepparent' | 'blended' | 'unsure'

  -- Your Business
  business_stage            text,             -- 'idea' | 'startup' | 'growing' | 'established'
  business_role             text,             -- 'equal-partners' | 'i-lead' | 'they-lead' | 'still-figuring'
  years_building_together   text,             -- 'just-starting' | 'under-2' | '2-5' | '5+'

  -- Your Financial Picture (all optional)
  debt_level                text,             -- 'none' | 'manageable' | 'significant' | 'overwhelming'
  savings_runway            text,             -- 'none' | '1-3-months' | '3-6-months' | '6-plus'
  money_alignment           text,             -- 'low' | 'medium' | 'high'
  financial_stressor        text,             -- open text

  -- What You're Bringing In
  biggest_challenge         text,             -- open text
  course_goal               text[],           -- multi-select

  completed_at              timestamptz,      -- null until submitted
  created_at                timestamptz default now(),
  updated_at                timestamptz default now(),

  unique(user_id, couple_id)
);

-- ═══ ROW LEVEL SECURITY ═══
alter table partner_profiles enable row level security;

-- Each partner can only see and edit their own profile
create policy "Users manage own profile"
  on partner_profiles for all
  using (auth.uid() = user_id)
  with check (auth.uid() = user_id);

-- Note: service role bypasses RLS automatically — no additional policy needed
