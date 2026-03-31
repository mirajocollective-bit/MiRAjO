-- ═══ COURSES ═══
create table if not exists courses (
  id uuid primary key default gen_random_uuid(),
  slug text unique not null,
  title text not null,
  description text,
  thumbnail_url text,
  created_at timestamptz default now()
);

-- ═══ MODULES (chapters inside a course) ═══
create table if not exists modules (
  id uuid primary key default gen_random_uuid(),
  course_id uuid references courses(id) on delete cascade,
  title text not null,
  position int not null default 0,
  created_at timestamptz default now()
);

-- ═══ LESSONS (individual videos/content inside a module) ═══
create table if not exists lessons (
  id uuid primary key default gen_random_uuid(),
  module_id uuid references modules(id) on delete cascade,
  title text not null,
  content text,
  video_url text,
  position int not null default 0,
  created_at timestamptz default now()
);

-- ═══ ENROLLMENTS ═══
create table if not exists enrollments (
  id uuid primary key default gen_random_uuid(),
  user_id uuid references auth.users(id) on delete cascade,
  course_id uuid references courses(id) on delete cascade,
  enrolled_at timestamptz default now(),
  unique(user_id, course_id)
);

-- ═══ PROGRESS ═══
create table if not exists progress (
  id uuid primary key default gen_random_uuid(),
  user_id uuid references auth.users(id) on delete cascade,
  lesson_id uuid references lessons(id) on delete cascade,
  completed boolean default false,
  completed_at timestamptz,
  unique(user_id, lesson_id)
);

-- ═══ ROW LEVEL SECURITY ═══
alter table courses enable row level security;
alter table modules enable row level security;
alter table lessons enable row level security;
alter table enrollments enable row level security;
alter table progress enable row level security;

-- Anyone can read courses and modules and lessons
create policy "Public can view courses" on courses for select using (true);
create policy "Public can view modules" on modules for select using (true);
create policy "Public can view lessons" on lessons for select using (true);

-- Users can only see their own enrollments
create policy "Users see own enrollments" on enrollments for select using (auth.uid() = user_id);
create policy "Service role can insert enrollments" on enrollments for insert with check (true);

-- Users can only see and update their own progress
create policy "Users see own progress" on progress for select using (auth.uid() = user_id);
create policy "Users update own progress" on progress for insert with check (auth.uid() = user_id);
create policy "Users mark complete" on progress for update using (auth.uid() = user_id);

-- ═══ INSERT 25D25N COURSE ═══
insert into courses (slug, title, description)
values (
  '25-days-and-25-nights',
  '25 Days & 25 Nights',
  'A 25-day leadership and personal development program by Miranda Johnson. Full course access to all modules on the MiRAjO platform.'
)
on conflict (slug) do nothing;
