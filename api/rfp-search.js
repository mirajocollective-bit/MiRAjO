export default async function handler(req, res) {
  const SAM_API_KEY = process.env.SAM_API_KEY;
  const { keyword = '', page = 1 } = req.query;

  const keywords = [
    keyword || 'professional development training',
  ];

  const naicsCodes = ['611430', '611699', '611710', '541611', '522390', '624310'];
  const results = [];
  const seen = new Set();

  for (const naics of naicsCodes) {
    for (const kw of keywords) {
      try {
        const params = new URLSearchParams({
          api_key: SAM_API_KEY,
          keyword: kw,
          naicsCode: naics,
          limit: '20',
          offset: String((parseInt(page) - 1) * 20),
          postedFrom: getDateDaysAgo(90),
          postedTo: getTodayDate(),
          status: 'active',
        });

        const url = `https://api.sam.gov/opportunities/v2/search?${params}`;
        const response = await fetch(url);

        if (!response.ok) continue;

        const data = await response.json();
        const opps = data.opportunitiesData || [];

        for (const opp of opps) {
          if (seen.has(opp.noticeId)) continue;
          seen.add(opp.noticeId);

          // Filter out irrelevant ones
          const title = (opp.title || '').toLowerCase();
          const desc = (opp.description || '').toLowerCase();
          const skip = ['engineer', 'clinical', 'medical', 'physician', 'dental',
            'nursing', 'radiology', 'construction', 'hvac', 'plumbing',
            'electrical', 'civil', 'structural', 'it support', 'cybersecurity',
            'software development', 'hardware', 'maintenance', 'janitorial'];

          if (skip.some(s => title.includes(s) || desc.includes(s))) continue;

          results.push({
            id: opp.noticeId,
            title: opp.title,
            agency: opp.organizationName || opp.department,
            posted: opp.postedDate,
            deadline: opp.responseDeadLine,
            setAside: opp.typeOfSetAside || 'None',
            naics: opp.naicsCode,
            type: opp.type,
            link: `https://sam.gov/opp/${opp.noticeId}/view`,
            description: (opp.description || '').substring(0, 300),
          });
        }
      } catch (e) {
        continue;
      }
    }
  }

  // Sort by deadline ascending
  results.sort((a, b) => new Date(a.deadline) - new Date(b.deadline));

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
