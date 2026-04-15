-- ══════════════════════════════════════════════════════════════════
-- CIE: TOGETHER WORK + EM DASH FIXES
-- Run AFTER all cie-lessons-mod*.sql files have been run.
-- Safe to run multiple times.
-- ══════════════════════════════════════════════════════════════════


-- ── STEP 1: Fix em dashes in all lesson content ───────────────────
-- Replaces " — " (em dash with spaces) with ", " throughout.
-- Covers modules 1–8.

UPDATE lessons
SET content = REPLACE(content, ' — ', ', ')
WHERE module_id IN (
  '7da97dc1-3004-4072-bc19-009482600d36',
  '29f3f2ac-a852-4de5-bb15-f80b76a0543a',
  'b75af360-0bee-428e-a800-74f6c97f1b6c',
  'df656a1c-79d8-4d31-8944-b89f1e63e615',
  '1a30c1cc-1820-4e05-805d-45c7f79b0dd4',
  'b579bb90-abe5-4363-bb73-f12cfcd34ee9',
  '4fc18eac-5fed-4f48-8f95-2c2d8b7a836a',
  'f5878885-62a4-4c13-a869-c64b4bae9ee4'
);


-- ── STEP 2: Together Work — Module 1: The Cost of Misalignment ────

UPDATE lessons SET together_work =
'<p>You each wrote one thing you are hoping to get from this course. Time to share it.</p>
<p>Take turns. One sentence each. No explaining it, no justifying it, just say it out loud. Then listen to your partner say theirs.</p>
<p>You do not need to respond to what they said. Just hear it. That is the whole exercise.</p>'
WHERE module_id = '7da97dc1-3004-4072-bc19-009482600d36' AND position = 1;

UPDATE lessons SET together_work =
'<p>Each of you name one area where you feel the gap most right now. Pick the one that first came to mind when you were reading, not the one that feels safest to say out loud. That first one is the data.</p>
<p>Compare your answers. Did you name the same area? Different ones? Either answer is useful information.</p>
<p>No fixing it yet. Just notice where each of you is starting from.</p>'
WHERE module_id = '7da97dc1-3004-4072-bc19-009482600d36' AND position = 2;

UPDATE lessons SET together_work =
'<p>You each identified a business decision that took longer than it should have or landed with tension. Share yours.</p>
<p>The rule: you are describing the decision, not assigning blame for it. "The pricing conversation in February" is the right format. "The time you refused to budge on pricing" is not.</p>
<p>Did you name the same decision? That is interesting. Did you name different ones? That is also interesting. Both mean the list is longer than either of you realized.</p>'
WHERE module_id = '7da97dc1-3004-4072-bc19-009482600d36' AND position = 3;

UPDATE lessons SET together_work =
'<p>You each identified a moment when the business followed you somewhere it was not invited. Share that moment with each other.</p>
<p>Keep it short. One story. Then your partner shares theirs. The point is not to relitigate the moment, it is just to see it together and say: yes, that happened, and it cost us something.</p>
<p>That acknowledgment is worth more than any action item.</p>'
WHERE module_id = '7da97dc1-3004-4072-bc19-009482600d36' AND position = 4;


-- ── STEP 3: Together Work — Module 2: The Financial Playbook ──────

UPDATE lessons SET together_work =
'<p>You each completed the sentence: "To me, money primarily represents __________."</p>
<p>Share your answers. Then share where you think that relationship with money came from, what you watched growing up, what shaped it.</p>
<p>Listen to understand, not to evaluate. Your partner''s answer is not wrong. It is just different, and now you know where the friction actually comes from.</p>'
WHERE module_id = '29f3f2ac-a852-4de5-bb15-f80b76a0543a' AND position = 1;

UPDATE lessons SET together_work =
'<p>Audit your current setup together. Go through the actual accounts and answer these questions out loud:</p>
<ul>
  <li>Is business money in a separate account from household money right now?</li>
  <li>Do you both have visibility into both accounts?</li>
  <li>When money moves between business and household, does the other person know?</li>
</ul>
<p>No judgment on the current state. Just get a clear picture together. The gaps you find in this conversation are the things to fix first.</p>'
WHERE module_id = '29f3f2ac-a852-4de5-bb15-f80b76a0543a' AND position = 2;

