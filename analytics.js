// analytics.js — MiRAjO site-wide tracking
// ─────────────────────────────────────────────────────────────────
// SETUP REQUIRED: Replace the two placeholder IDs below with your real IDs.
//
//   GA4_ID:          Get from analytics.google.com
//                    Admin → Data Streams → your stream → Measurement ID (G-XXXXXXXXXX)
//
//   META_PIXEL_ID:   Get from business.facebook.com → Events Manager → Connect Data Sources → Web → Pixel
//                    Copy the numeric Pixel ID shown after creation
// ─────────────────────────────────────────────────────────────────

(function () {
  var GA4_ID = 'G-XXXXXXXXXX';        // ← replace with your GA4 Measurement ID
  var META_PIXEL_ID = 'XXXXXXXXXXXXXXX'; // ← replace with your Meta Pixel ID

  var isProd = window.location.hostname === 'www.mirajoco.org' ||
               window.location.hostname === 'mirajoco.org';

  // Only fire tracking on production — skip localhost and Vercel preview URLs
  if (!isProd) return;

  // ── Google Analytics 4 ────────────────────────────────────────────────────
  var gtagScript = document.createElement('script');
  gtagScript.async = true;
  gtagScript.src = 'https://www.googletagmanager.com/gtag/js?id=' + GA4_ID;
  document.head.appendChild(gtagScript);

  window.dataLayer = window.dataLayer || [];
  function gtag() { dataLayer.push(arguments); }
  window.gtag = gtag;
  gtag('js', new Date());
  gtag('config', GA4_ID, { send_page_view: true });

  // ── Meta Pixel ────────────────────────────────────────────────────────────
  !function (f, b, e, v, n, t, s) {
    if (f.fbq) return;
    n = f.fbq = function () { n.callMethod ? n.callMethod.apply(n, arguments) : n.queue.push(arguments); };
    if (!f._fbq) f._fbq = n;
    n.push = n; n.loaded = !0; n.version = '2.0'; n.queue = [];
    t = b.createElement(e); t.async = !0; t.src = v;
    s = b.getElementsByTagName(e)[0]; s.parentNode.insertBefore(t, s);
  }(window, document, 'script', 'https://connect.facebook.net/en_US/fbevents.js');
  window.fbq('init', META_PIXEL_ID);
  window.fbq('track', 'PageView');

  // ── UTM capture ───────────────────────────────────────────────────────────
  // Reads UTM params from the URL and persists them in sessionStorage.
  // They survive internal navigation so you can attribute conversions to the
  // original traffic source for the full session.
  //
  // Usage in LinkedIn (and any other link you share):
  //   https://www.mirajoco.org/?utm_source=linkedin&utm_medium=organic&utm_campaign=cie-launch
  //   https://www.mirajoco.org/25daysand25nights?utm_source=linkedin&utm_medium=organic&utm_campaign=25d25n-post
  //
  // UTM conventions for MiRAjO:
  //   utm_source   = linkedin | meta | google | email | youtube | organic
  //   utm_medium   = organic | paid | newsletter | story | reel | post
  //   utm_campaign = short slug for the specific campaign (e.g. cie-launch, 25d25n-apr, coaching-q2)
  //   utm_content  = optional — specific post/ad variant (e.g. pain-point-hook, testimonial-v1)

  var params = new URLSearchParams(window.location.search);
  var utmKeys = ['utm_source', 'utm_medium', 'utm_campaign', 'utm_content', 'utm_term'];
  var utmData = {};

  utmKeys.forEach(function (key) {
    var val = params.get(key);
    if (val) {
      sessionStorage.setItem('mj_' + key, val);
      utmData[key] = val;
    } else {
      var stored = sessionStorage.getItem('mj_' + key);
      if (stored) utmData[key] = stored;
    }
  });

  // Send UTM session data to GA4 as a custom event for attribution reporting
  if (utmData.utm_source) {
    gtag('event', 'utm_session', utmData);
  }

  // ── Checkout events ───────────────────────────────────────────────────────
  // Call window.trackPurchase({ value, currency, transactionId }) after a
  // confirmed Stripe purchase to fire a GA4 purchase event + Meta Purchase event.
  window.trackPurchase = function (opts) {
    opts = opts || {};
    if (window.gtag) {
      gtag('event', 'purchase', {
        transaction_id: opts.transactionId || '',
        value:          opts.value || 0,
        currency:       opts.currency || 'USD'
      });
    }
    if (window.fbq) {
      fbq('track', 'Purchase', {
        value:    opts.value || 0,
        currency: opts.currency || 'USD'
      });
    }
  };

  // ── Lead events ───────────────────────────────────────────────────────────
  // Call window.trackLead() on form submissions, email opt-ins, etc.
  window.trackLead = function () {
    if (window.gtag) gtag('event', 'generate_lead');
    if (window.fbq) fbq('track', 'Lead');
  };

})();
