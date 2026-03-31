import { createClient } from '@supabase/supabase-js';

const supabase = createClient(
  process.env.SUPABASE_URL,
  process.env.SUPABASE_SERVICE_ROLE_KEY
);

const DEFAULT_ACCOUNTS = [
  { name: 'Checking', type: 'checking', current_balance: 0, color: '#256B42', sort_order: 0 },
  { name: 'Savings',  type: 'savings',  current_balance: 0, color: '#C4A245', sort_order: 1 },
];

const DEFAULT_CATEGORIES = [
  { name: 'Salary',           type: 'income',  color: '#6DC48A' },
  { name: 'Freelance',        type: 'income',  color: '#6DC48A' },
  { name: 'Side Hustle',      type: 'income',  color: '#6DC48A' },
  { name: 'Investments',      type: 'income',  color: '#6DC48A' },
  { name: 'Other Income',     type: 'income',  color: '#6DC48A' },
  { name: 'Housing',          type: 'expense', color: '#C4A245' },
  { name: 'Food & Groceries', type: 'expense', color: '#C4A245' },
  { name: 'Transportation',   type: 'expense', color: '#C4A245' },
  { name: 'Utilities',        type: 'expense', color: '#C4A245' },
  { name: 'Healthcare',       type: 'expense', color: '#C4A245' },
  { name: 'Entertainment',    type: 'expense', color: '#C4A245' },
  { name: 'Clothing',         type: 'expense', color: '#C4A245' },
  { name: 'Education',        type: 'expense', color: '#C4A245' },
  { name: 'Savings Transfer', type: 'expense', color: '#C4A245' },
  { name: 'Business',         type: 'expense', color: '#C4A245' },
  { name: 'Other',            type: 'expense', color: '#C4A245' },
];

export default async function handler(req, res) {
  if (req.method !== 'POST') {
    return res.status(405).json({ error: 'Method not allowed' });
  }

  // Verify auth
  const token = req.headers.authorization?.replace('Bearer ', '');
  if (!token) return res.status(401).json({ error: 'Unauthorized' });

  const { data: { user }, error: authErr } = await supabase.auth.getUser(token);
  if (authErr || !user) return res.status(401).json({ error: 'Unauthorized' });

  // Check if already provisioned
  const { data: existing } = await supabase
    .from('mm_members')
    .select('household_id')
    .eq('user_id', user.id)
    .eq('status', 'active')
    .limit(1);

  if (existing?.length) {
    return res.status(200).json({ provisioned: false, message: 'Already provisioned' });
  }

  // Create household
  const { data: household, error: hhErr } = await supabase
    .from('mm_households')
    .insert({ owner_id: user.id, name: 'My Household' })
    .select('id')
    .single();

  if (hhErr) return res.status(500).json({ error: hhErr.message });

  const householdId = household.id;

  // Member
  await supabase.from('mm_members').insert({
    household_id: householdId,
    user_id:      user.id,
    email:        user.email,
    role:         'owner',
    status:       'active',
  });

  // Subscription (free/manual — real purchases come through webhook)
  await supabase.from('mm_subscriptions').insert({
    user_id:                user.id,
    stripe_customer_id:     'pending',
    stripe_subscription_id: 'pending',
    plan:       'individual',
    billing:    'monthly',
    status:     'active',
    period_end: new Date(Date.now() + 30 * 24 * 60 * 60 * 1000).toISOString(),
    updated_at: new Date().toISOString(),
  });

  // Accounts
  await supabase.from('mm_accounts').insert(
    DEFAULT_ACCOUNTS.map(a => ({ ...a, household_id: householdId }))
  );

  // Categories
  await supabase.from('mm_categories').insert(
    DEFAULT_CATEGORIES.map(c => ({ ...c, household_id: householdId }))
  );

  // Preferences
  await supabase.from('mm_preferences').insert({
    user_id:          user.id,
    personality_mode: 'mom',
    updated_at:       new Date().toISOString(),
  });

  console.log(`mm-provision: provisioned account for ${user.email}`);
  return res.status(200).json({ provisioned: true });
}
