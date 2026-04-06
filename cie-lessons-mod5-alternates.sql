-- CIE MODULE 5: Alternate lesson versions based on family_structure profile field
-- Run AFTER cie-lessons-mod5.sql
-- Requires profile_condition column on lessons table (see migration below)

-- ─── MIGRATION: add profile_condition column ───────────────────────────────
ALTER TABLE lessons
  ADD COLUMN IF NOT EXISTS profile_condition jsonb DEFAULT NULL;

-- NULL = show to everyone (default)
-- { "field": "family_structure", "values": ["no-kids", "unsure"] } = show only to child-free couples
-- { "field": "family_structure", "values": ["blended", "stepparent"] } = show only to blended families
-- { "field": "family_structure", "values": ["kids-together"] } = show only to couples with shared kids

-- ─── TAG EXISTING LESSON 2 as kids-having only ─────────────────────────────
UPDATE lessons
SET profile_condition = '{"field":"family_structure","values":["kids-together","blended","stepparent"]}'
WHERE module_id = '1a30c1cc-1820-4e05-805d-45c7f79b0dd4'
  AND title = 'How Family Fits Into the Picture';

-- ─── FIX LESSON 5: remove kids-specific line ───────────────────────────────
UPDATE lessons
SET content = replace(
  content,
  'This conversation will happen more than once. The business changes. Kids get older. The design needs to change with all of it.',
  'This conversation will happen more than once. The business changes. Life changes. The design needs to change with all of it.'
)
WHERE module_id = '1a30c1cc-1820-4e05-805d-45c7f79b0dd4'
  AND title = 'Designing the Week Together';

-- ─── ALTERNATE LESSON 2: No-kids version ──────────────────────────────────
INSERT INTO lessons (module_id, title, content, position, profile_condition) VALUES
(
  '1a30c1cc-1820-4e05-805d-45c7f79b0dd4',
  'How Life Outside the Business Fits In',
  '<p>When there are no kids in the picture, it is easy to assume the life outside the business will just take care of itself. You are both adults. You will figure it out. But that assumption is exactly how couples end up building a great business and a neglected life.</p>

<p>The logistics that child-free couples often leave unspoken:</p>

<ul>
  <li>Who handles the household admin — bills, appointments, repairs, groceries?</li>
  <li>What does a protected evening actually look like — and who protects it?</li>
  <li>How do you handle it when one of you needs to decompress and the other wants to debrief the business day?</li>
  <li>What are your non-negotiables for time together that have nothing to do with work?</li>
  <li>What do you do when both of you are slammed at the same time and the home falls behind?</li>
</ul>

<blockquote>Not having children does not mean your personal life runs itself. It means the friction shows up differently — in who carries the household load, in whether you ever fully leave work, in whether the relationship gets real time or just the time that is left over.</blockquote>

<h3>Take Action</h3>
<p>Write out how your home life actually runs right now — not how it should run. Who carries what? Where is the default "whoever handles it" living? Mark those areas. Decide on them specifically, together, before the resentment of unspoken imbalance gets ahead of you.</p>',
  2,
  '{"field":"family_structure","values":["no-kids","unsure"]}'
),

-- ─── ALTERNATE LESSON 2: Blended family version ───────────────────────────
(
  '1a30c1cc-1820-4e05-805d-45c7f79b0dd4',
  'How Family Fits In When the Picture Is Complex',
  '<p>Blended families do not follow a standard schedule. The pace of your home life changes based on custody rotations, the other household, the needs of kids who did not ask to be in this situation. Building a business on top of that is not impossible — but it requires a level of planning that most couples never do out loud.</p>

<p>The conversations blended-family business couples need to have:</p>

<ul>
  <li>How does the business schedule flex during weeks when kids are with you — and is that flex actually agreed on or just assumed?</li>
  <li>What is the step-parent role in day-to-day logistics — pickups, appointments, homework — and does the step-parent feel clear and supported in that role?</li>
  <li>How do you handle last-minute custody changes, sick days, or school events that land in the middle of the workday?</li>
  <li>How does the other household affect your planning — and have you actually talked about that impact openly?</li>
  <li>What does the step-parent need to feel like a full partner in the home, not just a backup system?</li>
</ul>

<blockquote>The step-parent who goes quiet during custody weeks is not being difficult. They may be carrying something that was never fully named. The biological parent who does not notice is not indifferent. They may be managing two systems at once and missing what is happening right next to them.</blockquote>

<h3>Take Action</h3>
<p>Map out a typical two-week cycle — one week with kids, one without. Where are the pressure points? Where does the step-parent carry something that was never explicitly agreed to? Have that conversation before the next rotation, not during it.</p>',
  2,
  '{"field":"family_structure","values":["blended","stepparent"]}'
);
