// POST /api/cie-regenerate-report
// Recalculates unlocked_domains and report_data for an existing report.
// Called when report exists but unlocked_domains is empty.

import { createClient } from '@supabase/supabase-js';

const supabase = createClient(
  process.env.SUPABASE_URL,
  process.env.SUPABASE_SERVICE_ROLE_KEY
);

const DOMAINS = ['business', 'finances', 'family', 'relationship'];

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
  if (!user_id || !couple_id) return res.status(400).json({ error: 'Missing fields' });

  // Verify user belongs to this couple
  const { data: couple } = await supabase
    .from('couples')
    .select('id, partner_a_user_id, partner_b_user_id')
    .eq('id', couple_id)
    .single();

  if (!couple || (couple.partner_a_user_id !== user_id && couple.partner_b_user_id !== user_id)) {
    return res.status(403).json({ error: 'Unauthorized' });
  }

  // Load all diagnostic answers
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

  if (unlocked_domains.length === 0) unlocked_domains.push(...DOMAINS);
  if (unlocked_domains.length === DOMAINS.length) unlocked_domains.push('all');

  // Build report_data
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

  // Update the existing report
  const { error } = await supabase
    .from('partnership_reports')
    .update({ unlocked_domains, report_data })
    .eq('couple_id', couple_id);

  if (error) {
    console.error('Regenerate error:', error);
    return res.status(500).json({ error: 'Failed to update report' });
  }

  console.log(`Report regenerated for couple ${couple_id}: unlocked=${unlocked_domains.join(',')}`);
  return res.status(200).json({ success: true, unlocked_domains });
}
