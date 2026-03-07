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
    if (!eventRes.ok) throw new Error(`Event lookup failed: ${eventRes.status}`);
    const eventData = await eventRes.json();
    const organizerId = eventData.organizer_id;

    if (!organizerId) {
      return res.status(200).json({ debug: eventData });
    }

    // Get all events for that organizer
    const response = await fetch(
      `https://www.eventbriteapi.com/v3/organizers/${organizerId}/events/?expand=venue,ticket_classes&order_by=start_asc`,
      { headers }
    );

    if (!response.ok) {
      const errBody = await response.text();
      throw new Error(`Organizer events failed: ${response.status} — ${errBody}`);
    }

    const data = await response.json();

    res.setHeader('Cache-Control', 's-maxage=300, stale-while-revalidate');
    return res.status(200).json(data);
  } catch (error) {
    return res.status(500).json({ error: error.message });
  }
}