UPDATE lessons SET together_work =
'<p>Each of you say out loud what you are currently taking from the business. The actual number, or as close to it as you know.</p>
<p>Then each of you say what you think you should be taking. Not what is possible right now. What would feel right.</p>
<p>If those numbers are different, that gap is the conversation. Not a fight, just the next thing to figure out together.</p>'
WHERE module_id = '29f3f2ac-a852-4de5-bb15-f80b76a0543a' AND position = 3;

UPDATE lessons SET together_work =
'<p>Name where you two differ on reinvestment and risk. Be specific.</p>
<p>One of you probably thinks the last thing you reinvested in was the right call. One of you probably thinks it was a little too bold or a little too cautious. Whoever thought it was the right call: say why. Whoever had reservations: say what they were.</p>
<p>You are not trying to win this conversation. You are trying to understand how your partner reads risk so the next big decision does not catch either of you off guard.</p>'
WHERE module_id = '29f3f2ac-a852-4de5-bb15-f80b76a0543a' AND position = 4;

UPDATE lessons SET together_work =
'<p>Each of you describe what financial security feels like to you. Not a number yet, a feeling. What does "safe" look like in your mind?</p>
<p>Then name your actual number: the minimum in the account that lets you stop checking the account. The threshold where you can exhale.</p>
<p>Share both. If your numbers are different, great. Now you know the range you are both working within, and you can stop having the same disagreement about whether things are fine.</p>'
WHERE module_id = '29f3f2ac-a852-4de5-bb15-f80b76a0543a' AND position = 5;

UPDATE lessons SET together_work =
'<p>Open a shared document right now and fill in your three-line financial framework together:</p>
<ul>
  <li>Our personal draw agreement: __________</li>
  <li>Our reinvestment commitment: __________</li>
  <li>Our reserve floor (do not touch without a conversation): __________</li>
</ul>
<p>Read it back to each other when you are done. If either line feels wrong when you hear it out loud, change it now. If it holds, write the date on it and set a 90-day reminder to review it.</p>
<p>Yes, the date matters. Future you will be glad past you did this.</p>'
WHERE module_id = '29f3f2ac-a852-4de5-bb15-f80b76a0543a' AND position = 6;

UPDATE lessons SET together_work =
'<p>If one of you is still working a job while the other is in the business full time, fill in these three lines together before you move on:</p>
<ul>
  <li>Our household runway agreement: __________</li>
  <li>The value we assign to full-time business work: __________ per month</li>
  <li>The business milestone that triggers a real draw: __________</li>
</ul>
<p>If you are both fully in the business already, or neither of you is yet, note the date and agree to revisit this lesson when the structure changes. It will change, and when it does, you will want to have already talked about it.</p>'
WHERE module_id = '29f3f2ac-a852-4de5-bb15-f80b76a0543a' AND position = 7;


-- ── STEP 4: Together Work — Module 3: The Game Plan ──────────────

UPDATE lessons SET together_work =
'<p>Each of you write one sentence that describes what you are building. Not the mission statement version. The honest version, the one you would say to a friend over dinner.</p>
<p>Share your sentences. Are they about the same thing? Similar but framed differently? Genuinely different?</p>
<p>The gap between your sentences, if there is one, is not a problem. It is the starting point for building a description you both actually mean.</p>'
WHERE module_id = 'b75af360-0bee-428e-a800-74f6c97f1b6c' AND position = 1;

UPDATE lessons SET together_work =
'<p>Each of you describe where you see the business in five years. Be specific: size, structure, what your day looks like, what role you are each playing.</p>
<p>Then compare. You are looking for the places where your pictures match and the places where they quietly diverge. Neither picture is wrong. But if they are different, you are currently making decisions that lead to different destinations.</p>
<p>That is fixable. But only if you see it.</p>'
WHERE module_id = 'b75af360-0bee-428e-a800-74f6c97f1b6c' AND position = 2;

UPDATE lessons SET together_work =
'<p>Each of you answer: what is growth actually funding for you? Not the business answer. Your personal answer.</p>
<p>Time with family? Financial independence? Proving something? A specific life that the business makes possible? All of these are valid. None of them are embarrassing to say out loud.</p>
<p>Share yours. Listen to your partner''s. The overlap is where your shared motivation lives. The difference is worth knowing.</p>'
WHERE module_id = 'b75af360-0bee-428e-a800-74f6c97f1b6c' AND position = 3;

