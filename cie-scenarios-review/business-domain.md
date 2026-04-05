# CIE Diagnostic — Business Domain Scenarios
## For Review — Do Not Load to Supabase Yet

Scoring key (internal only, never shown to users):
- 4 = proactive and aligned
- 3 = engaged but partial
- 2 = passive or avoidant soft
- 1 = unilateral or fully avoidant

Each scenario has a notes line explaining the branching condition where applicable.

---

## BASE SCENARIOS
Everyone gets these regardless of profile.

---

### B1 — Making a call when your partner is not there

You need to give someone an answer today. Not a massive call, but not nothing either. Your partner is unreachable and the window is closing.

**A.** You make the call, keep a note of what you decided and why, and walk them through it when they are back. `[4]`
**B.** You let the window close. A decision this size should not happen without both of you. `[2]`
**C.** You make the call and mention it later when it comes up naturally. `[3]`
**D.** You handle it. If it goes well, great. If not, you will figure it out then. `[1]`

---

### B2 — You see an opportunity differently

Something real lands. More revenue, more reach. You are ready to move. Your partner is not so sure.

**A.** You slow down and ask what is making them hesitate before you say another word about it. `[4]`
**B.** You lay out your full case and ask for a proper sit-down before either of you decides. `[3]`
**C.** You push forward. You believe in it and sometimes one person has to lead. `[2]`
**D.** You let it go. If both of you are not in it, the opportunity is not worth the tension. `[1]`

---

### B3 — Outside advice that contradicts your partner

A mentor, advisor, or investor gives you feedback about the business. It is good feedback. But it directly contradicts the way your partner has been running their side of things.

**A.** You share it with your partner as something worth considering, not as proof they are wrong. `[4]`
**B.** You sit on it. You do not want to start something based on one person's opinion. `[2]`
**C.** You bring it up the next time you two disagree because now you have backup. `[1]`
**D.** You implement what makes sense and tell your partner what you changed and why. `[3]`

---

### B4 — Work creeping into your partner's lane

You keep doing things that both of you agreed were your partner's responsibility. Not because they are dropping the ball. Just because things fall and you pick them up.

**A.** You bring it up. Not as a complaint, just as a check-in on whether the split still makes sense. `[4]`
**B.** You keep handling it. The work needs to get done and right now you are the one doing it. `[2]`
**C.** You stop doing it and wait to see if they notice. `[1]`
**D.** You mention it once and then let them handle it however they handle it. `[3]`

---

### B5 — When an area of the business is underperforming

Something in the business is not working and it is connected to what your partner is leading. You have noticed it for a while. So have the numbers.

**A.** You ask to look at it together. Not to point fingers, just to understand what is happening. `[4]`
**B.** You bring it up directly. The business cannot wait for a comfortable moment. `[3]`
**C.** You quietly take on some of the work yourself to help without making it a conversation. `[2]`
**D.** You wait. You do not want to bring up a problem before you have a solution to go with it. `[1]`

---

## CONDITIONAL SCENARIOS
These load based on the partner's profile answers.

---

### B6 — Going all in
**Condition:** both_full_time = one-of-us OR neither

One of you wants to quit the job and go all in. Full focus, build this thing for real. The other is not ready to make that call yet.

**A.** You map out what it would actually take financially before either of you says yes or no. `[4]`
**B.** The one who wants to go in goes in. The other will follow when they are ready. `[2]`
**C.** You both agree to stay where you are until you are fully aligned. You will not rush it. `[3]`
**D.** You drop the conversation. It always ends in tension and right now you cannot afford that. `[1]`

---

### B7 — Outside money, different timelines
**Condition:** long_term_vision values differ between partners (detected at report generation)

Someone approaches you about investing in the business. Real money. But their expectations do not quite match where one of you sees this going long term.

**A.** You both take 48 hours separately to think about what you actually want before you respond. `[4]`
**B.** You turn it down. Outside money changes the dynamic and you are not ready for that conversation. `[2]`
**C.** You move forward with the conversation and let it show you both what you really want. `[3]`
**D.** The partner who feels more strongly about it makes the call. `[1]`

---

### B8 — When the client picks a favorite
**Condition:** business_role = i-lead OR they-lead (not equal-partners or still-figuring)

A major client makes it clear they prefer dealing with one of you. The other partner starts quietly stepping back from client conversations.

**A.** You name it. You ask your partner directly how they are feeling about it and whether the current setup is still working for both of you. `[4]`
**B.** You let it be. If it is working for the client, you will sort out the internal piece later. `[2]`
**C.** You make sure your partner stays looped in on key updates so they do not feel cut out. `[3]`
**D.** You do not bring it up. If they have a problem with it, they will say something. `[1]`

---

## Notes for Miranda

- Scenarios are written so no option feels obviously wrong. Real people would do all of these.
- Scores are internal only. Users never see a number.
- B7 is triggered when the system detects a vision mismatch between partners at report generation, not at profile entry. Both partners may see B7 if their long_term_vision answers differ.
- The optional notes field will appear below each scenario for journaling. No minimum. Just a prompt like: "Anything you want to add about how this usually goes for you two?"
