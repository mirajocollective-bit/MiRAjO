// Money Moves Service Worker
// Caches the app shell for fast loads and offline access

const CACHE  = 'mm-v4';
const SHELL  = [
  '/tools/money-moves/dashboard',
  '/tools/money-moves/login',
  '/tools/money-moves/confirm',
  '/tools/money-moves/settings',
  '/tools/money-moves/reports',
  '/tools/money-moves/manifest.json',
  '/img/favicon.png',
  '/img/logo-horizontal.png',
  'https://fonts.googleapis.com/css2?family=DM+Mono:ital,wght@0,300;0,400;0,500;1,400&family=Instrument+Serif:ital@0;1&family=Inter:wght@400;500;600;700&family=Plus+Jakarta+Sans:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;1,300;1,400&display=swap',
];

// Install — cache the app shell
self.addEventListener('install', e => {
  e.waitUntil(
    caches.open(CACHE)
      .then(c => c.addAll(SHELL.map(u => new Request(u, { cache: 'reload' }))))
      .then(() => self.skipWaiting())
  );
});

// Activate — delete old caches
self.addEventListener('activate', e => {
  e.waitUntil(
    caches.keys()
      .then(keys => Promise.all(keys.filter(k => k !== CACHE).map(k => caches.delete(k))))
      .then(() => self.clients.claim())
  );
});

// Fetch — network first for API calls, cache first for assets
self.addEventListener('fetch', e => {
  const url = new URL(e.request.url);

  // Always hit network for API calls and Supabase
  if (url.pathname.startsWith('/api/') || url.hostname.includes('supabase')) {
    return; // let browser handle it normally
  }

  // Network first for HTML pages (so fresh data always loads)
  if (e.request.mode === 'navigate' || e.request.headers.get('accept')?.includes('text/html')) {
    e.respondWith(
      fetch(e.request)
        .then(res => {
          const clone = res.clone();
          caches.open(CACHE).then(c => c.put(e.request, clone));
          return res;
        })
        .catch(() => caches.match(e.request))
    );
    return;
  }

  // Cache first for fonts, images, static assets
  e.respondWith(
    caches.match(e.request).then(cached => {
      if (cached) return cached;
      return fetch(e.request).then(res => {
        if (res.ok) {
          const clone = res.clone();
          caches.open(CACHE).then(c => c.put(e.request, clone));
        }
        return res;
      });
    })
  );
});