UPDATE lessons SET together_work =
'<p>Describe your ideal version of this business to each other. Not where it is now, where you actually want it to go.</p>
<p>Cover: size, pace, how involved you each are in the day-to-day, what kind of team (if any), and what a good week feels like operationally.</p>
<p>Compare. You might be surprised how aligned you already are. You might also find the one thing you have both been avoiding naming. Either way, you now have the real conversation instead of the polite one.</p>'
WHERE module_id = 'b75af360-0bee-428e-a800-74f6c97f1b6c' AND position = 4;

UPDATE lessons SET together_work =
'<p>Draft one shared goal together. Not a list. One goal, the one that matters most right now.</p>
<p>It should pass the test: both of you would say yes, that is actually ours, not just one person''s goal that the other is going along with.</p>
<p>Write it down. Put it somewhere you will both see it. Shared goals that live only in one person''s head tend to stay that way.</p>'
WHERE module_id = 'b75af360-0bee-428e-a800-74f6c97f1b6c' AND position = 5;

UPDATE lessons SET together_work =
'<p>Open your calendars right now, both of you. Set three dates before you close this lesson:</p>
<ul>
  <li>A recurring weekly business check-in (pick a day and time you can both protect)</li>
  <li>A quarterly review 90 days from today</li>
  <li>An annual planning day, somewhere off-site, just the two of you</li>
</ul>
<p>The rhythm only exists if it is on the calendar. "We should do that" is not a rhythm. A recurring calendar invite is a rhythm.</p>'
WHERE module_id = 'b75af360-0bee-428e-a800-74f6c97f1b6c' AND position = 6;

UPDATE lessons SET together_work =
'<p>Each of you answer these three questions privately first, then share with each other:</p>
<ol>
  <li>In ten years, where do you want to be with this business? Be specific about your role, your involvement, your workload.</li>
  <li>If the business had to end or significantly change tomorrow, what would that mean for you personally?</li>
  <li>Is there anything you want that you have not said out loud yet because you did not know how your partner would react?</li>
</ol>
<p>Take turns. The goal is to understand what your partner wants, not to negotiate yet. Just see each other clearly on this one.</p>'
WHERE module_id = 'b75af360-0bee-428e-a800-74f6c97f1b6c' AND position = 7;


-- ── STEP 5: Together Work — Module 4: Who Runs What ──────────────

UPDATE lessons SET together_work =
'<p>Each of you name one area in the business where the role friction is highest right now. The area where you are stepping on each other most, or where one of you feels like they are carrying something they should not have to carry alone.</p>
<p>Share your answers. Did you name the same area? That means you both feel it. Did you name different areas? That means the list is bigger than you thought.</p>
<p>Either way, this is where the module starts doing real work.</p>'
WHERE module_id = 'df656a1c-79d8-4d31-8944-b89f1e63e615' AND position = 1;

UPDATE lessons SET together_work =
'<p>Do this separately first, then compare.</p>
<p>Go through the core functions of your business and write your own name next to what you actually own right now. Not what you agreed to, what actually happens. Who makes the final call? Who handles it when it goes wrong?</p>
<p>When you are both done, compare your lists. The places where you both wrote your own name are where the overlap is. The places where neither of you wrote anything are where things are falling through. Both are worth a conversation.</p>'
WHERE module_id = 'df656a1c-79d8-4d31-8944-b89f1e63e615' AND position = 2;

UPDATE lessons SET together_work =
'<p>Go back to your ownership map from the last lesson. For each area, agree on one of three categories:</p>
<ul>
  <li><strong>Solo:</strong> one partner owns it and decides alone</li>
  <li><strong>Together:</strong> both partners decide, no exceptions</li>
  <li><strong>Function owner decides:</strong> whoever holds that area makes the call, even if the other has opinions about it</li>
</ul>
<p>Write "solo," "together," or "function owner" next to each area. If you disagree about which category something falls into, that disagreement is the most important conversation on this list.</p>'
WHERE module_id = 'df656a1c-79d8-4d31-8944-b89f1e63e615' AND position = 3;

