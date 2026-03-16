(function () {
  if (sessionStorage.getItem('dir-ad-dismissed')) return;

  const css = `
    #dir-ad {
      position: fixed;
      bottom: 0; left: 0; right: 0;
      background: #1E1E1E;
      border-top: 1px solid rgba(255,255,255,0.08);
      box-shadow: 0 -4px 32px rgba(0,0,0,0.35);
      z-index: 9999;
      transform: translateY(100%);
      transition: transform 0.4s cubic-bezier(0.16,1,0.3,1);
      font-family: 'Plus Jakarta Sans', sans-serif;
    }
    #dir-ad.visible { transform: translateY(0); }
    #dir-ad-inner {
      max-width: 1100px;
      margin: 0 auto;
      padding: 14px 24px;
      display: flex;
      align-items: center;
      gap: 20px;
    }
    #dir-ad-label {
      font-size: 9px;
      font-weight: 700;
      letter-spacing: 2px;
      text-transform: uppercase;
      color: rgba(255,255,255,0.3);
      border: 1px solid rgba(255,255,255,0.15);
      padding: 3px 8px;
      border-radius: 4px;
      flex-shrink: 0;
    }
    #dir-ad-copy {
      flex: 1;
      display: flex;
      align-items: center;
      gap: 12px;
      flex-wrap: wrap;
    }
    #dir-ad-headline {
      font-size: 14px;
      font-weight: 700;
      color: #fff;
      white-space: nowrap;
    }
    #dir-ad-sub {
      font-size: 13px;
      color: rgba(255,255,255,0.5);
      white-space: nowrap;
    }
    #dir-ad-price {
      font-size: 13px;
      font-weight: 700;
      color: #C4A245;
      white-space: nowrap;
    }
    #dir-ad-cta {
      display: inline-block;
      padding: 10px 24px;
      background: #C4A245;
      color: #1E1E1E;
      border-radius: 6px;
      font-size: 12px;
      font-weight: 800;
      letter-spacing: 0.5px;
      text-decoration: none;
      white-space: nowrap;
      transition: background 0.2s;
      flex-shrink: 0;
    }
    #dir-ad-cta:hover { background: #D4B255; }
    #dir-ad-dismiss {
      background: none;
      border: none;
      color: rgba(255,255,255,0.3);
      cursor: pointer;
      font-size: 18px;
      line-height: 1;
      padding: 4px 8px;
      flex-shrink: 0;
      transition: color 0.2s;
    }
    #dir-ad-dismiss:hover { color: rgba(255,255,255,0.7); }
    @media (max-width: 640px) {
      #dir-ad-inner { padding: 12px 16px; gap: 12px; }
      #dir-ad-sub { display: none; }
      #dir-ad-headline { font-size: 13px; }
      #dir-ad-price { font-size: 12px; }
      #dir-ad-cta { padding: 9px 16px; font-size: 11px; }
    }
  `;

  const style = document.createElement('style');
  style.textContent = css;
  document.head.appendChild(style);

  const ad = document.createElement('div');
  ad.id = 'dir-ad';
  ad.innerHTML = `
    <div id="dir-ad-inner">
      <span id="dir-ad-label">Ad</span>
      <div id="dir-ad-copy">
        <span id="dir-ad-headline">Get your business listed on the MiRAjO Directory.</span>
        <span id="dir-ad-sub">Direct leads · Profile page · Events · Products</span>
        <span id="dir-ad-price">$5.55 / month</span>
      </div>
      <a id="dir-ad-cta" href="https://www.directory.mirajoco.org/join" target="_blank" rel="noopener">Get Listed →</a>
      <button id="dir-ad-dismiss" aria-label="Dismiss">×</button>
    </div>
  `;
  document.body.appendChild(ad);

  setTimeout(() => ad.classList.add('visible'), 3000);

  document.getElementById('dir-ad-dismiss').addEventListener('click', () => {
    ad.classList.remove('visible');
    setTimeout(() => ad.remove(), 400);
    sessionStorage.setItem('dir-ad-dismissed', '1');
  });
})();
