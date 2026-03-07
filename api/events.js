export default async function handler(req, res) {
  const apiKey = (process.env.EVENTBRITE_API_KEY || '').trim();

  if (!apiKey) {
    return res.status(500).json({ error: 'API key not configured' });
  }

  try {
    const headers = { 'Authorization': `Bearer ${apiKey}` };

    // Get organizer ID from known event
    const eventRes = await fetch(
      'https://www.eventbriteapi.com/v3/events/1983918066342/',
      { headers }
    );
    if (!eventRes.ok) throw new Error(`Eventbrite event lookup error: ${eventRes.status}`);
    const eventData = await eventRes.json();
    const organizerId = eventData.organizer_id;

    // Get all events for that organizer
    const response = await fetch(
      `https://www.eventbriteapi.com/v3/organizers/${organizerId}/events/?expand=venue,ticket_classes&order_by=start_asc&time_filter=current_future`,
      { headers }
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
