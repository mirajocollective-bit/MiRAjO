// POST /api/couples-submit-diagnostic
// Saves diagnostic responses + marks completion.
// If both partners are done, generates the Partnership Report and queues report-ready emails.

import { createClient } from '@supabase/supabase-js';
import { queueSequence } from './_emails.js';

const supabase = createClient(
  process.env.SUPABASE_URL,
  process.env.SUPABASE_SERVICE_ROLE_KEY
);

// Unlock a domain if either partner rated it <= 3, or the gap between ratings >= 2
function shouldUnlock(ratingA, ratingB) {
  if (!ratingA || !ratingB) return true; // missing data → unlock to be safe
  return ratingA <= 3 || ratingB <= 3 || Math.abs(ratingA - ratingB) >= 2;
}

export default async function handler(req, res) {
  if (req.method !== 'POST') return res.status(405).json({ error: 'Method not allowed' });

  const { user_id, couple_id, responses } = req.body || {};
  if (!user_id || !couple_id || !responses) {
    return res.status(400).json({ error: 'Missing required fields' });
  }

  // Verify the user belongs to this couple
  const { data: couple } = await supabase
    .from('couples')
    .select('id, partner_a_user_id, partner_b_user_id')
    .eq('id', couple_id)
    .single();

  if (!couple || (couple.partner_a_user_id !== user_id && couple.partner_b_user_id !== user_id)) {
    return res.status(403).json({ error: 'Unauthorized' });
  }

  // Save all responses (upsert by couple_id + user_id + domain + question_key)
  const rows = [];
  for (const [domain, questions] of Object.entries(responses)) {
    for (const [question_key, response_text] of Object.entries(questions)) {
      rows.push({
        couple_id,
        user_id,
        domain,
        question_key,
        response_text: String(response_text),
      });
    }
  }

  const { error: saveError } = await supabase
    .from('diagnostic_responses')
    .upsert(rows, { onConflict: 'couple_id,user_id,domain,question_key' });

  if (saveError) {
    console.error('Save responses error:', saveError);
    return res.status(500).json({ error: 'Failed to save responses' });
  }

  // Mark this user's diagnostic as complete
  const { error: completionError } = await supabase
    .from('diagnostic_completion')
    .upsert({ couple_id, user_id, completed_at: new Date().toISOString() },
             { onConflict: 'couple_id,user_id' });

  if (completionError) {
    console.error('Completion error:', completionError);
    return res.status(500).json({ error: 'Failed to mark completion' });
  }

  // Check if both partners are now complete
  const { data: completions } = await supabase
    .from('diagnostic_completion')
    .select('user_id')
    .eq('couple_id', couple_id);

  const bothDone = completions?.length === 2;

  if (!bothDone) {
    return res.status(200).json({ success: true, report_ready: false });
  }

  // Both partners done — check if report already exists
  const { data: existingReport } = await supabase
    .from('partnership_reports')
    .select('id')
    .eq('couple_id', couple_id)
    .single();

  if (existingReport) {
    return res.status(200).json({ success: true, report_ready: true });
  }

  // Load both partners' alignment ratings
  const partnerId = user_id === couple.partner_a_user_id ? couple.partner_b_user_id : couple.partner_a_user_id;
  const DOMAINS = ['business', 'finances', 'family', 'relationship'];

  const { data: allRatings } = await supabase
    .from('diagnostic_responses')
    .select('user_id, domain, response_text')
    .eq('couple_id', couple_id)
    .eq('question_key', 'alignment_rating');

  const ratings = {};
  for (const row of (allRatings || [])) {
    if (!ratings[row.domain]) ratings[row.domain] = {};
    ratings[row.domain][row.user_id] = parseInt(row.response_text, 10);
  }

  // Determine unlocked domains
  const unlocked_domains = [];
  for (const domain of DOMAINS) {
    const rA = ratings[domain]?.[couple.partner_a_user_id];
    const rB = ratings[domain]?.[couple.partner_b_user_id];
    if (shouldUnlock(rA, rB)) unlocked_domains.push(domain);
  }

  // If all 4 are misaligned, set 'all' flag for easy frontend check
  if (unlocked_domains.length === DOMAINS.length) unlocked_domains.push('all');

  // Load all responses for report_data
  const { data: allResponses } = await supabase
    .from('diagnostic_responses')
    .select('user_id, domain, question_key, response_text')
    .eq('couple_id', couple_id);

  // Build report_data: { domain: { question_key: { partner_a: text, partner_b: text } } }
  const report_data = {};
  for (const row of (allResponses || [])) {
    if (!report_data[row.domain]) report_data[row.domain] = {};
    if (!report_data[row.domain][row.question_key]) report_data[row.domain][row.question_key] = {};
    const who = row.user_id === couple.partner_a_id ? 'partner_a' : 'partner_b';
    report_data[row.domain][row.question_key][who] = row.response_text;
  }

  // Insert partnership report
  const { error: reportError } = await supabase
    .from('partnership_reports')
    .insert({ couple_id, unlocked_domains, report_data, generated_at: new Date().toISOString() });

  if (reportError) {
    console.error('Report insert error:', reportError);
    return res.status(500).json({ error: 'Failed to generate report' });
  }

  // Queue report-ready emails to both partners
  const { data: partnerAProfile } = await supabase.auth.admin.getUserById(couple.partner_a_user_id);
  const { data: partnerBProfile } = await supabase.auth.admin.getUserById(couple.partner_b_user_id);

  const aEmail = partnerAProfile?.user?.email;
  const bEmail = partnerBProfile?.user?.email;
  const aName  = partnerAProfile?.user?.user_metadata?.first_name || '';
  const bName  = partnerBProfile?.user?.user_metadata?.first_name || '';

  const DASHBOARD = `${process.env.SITE_URL}/programs/couples-dashboard`;

  if (aEmail) await queueSequence(supabase, aEmail, 'report-ready-cie', aName, { dashboard_url: DASHBOARD });
  if (bEmail) await queueSequence(supabase, bEmail, 'report-ready-cie', bName, { dashboard_url: DASHBOARD });

  return res.status(200).json({ success: true, report_ready: true, unlocked_domains });
}
