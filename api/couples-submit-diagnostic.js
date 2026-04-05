// POST /api/couples-submit-diagnostic
// Marks this partner's diagnostic complete.
// When both partners are done, calculates domain scores from scenario answers,
// determines unlocked modules, generates the Partnership Report, and queues emails.

import { createClient } from '@supabase/supabase-js';
import { queueSequence } from './_emails.js';

const supabase = createClient(
  process.env.SUPABASE_URL,
  process.env.SUPABASE_SERVICE_ROLE_KEY
);

const DOMAINS = ['business', 'finances', 'family', 'relationship'];

// Unlock a domain if either partner averages below 3.0 or the gap between them is >= 1.0
function shouldUnlock(avgA, avgB) {
  if (avgA === null || avgB === null) return true;
  return avgA < 3.0 || avgB < 3.0 || Math.abs(avgA - avgB) >= 1.0;
}

function average(scores) {
  if (!scores?.length) return null;
  return scores.reduce((sum, s) => sum + s, 0) / scores.length;
}

export default async function handler(req, res) {
  if (req.method !== 'POST') return res.status(405).json({ error: 'Method not allowed' });

  const { user_id, couple_id } = req.body || {};
  if (!user_id || !couple_id) {
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

  // Mark this partner's diagnostic as complete
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

  const partnerADone = completions?.some(c => c.user_id === couple.partner_a_user_id);
  const partnerBDone = completions?.some(c => c.user_id === couple.partner_b_user_id);
  const bothDone = !!(partnerADone && partnerBDone);

  if (!bothDone) {
    return res.status(200).json({ success: true, report_ready: false });
  }

  // Both done — check if report already generated
  const { data: existingReport } = await supabase
    .from('partnership_reports')
    .select('id')
    .eq('couple_id', couple_id)
    .single();

  if (existingReport) {
    return res.status(200).json({ success: true, report_ready: true });
  }

  // Load all diagnostic answers for this couple
  const { data: allAnswers } = await supabase
    .from('diagnostic_answers')
    .select('user_id, domain, score')
    .eq('couple_id', couple_id);

  // Group scores by domain + partner
  const domainScores = {};
  for (const row of (allAnswers || [])) {
    if (!domainScores[row.domain]) domainScores[row.domain] = {};
    if (!domainScores[row.domain][row.user_id]) domainScores[row.domain][row.user_id] = [];
    domainScores[row.domain][row.user_id].push(row.score);
  }

  // Determine unlocked domains
  const unlocked_domains = [];
  for (const domain of DOMAINS) {
    const avgA = average(domainScores[domain]?.[couple.partner_a_user_id]);
    const avgB = average(domainScores[domain]?.[couple.partner_b_user_id]);
    if (shouldUnlock(avgA, avgB)) unlocked_domains.push(domain);
  }

  if (unlocked_domains.length === DOMAINS.length) unlocked_domains.push('all');

  // Build report_data: domain averages + raw score arrays for display
  const report_data = {};
  for (const domain of DOMAINS) {
    const aScores = domainScores[domain]?.[couple.partner_a_user_id] || [];
    const bScores = domainScores[domain]?.[couple.partner_b_user_id] || [];
    report_data[domain] = {
      partner_a_avg: average(aScores),
      partner_b_avg: average(bScores),
      partner_a_scores: aScores,
      partner_b_scores: bScores,
    };
  }

  // Insert partnership report
  const { error: reportError } = await supabase
    .from('partnership_reports')
    .insert({
      couple_id,
      unlocked_domains,
      report_data,
      generated_at: new Date().toISOString(),
    });

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
