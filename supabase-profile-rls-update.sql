-- ═══════════════════════════════════════════════════════════════
-- PARTNER PROFILES — RLS update
-- Run this in Supabase SQL Editor AFTER supabase-partner-profiles.sql
-- Allows both partners in a couple to read each other's profile
-- (needed for the Partnership Report page)
-- ═══════════════════════════════════════════════════════════════

create policy "Partners can view each other's profiles"
  on partner_profiles for select
  using (
    exists (
      select 1 from couples c
      where c.id = couple_id
      and (c.partner_a_user_id = auth.uid() or c.partner_b_user_id = auth.uid())
    )
  );
