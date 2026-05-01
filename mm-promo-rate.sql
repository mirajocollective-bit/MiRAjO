-- Add promotional rate fields to mm_debts
-- promo_rate:     the temporary rate (e.g. 0 for 0% APR)
-- promo_end_date: when the promo ends; reverts to interest_rate after this date

alter table mm_debts
  add column if not exists promo_rate     numeric(5,2),
  add column if not exists promo_end_date date;
