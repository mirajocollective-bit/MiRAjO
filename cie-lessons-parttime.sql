-- CIE: Supplementary lessons for couples where one or both partners
-- still have a job or are not yet full-time in the business.
-- Condition: both_full_time = 'one-of-us' OR 'neither'
-- Module 3 (The Game Plan): position 8
-- Module 4 (Who Runs What): position 7

-- Module 3 ID: b75af360-0bee-428e-a800-74f6c97f1b6c
-- Module 4 ID: df656a1c-79d8-4d31-8944-b89f1e63e615

INSERT INTO lessons (module_id, title, content, position, profile_condition) VALUES

(
  'b75af360-0bee-428e-a800-74f6c97f1b6c',
  'Planning While One of You Is Still Employed',
  '<p>The game plan looks different when one or both of you still have a job. The vision conversations in this module still apply — but you have a layer the all-in couples do not.</p>

<p>The income from outside the business is not just money. It is time, energy, and divided attention. And if both of you are not clear on what that means for the business, it creates quiet friction that is hard to name.</p>

<h3>The questions this situation requires</h3>
<ul>
  <li><strong>What does the business need to prove before the employed partner goes full-time?</strong> A specific revenue number. A specific date. A specific milestone. If there is no answer to this, "when things are going well" will become a moving target that never arrives.</li>
  <li><strong>What does the employed partner''s contribution to the business look like right now?</strong> Not just financially — what are they actually doing, and when? Is that sustainable?</li>
  <li><strong>Is the full-time partner being compensated for carrying more of the operational load?</strong> Not necessarily in cash. In recognition, in decision-making weight, in protected time — but in something. An unspoken imbalance here grows fast.</li>
  <li><strong>What happens if the business timeline shifts?</strong> If the plan was to go full-time in one year and it is now looking like two — have you talked about that?</li>
</ul>

<blockquote>The employed partner is carrying the bridge. That is a real contribution and it deserves to be named, honored, and planned around — not taken for granted because the money is still coming in.</blockquote>

<h3>Take Action</h3>
<p>Write down the milestone that triggers full-time commitment for the partner who is not yet all-in. Be specific. A number. A date. A condition. Then both of you agree on it. If you cannot agree on the milestone, that is the conversation you need — not more strategy.</p>',
  8,
  '{"field":"both_full_time","values":["one-of-us","neither"]}'
),

(
  'df656a1c-79d8-4d31-8944-b89f1e63e615',
  'Roles When You Are Not Both In It Full-Time',
  '<p>The role maps and agreements in this module were built for couples who are both fully in the business. Your situation has more moving parts.</p>

<p>When one of you has a job — or neither of you is in the business full-time — the role structure is not just about who runs what inside the business. It is also about who runs what outside of it, and how those two worlds stay from colliding.</p>

<h3>What needs to be decided specifically</h3>
<ul>
  <li><strong>When is the employed partner available for business decisions?</strong> Mornings? Evenings? Weekends? "When I have time" is not a schedule. A schedule is a schedule.</li>
  <li><strong>What decisions can the full-time partner make alone during business hours, and what has to wait?</strong> Every decision that waits is a drag on the business. Every decision made without the other partner is a potential source of friction. Know the line before you hit it.</li>
  <li><strong>What does the employed partner actually own inside the business?</strong> Not just financially. Which function, which relationship, which area of the work belongs to them — even if they can only give it part-time attention?</li>
  <li><strong>What happens when the business needs something the employed partner cannot give right now?</strong> A big pitch, a hiring decision, a crisis — and they are in the middle of a work week. What is the protocol?</li>
</ul>

<blockquote>Part-time involvement does not mean part-time ownership. You are still partners. But the role structure needs to reflect the reality of your bandwidth — not the ideal version of how you would operate if everything were equal.</blockquote>

<h3>Take Action</h3>
<p>Add one more column to your Roles Agreement: availability. Next to each function, note when the responsible partner is actually accessible to handle it. Where the availability does not match the responsibility, that is where your plan has a gap — fix it before the business finds it for you.</p>',
  7,
  '{"field":"both_full_time","values":["one-of-us","neither"]}'
);

-- Together work for both new lessons
UPDATE lessons SET together_work =
'<p>Name the milestone out loud — the specific thing the business needs to hit before the full commitment changes.</p>
<p>Do you both agree on what that is? If not, that is the only agenda item for your next planning conversation.</p>'
WHERE module_id = 'b75af360-0bee-428e-a800-74f6c97f1b6c'
  AND position = 8;

UPDATE lessons SET together_work =
'<p>Take your Roles Agreement and add one line for each area: when is this person actually available to handle this?</p>
<p>Read it back together. Where does the availability not match the responsibility? Those gaps need to be resolved — on paper, before they become problems in real life.</p>'
WHERE module_id = 'df656a1c-79d8-4d31-8944-b89f1e63e615'
  AND position = 7;
