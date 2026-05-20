/**
 * run-sql.js — run one or more SQL files against Supabase Postgres
 *
 * Usage:
 *   node run-sql.js hub-starting-a-business.sql
 *   node run-sql.js hub-*.sql
 *   node run-sql.js hub-marketing.sql hub-branding.sql
 *
 * Requires DATABASE_URL in a .env file or environment variable.
 * Get it from: Supabase dashboard → Settings → Database → Connection string (URI)
 */

const { Client } = require('pg');
const fs = require('fs');
const path = require('path');

// Load .env if it exists
try {
  const envPath = path.join(__dirname, '.env');
  if (fs.existsSync(envPath)) {
    fs.readFileSync(envPath, 'utf8').split('\n').forEach(line => {
      const [key, ...rest] = line.split('=');
      if (key && rest.length) process.env[key.trim()] = rest.join('=').trim();
    });
  }
} catch {}

const args = process.argv.slice(2);
if (!args.length) {
  console.error('Usage: node run-sql.js <file.sql> [file2.sql ...]');
  process.exit(1);
}

if (!process.env.DATABASE_URL) {
  console.error('Missing DATABASE_URL. Add it to a .env file or set it in your environment.');
  console.error('Get it from: Supabase dashboard → Settings → Database → Connection string (URI)');
  process.exit(1);
}

(async () => {
  const client = new Client({ connectionString: process.env.DATABASE_URL, ssl: { rejectUnauthorized: false } });
  await client.connect();
  console.log('Connected to database.');

  for (const file of args) {
    const filePath = path.resolve(file);
    if (!fs.existsSync(filePath)) {
      console.error(`File not found: ${filePath}`);
      continue;
    }
    const sql = fs.readFileSync(filePath, 'utf8');
    console.log(`Running ${path.basename(filePath)}...`);
    try {
      await client.query(sql);
      console.log(`  Done.`);
    } catch (err) {
      console.error(`  Error in ${path.basename(filePath)}: ${err.message}`);
    }
  }

  await client.end();
  console.log('All done.');
})();
