-- ─────────────────────────────────────────────────────────────────────────────
-- Money Moves by MiRAjO — Supabase Schema (v2)
-- Run this in Supabase SQL Editor
-- ─────────────────────────────────────────────────────────────────────────────

-- ── Subscriptions ─────────────────────────────────────────────────────────────
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
create table if not exists mm_households (
  id         uuid primary key default gen_random_uuid(),
  owner_id   uuid not null references auth.users(id) on delete cascade,
  name       text not null default 'My Household',
  created_at timestamptz default now()
);

-- ── Members ───────────────────────────────────────────────────────────────────
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

-- ── Accounts ──────────────────────────────────────────────────────────────────
-- Each household has multiple accounts (checking, savings, credit, etc.)
-- Transactions are linked to a specific account.
-- Calendar shows one account at a time via tabs.
create table if not exists mm_accounts (
  id              uuid primary key default gen_random_uuid(),
  household_id    uuid not null references mm_households(id) on delete cascade,
  name            text not null,
  type            text not null default 'checking', -- checking | savings | credit | loan | investment | other
  current_balance numeric(12,2) not null default 0,
  color           text default '#6DC48A',
  sort_order      integer default 0,
  is_active       boolean default true,
  created_at      timestamptz default now()
);

-- ── Categories ────────────────────────────────────────────────────────────────
create table if not exists mm_categories (
  id             uuid primary key default gen_random_uuid(),
  household_id   uuid not null references mm_households(id) on delete cascade,
  name           text not null,
  type           text not null default 'expense', -- income | expense
  color          text default '#C4A245',
  icon           text,
  budget_amount  numeric(10,2) default 0,
  created_at     timestamptz default now()
);

-- ── Transactions ──────────────────────────────────────────────────────────────
-- Linked to a specific account. Recurring transactions generate forward entries
-- used for 7-year projection calculations (no separate projection table needed —
-- projections are computed on the fly from is_recurring rows).
create table if not exists mm_transactions (
  id               uuid primary key default gen_random_uuid(),
  household_id     uuid not null references mm_households(id) on delete cascade,
  account_id       uuid not null references mm_accounts(id) on delete cascade,
  member_id        uuid references mm_members(id) on delete set null,
  category_id      uuid references mm_categories(id) on delete set null,
  type             text not null,                  -- income | expense | transfer
  amount           numeric(10,2) not null,
  date             date not null,
  description      text,
  notes            text,
  is_recurring      boolean default false,
  recur_frequency   text,                          -- weekly | biweekly | twice_monthly | monthly | yearly
  recur_end_date    date,
  recur_end_type    text,                          -- date | count | amount
  recur_end_count   integer,
  recur_end_amount  numeric(12,2),
  recur_second_date integer,                       -- day-of-month for twice_monthly (e.g. 15)
  transfer_to_account_id uuid references mm_accounts(id) on delete set null,
  created_at       timestamptz default now()
);

-- ── Debts ─────────────────────────────────────────────────────────────────────
-- Tracks loans, credit cards, mortgages, medical debt, etc.
-- Linked to an account optionally (e.g. a credit card account).
create table if not exists mm_debts (
  id               uuid primary key default gen_random_uuid(),
  household_id     uuid not null references mm_households(id) on delete cascade,
  account_id       uuid references mm_accounts(id) on delete set null,
  name             text not null,
  type             text not null default 'loan',   -- credit_card | loan | mortgage | medical | student | other
  current_balance  numeric(12,2) not null default 0,
  original_amount  numeric(12,2),
  interest_rate    numeric(5,2),                   -- APR %
  minimum_payment  numeric(10,2),
  due_day          integer,                        -- day of month payment is due (1–31)
  payoff_goal_date date,
  status           text default 'active',          -- active | paid_off
  created_at       timestamptz default now(),
  paid_off_at      timestamptz
);

