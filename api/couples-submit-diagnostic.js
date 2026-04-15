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

// Unlock a domain's modules if either partner's avg is below 3.0,
// or if there's a gap of 0.5+ between partners (meaningful misalignment).
// If null scores (no answers), unlock by default.
function shouldUnlock(avgA, avgB) {
  if (avgA === null || avgB === null) return true;
  return avgA < 3.0 || avgB < 3.0 || Math.abs(avgA - avgB) >= 0.5;
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
    // One partner just finished — send reminder to the other
    try {
      const completedId  = user_id;
      const waitingId    = user_id === couple.partner_a_user_id ? couple.partner_b_user_id : couple.partner_a_user_id;
      const { data: completedProfile } = await supabase.auth.admin.getUserById(completedId);
      const { data: waitingProfile   } = await supabase.auth.admin.getUserById(waitingId);
      const completedName = completedProfile?.user?.user_metadata?.first_name || '';
      const waitingEmail  = waitingProfile?.user?.email;
      const waitingName   = waitingProfile?.user?.user_metadata?.first_name || '';
      if (waitingEmail) {
        await queueSequence(supabase, waitingEmail, 'diagnostic-reminder-cie', waitingName, { partner_name: completedName });
      }
    } catch (_) {}
    return res.status(200).json({ success: true, report_ready: false });
  }

  // Both done — check if report already generated with valid unlocked_domains
  const { data: existingReport } = await supabase
    .from('partnership_reports')
    .select('id, unlocked_domains')
    .eq('couple_id', couple_id)
    .single();

  // If report exists AND has unlocked domains already, nothing to do
  if (existingReport && existingReport.unlocked_domains?.length > 0) {
    return res.status(200).json({ success: true, report_ready: true });
  }
  // If report exists but unlocked_domains is empty, recalculate and update it

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

  // Determine unlocked domains based on misalignment
  const unlocked_domains = [];
  for (const domain of DOMAINS) {
    const avgA = average(domainScores[domain]?.[couple.partner_a_user_id]);
    const avgB = average(domainScores[domain]?.[couple.partner_b_user_id]);
    if (shouldUnlock(avgA, avgB)) unlocked_domains.push(domain);
  }

  // If perfectly aligned everywhere, unlock all (no couple leaves with zero modules)
  if (unlocked_domains.length === 0) unlocked_domains.push(...DOMAINS);

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

  // Insert new report, or update existing one that had empty unlocked_domains
  let reportError;
  if (existingReport) {
    const { error } = await supabase
      .from('partnership_reports')
      .update({ unlocked_domains, report_data })
      .eq('id', existingReport.id);
    reportError = error;
  } else {
    const { error } = await supabase
      .from('partnership_reports')
      .insert({ couple_id, unlocked_domains, report_data, generated_at: new Date().toISOString() });
    reportError = error;
  }

  if (reportError) {
    console.error('Report insert/update error:', reportError);
    return res.status(500).json({ error: 'Failed to generate report' });
  }

  // Queue report-ready emails — only when first generated, not on recalculation
  if (!existingReport) {
    const { data: partnerAProfile } = await supabase.auth.admin.getUserById(couple.partner_a_user_id);
    const { data: partnerBProfile } = await supabase.auth.admin.getUserById(couple.partner_b_user_id);

    const aEmail = partnerAProfile?.user?.email;
    const bEmail = partnerBProfile?.user?.email;
    const aName  = partnerAProfile?.user?.user_metadata?.first_name || '';
    const bName  = partnerBProfile?.user?.user_metadata?.first_name || '';

    const DASHBOARD = `${process.env.SITE_URL}/programs/couples-dashboard`;

    if (aEmail) await queueSequence(supabase, aEmail, 'report-ready-cie', aName, { dashboard_url: DASHBOARD });
    if (bEmail) await queueSequence(supabase, bEmail, 'report-ready-cie', bName, { dashboard_url: DASHBOARD });
  }

  return res.status(200).json({ success: true, report_ready: true, unlocked_domains });
}
