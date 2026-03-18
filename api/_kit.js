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

