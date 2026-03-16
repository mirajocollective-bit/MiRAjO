(function () {
  if (localStorage.getItem('cookie-consent')) return;

  const css = `
    #cookie-bar {
      position: fixed;
      top: 0; left: 0; right: 0;
      background: rgba(18, 32, 18, 0.96);
      border-bottom: 1px solid rgba(255,255,255,0.07);
      z-index: 99999;
      transform: translateY(-100%);
      transition: transform 0.35s cubic-bezier(0.16,1,0.3,1);
      font-family: 'Plus Jakarta Sans', sans-serif;
    }
    #cookie-bar.visible { transform: translateY(0); }
    #cookie-bar-inner {
      max-width: 1100px;
      margin: 0 auto;
      padding: 10px 24px;
      display: flex;
      align-items: center;
      gap: 16px;
      flex-wrap: wrap;
    }
    #cookie-bar-text {
      flex: 1;
      font-size: 12px;
      color: rgba(242,235,217,0.55);
      min-width: 200px;
    }
    #cookie-bar-text a {
      color: rgba(242,235,217,0.7);
      text-decoration: underline;
    }
    #cookie-bar-accept {
      background: none;
      border: 1px solid rgba(242,235,217,0.2);
      color: rgba(242,235,217,0.7);
      font-family: 'Plus Jakarta Sans', sans-serif;
      font-size: 11px;
      font-weight: 600;
      letter-spacing: 0.5px;
      padding: 6px 16px;
      border-radius: 4px;
      cursor: pointer;
      white-space: nowrap;
      transition: border-color 0.2s, color 0.2s;
      flex-shrink: 0;
    }
    #cookie-bar-accept:hover {
      border-color: rgba(242,235,217,0.5);
      color: rgba(242,235,217,0.95);
    }
    @media (max-width: 640px) {
      #cookie-bar-inner { padding: 10px 16px; gap: 10px; }
      #cookie-bar-text { font-size: 11px; }
    }
  `;

  const style = document.createElement('style');
  style.textContent = css;
  document.head.appendChild(style);

  const bar = document.createElement('div');
  bar.id = 'cookie-bar';
  bar.innerHTML = `
    <div id="cookie-bar-inner">
      <span id="cookie-bar-text">
        This site uses cookies for essential functions including secure checkout and account access.
        <a href="/about/privacy">Learn more</a>
      </span>
      <button id="cookie-bar-accept">Got it</button>
    </div>
  `;
  document.body.insertBefore(bar, document.body.firstChild);

  setTimeout(() => bar.classList.add('visible'), 800);

  document.getElementById('cookie-bar-accept').addEventListener('click', function () {
    bar.classList.remove('visible');
    setTimeout(() => bar.remove(), 350);
    localStorage.setItem('cookie-consent', '1');
  });
})();
