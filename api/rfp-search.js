const TRAINING_NAICS = ['611430', '611699', '611710', '611519', '541611', '541612', '541618', '541990', '624310', '624190', '611420'];

const KEYWORD_SEARCHES = [
  'workforce development training',
  'professional development training',
  'leadership development training',
  'financial literacy education',
  'entrepreneurship training',
];

const EXCLUDE_KEYWORDS = [
  'pump','valve','screw','bolt','tire','circuit','cable','pipe','sensor',
  'engine','aircraft','turbine','weapon','ammunition','vehicle','ship',
  'medical device','pharmaceutical','radiology','clinical documentation',
  'physician','nursing','dental','surgery','construction','hvac','plumbing',
  'electrical','civil engineer','sandblast','painting','janitorial','laundry',
  'food service','catering','grounds maintenance','mowing','pest control',
  'custodial','landscaping','roofing','flooring','masonry','welding',
];

async function fetchSAM(params, apiKey) {
  const p = new URLSearchParams({
    ...params,
    api_key: apiKey,
    limit: '25',
    postedFrom: getDateDaysAgo(120),
    postedTo: getTodayDate(),
  });
  try {
    const response = await fetch(`https://api.sam.gov/opportunities/v2/search?${p}`);
    if (!response.ok) return [];
    const data = await response.json();
    return data.opportunitiesData || [];
  } catch {
    return [];
  }
}

export default async function handler(req, res) {
  const SAM_API_KEY = process.env.SAM_API_KEY;
  if (!SAM_API_KEY) return res.status(500).json({ error: 'SAM_API_KEY not configured' });

  const { keyword } = req.query;

  // Run all searches in parallel — NAICS-based (reliable) + keyword-based (supplemental)
  const keywords = [...KEYWORD_SEARCHES];
  if (keyword && !KEYWORD_SEARCHES.includes(keyword)) keywords.push(keyword);

  const allFetches = [
    ...TRAINING_NAICS.map(naics => fetchSAM({ naics }, SAM_API_KEY)),
    ...keywords.map(kw => fetchSAM({ keyword: kw }, SAM_API_KEY)),
  ];

  const allBatches = await Promise.all(allFetches);

  const seen = new Set();
  const results = [];

  for (const opps of allBatches) {
    for (const opp of opps) {
      if (seen.has(opp.noticeId)) continue;

      const title = (opp.title || '').toLowerCase();
      if (EXCLUDE_KEYWORDS.some(kw => title.includes(kw))) continue;

      // Award notices are past-due — skip them for bid tracking
      if (opp.type === 'Award Notice') continue;

      seen.add(opp.noticeId);
      results.push({
        id: opp.noticeId,
        title: opp.title,
        agency: opp.organizationName || opp.department || 'Federal Agency',
        posted: opp.postedDate,
        deadline: opp.responseDeadLine,
        setAside: opp.typeOfSetAside || '',
        setAsideDesc: opp.typeOfSetAsideDescription || '',
        naics: opp.naicsCode || '',
        type: opp.type,
        link: `https://sam.gov/opp/${opp.noticeId}/view`,
        description: (opp.description || '').replace(/<[^>]*>/g, '').substring(0, 400),
      });
    }
  }

  results.sort((a, b) => {
    if (!a.deadline) return 1;
    if (!b.deadline) return -1;
    return new Date(a.deadline) - new Date(b.deadline);
  });

  res.status(200).json({ count: results.length, results });
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
