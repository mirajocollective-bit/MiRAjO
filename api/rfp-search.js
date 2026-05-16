const TRAINING_NAICS = new Set([
  '611430','611699','611710','611519','541611','541612',
  '541618','711510','522390','541990','624310','624190','611420'
]);

const TRAINING_KEYWORDS = [
  'training','education','workforce','professional development','leadership',
  'financial literacy','entrepreneurship','curriculum','instruction','coaching',
  'workshop','seminar','learning','facilitation','mentor','tutor','program development'
];

const EXCLUDE_KEYWORDS = [
  'pump','valve','screw','bolt','tire','circuit','cable','pipe','sensor',
  'engine','aircraft','turbine','weapon','ammunition','vehicle','ship',
  'medical device','pharmaceutical','radiology','clinical documentation',
  'physician','nursing','dental','surgery','construction','hvac','plumbing',
  'electrical','civil engineer','sandblast','painting','janitorial','laundry',
  'food service','catering','grounds maintenance','mowing','pest control'
];

export default async function handler(req, res) {
  const SAM_API_KEY = process.env.SAM_API_KEY;
  if (!SAM_API_KEY) return res.status(500).json({ error: 'SAM_API_KEY not configured' });

  const { keyword = 'workforce development training' } = req.query;

  const searchTerms = [
    keyword,
    'professional development training',
    'workforce training services',
    'leadership development training',
    'financial literacy education',
  ];

  const seen = new Set();
  const results = [];

  for (const term of searchTerms) {
    try {
      const params = new URLSearchParams({
        api_key: SAM_API_KEY,
        keyword: term,
        limit: '50',
        postedFrom: getDateDaysAgo(120),
        postedTo: getTodayDate(),
      });

      const url = `https://api.sam.gov/opportunities/v2/search?${params}`;
      const response = await fetch(url);
      if (!response.ok) continue;

      const data = await response.json();
      const opps = data.opportunitiesData || [];

      for (const opp of opps) {
        if (seen.has(opp.noticeId)) continue;

        const title = (opp.title || '').toLowerCase();
        const desc = (opp.description || '').toLowerCase();
        const naics = opp.naicsCode || '';

        // Must match training NAICS OR contain training keywords in title
        const naicsMatch = TRAINING_NAICS.has(naics);
        const titleMatch = TRAINING_KEYWORDS.some(kw => title.includes(kw));
        const descMatch = TRAINING_KEYWORDS.some(kw => desc.includes(kw));

        if (!naicsMatch && !titleMatch && !descMatch) continue;

        // Exclude clearly irrelevant items
        if (EXCLUDE_KEYWORDS.some(kw => title.includes(kw))) continue;

        seen.add(opp.noticeId);
        results.push({
          id: opp.noticeId,
          title: opp.title,
          agency: opp.organizationName || opp.department || 'Federal Agency',
          posted: opp.postedDate,
          deadline: opp.responseDeadLine,
          setAside: opp.typeOfSetAside || '',
          setAsideDesc: opp.typeOfSetAsideDescription || '',
          naics: naics,
          type: opp.type,
          link: `https://sam.gov/opp/${opp.noticeId}/view`,
          description: (opp.description || '').replace(/<[^>]*>/g, '').substring(0, 400),
        });
      }
    } catch (e) {
      continue;
    }
  }

  // Sort by deadline ascending (soonest first)
  results.sort((a, b) => {
    if (!a.deadline) return 1;
    if (!b.deadline) return -1;
    return new Date(a.deadline) - new Date(b.deadline);
  });

  res.status(200).json({ count: results.length, keyword, results });
}

function getDateDaysAgo(days) {
  const d = new Date();
  d.setDate(d.getDate() - days);
  return `${String(d.getMonth() + 1).padStart(2, '0')}/${String(d.getDate()).padStart(2, '0')}/${d.getFullYear()}`;
}

function getTodayDate() {
  const d = new Date();
  return `${String(d.getMonth() + 1).padStart(2, '0')}/${String(d.getDate()).padStart(2, '0')}/${d.getFullYear()}`;
}