UPDATE lessons SET together_work =
'<p>Write your disagreement protocol together in one or two sentences. It should cover: what happens when you cannot agree on something in one partner''s lane? What happens when you cannot agree on a shared decision?</p>
<p>It does not need to cover every scenario. It needs to cover the ones that come up most. Write it down, say it out loud, agree that it reflects what you actually want to do.</p>
<p>Then put it somewhere both of you can find it when you are in the middle of a disagreement and definitely do not want to write a protocol from scratch.</p>'
WHERE module_id = 'df656a1c-79d8-4d31-8944-b89f1e63e615' AND position = 4;

UPDATE lessons SET together_work =
'<p>Each of you name one lane you need your partner to fully trust you with. The area where you most need them to let go and let you own it.</p>
<p>Say it directly: "The thing I need you to trust me on is __________."</p>
<p>Then your partner says: "I hear you, and I commit to __________" (one specific behavior that shows the trust).</p>
<p>This is not a binding legal agreement. It is two people choosing to actually mean what they agreed to.</p>'
WHERE module_id = 'df656a1c-79d8-4d31-8944-b89f1e63e615' AND position = 5;

UPDATE lessons SET together_work =
'<p>Write your Roles Agreement together before you close this module. Use a shared doc, a note, a printed page, whatever works for you. Include:</p>
<ul>
  <li>Who owns each core business function (one name each)</li>
  <li>What always requires both of you (the list and the dollar threshold if there is one)</li>
  <li>Your disagreement protocol (one or two sentences)</li>
  <li>When you will review this agreement next</li>
</ul>
<p>When you are done, one of you reads it out loud. If anything sounds wrong out loud, fix it. If it holds, you are aligned. Put it somewhere you can both find it.</p>
<p>This document is the thing you point to instead of arguing about what you meant. Make sure it says what you actually mean.</p>'
WHERE module_id = 'df656a1c-79d8-4d31-8944-b89f1e63e615' AND position = 6;


-- ── STEP 6: Together Work — Module 5: The Life Architecture ───────

UPDATE lessons SET together_work =
'<p>Each of you name one thing the business has taken from your life that you want back. Not as an accusation of the business or each other, just as a clear statement of something that matters.</p>
<p>"I want back __________."</p>
<p>Share yours. Hear your partner''s. You do not have to solve it in this conversation. Just acknowledge it together. Sometimes naming a thing out loud takes away half its power to keep being ignored.</p>'
WHERE module_id = '1a30c1cc-1820-4e05-805d-45c7f79b0dd4' AND position = 1;

UPDATE lessons SET together_work =
'<p>Describe what your family picture looks like right now, and what you want it to look like. Be honest about whether those two pictures match.</p>
<p>Then compare your descriptions with each other. Are you looking at the same family life, or have you each quietly built a different version in your heads?</p>
<p>There is no wrong answer here. There is only what is real, and what you both actually want.</p>'
WHERE module_id = '1a30c1cc-1820-4e05-805d-45c7f79b0dd4' AND position = 2;

UPDATE lessons SET together_work =
'<p>Name one boundary you have both agreed to that neither of you has actually kept.</p>
<p>Be honest. No blame. The goal is not to call each other out, it is to identify the one thing that keeps getting negotiated away, usually by both of you, and decide together whether you actually want that boundary or whether you need to set a different one that you will actually hold.</p>
<p>A boundary you do not keep is just a wish. Decide if you want a real one.</p>'
WHERE module_id = '1a30c1cc-1820-4e05-805d-45c7f79b0dd4' AND position = 3;

UPDATE lessons SET together_work =
'<p>Each of you name the thing that restores you. The actual thing, not what sounds good to say. Some people restore through silence. Some through physical activity. Some through being around people. Some through doing nothing productive for a full afternoon.</p>
<p>Share yours. Then answer together: does your current schedule make space for that, even occasionally? If not, what is one small thing you could protect this week?</p>
<p>Start small. One protected hour is more useful than one perfect week that never happens.</p>'
WHERE module_id = '1a30c1cc-1820-4e05-805d-45c7f79b0dd4' AND position = 4;

UPDATE lessons SET together_work =
'<p>Design your ideal week structure together. Sketch it out: when does work start and stop, when is family time protected, when do you two get time that is neither business nor parenting, what is the weekly rhythm you are actually trying to live?</p>
<p>Then compare it to the week you actually had last week. Note the gaps. Pick one thing to protect differently starting this week, not a full overhaul, just one thing.</p>
<p>The design only works if it starts somewhere real.</p>'
WHERE module_id = '1a30c1cc-1820-4e05-805d-45c7f79b0dd4' AND position = 5;


