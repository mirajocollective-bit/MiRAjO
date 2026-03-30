-- ─────────────────────────────────────────────────────────────────────────────
-- Money Moves by MiRAjO — Supabase Schema
-- Run this in Supabase SQL Editor
-- ─────────────────────────────────────────────────────────────────────────────

-- ── Subscriptions ─────────────────────────────────────────────────────────────
-- Tracks Stripe subscription per user (owner of the plan)
create table if not exists mm_subscriptions (
  id                     uuid primary key default gen_random_uuid(),
  user_id                uuid not null references auth.users(id) on delete cascade,
  stripe_customer_id     text,
  stripe_subscription_id text,
  plan                   text not null default 'individual', -- individual | family
  billing                text not null default 'monthly',    -- monthly | annual
  status                 text not null default 'active',     -- active | cancelled | past_due | trialing
  period_end             timestamptz,
  created_at             timestamptz default now(),
  updated_at             timestamptz default now()
);

-- ── Households ────────────────────────────────────────────────────────────────
-- A household groups users on a family plan.
-- Individual subscribers also get a household (just one member).
create table if not exists mm_households (
  id         uuid primary key default gen_random_uuid(),
  owner_id   uuid not null references auth.users(id) on delete cascade,
  name       text not null default 'My Household',
  created_at timestamptz default now()
);

-- ── Members ───────────────────────────────────────────────────────────────────
-- Links users to a household. Owner is auto-added on signup.
-- Family members are added via invite (email).
create table if not exists mm_members (
  id           uuid primary key default gen_random_uuid(),
  household_id uuid not null references mm_households(id) on delete cascade,
  user_id      uuid references auth.users(id) on delete set null,
  email        text not null,
  display_name text,
  role         text not null default 'member', -- owner | member
  status       text not null default 'active', -- active | invited | removed
  invited_at   timestamptz,
  joined_at    timestamptz default now()
);

-- ── Categories ────────────────────────────────────────────────────────────────
-- Budget categories per household. Seeded with defaults on signup.
create table if not exists mm_categories (
  id             uuid primary key default gen_random_uuid(),
  household_id   uuid not null references mm_households(id) on delete cascade,
  name           text not null,
  type           text not null default 'expense', -- income | expense
  color          text default '#6DC48A',
  icon           text,
  budget_amount  numeric(10,2) default 0,         -- monthly budget cap for this category
  created_at     timestamptz default now()
);

-- ── Transactions ──────────────────────────────────────────────────────────────
-- Every income or expense entry on the calendar
create table if not exists mm_transactions (
  id               uuid primary key default gen_random_uuid(),
  household_id     uuid not null references mm_households(id) on delete cascade,
  member_id        uuid references mm_members(id) on delete set null,
  category_id      uuid references mm_categories(id) on delete set null,
  type             text not null,                  -- income | expense
  amount           numeric(10,2) not null,
  date             date not null,
  description      text,
  is_recurring     boolean default false,
  recur_frequency  text,                           -- daily | weekly | biweekly | monthly | yearly
  recur_end_date   date,
  created_at       timestamptz default now()
);

-- ── Goals ─────────────────────────────────────────────────────────────────────
-- Savings goals — can be individual or household-wide
create table if not exists mm_goals (
  id                uuid primary key default gen_random_uuid(),
  household_id      uuid not null references mm_households(id) on delete cascade,
  member_id         uuid references mm_members(id) on delete set null,
  name              text not null,
  description       text,
  target_amount     numeric(10,2) not null,
  current_amount    numeric(10,2) not null default 0,
  target_date       date,
  celebration_type  text default 'confetti',       -- confetti | message | badge | purchase
  celebration_note  text,                          -- "treat yourself to a spa day!" etc
  status            text default 'active',         -- active | completed | paused | abandoned
  created_at        timestamptz default now(),
  completed_at      timestamptz
);

-- ── Preferences ───────────────────────────────────────────────────────────────
-- Per-user settings: personality mode, alert thresholds, email opt-in
create table if not exists mm_preferences (
  id                 uuid primary key default gen_random_uuid(),
  user_id            uuid not null references auth.users(id) on delete cascade unique,
  personality_mode   text not null default 'mom',  -- mom | dad | spiritual | wrestling
  alert_threshold    integer default 80,           -- % of budget used before alert fires
  email_alerts       boolean default true,
  weekly_summary     boolean default true,
  goal_alerts        boolean default true,
  timezone           text default 'America/New_York',
  created_at         timestamptz default now(),
  updated_at         timestamptz default now()
);

-- ─────────────────────────────────────────────────────────────────────────────
-- Row Level Security
-- ─────────────────────────────────────────────────────────────────────────────

alter table mm_subscriptions enable row level security;
alter table mm_households    enable row level security;
alter table mm_members       enable row level security;
alter table mm_categories    enable row level security;
alter table mm_transactions  enable row level security;
alter table mm_goals         enable row level security;
alter table mm_preferences   enable row level security;

-- Subscriptions: user sees only their own
create policy "mm_sub_own" on mm_subscriptions
  for all using (auth.uid() = user_id);

-- Households: owner sees their household; members see their household
create policy "mm_household_access" on mm_households
  for all using (
    auth.uid() = owner_id or
    auth.uid() in (
      select user_id from mm_members where household_id = mm_households.id and status = 'active'
    )
  );

-- Members: household members see all members of their household
create policy "mm_members_access" on mm_members
  for all using (
    auth.uid() in (
      select user_id from mm_members m2 where m2.household_id = mm_members.household_id and m2.status = 'active'
    )
  );

-- Categories: household-scoped
create policy "mm_categories_access" on mm_categories
  for all using (
    auth.uid() in (
      select user_id from mm_members where household_id = mm_categories.household_id and status = 'active'
    )
  );

-- Transactions: household-scoped
create policy "mm_transactions_access" on mm_transactions
  for all using (
    auth.uid() in (
      select user_id from mm_members where household_id = mm_transactions.household_id and status = 'active'
    )
  );

-- Goals: household-scoped
create policy "mm_goals_access" on mm_goals
  for all using (
    auth.uid() in (
      select user_id from mm_members where household_id = mm_goals.household_id and status = 'active'
    )
  );

-- Preferences: user sees only their own
create policy "mm_prefs_own" on mm_preferences
  for all using (auth.uid() = user_id);

-- ─────────────────────────────────────────────────────────────────────────────
-- Default Categories (insert after signup via API, not here)
-- Reference data — seed per household on account creation:
--
-- Income:  Salary, Freelance, Side Hustle, Investments, Other Income
-- Expense: Housing, Food & Groceries, Transportation, Utilities, Healthcare,
--          Entertainment, Clothing, Education, Savings Transfer, Business, Other
-- ─────────────────────────────────────────────────────────────────────────────
