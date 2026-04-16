// Shared helper — logs every email capture to the subscribers table.
// Never throws. Subscriber logging should never break the calling API.
//
// Sources in use:
//   newsletter          — waitlist form on blog/notes pages
//   note-[slug]         — waitlist form on a specific note page
//   alignment-audit     — free alignment audit completion
//   couples-scorecard   — free couples scorecard completion
//   course-25d25n       — 25 Days & 25 Nights purchase
//   course-cie          — Couples in Entrepreneurship purchase
//   money-moves         — Money Moves account provisioned
//   coaching-apply      — coaching application submitted

export async function logSubscriber(supabase, email, firstName, source) {
  try {
    await supabase
      .from('subscribers')
      .upsert(
        {
          email: email.trim().toLowerCase(),
          first_name: (firstName || '').trim(),
          source,
        },
        { onConflict: 'email,source', ignoreDuplicates: true }
      );
  } catch (err) {
    console.error('[subscribers] Log error:', err.message);
  }
}
