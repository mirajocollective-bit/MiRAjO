// api/sync-eventbrite.js — pulls all Eventbrite attendees into Supabase + Resend
import { createClient } from '@supabase/supabase-js';
import { Resend } from 'resend';
import { logSubscriber } from './_subscribers.js';

const supabase = createClient(
  process.env.SUPABASE_URL,
  process.env.SUPABASE_SERVICE_ROLE_KEY
);
const resend = new Resend(process.env.RESEND_API_KEY);

function checkAuth(req) {
  const token = (req.headers.authorization || '').replace('Bearer ', '').trim();
  return token && token === process.env.ADMIN_PASSWORD;
}

async function fetchEventPage(url, apiKey) {
  const res = await fetch(url, { headers: { Authorization: `Bearer ${apiKey}` } });
  if (!res.ok) {
    const body = await res.text();
    throw new Error(`${res.status} — ${body}`);
  }
  return res.json();
}

async function getOrganizerEvents(organizerId, apiKey) {
  const seenIds = new Set();
  const events = [];

  // Fetch live/upcoming and ended events separately
  for (const status of ['live', 'ended']) {
    let url = `https://www.eventbriteapi.com/v3/organizers/${organizerId}/events/?status=${status}&order_by=start_asc`;
    try {
      while (url) {
        const data = await fetchEventPage(url, apiKey);
        for (const e of (data.events || [])) {
          if (!seenIds.has(e.id)) { seenIds.add(e.id); events.push(e); }
        }
        const cont = data.pagination?.continuation;
        url = data.pagination?.has_more_items && cont
          ? `https://www.eventbriteapi.com/v3/organizers/${organizerId}/events/?status=${status}&order_by=start_asc&continuation=${cont}`
          : null;
      }
    } catch (err) {
      console.warn(`[sync-eventbrite] status=${status} fetch failed:`, err.message);
    }
  }
  return events;
}

async function getEventAttendees(eventId, apiKey) {
  const headers = { Authorization: `Bearer ${apiKey}` };
  const attendees = [];
  let url = `https://www.eventbriteapi.com/v3/events/${eventId}/attendees/?expand=profile`;
  const errors = [];

  while (url) {
    const res = await fetch(url, { headers });
    if (!res.ok) {
      const body = await res.text();
      errors.push(`${res.status}: ${body}`);
      break;
    }
    const data = await res.json();
    attendees.push(...(data.attendees || []));
    const cont = data.pagination?.continuation;
    url = data.pagination?.has_more_items && cont
      ? `https://www.eventbriteapi.com/v3/events/${eventId}/attendees/?expand=profile&continuation=${cont}`
      : null;
  }

  if (errors.length) console.warn(`[sync-eventbrite] attendees ${eventId}:`, errors[0]);
  return attendees;
}

export default async function handler(req, res) {
  res.setHeader('Access-Control-Allow-Origin', 'https://www.mirajoco.org');
  res.setHeader('Access-Control-Allow-Methods', 'POST, OPTIONS');
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type, Authorization');

  if (req.method === 'OPTIONS') return res.status(200).end();
  if (req.method !== 'POST') return res.status(405).json({ error: 'Method not allowed' });
  if (!checkAuth(req)) return res.status(401).json({ error: 'Unauthorized' });

  const apiKey = (process.env.EVENTBRITE_API_KEY || '').trim();
  if (!apiKey) return res.status(500).json({ error: 'Eventbrite API key not configured' });

  try {
    const headers = { Authorization: `Bearer ${apiKey}` };

    // Get organizer ID from known event
    const eventRes = await fetch('https://www.eventbriteapi.com/v3/events/1983918066342/', { headers });
    if (!eventRes.ok) throw new Error(`Organizer lookup failed: ${eventRes.status}`);
    const { organizer_id } = await eventRes.json();

    // Get all events
    const events = await getOrganizerEvents(organizer_id, apiKey);

    // Collect all attendees across all events
    const seen = new Map(); // email -> { first_name, last_name }
    const attendeeErrors = [];
    for (const event of events) {
      const attendees = await getEventAttendees(event.id, apiKey, attendeeErrors);
      for (const a of attendees) {
        const email = (a.profile?.email || '').trim().toLowerCase();
        if (!email || seen.has(email)) continue;
        seen.set(email, {
          first_name: (a.profile?.first_name || '').trim(),
          last_name:  (a.profile?.last_name  || '').trim(),
        });
      }
    }

    if (seen.size === 0) {
      return res.status(200).json({ added: 0, duplicates: 0, total: 0, events: events.length, attendeeError: attendeeErrors[0] || null });
    }

    // Check which emails already exist in subscribers table
    const allEmails = Array.from(seen.keys());
    const { data: existing } = await supabase
      .from('subscribers')
      .select('email')
      .in('email', allEmails);

    const existingSet = new Set((existing || []).map(r => r.email.toLowerCase()));

    // Process each attendee
    let added = 0;
    let duplicates = 0;

    for (const [email, profile] of seen.entries()) {
      if (existingSet.has(email)) {
        duplicates++;
        continue;
      }

      // Add to Resend audience
      try {
        await resend.contacts.create({
          audienceId: process.env.RESEND_AUDIENCE_ID,
          email,
          firstName: profile.first_name,
          lastName:  profile.last_name,
          unsubscribed: false,
        });
      } catch (err) {
        // Contact may already exist in Resend — log and continue
        console.warn(`[sync-eventbrite] Resend skip ${email}: ${err.message}`);
      }

      // Log to subscribers table
      await logSubscriber(supabase, email, profile.first_name, 'eventbrite');
      added++;
    }

    return res.status(200).json({
      added,
      duplicates,
      total: seen.size,
      events: events.length,
    });

  } catch (err) {
    console.error('[sync-eventbrite]', err.message);
    return res.status(500).json({ error: err.message });
  }
}
