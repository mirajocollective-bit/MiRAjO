-- Migration: add new profile fields to partner_profiles
-- Run in Supabase SQL editor

ALTER TABLE partner_profiles
  ADD COLUMN IF NOT EXISTS long_term_vision   TEXT,
  ADD COLUMN IF NOT EXISTS risk_tolerance     TEXT,
  ADD COLUMN IF NOT EXISTS both_full_time     TEXT,
  ADD COLUMN IF NOT EXISTS public_visibility  TEXT,
  ADD COLUMN IF NOT EXISTS primary_income     TEXT;