-- ── STEP 7: Together Work — Module 6: Protect What You Built ─────

UPDATE lessons SET together_work =
'<p>Name out loud, to each other, what you are protecting.</p>
<p>Not the business. Not the income. The relationship. What specifically do you want to make sure survives building this thing together?</p>
<p>Each of you say it in one sentence. Then hear what your partner said and notice whether you named the same thing or something different. Both answers tell you something worth knowing.</p>'
WHERE module_id = 'b579bb90-abe5-4363-bb73-f12cfcd34ee9' AND position = 1;

UPDATE lessons SET together_work =
'<p>Be honest with each other about this one: have you two drifted into business-partner mode at home? Not as a judgment, as an honest read of where you are right now.</p>
<p>Each of you answer: on a scale of one to five, how much of your recent time together has actually been about each other versus about the business? One means almost none, five means it is well protected.</p>
<p>Share your numbers. If they are different, that difference is data. If they are both low, at least you are seeing it together, which is the beginning of changing it.</p>'
WHERE module_id = 'b579bb90-abe5-4363-bb73-f12cfcd34ee9' AND position = 2;

UPDATE lessons SET together_work =
'<p>Schedule protected time right now. Put it on both calendars before you close this lesson.</p>
<p>It does not have to be elaborate. It has to be real: a specific day, a specific time, and a specific rule about what does not come into that time with you. Even one recurring hour a week is worth more than an annual weekend away that never gets planned.</p>
<p>Set it. Protect it. Change the date if you have to, but do not cancel it.</p>'
WHERE module_id = 'b579bb90-abe5-4363-bb73-f12cfcd34ee9' AND position = 3;

UPDATE lessons SET together_work =
'<p>Name the thing that gets in the way of intimacy most right now. The actual thing, not the socially acceptable version.</p>
<p>Is it exhaustion? Is it unresolved tension from a business conversation that spilled over? Is it that you have been in business-partner mode for so long that switching back feels awkward? Is it something you have not said yet?</p>
<p>Say it out loud to each other. You do not have to solve it tonight. But you cannot protect something you are not willing to name.</p>'
WHERE module_id = 'b579bb90-abe5-4363-bb73-f12cfcd34ee9' AND position = 4;

UPDATE lessons SET together_work =
'<p>Look at each other and say it out loud: "You are my partner first."</p>
<p>Simple. A little awkward maybe. Do it anyway.</p>
<p>Then each of you name one thing you will do differently this week to act on that. One specific thing, not a general intention. "I will not bring up the business during dinner on Thursday" is a thing. "I will prioritize our relationship more" is not a thing.</p>'
WHERE module_id = 'b579bb90-abe5-4363-bb73-f12cfcd34ee9' AND position = 5;


-- ── STEP 8: Together Work — Module 7: Getting on the Same Page ───

UPDATE lessons SET together_work =
'<p>Name your communication pattern together. Not the one you aspire to, the one you actually have.</p>
<p>When things get tense, what typically happens? One person shuts down? One person escalates? Does it spiral and then get dropped without resolution? Does it get avoided until it explodes?</p>
<p>No shame in the answer. Every couple has a pattern. The only couples who cannot fix theirs are the ones who will not name it.</p>'
WHERE module_id = '4fc18eac-5fed-4f48-8f95-2c2d8b7a836a' AND position = 1;

UPDATE lessons SET together_work =
'<p>Set the rule together: where and when does business talk happen in your relationship?</p>
<p>Name a specific window (a time, a place, a context) that is the designated space for business conversations. Then name one context where business talk does not come in, ever.</p>
<p>Write both down. Saying "we will try to keep business out of the bedroom" is not a rule. "No business talk after 9pm and never during meals" is a rule. Make yours specific enough to actually follow.</p>'
WHERE module_id = '4fc18eac-5fed-4f48-8f95-2c2d8b7a836a' AND position = 2;

UPDATE lessons SET together_work =
'<p>Each of you name one conversation you have been avoiding. The thing you know needs to happen but keeps not happening.</p>
<p>Share what it is. You do not have to have the full conversation right now. Just name it, confirm that both of you know it is sitting there, and agree on a time in the next two weeks when you will have it.</p>
<p>Put that date on the calendar before you close this lesson. Avoiding a conversation has a cost. Scheduling it is how you stop paying it.</p>'
WHERE module_id = '4fc18eac-5fed-4f48-8f95-2c2d8b7a836a' AND position = 3;

