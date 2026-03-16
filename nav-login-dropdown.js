(function () {
  const btn = document.querySelector('a.nav-login');
  if (!btn) return;

  const css = `
    .nav-login-wrap {
      position: relative;
      display: inline-flex;
    }
    .nav-login-wrap a.nav-login {
      pointer-events: none;
      cursor: pointer;
    }
    .nav-login-trigger {
      display: inline-flex;
      align-items: center;
      justify-content: center;
      background: none;
      border: none;
      padding: 0;
      cursor: pointer;
      color: inherit;
      line-height: 1;
    }
    .nav-login-dropdown {
      position: absolute;
      top: calc(100% + 10px);
      right: 0;
      background: #fff;
      border: 1px solid rgba(0,0,0,0.08);
      border-radius: 8px;
      box-shadow: 0 8px 24px rgba(0,0,0,0.12);
      min-width: 190px;
      overflow: hidden;
      opacity: 0;
      transform: translateY(-6px);
      pointer-events: none;
      transition: opacity 0.18s ease, transform 0.18s ease;
      z-index: 10000;
      font-family: 'Plus Jakarta Sans', sans-serif;
    }
    .nav-login-dropdown.open {
      opacity: 1;
      transform: translateY(0);
      pointer-events: auto;
    }
    .nav-login-dropdown a {
      display: flex;
      align-items: center;
      gap: 10px;
      padding: 12px 16px;
      font-size: 13px;
      font-weight: 600;
      color: #1E4226;
      text-decoration: none;
      transition: background 0.15s;
      white-space: nowrap;
    }
    .nav-login-dropdown a:hover {
      background: #f2f7f3;
    }
    .nav-login-dropdown a + a {
      border-top: 1px solid rgba(0,0,0,0.06);
    }
    .nav-login-dropdown a svg {
      flex-shrink: 0;
      opacity: 0.6;
    }
  `;

  const style = document.createElement('style');
  style.textContent = css;
  document.head.appendChild(style);

  // Wrap the existing link
  const wrap = document.createElement('div');
  wrap.className = 'nav-login-wrap';
  btn.parentNode.insertBefore(wrap, btn);
  wrap.appendChild(btn);

  // Button that mimics the lock icon appearance
  const trigger = document.createElement('button');
  trigger.className = 'nav-login-trigger';
  trigger.setAttribute('aria-label', 'Member Login');
  trigger.innerHTML = btn.innerHTML;
  // Copy colour from original link
  trigger.style.color = window.getComputedStyle(btn).color;
  btn.style.display = 'none';
  wrap.appendChild(trigger);

  // Dropdown
  const dropdown = document.createElement('div');
  dropdown.className = 'nav-login-dropdown';
  dropdown.innerHTML = `
    <a href="https://www.directory.mirajoco.org/login" target="_blank" rel="noopener">
      <svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
        <rect x="3" y="11" width="18" height="11" rx="2" ry="2"/>
        <path d="M7 11V7a5 5 0 0 1 10 0v4"/>
      </svg>
      Access Directory
    </a>
    <a href="/programs/login">
      <svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
        <path d="M15 3h4a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2h-4"/>
        <polyline points="10 17 15 12 10 7"/>
        <line x1="15" y1="12" x2="3" y2="12"/>
      </svg>
      Access Programs
    </a>
  `;
  wrap.appendChild(dropdown);

  // Toggle on click
  trigger.addEventListener('click', function (e) {
    e.stopPropagation();
    dropdown.classList.toggle('open');
  });

  // Close on outside click
  document.addEventListener('click', function () {
    dropdown.classList.remove('open');
  });
})();
