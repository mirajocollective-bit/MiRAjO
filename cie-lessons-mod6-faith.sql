-- CIE MODULE 6: Faith-based supplementary lessons
-- Adds 2 lessons visible only when faith_influence = high
-- Run AFTER cie-lessons-mod6.sql
-- Module 6 ID: b579bb90-abe5-4363-bb73-f12cfcd34ee9

INSERT INTO lessons (module_id, title, content, position, profile_condition) VALUES

(
  'b579bb90-abe5-4363-bb73-f12cfcd34ee9',
  'When Faith Is Part of How You Build',
  '<p>For some couples, faith is not a personal preference that stays home on Sunday. It is the framework everything else runs through — how they make decisions, how they handle conflict, what they build toward and why.</p>

<p>If that is you, it is worth naming out loud what that actually looks like inside the business, not just inside the relationship.</p>

<p>What it means to build with faith as a foundation:</p>

<ul>
  <li>Decisions go through a discernment process, not just a business logic one. You both sense-check opportunities against your values, your calling, your peace — not just the numbers.</li>
  <li>Conflict has a different texture when both of you are trying to stay grounded. You are not just managing tension, you are choosing how to show up.</li>
  <li>Rest is not laziness. A sabbath rhythm — one day genuinely protected from the business — is a structural act of trust, not a productivity hack.</li>
  <li>You are building for something. Legacy, impact, generosity. That "why" matters when the hard seasons hit and the business-case answer alone is not enough to keep you going.</li>
</ul>

<blockquote>The business will not tell you what it is for. Your faith might. And if both of you share that anchor, it is one of the most powerful things you have going for you — as long as you are using it together, not just carrying it separately.</blockquote>

<h3>For Your Journal</h3>
<p>Where does your faith actually show up in how you run the business? Be specific. Where does it feel absent or disconnected from the work? And what would it look like to close that gap on purpose, together?</p>',
  6,
  '{"field":"faith_influence","values":["high"]}'
),

(
  'b579bb90-abe5-4363-bb73-f12cfcd34ee9',
  'The Covenant Between You',
  '<p>A business partnership is a contract. A marriage is a covenant. Those are not the same thing, and keeping them straight matters.</p>

<p>Contracts are conditional. They define what each party owes the other and what happens when someone falls short. Covenants are unconditional. They define who you are to each other regardless of performance, seasons, or outcomes.</p>

<p>The distinction gets blurry fast when you are building a business together. The business has KPIs. It has metrics, timelines, expectations. And slowly, almost without noticing, that contract-thinking starts to apply to the person you married. You track who is pulling their weight. You keep score. You show up conditionally.</p>

<p>What it looks like to protect the covenant inside the business:</p>

<ul>
  <li>You have a way to call time on business conversations — a signal that says "right now I need my spouse, not my business partner."</li>
  <li>Hard business seasons do not change how you treat each other. They change your capacity, not your commitment.</li>
  <li>You pray together, or at least acknowledge what you are building toward spiritually, as regularly as you meet about the business.</li>
  <li>When the business is hard, you say out loud that the covenant holds. Not just to each other — to yourselves.</li>
</ul>

<blockquote>The business can fail and the covenant can hold. The business can succeed and the covenant can be quietly eroding. One does not guarantee the other. You have to protect them separately — and most couples only protect one of them until it is too late.</blockquote>

<h3>Take Action</h3>
<p>Write a single sentence that describes what your covenant means in the context of the business. Not a vow renewal. Just a sentence you could both say on a hard day and mean it. Something like: "No matter what happens in the business, we are still us." Make it yours. Write it down. Put it somewhere you will both see it.</p>',
  7,
  '{"field":"faith_influence","values":["high"]}'
);