UPDATE lessons SET together_work =
'<p>Take a disagreement you have had recently, something low-stakes enough to practice on, and try the reframe together.</p>
<p>Instead of defending your own position, each of you make the strongest possible case for your partner''s view. Actually try to argue their side, not as a debate exercise, as a genuine attempt to understand why they see it the way they do.</p>
<p>You will be surprised how much easier the actual conversation gets once you have demonstrated to each other that you understand what you are disagreeing about.</p>'
WHERE module_id = '4fc18eac-5fed-4f48-8f95-2c2d8b7a836a' AND position = 4;

UPDATE lessons SET together_work =
'<p>Agree on your communication structure together. Three things to decide:</p>
<ol>
  <li>When and where do you have business conversations? (Specific time, specific setting.)</li>
  <li>What is the signal that a conversation has gotten too heated to continue right now? And what do you do with it when it happens?</li>
  <li>How do you close a conversation so it actually feels finished, not just paused?</li>
</ol>
<p>Write your answers down. A communication practice is only a practice if both of you know what it is and both of you are actually doing it.</p>'
WHERE module_id = '4fc18eac-5fed-4f48-8f95-2c2d8b7a836a' AND position = 5;


-- ── STEP 9: Together Work — Module 8: The Win ────────────────────

UPDATE lessons SET together_work =
'<p>Tell each other: what is one thing you learned about your partner through this course that you did not fully see before?</p>
<p>One thing each. Say it out loud. Let your partner hear it.</p>
<p>This is not a performance. It is a recognition. You both did something hard and honest, and the person across from you showed you something real. Name what you saw.</p>'
WHERE module_id = 'f5878885-62a4-4c13-a869-c64b4bae9ee4' AND position = 1;

UPDATE lessons SET together_work =
'<p>Describe alignment to each other, what it feels like for you right now compared to where you started.</p>
<p>Then each of you name one area where you still have work to do. Not as a way to end on a low note, as an honest acknowledgment that the practice continues. The couples who stay aligned are the ones who keep telling the truth about where they are.</p>
<p>One win. One area still in progress. Both are worth saying out loud.</p>'
WHERE module_id = 'f5878885-62a4-4c13-a869-c64b4bae9ee4' AND position = 2;

UPDATE lessons SET together_work =
'<p>Three things to do together before you close this lesson:</p>
<ol>
  <li>Open your calendars and schedule your annual planning conversation: a date, a location, a full day off-site just for you two.</li>
  <li>Set a reminder 12 months from today to retake the Partnership Diagnostic.</li>
  <li>Tell each other one thing you are committed to doing differently going forward. One sentence each. Say it out loud.</li>
</ol>
<p>The calendar items make it real. The sentences to each other make it personal. Both matter.</p>'
WHERE module_id = 'f5878885-62a4-4c13-a869-c64b4bae9ee4' AND position = 3;

UPDATE lessons SET together_work =
'<p>Create your Partnership Operating Agreement together today.</p>
<p>Open a shared document and pull the agreements you built in each module: your financial framework, your shared vision, your Roles Agreement, your life architecture commitments, your relationship commitments, and your communication structure.</p>
<p>Title it whatever feels right. Then both of you read through the full document once. Change anything that does not sound like both of you. When it does, write today''s date on it.</p>
<p>You now have a single place that holds what you decided. Use it. Update it when things change. It is not a trophy, it is a tool.</p>'
WHERE module_id = 'f5878885-62a4-4c13-a869-c64b4bae9ee4' AND position = 4;

UPDATE lessons SET together_work =
'<p>Agree on how you will call it when you notice drift. Not how you will blame each other for it. How you will name it neutrally so the conversation can happen before the tension does.</p>
<p>Pick a phrase, something low-stakes that either of you can say that means "I think we have gotten off our rhythm, can we check in?" It does not have to be clever. It has to be something you will actually say.</p>
<p>Then agree: when one of you says it, the other does not get defensive. That is the whole deal. The signal only works if both of you treat it as information and not as an accusation.</p>'
WHERE module_id = 'f5878885-62a4-4c13-a869-c64b4bae9ee4' AND position = 5;
