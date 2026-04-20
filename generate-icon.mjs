import sharp from 'sharp';
import fs from 'fs';
import path from 'path';

// Money Moves icon — dark green + gold calendar with dollar sign
const svg = `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1024 1024" width="1024" height="1024">
  <!-- Background -->
  <rect width="1024" height="1024" fill="#122012"/>

  <!-- Calendar body -->
  <rect x="172" y="280" width="680" height="560" rx="48" ry="48" fill="none" stroke="#C4A245" stroke-width="36"/>

  <!-- Calendar top bar -->
  <rect x="172" y="280" width="680" height="160" rx="48" ry="48" fill="#C4A245"/>
  <rect x="172" y="380" width="680" height="60" fill="#C4A245"/>

  <!-- Calendar hanger pins -->
  <rect x="320" y="200" width="52" height="130" rx="26" fill="#C4A245"/>
  <rect x="652" y="200" width="52" height="130" rx="26" fill="#C4A245"/>

  <!-- Dollar sign centered in lower calendar area -->
  <!-- Vertical bar -->
  <rect x="492" y="490" width="40" height="300" rx="8" fill="#C4A245"/>
  <!-- S curve top -->
  <path d="M 512 530
           C 420 530 380 575 380 625
           C 380 675 420 705 512 715
           C 604 725 644 755 644 805
           C 644 855 604 895 512 895"
        fill="none" stroke="#C4A245" stroke-width="44" stroke-linecap="round"/>
  <!-- Top cap -->
  <line x1="440" y1="530" x2="584" y2="530" stroke="#C4A245" stroke-width="44" stroke-linecap="round"/>
  <!-- Bottom cap -->
  <line x1="440" y1="895" x2="584" y2="895" stroke="#C4A245" stroke-width="44" stroke-linecap="round"/>
</svg>`;

// Output directories
const iconDir = 'assets';
if (!fs.existsSync(iconDir)) fs.mkdirSync(iconDir, { recursive: true });

// Generate master 1024x1024
await sharp(Buffer.from(svg))
  .resize(1024, 1024)
  .png()
  .toFile('assets/icon.png');

console.log('✓ assets/icon.png (1024x1024)');

// Generate splash — 2732x2732 (Capacitor standard)
const splashSvg = `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 2732 2732" width="2732" height="2732">
  <rect width="2732" height="2732" fill="#122012"/>
  <!-- Centered icon at 600px -->
  <g transform="translate(1066, 1066)">
    <rect x="0" y="0" width="600" height="600" rx="80" fill="#122012"/>
    <!-- Calendar body -->
    <rect x="60" y="160" width="480" height="390" rx="32" fill="none" stroke="#C4A245" stroke-width="24"/>
    <!-- Calendar top bar -->
    <rect x="60" y="160" width="480" height="110" rx="32" fill="#C4A245"/>
    <rect x="60" y="225" width="480" height="45" fill="#C4A245"/>
    <!-- Pins -->
    <rect x="170" y="110" width="36" height="90" rx="18" fill="#C4A245"/>
    <rect x="394" y="110" width="36" height="90" rx="18" fill="#C4A245"/>
    <!-- Dollar sign -->
    <rect x="282" y="290" width="36" height="220" rx="6" fill="#C4A245"/>
    <path d="M 300 318 C 240 318 212 348 212 380 C 212 412 240 430 300 438 C 360 446 388 466 388 498 C 388 530 360 552 300 552"
          fill="none" stroke="#C4A245" stroke-width="32" stroke-linecap="round"/>
    <line x1="248" y1="318" x2="352" y2="318" stroke="#C4A245" stroke-width="32" stroke-linecap="round"/>
    <line x1="248" y1="552" x2="352" y2="552" stroke="#C4A245" stroke-width="32" stroke-linecap="round"/>
  </g>
  <!-- App name -->
  <text x="1366" y="1820" font-family="Arial, sans-serif" font-size="96" font-weight="bold" fill="#C4A245" text-anchor="middle" letter-spacing="4">MONEY MOVES</text>
  <text x="1366" y="1920" font-family="Arial, sans-serif" font-size="52" fill="#6DC48A" text-anchor="middle" letter-spacing="2">by MiRAjO</text>
</svg>`;

await sharp(Buffer.from(splashSvg))
  .resize(2732, 2732)
  .png()
  .toFile('assets/splash.png');

console.log('✓ assets/splash.png (2732x2732)');
console.log('\nNext: run  npx @capacitor/assets generate  to push to all Android + iOS sizes');
