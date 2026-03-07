export default async function handler(req, res) {
  const apiKey = (process.env.EVENTBRITE_API_KEY || '').trim();

  if (!apiKey) {
    return res.status(500).json({ error: 'API key not configured' });
  }

  try {
    const response = await fetch(
      'https://www.eventbriteapi.com/v3/users/me/events/?expand=venue,ticket_classes&status=live,started&order_by=start_asc&time_filter=current_future',
      {
        headers: { 'Authorization': `Bearer ${apiKey}` }
      }
    );

    if (!response.ok) {
      throw new Error(`Eventbrite API error: ${response.status}`);
    }

    const data = await response.json();

    res.setHeader('Cache-Control', 's-maxage=300, stale-while-revalidate');
    return res.status(200).json(data);
  } catch (error) {
    return res.status(500).json({ error: error.message });
  }
}
