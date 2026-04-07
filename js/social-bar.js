(function () {
  const MARKETING_PATHS = [
    '/', '/index.html',
    '/philosophy', '/philosophy.html',
    '/programs', '/programs.html',
    '/blog', '/blog.html',
    '/events', '/events.html',
    '/25daysand25nights', '/25daysand25nights.html',
    '/coaching', '/coaching.html',
    '/leadnowprogram', '/leadnowprogram.html',
    '/womenimpactnetwork', '/womenimpactnetwork.html',
    '/about', '/about.html',
  ];

  const path = window.location.pathname;
  const isMarketing = MARKETING_PATHS.includes(path) || path === '/';

  const ALL_LINKS = [
    {
      name: 'LinkedIn',
      url: 'https://www.linkedin.com/in/miranda-johnson-mirajocollective/',
      color: '#0077B5',
      svg: `<svg width="18" height="18" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true"><path d="M20.447 20.452h-3.554v-5.569c0-1.328-.027-3.037-1.852-3.037-1.853 0-2.136 1.445-2.136 2.939v5.667H9.351V9h3.414v1.561h.046c.477-.9 1.637-1.85 3.37-1.85 3.601 0 4.267 2.37 4.267 5.455v6.286zM5.337 7.433a2.062 2.062 0 0 1-2.063-2.065 2.064 2.064 0 1 1 2.063 2.065zm1.782 13.019H3.555V9h3.564v11.452zM22.225 0H1.771C.792 0 0 .774 0 1.729v20.542C0 23.227.792 24 1.771 24h20.451C23.2 24 24 23.227 24 22.271V1.729C24 .774 23.2 0 22.222 0h.003z"/></svg>`
    },
    {
      name: 'YouTube',
      url: 'https://www.youtube.com/@MirandaJohnson-MiRAjO',
      color: '#FF0000',
      svg: `<svg width="20" height="15" viewBox="0 0 24 17" fill="currentColor" aria-hidden="true"><path d="M23.495 2.205a3.02 3.02 0 0 0-2.122-2.136C19.505 0 12 0 12 0S4.495 0 2.627.069A3.02 3.02 0 0 0 .505 2.205C0 4.069 0 8.05 0 8.05s0 3.98.505 5.845a3.02 3.02 0 0 0 2.122 2.136C4.495 16.1 12 16.1 12 16.1s7.505 0 9.373-.069a3.02 3.02 0 0 0 2.122-2.136C24 12.031 24 8.05 24 8.05s0-3.98-.505-5.845zM9.609 11.45V4.649l6.264 3.401-6.264 3.4z"/></svg>`
    },
    {
      name: 'TikTok',
      url: 'https://www.tiktok.com/@mirajo_collective',
      color: '#010101',
      svg: `<svg width="16" height="18" viewBox="0 0 24 27" fill="currentColor" aria-hidden="true"><path d="M19.59 6.69a4.83 4.83 0 0 1-3.77-4.25V2h-3.45v13.67a2.89 2.89 0 0 1-2.88 2.5 2.89 2.89 0 0 1-2.89-2.89 2.89 2.89 0 0 1 2.89-2.89c.28 0 .54.04.79.1V9.01a6.33 6.33 0 0 0-.79-.05 6.34 6.34 0 0 0-6.34 6.34 6.34 6.34 0 0 0 6.34 6.34 6.34 6.34 0 0 0 6.33-6.34V8.69a8.18 8.18 0 0 0 4.78 1.52V6.75a4.85 4.85 0 0 1-1.01-.06z"/></svg>`
    },
    {
      name: 'Instagram',
      url: 'https://www.instagram.com/mirajocollective',
      color: '#E1306C',
      svg: `<svg width="18" height="18" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true"><path d="M12 2.163c3.204 0 3.584.012 4.85.07 3.252.148 4.771 1.691 4.919 4.919.058 1.265.069 1.645.069 4.849 0 3.205-.012 3.584-.069 4.849-.149 3.225-1.664 4.771-4.919 4.919-1.266.058-1.644.07-4.85.07-3.204 0-3.584-.012-4.849-.07-3.26-.149-4.771-1.699-4.919-4.92-.058-1.265-.07-1.644-.07-4.849 0-3.204.013-3.583.07-4.849.149-3.227 1.664-4.771 4.919-4.919 1.266-.057 1.645-.069 4.849-.069zm0-2.163c-3.259 0-3.667.014-4.947.072-4.358.2-6.78 2.618-6.98 6.98-.059 1.281-.073 1.689-.073 4.948 0 3.259.014 3.668.072 4.948.2 4.358 2.618 6.78 6.98 6.98 1.281.058 1.689.072 4.948.072 3.259 0 3.668-.014 4.948-.072 4.354-.2 6.782-2.618 6.979-6.98.059-1.28.073-1.689.073-4.948 0-3.259-.014-3.667-.072-4.947-.196-4.354-2.617-6.78-6.979-6.98-1.281-.059-1.69-.073-4.949-.073zm0 5.838a6.162 6.162 0 1 0 0 12.324 6.162 6.162 0 0 0 0-12.324zM12 16a4 4 0 1 1 0-8 4 4 0 0 1 0 8zm6.406-11.845a1.44 1.44 0 1 0 0 2.881 1.44 1.44 0 0 0 0-2.881z"/></svg>`
    }
  ];

  const toShow = isMarketing
    ? ALL_LINKS
    : ALL_LINKS.filter(l => l.name === 'LinkedIn' || l.name === 'YouTube');

  const style = document.createElement('style');
  style.textContent = `
    .social-bar {
      position: fixed;
      right: 20px;
      top: 50%;
      transform: translateY(-50%);
      display: flex;
      flex-direction: column;
      gap: 8px;
      z-index: 9999;
    }
    .social-bar a {
      width: 40px;
      height: 40px;
      border-radius: 50%;
      background: #ffffff;
      border: 1px solid rgba(0,0,0,0.09);
      box-shadow: 0 2px 12px rgba(0,0,0,0.11);
      display: flex;
      align-items: center;
      justify-content: center;
      color: #444;
      text-decoration: none;
      transition: transform 0.18s ease, background 0.18s ease, color 0.18s ease, box-shadow 0.18s ease;
    }
    .social-bar a:hover {
      transform: scale(1.14);
      box-shadow: 0 4px 20px rgba(0,0,0,0.18);
    }
    @media (max-width: 768px) {
      .social-bar { display: none; }
    }
  `;
  document.head.appendChild(style);

  const bar = document.createElement('div');
  bar.className = 'social-bar';
  bar.setAttribute('aria-label', 'Social media links');

  toShow.forEach(function (link) {
    const a = document.createElement('a');
    a.href = link.url;
    a.target = '_blank';
    a.rel = 'noopener noreferrer';
    a.setAttribute('aria-label', link.name);
    a.innerHTML = link.svg;
    a.addEventListener('mouseenter', function () {
      a.style.background = link.color;
      a.style.color = '#ffffff';
      a.style.borderColor = link.color;
    });
    a.addEventListener('mouseleave', function () {
      a.style.background = '#ffffff';
      a.style.color = '#444';
      a.style.borderColor = 'rgba(0,0,0,0.09)';
    });
    bar.appendChild(a);
  });

  document.body.appendChild(bar);
})();