-- ── Goals ─────────────────────────────────────────────────────────────────────
create table if not exists mm_goals (
  id                uuid primary key default gen_random_uuid(),
  household_id      uuid not null references mm_households(id) on delete cascade,
  member_id         uuid references mm_members(id) on delete set null,
  account_id        uuid references mm_accounts(id) on delete set null,
  name              text not null,
  description       text,
  target_amount     numeric(10,2) not null,
  current_amount    numeric(10,2) not null default 0,
  target_date       date,
  celebration_type  text default 'confetti',       -- confetti | message | badge | purchase
  celebration_note  text,
  status            text default 'active',         -- active | completed | paused | abandoned
  created_at        timestamptz default now(),
  completed_at      timestamptz
);

-- ── Preferences ───────────────────────────────────────────────────────────────
create table if not exists mm_preferences (
  id                 uuid primary key default gen_random_uuid(),
  user_id            uuid not null references auth.users(id) on delete cascade unique,
  personality_mode   text not null default 'mom',  -- mom | dad | spiritual | wrestling
  alert_threshold    integer default 80,
  email_alerts       boolean default true,
  weekly_summary     boolean default true,
  goal_alerts        boolean default true,
  timezone           text default 'America/New_York',
  default_account_id uuid references mm_accounts(id) on delete set null,
  created_at         timestamptz default now(),
  updated_at         timestamptz default now()
);

-- ─────────────────────────────────────────────────────────────────────────────
-- Row Level Security
-- ─────────────────────────────────────────────────────────────────────────────

alter table mm_subscriptions enable row level security;
alter table mm_households    enable row level security;
alter table mm_members       enable row level security;
alter table mm_accounts      enable row level security;
alter table mm_categories    enable row level security;
alter table mm_transactions  enable row level security;
alter table mm_debts         enable row level security;
alter table mm_goals         enable row level security;
alter table mm_preferences   enable row level security;

-- Subscriptions: own only
create policy "mm_sub_own" on mm_subscriptions
  for all using (auth.uid() = user_id);

-- Households: owner or member
create policy "mm_household_access" on mm_households
  for all using (
    auth.uid() = owner_id or
    auth.uid() in (
      select user_id from mm_members
      where household_id = mm_households.id and status = 'active'
    )
  );

-- Members: household-scoped
create policy "mm_members_access" on mm_members
  for all using (
    auth.uid() in (
      select user_id from mm_members m2
      where m2.household_id = mm_members.household_id and m2.status = 'active'
    )
  );

-- Accounts: household-scoped
create policy "mm_accounts_access" on mm_accounts
  for all using (
    auth.uid() in (
      select user_id from mm_members
      where household_id = mm_accounts.household_id and status = 'active'
    )
  );

-- Categories: household-scoped
create policy "mm_categories_access" on mm_categories
  for all using (
    auth.uid() in (
      select user_id from mm_members
      where household_id = mm_categories.household_id and status = 'active'
    )
  );

-- Transactions: household-scoped
create policy "mm_transactions_access" on mm_transactions
  for all using (
    auth.uid() in (
      select user_id from mm_members
      where household_id = mm_transactions.household_id and status = 'active'
    )
  );

-- Debts: household-scoped
create policy "mm_debts_access" on mm_debts
  for all using (
    auth.uid() in (
      select user_id from mm_members
      where household_id = mm_debts.household_id and status = 'active'
    )
  );

-- Goals: household-scoped
create policy "mm_goals_access" on mm_goals
  for all using (
    auth.uid() in (
      select user_id from mm_members
      where household_id = mm_goals.household_id and status = 'active'
    )
  );

-- Preferences: own only
create policy "mm_prefs_own" on mm_preferences
  for all using (auth.uid() = user_id);

-- ─────────────────────────────────────────────────────────────────────────────
-- Default Accounts (seeded per household on signup)
-- Checking, Savings — always created
-- ─────────────────────────────────────────────────────────────────────────────

-- ─────────────────────────────────────────────────────────────────────────────
-- Default Categories (seeded per household on signup)
--
-- Income:   Salary | Freelance | Side Hustle | Investments | Business Revenue | Other Income
-- Expense:  Housing | Food & Groceries | Transportation | Utilities | Healthcare |
--           Entertainment | Clothing | Education | Savings Transfer |
--           Business Expense | Debt Payment | Other
-- ─────────────────────────────────────────────────────────────────────────────
