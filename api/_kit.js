// Shared Kit (ConvertKit) API helpers

function secret() {
  return process.env.CONVERTKIT_API_SECRET;
}

export async function addTag(email, tagName, fields = {}) {
  const tagsRes = await fetch(`https://api.convertkit.com/v3/tags?api_secret=${secret()}`);
  const tagsData = await tagsRes.json();
  const tag = tagsData.tags?.find(t => t.name === tagName);
  if (!tag) { console.error(`[kit] Tag not found: ${tagName}`); return false; }

  const res = await fetch(`https://api.convertkit.com/v3/tags/${tag.id}/subscribe`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ api_secret: secret(), email, ...fields }),
  });
  return res.ok;
}

export async function addToSequence(email, sequenceName, firstName = '') {
  const seqRes = await fetch(`https://api.convertkit.com/v3/sequences?api_secret=${secret()}`);
  const seqData = await seqRes.json();
  // Kit calls sequences "courses" internally
  const seq = seqData.courses?.find(s => s.name === sequenceName);
  if (!seq) { console.error(`[kit] Sequence not found: ${sequenceName}`); return false; }

  const res = await fetch(`https://api.convertkit.com/v3/sequences/${seq.id}/subscribe`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ api_secret: secret(), email, first_name: firstName }),
  });
  return res.ok;
}
