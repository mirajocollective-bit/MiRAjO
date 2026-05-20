-- ═══════════════════════════════════════════════
-- FINANCIAL LITERACY: KNOW YOUR MONEY, CHANGE YOUR FUTURE
-- 6 modules, 24 lessons
-- ═══════════════════════════════════════════════

DO $$
DECLARE
  v_course_id uuid;
  v_mod_id    uuid;
BEGIN

-- ── COURSE ──
INSERT INTO courses (slug, title, description, price)
VALUES (
  'financial-literacy',
  'Financial Literacy: Know Your Money, Change Your Future',
  'See your money clearly. Six modules covering where you are right now, building your emergency fund, managing debt, financial planning for the self-employed, money during hard times, and building real wealth.',
  0
)
ON CONFLICT (slug) DO NOTHING;

SELECT id INTO v_course_id FROM courses WHERE slug = 'financial-literacy';

-- ═══════════════════════════════════════════════
-- MODULE 1
-- ═══════════════════════════════════════════════
INSERT INTO modules (course_id, title, position)
VALUES (v_course_id, 'Where You Are Right Now — Getting Honest', 1)
RETURNING id INTO v_mod_id;

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Why Most People Avoid Looking at Their Money (And Why That Makes It Worse)',
'<p>If you have not looked at your bank account in a few days, or you swipe your card and hope for the best, you are not alone. Avoidance is one of the most common financial behaviors there is, and it makes complete sense when you understand where it comes from. But here is what nobody tells you: not looking does not make the number smaller.</p>
<p>Most people were never taught how to manage money. They were taught how to earn it, maybe, but not how to think about it, talk about it, or make decisions with it. So when something goes wrong financially, the default response is shame. And shame makes us look away.</p>
<p>The problem is that avoidance is expensive. When you do not look, you cannot see the subscription you forgot about, the overdraft fee that triggered two more, or the bill that is about to go to collections. Financial problems do not sit still. They grow.</p>
<p>There is also a psychological cost to not knowing. That low-level anxiety you carry everywhere, the one that tightens up every time someone mentions money, that is the cost of avoidance. Knowing is almost always less scary than not knowing, even when the number is bad.</p>
<p>This course is not going to judge where you are. Your starting point is just your starting point. What matters is that you are here, you are willing to look, and we are going to walk through this together, one step at a time.</p>
<p>Your first job is not to fix anything. It is just to see clearly.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Open your bank account or banking app today and look at the current balance. Do not judge it. Just see it.</li>
  <li>Write down how it felt to look. Was it anxious? Relieved? Numb? Name the feeling before you do anything else.</li>
  <li>Tell yourself out loud or in writing: "I am allowed to know where I am." This is a reset, not a report card.</li>
</ul>',
NULL, 1);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Your Net Worth — What You Own vs. What You Owe',
'<p>Net worth is one of those terms that sounds like it belongs to wealthy people. It does not. It belongs to everyone, even when it is a negative number. In fact, knowing your net worth when it is negative is exactly the information you need to start changing it.</p>
<p>Your net worth is simple math. You add up everything you own that has value, and you subtract everything you owe. The result is your net worth. If that number is negative right now, that is okay. Many people start there. The goal is to track it over time and watch it move in the right direction.</p>
<p>Assets are things you own that have monetary value. Your car (current market value, not what you paid), your home if you own one, savings accounts, retirement accounts, investments, and any valuables you could actually sell. Do not include your furniture or your wardrobe unless you are sitting on something rare. Be realistic, not hopeful.</p>
<p>Liabilities are what you owe. Student loans, car loan balance, mortgage balance, credit card balances, medical debt, personal loans, anything you are legally obligated to repay. Write the current balance, not the original amount.</p>
<p>Subtract your total liabilities from your total assets. That is your net worth today. Write it down with today''s date. You will come back to this number in 90 days, and in 6 months, and you will see movement. Even $47 of movement is movement.</p>
<p>This number is not your worth as a person. It is not a judgment on your decisions or your character. It is a financial snapshot, and snapshots change.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>List every asset you own with a realistic dollar value next to each one. Add them up.</li>
  <li>List every debt you carry with the current balance next to each one. Add them up.</li>
  <li>Subtract liabilities from assets and write your net worth with today''s date at the top of the page. Save this somewhere you can find it.</li>
</ul>',
NULL, 2);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Your Monthly Cash Flow — Where the Money Actually Goes',
'<p>Most people have a rough idea of what they earn and a very fuzzy idea of what they spend. The gap between those two things is where the confusion lives. Your cash flow is not about what you plan to spend. It is about what actually leaves your account every single month.</p>
<p>Start with your income. If you are a salaried employee, this is your take-home pay after taxes and deductions. If you have variable income or multiple streams, use your average from the last three months. Be conservative. Round down, not up.</p>
<p>Now list your fixed expenses. These are the amounts that are the same every month: rent or mortgage, car payment, insurance premiums, phone bill, any subscriptions on autopay, student loan minimums, other loan minimums. Write the exact amount, not a guess.</p>
<p>Next, list your variable expenses. These change month to month: groceries, gas, dining out, clothing, household supplies, entertainment, Amazon orders. Pull your last two bank statements and add up what you actually spent in each category, not what you intended to spend. These numbers are going to surprise you. That is normal.</p>
<p>Subtract all of your expenses from your income. That number is your monthly cash flow. If it is negative, you are spending more than you make, and debt or savings is covering the gap. If it is positive, you have room to work with. If it is nearly zero, you are surviving but not building.</p>
<p>This is not about blame. Most people find at least one category that shocks them when they see the real number. That surprise is valuable information. You cannot change what you cannot see.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Pull your last two months of bank and credit card statements and total your actual spending in each category.</li>
  <li>Calculate your true monthly cash flow: total income minus total expenses. Write down the exact number.</li>
  <li>Identify the one spending category where the real number was furthest from what you would have guessed. Circle it. That is your first focus area.</li>
</ul>',
NULL, 3);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'The Money Mindset That Is Keeping You Stuck',
'<p>Before we talk about budgets and accounts and strategies, we need to talk about the stories you believe about money. Because those stories are running in the background of every financial decision you make, whether you are aware of them or not.</p>
<p>Money mindset is not a soft topic. It is the reason two people with the same income can end up in completely different financial situations. One person was told "money is the root of all evil" and unconsciously avoids accumulating it. Another was told "rich people are greedy" and self-sabotages every time they start to get ahead. Another was told "we just don''t have that kind of money" so many times that scarcity became their default lens.</p>
<p>Think about what you heard about money growing up. What did the adults around you say? What did they model? What was the relationship between money and safety, money and love, money and worth in your household? These early messages become beliefs, and beliefs become behavior.</p>
<p>Some of the most common stuck patterns include: spending as emotional relief ("retail therapy"), avoiding bills because looking feels worse than not knowing, giving money away to feel generous even when you cannot afford it, and conflating your bank balance with your value as a person.</p>
<p>Awareness is the first shift. You do not have to overhaul your psychology before you can make progress. But when you notice yourself avoiding, overspending, or catastrophizing about money, pause and ask: "What am I believing right now?" Naming the belief takes some of its power away.</p>
<p>Your financial future is not determined by your past. It is determined by the decisions you make starting now, and those decisions are shaped by what you believe is possible for you.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Write down three things you heard about money growing up. Do not filter. Just write what you remember.</li>
  <li>Identify which of those beliefs you still carry. Write one sentence for each: "I believe that money is ____."</li>
  <li>Choose one belief that is not serving you and write a replacement: "A more accurate thing I can believe is ____." Post it somewhere visible this week.</li>
</ul>',
NULL, 4);

-- ═══════════════════════════════════════════════
-- MODULE 2
-- ═══════════════════════════════════════════════
INSERT INTO modules (course_id, title, position)
VALUES (v_course_id, 'Building Your Emergency Fund', 2)
RETURNING id INTO v_mod_id;

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Why an Emergency Fund Changes Everything',
'<p>If you have ever had a car break down, a medical bill land, or a shift get cut right when the rent is due, you know what it feels like to have no financial cushion. It is one of the most stressful experiences a person can have, and it forces you into bad decisions: high-interest loans, overdraft fees, borrowing from people you did not want to ask. An emergency fund does not just give you money. It gives you choices.</p>
<p>When you have even a small buffer set aside, the calculus of a crisis changes completely. A $400 car repair is inconvenient instead of catastrophic. A missed paycheck is manageable instead of devastating. That shift in experience, from panic to problem-solving, is real and significant.</p>
<p>An emergency fund is not a savings goal in the traditional sense. It is more like financial infrastructure. Just like you need a roof over your head before you can think about decorating, you need this buffer before you can effectively build anything else. It is the foundation.</p>
<p>Without an emergency fund, every unexpected expense sends you backward. You pay off debt, then an emergency hits and you put it right back on the card. You start saving, then the furnace goes out. The cycle repeats. The emergency fund is what breaks that cycle.</p>
<p>Federal employees and government contractors know this in a particular way. A government shutdown or furlough, even a short one, can wipe out a household''s stability in weeks if there is no reserve. An emergency fund is not just good personal finance advice. It is protection against systems that are outside your control.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Write down the last three financial emergencies you faced and what they cost you. Add up the total.</li>
  <li>Identify one thing you are currently spending money on that could be paused for 60 days to redirect toward your emergency fund.</li>
  <li>Open a separate savings account labeled "Emergency Only" today if you do not already have one. Even if it has $0 in it. Name it. Make it real.</li>
</ul>',
NULL, 1);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'How Much You Actually Need and the Fastest Way to Get There',
'<p>The standard advice is three to six months of expenses. That advice is correct and also not where most people need to start. If you have nothing saved right now, three months of expenses feels impossible. So let''s talk about the actual path.</p>
<p>Your first milestone is $1,000. Not $5,000. Not three months of expenses. One thousand dollars. This single milestone will protect you from the most common financial emergencies and give you enough breathing room to stop the debt spiral for most people. Set your sights here first.</p>
<p>To calculate what you need, look back at your cash flow from Lesson 3. Identify your essential monthly expenses only: housing, utilities, food, transportation to work, minimum debt payments. Not streaming subscriptions. Not dining out. Just the expenses that keep your life functioning. Multiply that number by 3.7 for a solid baseline emergency fund once you get past the $1,000 milestone.</p>
<p>The fastest path to $1,000 is not a side hustle. It is cutting. Look at your discretionary spending and find $83 to $125 per month that you can redirect. That gets you to $1,000 in 8 to 12 months. If you can find $200 per month, you are there in 5 months. Selling things you own but do not use can accelerate this further.</p>
<p>Automate the transfer the day after payday. Before you see it, before you spend it, it moves. Even $50 per paycheck adds up to $1,300 a year. Automation removes the decision from the equation, and removed decisions are decisions that actually happen.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Calculate your essential monthly expenses (housing, utilities, food, transportation, minimums only). Write the number down.</li>
  <li>Multiply that number by 3.7 to find your full emergency fund target. Write that down too.</li>
  <li>Set up an automatic transfer to your emergency fund account for any amount, even $25, starting with your next pay date.</li>
</ul>',
NULL, 2);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Where to Keep It — Not Your Checking Account',
'<p>Keeping your emergency fund in your regular checking account is like keeping a fire extinguisher in the middle of your living room where you trip over it daily. It is accessible, yes. But it is also too accessible. It disappears into regular spending without you even noticing.</p>
<p>Your emergency fund needs to be in a separate account. Ideally, it is at a different bank than your checking account, or at minimum it is labeled clearly and not connected to a debit card you use regularly. The friction of transferring it is intentional. That friction is a pause. That pause is protection.</p>
<p>High-yield savings accounts are the right home for your emergency fund. As of recent years, many online banks offer interest rates between 4.2% and 5.1% on savings accounts, compared to the 0.01% to 0.07% that most traditional bank savings accounts pay. On a $5,000 emergency fund, the difference is roughly $200 to $250 per year in earned interest. That is meaningful.</p>
<p>Some good options to look into include online banks and credit unions that offer high-yield savings with no monthly fees and no minimum balance requirements. Examples include Ally, Marcus by Goldman Sachs, and credit unions in your area. Always check current rates before opening, as these change with the federal funds rate.</p>
<p>What your emergency fund is not: it is not your investment account, your retirement account, or anything you have to sell something to access. It needs to be liquid, meaning available in one to three business days without penalty. Certificates of deposit can work for a portion of it, but do not lock up the full amount.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Look up the current interest rate on your existing savings account. Write it down.</li>
  <li>Research two to three high-yield savings accounts and compare their current APY. Write those down next to your current rate.</li>
  <li>If the difference is significant, open a high-yield account this week and begin transferring your emergency fund there.</li>
</ul>',
NULL, 3);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'What Counts as an Emergency and What Does Not',
'<p>Having an emergency fund only works if you protect it. And the biggest threat to your emergency fund is not an actual emergency. It is the slow drain of things that feel urgent but are not. Car registration is not an emergency. Christmas is not an emergency. A sale you did not want to miss is not an emergency.</p>
<p>An emergency is an event that is unexpected, necessary, and cannot be handled any other way. Your car breaking down and you need it to get to work qualifies. A medical procedure you cannot delay qualifies. A job loss that cuts your income qualifies. A flight home for a family funeral qualifies.</p>
<p>The test is three questions. Was this unexpected? Is this truly necessary right now? Is there no other way to handle it? If all three answers are yes, your emergency fund is the right tool. If even one answer is no, this is a different problem with a different solution.</p>
<p>Car registration, annual insurance premiums, holiday gifts, school supplies in September, back-to-school shopping: these are not emergencies. These are predictable expenses that need their own dedicated savings category. When you plan for them in advance, you stop stealing from your emergency fund to cover them.</p>
<p>Once you use your emergency fund, rebuilding it becomes your next priority. Not your vacation fund, not extra debt payments. Rebuild the emergency fund first. It is the foundation. You do not build the second floor before you repair the first.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>List every expense in the next six months that you know is coming: car registration, insurance premium, back-to-school, holidays, etc. Estimate the cost of each.</li>
  <li>Calculate the monthly savings amount you need to cover each of those without touching your emergency fund. Set up a separate "Planned Expenses" savings bucket if your bank allows it.</li>
  <li>Write your emergency fund rule somewhere visible: "This fund is for unexpected, necessary expenses only."</li>
</ul>',
NULL, 4);

-- ═══════════════════════════════════════════════
-- MODULE 3
-- ═══════════════════════════════════════════════
INSERT INTO modules (course_id, title, position)
VALUES (v_course_id, 'Understanding and Managing Debt', 3)
RETURNING id INTO v_mod_id;

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'The Real Cost of Debt — What That Monthly Payment Is Actually Costing You',
'<p>Most people think about debt in terms of the monthly payment. "I can afford this. It''s only $89 a month." That framing is exactly what lenders want, because the monthly payment hides the actual cost. Debt is not the payment. Debt is the total of every payment you will ever make, including interest, over the life of the loan.</p>
<p>Here is a specific example. A $6,200 credit card balance at 22.9% interest, making minimum payments of about $124 per month, will take 7.4 years to pay off. You will pay a total of $10,996. That means the item or items that put $6,200 on your card will ultimately cost you $10,996. Nearly $4,800 extra, over nearly eight years, for the privilege of paying later.</p>
<p>Interest rate is the most important number on any debt you carry. The interest rate determines how fast the balance grows when you are only paying minimums, and it determines how much of your payment goes to principal versus interest. At 22.9% APR, most of your minimum payment goes to interest every month. The principal barely moves.</p>
<p>Annual Percentage Rate (APR) is the cost of borrowing expressed as a yearly percentage. When comparing debt, always compare APR, not the monthly payment or the minimum payment. A personal loan at 11.5% APR is significantly cheaper than a credit card at 22.9% APR, even if the payment is higher, because less of your money is going to interest over time.</p>
<p>Knowing the real cost of your debt is not about shame. It is about information. You cannot make smart payoff decisions without knowing what each dollar of debt is actually costing you.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>List every debt you carry with its current balance and its APR. If you do not know the APR, log in to the account or look at your statement.</li>
  <li>Use a free online debt payoff calculator (search "debt payoff calculator") and enter your highest-interest balance. See what the total cost is at minimum payments. Write that number down.</li>
  <li>Identify which of your debts has the highest APR. That debt is your most expensive money problem.</li>
</ul>',
NULL, 1);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'The Debt Payoff Methods That Work — Avalanche, Snowball, and Which to Pick',
'<p>There are two well-known debt payoff strategies, and both of them work. The difference is not math. The difference is psychology. Understanding both lets you choose the one that actually fits how you are wired, because a strategy you can stick to is always better than a theoretically optimal strategy you abandon in month three.</p>
<p>The Debt Avalanche focuses on interest rates. You list all of your debts from highest APR to lowest. You make minimum payments on everything except the highest-interest debt, and you throw every extra dollar at that one. When it is paid off, you roll that payment to the next highest. You pay less total interest over time with this method. Mathematically, it is the most efficient.</p>
<p>The Debt Snowball focuses on balances. You list all of your debts from smallest balance to largest, regardless of interest rate. You attack the smallest balance first while paying minimums on everything else. When it is gone, you roll that payment to the next. You get wins faster. Those wins keep you motivated. Research in behavioral economics consistently shows that the snowball method works better in practice for people who have struggled to stay consistent, because momentum matters.</p>
<p>A hybrid approach works well for some people. Knock out one or two small balances for the psychological win, then switch to avalanche for the larger ones. The key is to have a written plan before you start, so you are not making decisions every month based on how you feel.</p>
<p>What both methods require is that you stop adding to the debt while you pay it down. That means no new credit card charges you cannot pay in full, no new loans unless absolutely necessary, and a commitment to living on what you make, not what you can borrow.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>List all of your debts in two ways: once sorted by APR (highest to lowest), and once sorted by balance (smallest to largest). Compare the two lists.</li>
  <li>Decide which method fits your personality. If you need motivation and quick wins, snowball. If you are steady and number-driven, avalanche. Write down your choice.</li>
  <li>Calculate how much extra you can put toward debt each month after covering minimums and essential expenses. Write that number next to your target debt.</li>
</ul>',
NULL, 2);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Negotiating With Creditors — What You Can Ask For and How to Ask',
'<p>Most people do not know that credit card companies, medical billing departments, and lenders will often work with you if you call them first. They would rather receive something than go through the cost and trouble of collections. But you have to make the first move, and you have to know what to ask for.</p>
<p>The most important rule of negotiating with creditors is this: call before you miss a payment, not after. Once you are 60 to 90 days late, your options narrow and the notes on your account work against you. If you know a hard month is coming, a layoff happened, or you are about to miss a payment, call now. Tell them what is happening. Ask what options they have.</p>
<p>For credit cards, you can ask for a temporary hardship rate, which reduces your interest rate for 6 to 12 months. You can ask for a waiver on a late fee, especially if you have been a consistent payer. You can ask about a hardship repayment plan that lowers your minimum payment. These programs exist. They are not advertised. You have to ask.</p>
<p>For medical debt, you can almost always negotiate. Hospitals have charity care programs and financial assistance programs that are rarely mentioned until you ask. You can also negotiate a lower lump-sum settlement if you have a chunk of money available. Medical debt that is unaffordable at the billed amount is often settled for 30% to 60% of the original balance.</p>
<p>For collections, get everything in writing before you pay anything. If you are negotiating a settlement, the agreement must be in writing before you send a payment. Verbal agreements in collections are not reliable.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Identify one creditor you have been avoiding or struggling to pay and call them this week. Have your account number ready.</li>
  <li>Write down in advance what you want to ask for (hardship rate, fee waiver, payment plan) so you do not freeze on the call.</li>
  <li>If you have medical debt, call the billing department and ask specifically: "Do you have a financial assistance program or charity care?" Then ask: "Is this balance negotiable?"</li>
</ul>',
NULL, 3);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Credit Scores — What They Actually Measure and How to Improve Yours',
'<p>Your credit score is not a measure of how good you are with money. It is a measure of how you have handled borrowed money over time. Those are not the same thing. Someone who has never borrowed anything has a thin credit file and a mediocre score, even if they are financially disciplined. Someone who has borrowed and paid on time has a strong score. The system is measuring creditworthiness, not financial health.</p>
<p>The FICO score, which is the most widely used, ranges from 300 to 850. Five factors make it up. Payment history is 35%, meaning whether you pay on time. Amounts owed, which is mostly about credit utilization, is 30%. Length of credit history is 15%. Credit mix is 10%. New credit inquiries are 10%.</p>
<p>Credit utilization is the most direct tool most people have. Utilization is the percentage of your available credit that you are using. If you have a $3,000 credit limit and carry a $1,800 balance, your utilization is 60%. That is hurting your score. Keeping utilization below 30% helps your score. Below 10% is even better. You can improve your score meaningfully just by paying down balances or asking for a credit limit increase without spending more.</p>
<p>Payment history is the biggest factor, and the most damaging entries are late payments and collections. A single 30-day late payment can drop a strong score by 60 to 110 points. If you have late payments on your report, they stay for seven years, but their impact fades with time if you stay current from now on.</p>
<p>You can check your credit report for free at AnnualCreditReport.com. Look for errors. Disputed errors on credit reports are more common than most people realize, and incorrect information can be disputed and removed, which improves your score.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Pull your free credit report at AnnualCreditReport.com and review it for errors. Look specifically at account balances, payment history, and any accounts you do not recognize.</li>
  <li>Calculate your current credit utilization for each card: balance divided by credit limit, multiplied by 100. Write down the percentage for each card.</li>
  <li>If any card is above 30% utilization, make a plan to get it below 30% as part of your debt payoff strategy. That number change will move your score.</li>
</ul>',
NULL, 4);

-- ═══════════════════════════════════════════════
-- MODULE 4
-- ═══════════════════════════════════════════════
INSERT INTO modules (course_id, title, position)
VALUES (v_course_id, 'Financial Planning for the Self-Employed and Variable Income', 4)
RETURNING id INTO v_mod_id;

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Budgeting When Your Income Changes Every Month',
'<p>If you are self-employed, a freelancer, a contractor, a commission-based earner, or anyone whose income is not the same every single month, traditional budgeting advice was not written for you. The "take home your salary and divide by 12" framework falls apart when some months you make $4,100 and some months you make $1,800. But you still need a system.</p>
<p>The baseline budget method works for variable income. First, identify your lowest income month in the last 12 months. That is your baseline. Build your budget around that number. If your lowest month was $2,300, design your essential expenses to fit inside $2,300. Whatever you earn above that in better months goes into categories in this order: taxes, emergency fund, irregular expenses, then discretionary.</p>
<p>Your baseline budget covers housing, utilities, food, transportation, minimum debt payments, and essential insurance. Nothing else. This is the floor. It is what you can always cover no matter what. Build outward from there on the months you earn more.</p>
<p>Many variable-income earners also benefit from creating a monthly income smoothing account. Every dollar of income goes into this account first. Every month you pay yourself the same "salary" from it, regardless of what came in that month. In good months the account grows. In slow months you draw it down. This is how you create stability from instability.</p>
<p>Tracking income and expenses is non-negotiable when your income varies. You cannot eyeball this. Use a spreadsheet, an app, or the MiRAjO Budget Calendar, updated weekly at minimum. Pattern recognition over time tells you which months tend to run high and which tend to run low, and you can plan around that.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Look at your income for each of the last 12 months. Write them down. Find your lowest month.</li>
  <li>Build a bare-bones budget based on that lowest-month income. Every essential expense must fit inside that number.</li>
  <li>Consider opening a separate checking account as your "income smoothing" account. Set a fixed monthly transfer to your personal expenses account and let the rest accumulate.</li>
</ul>',
NULL, 1);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Taxes for the Self-Employed — What to Set Aside and When to Pay',
'<p>If no one is withholding taxes from your paycheck, this is one of the most important financial realities you need to face. Self-employment taxes are real, they are significant, and the IRS does not wait until April to want their money. Missing quarterly payments means penalties and interest on top of what you already owe. This is not a situation you want to be surprised by.</p>
<p>Self-employed individuals pay both the employee and employer portions of Social Security and Medicare taxes, which is 15.3% of net self-employment income. This is in addition to income tax. A self-employed person making $60,000 in profit could easily owe $18,000 to $22,000 in combined federal taxes before state taxes, depending on their deductions and filing situation.</p>
<p>The standard guidance for self-employed people without a complex deduction situation is to set aside 25% to 30% of every dollar of profit for taxes. This is not optional money. Set it aside the moment it comes in. Put it in a separate savings account labeled "Taxes" and do not touch it for anything else. When quarterly payments are due, you transfer from that account. It should feel like writing a check from someone else''s money, because that is essentially what it is.</p>
<p>Quarterly estimated taxes are due in April, June, September, and January (for the prior year''s final quarter). The specific due dates shift when they fall on weekends or holidays, so confirm the IRS schedule each year. You can pay online at IRS.gov/payments. Underpaying by a significant amount results in penalties at filing time.</p>
<p>Business deductions reduce your taxable profit. Common deductions for the self-employed include home office (if it is dedicated workspace), business mileage, professional subscriptions and software, marketing expenses, business insurance, and retirement contributions. Keep receipts and records for everything. Work with a CPA or tax professional, especially in your first year.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Calculate 25% to 30% of your average monthly net income. That is your monthly tax set-aside amount.</li>
  <li>Open a separate savings account labeled "Taxes" and transfer this month''s amount into it today.</li>
  <li>Look up the next IRS quarterly estimated tax due date and add it to your calendar with a reminder 2 weeks before.</li>
</ul>',
NULL, 2);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Retirement Savings When You Do Not Have a 401k — IRA, SEP-IRA, Solo 401k',
'<p>One of the biggest financial disadvantages of self-employment is the absence of an employer-sponsored retirement plan. No automatic enrollment, no employer match, no HR department reminding you to sign up. The responsibility is entirely yours. The good news is that the options available to self-employed people are actually quite good, in some cases better than what employees have access to.</p>
<p>A Traditional IRA or Roth IRA is the most accessible starting point. In 2024, you can contribute up to $7,000 per year ($8,000 if you are 50 or older). A Traditional IRA gives you a potential tax deduction now. A Roth IRA uses after-tax money but grows tax-free, meaning you will not owe taxes on withdrawals in retirement. For most people in earlier career stages or lower income years, the Roth IRA is often the better long-term choice.</p>
<p>A SEP-IRA (Simplified Employee Pension) is designed for self-employed people and small business owners. You can contribute up to 25% of your net self-employment income, with a maximum of $69,000 in 2024. Contributions are tax-deductible, which reduces your taxable income significantly. This is an excellent option if you have a profitable year and want to shelter more income from taxes.</p>
<p>A Solo 401k (also called an Individual 401k) allows the highest contribution limits of any self-employed retirement account. As both employer and employee, you can contribute up to $23,000 as an employee contribution, plus up to 25% of compensation as an employer contribution, for a combined max of $69,000 in 2024. The Solo 401k requires a bit more setup but is worth it for high earners.</p>
<p>Start with whatever you can contribute, even if it is $50 a month. The habit matters more than the amount at the beginning. The amount grows as your income grows.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Decide which account type fits your current situation: Roth IRA for accessibility and tax-free growth, SEP-IRA if your income is strong and you want a large deduction, Solo 401k if you want maximum contribution room.</li>
  <li>Research one provider to open the account (Fidelity, Vanguard, and Schwab are widely used and have no-fee IRA options). Start the account opening process.</li>
  <li>Set up a monthly automatic contribution, even a small one. $100 a month invested for 20 years at a 7% average return grows to approximately $52,000. Start now.</li>
</ul>',
NULL, 3);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Benefits You Have to Buy Yourself — Health Insurance, Disability, Life',
'<p>When you leave traditional employment, the benefits that seemed invisible suddenly become very visible. Health insurance, paid sick leave, disability coverage, life insurance: these were all handled by your employer, and now they are your responsibility. This section is not optional reading. Skipping these protections is a financial decision with potentially devastating consequences.</p>
<p>Health insurance is the most urgent. A single uninsured hospitalization can result in tens of thousands of dollars in medical debt. As a self-employed person, you have several options: the Healthcare.gov marketplace (subsidies may be available based on your income), your spouse or domestic partner''s employer plan if applicable, a Health Sharing Ministry if you meet the criteria, or COBRA if you recently left employment (expensive, but it bridges gaps). Dental and vision are typically separate and can be added through the marketplace or purchased independently.</p>
<p>Disability insurance is the benefit most self-employed people overlook, and it is arguably the most important one to have. If you get sick or injured and cannot work, your income stops. Disability insurance replaces a portion of your income, typically 60%, during that time. Short-term disability covers you for a few months. Long-term disability covers you for years, sometimes until retirement age. The younger and healthier you are when you buy it, the lower the premium.</p>
<p>Life insurance matters if anyone depends on your income: a spouse, children, aging parents, or a business partner. Term life insurance is the most straightforward and affordable option for most people. A 20-year term policy provides coverage for the years when dependents are most financially vulnerable. Whole life and universal life are more complex and more expensive and are not the right starting point for most working adults building their financial foundation.</p>
<p>The cost of these benefits is real and needs to be built into your pricing as a self-employed person. If your rates do not account for your own benefits costs, you are effectively subsidizing your clients.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Confirm that you have health insurance coverage right now. If you do not, go to Healthcare.gov this week and see what is available in your area and at what cost.</li>
  <li>Get a quote for a short-term and long-term disability policy. An independent insurance broker can help you compare options.</li>
  <li>If you have dependents, get a quote for a 20-year term life policy. Your age and health today determine your rate for the entire 20 years, so earlier is cheaper.</li>
</ul>',
NULL, 4);

-- ═══════════════════════════════════════════════
-- MODULE 5
-- ═══════════════════════════════════════════════
INSERT INTO modules (course_id, title, position)
VALUES (v_course_id, 'Money During Hard Times', 5)
RETURNING id INTO v_mod_id;

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'When Income Drops — What to Cut First, What to Protect',
'<p>Income loss is one of the most destabilizing events a person can face, and it almost always comes with shame attached. The silence around job loss, reduced hours, a slow business season, or a lost contract keeps people from acting quickly, and delay is what turns a manageable problem into a crisis. If your income dropped, the single most important thing you can do right now is look at your expenses clearly and move fast.</p>
<p>When income drops, you have two jobs. First, protect what keeps your life functional. Second, cut everything else. The order matters.</p>
<p>What to protect first: housing (keeping a roof over your head is the absolute top priority), utilities connected to that housing, food for your household, transportation to any remaining income source, and minimum payments on any secured debt (car loan, mortgage) to avoid repossession or foreclosure. These four categories are non-negotiable.</p>
<p>What to cut immediately: subscriptions, streaming services, gym memberships, dining out, retail spending of any kind, anything that is not on the essential list above. This is not forever. This is the emergency protocol. You are buying time.</p>
<p>What to cut carefully: insurance premiums are tempting to cancel but extremely dangerous to eliminate, especially health and auto. Losing coverage to save $200 a month and then needing it creates a debt that can take years to recover from. If cost is the issue, call your insurance provider and ask about a hardship reduction, a temporary coverage change, or a payment plan.</p>
<p>Cutting is only half the equation. The other half is increasing income or accessing available resources. Unemployment benefits, SNAP, utility assistance programs, local food banks, and nonprofit emergency assistance exist for exactly this situation. Using them is not a moral failure. It is using the safety net that exists for this purpose.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Write your essential expenses only: housing, utilities, food, transportation, secured debt minimums. Add them up. This is your bare-minimum monthly number.</li>
  <li>Go through every other expense and mark each one as "pause" or "cancel" for the next 60 days. Do not negotiate with yourself on this list.</li>
  <li>Research what assistance is available in your area: call 211, check benefits.gov, and look up your local community action agency. Know what exists before you need it.</li>
</ul>',
NULL, 1);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Government Shutdowns, Layoffs, and Economic Disruptions — Financial Preparation',
'<p>If you work for the federal government, are a federal contractor, or live in a household that depends on government employment, you already know that government shutdowns are a real financial threat. For the roughly 2.2 million federal civilian employees in the United States, a shutdown means working without pay or being furloughed without pay, sometimes for weeks. In 2018 and 2019, the longest shutdown in U.S. history lasted 35 days. Thirty-five days of zero income for hundreds of thousands of households.</p>
<p>The financial preparation for a shutdown is the same as the preparation for any income disruption, but with one important difference: federal employees often know with some certainty that the pay will eventually come (backpay has historically been approved), but they do not know when. That uncertainty is its own kind of stress, and it requires a different kind of planning.</p>
<p>The single most important protection is an emergency fund with at least three months of essential expenses. This is not abstract advice for federal workers. It is specifically calibrated to the reality that shutdowns have lasted anywhere from one day to 35 days, and economists recommend a buffer that covers the historical worst cases with room to spare.</p>
<p>Beyond emergency savings, federal employees should understand their benefits landscape. Federal Employees Retirement System (FERS) contributions, Thrift Savings Plan (TSP) contributions, and Federal Employees Health Benefits (FEHB) coverage all have specific rules during a shutdown. Premium payments for FEHB, for example, accumulate as a debt to be repaid when the shutdown ends, not a cancellation. TSP loans and withdrawals also have implications. Know your specifics before a crisis happens.</p>
<p>Private-sector workers facing layoffs should understand their severance rights, COBRA continuation rights for health insurance (you have 60 days to elect coverage retroactively), and unemployment insurance eligibility. File for unemployment benefits the same week your employment ends. Waiting costs you weeks of benefits you are entitled to.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Calculate how many weeks your current emergency fund would cover your essential expenses. Write that number down. If it is less than 8 weeks, make rebuilding it your next financial priority.</li>
  <li>If you are a federal employee, look up your agency''s shutdown furlough guidance so you know what to expect. Find out whether your position is "essential" (required to work) or "non-essential" (furloughed).</li>
  <li>Write a one-page "shutdown or layoff protocol" for your household: what gets paid first, what gets paused, who you call, and what accounts you draw from. Review it with your partner or household members if applicable.</li>
</ul>',
NULL, 2);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Communicating With Lenders When You Cannot Pay',
'<p>Silence is the worst thing you can do when you cannot make a payment. It triggers late fees, penalty rates, negative credit reporting, and eventually collections. None of those things happen immediately if you make contact first. The moment you know you cannot pay, reach out. The phone call feels terrifying. But it is almost always better than what happens when you avoid it.</p>
<p>Most lenders have hardship programs. These exist because lenders know that life is unpredictable and that a customer who makes reduced payments temporarily is more valuable than a customer who defaults entirely. Hardship programs can include deferred payments (no payment required for one to three months, interest may or may not continue to accrue), temporarily reduced minimum payments, a reduced interest rate for the hardship period, or waived late fees.</p>
<p>When you call, you do not need to tell your lender your entire story. You need to be clear, calm, and specific. Say: "I''m reaching out because I''m experiencing a financial hardship and I''m not going to be able to make my full payment this month. I want to talk about what options you have." That is it. They will ask questions. Answer honestly. Then ask specifically what programs they have available.</p>
<p>Mortgage servicers have the most options because the consequences of default are so significant. If you have a federally backed mortgage (FHA, VA, USDA, Fannie Mae, Freddie Mac), you have specific forbearance rights under federal law. Forbearance pauses or reduces your mortgage payment without triggering a default. Know whether your mortgage is federally backed, because it changes what you are entitled to.</p>
<p>Document every call. Write down the date, the representative''s name, the phone number you called, and what they told you. If they offer you a plan, ask for written confirmation. Follow up in writing by email or letter if they agree to anything.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Make a list of every lender you may need to contact if your income were disrupted. Include their customer service number and account number for each.</li>
  <li>Rehearse what you would say in a hardship call: one to two sentences describing the situation and a specific ask for options. Practice out loud.</li>
  <li>If you are already past due on anything, call that lender today. Every day of delay makes the conversation harder and the options fewer.</li>
</ul>',
NULL, 3);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Rebuilding After a Financial Crisis — The Practical Sequence',
'<p>Coming out of a financial crisis is not just a practical challenge. It is an emotional one. There is often grief involved, the kind that comes with losing a version of your life that you thought was stable. There can be anger, exhaustion, and a feeling that all of your hard work was erased. Those feelings are valid, and they are also not the end of the story. People rebuild. You will rebuild. But the sequence matters.</p>
<p>Step one is stabilize income. Before you address debt, before you rebuild savings, you need income that covers your essential expenses. If your income is not yet stable, that is the only job. Part-time work, gig work, consulting, whatever it takes to cover the baseline. Stability first.</p>
<p>Step two is build a minimal cash buffer. Even $500 to $1,000 sitting between you and the next crisis changes your psychology and your options. This comes before aggressive debt repayment. It is the first layer of protection.</p>
<p>Step three is address the most urgent financial threats. Utility shutoffs, eviction notices, and repossession threats move to the front of the line. Unsecured debt like credit cards is important but does not take your housing or transportation. Secured debt and housing go first.</p>
<p>Step four is work the debt in order. Once your basics are covered and you have a small buffer, use the avalanche or snowball method from Module 3 to start moving the debt. Do not try to attack everything at once. One focus point, consistent extra payments, keep going.</p>
<p>Step five is rebuild credit and savings in parallel. Small credit-building steps (on-time payments, low utilization) run alongside small savings contributions. Neither happens at a pace that feels dramatic. But over 12 to 24 months, the cumulative effect is real.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Write out the five-step sequence on a card or in your phone where you can see it. Know what step you are on right now.</li>
  <li>Identify the single most urgent financial threat in your current situation and write down one specific action you can take on it this week.</li>
  <li>Schedule a 30-minute money check-in with yourself every two weeks. Put it on your calendar with an alarm. Progress that is not measured is progress that stalls.</li>
</ul>',
NULL, 4);

-- ═══════════════════════════════════════════════
-- MODULE 6
-- ═══════════════════════════════════════════════
INSERT INTO modules (course_id, title, position)
VALUES (v_course_id, 'Building Wealth, Not Just Stability', 6)
RETURNING id INTO v_mod_id;

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'The Difference Between Saving and Investing',
'<p>Most people use the words "saving" and "investing" interchangeably, and that mix-up costs them. Saving and investing are both important, but they work differently, they have different purposes, and they produce very different results over time. Once you understand the difference, you will make better decisions about where your money goes.</p>
<p>Saving is putting money somewhere safe and accessible. It preserves what you have. A savings account at your bank or credit union, a high-yield savings account, a money market account: these are savings tools. They are appropriate for money you need within the next one to five years, including your emergency fund, a down payment you are working toward, or a planned major expense.</p>
<p>Investing is putting money to work with the expectation that it will grow over time, accepting some level of risk to achieve that growth. Stock market investments, real estate, index funds, retirement accounts invested in funds: these are investing tools. They are appropriate for money you will not need for at least five years, ideally longer, because markets fluctuate and you need time to ride out the downturns.</p>
<p>The key difference is risk and time horizon. Savings are low-risk because the money does not fluctuate in value, but they earn a limited return. Investing involves risk because the value can go down before it goes up, but over long periods the growth potential is significantly greater. The stock market has historically averaged around 7% annual return after inflation. A high-yield savings account earns 4% to 5% in a high-rate environment and much less in a low-rate environment.</p>
<p>You need both. The emergency fund is savings. Retirement is investing. A five-year goal could be either, depending on your timeline and risk tolerance. The mistake most people make is keeping money meant for long-term goals in savings accounts, where it loses purchasing power to inflation over time.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>List every account where you currently hold money. Label each one as "saving" or "investing" based on the purpose and where it is held.</li>
  <li>Ask yourself: is any money sitting in a savings account that I will not need for more than 5 years? If yes, that money might be better served in an investment account.</li>
  <li>Look up the current inflation rate. Compare it to the interest rate on your savings account. That gap is the real cost of keeping long-term money in savings.</li>
</ul>',
NULL, 1);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Compound Interest — Why Starting Now Beats Starting With More Later',
'<p>Compound interest is the single most powerful financial force available to ordinary people. It is not complicated. It is patient. And the longer you wait to use it, the more of its power you give away.</p>
<p>Here is how it works. You invest $1,000. It earns 7% in the first year: $70. Now you have $1,070. The next year, you earn 7% on $1,070, not just the original $1,000. That is $74.90. You now have $1,144.90. The year after that, you earn 7% on $1,144.90. Over time, the growth accelerates because you are always earning returns on the accumulated returns. This is compounding.</p>
<p>The time math is where this gets real. If you invest $200 per month starting at age 25 and earn a 7% average annual return, by age 65 you have approximately $524,000. If you wait until age 35 to start, and invest that same $200 per month at the same return, you have approximately $243,000 at age 65. You invested for 10 fewer years and ended up with $281,000 less. Ten years cost you more than a quarter million dollars.</p>
<p>This is why "start now, even with a small amount" is not just motivational language. It is mathematically accurate. Investing $50 per month starting today is worth more than investing $500 per month starting five years from now, depending on your time horizon. The math favors early action over large amounts.</p>
<p>You do not need to be rich to invest. You need to be consistent and patient. Index funds in a Roth IRA or 401k are accessible to most people and require no expertise to manage. Set it up, automate contributions, and leave it alone.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Calculate how many years you have until traditional retirement age (65). Write that number down.</li>
  <li>Use a compound interest calculator (available free online) and enter $100 per month, 7% annual return, and your number of years. Look at the result.</li>
  <li>If you do not yet have a retirement investment account, identify the right account type from Lesson 3 of Module 4 and take one step toward opening it this week.</li>
</ul>',
NULL, 2);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Generational Wealth — What It Requires and How to Start It in Your Family',
'<p>Generational wealth is a term people hear a lot, but what it actually means in practice for working-class families is rarely explained. It does not mean leaving your children millions of dollars. It means giving them a financial head start that you did not have. It means breaking a cycle, not creating a dynasty.</p>
<p>In communities where wealth was not historically built or passed down, because of structural barriers, wage gaps, discriminatory lending, or simply poverty passed from one generation to the next, starting now matters enormously. The family that starts investing even modestly this generation changes the trajectory for the next. That is not small. That is everything.</p>
<p>Generational wealth starts with your own financial stability. You cannot build a foundation on sand. Getting out of debt, building an emergency fund, investing consistently in retirement accounts: these are the personal actions that generate the surplus that can eventually be transferred. You must secure your own financial future before you can meaningfully contribute to your children''s.</p>
<p>Financial education is itself a form of generational wealth. Teaching your children or the young people in your life how money works, how credit scores are calculated, what compound interest means, how to read a paycheck and understand deductions: this knowledge has compounding returns. A child who understands money at 18 is decades ahead of where you may have started.</p>
<p>Specific tools that build generational wealth include life insurance (a term or whole life policy that creates a death benefit), a 529 education savings account for children or grandchildren, naming beneficiaries on all of your retirement accounts and life insurance policies, and having a will or trust that clearly directs your assets. Many people believe they do not have enough assets to need a will. They are wrong. A will is about making sure your intentions are honored, regardless of the size of the estate.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Check the beneficiary designations on every account you have: retirement accounts, life insurance policies, bank accounts with transfer-on-death options. Update any that are outdated or missing.</li>
  <li>If you have children, research 529 education savings accounts. Even $25 per month opened when a child is young can grow to a meaningful sum by college age.</li>
  <li>Write down one financial lesson you wish you had learned earlier. Consider how you will teach that to the next generation in your family.</li>
</ul>',
NULL, 3);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Your 5-Year Financial Plan — Writing It, Protecting It, and Revisiting It',
'<p>You have covered a lot of ground in this course. You looked at where you are, you built a plan for your emergency fund, you created a debt payoff strategy, and you started thinking about investing. Now you need to pull all of that into a single written plan that guides the next five years of your financial life. Written plans that are specific and reviewed regularly outperform intentions that live only in your head. This is not a theory. It is documented in research on financial behavior and goal achievement.</p>
<p>Your 5-year plan is a document, not a dream. It names specific numbers and specific timelines. Not "I want to get out of debt" but "I will pay off my $7,340 in credit card debt by April 2028 using the avalanche method, contributing $340 per month." Not "I want to save more" but "I will build a 4.1-month emergency fund of $12,680 by March 2027."</p>
<p>Your plan should cover four areas. First: debt elimination goals, listing each debt, the current balance, the target payoff date, and the monthly payment strategy. Second: savings goals, including your emergency fund target, any planned major purchases like a vehicle or down payment, and your timeline for each. Third: investing goals, including which retirement account you are contributing to, the monthly amount, and your contribution target for the year. Fourth: income goals, including any plans to increase earnings, start a business, earn a certification, or change employment.</p>
<p>Protecting your plan means storing it somewhere safe and accessible, sharing it with a trusted partner or accountability person if you have one, and not letting a bad month convince you the plan is broken. One bad month is not a broken plan. It is data.</p>
<p>Revisiting your plan is non-negotiable. Every three months, sit down with your plan and compare your actual numbers to your targets. Adjust timelines if life changes. Celebrate progress, even small progress. A plan that is reviewed and adjusted is alive. A plan that sits in a drawer is just a document.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Write your 5-year financial plan using the four sections above: debt, savings, investing, income. Use specific numbers and specific dates for every goal.</li>
  <li>Store your plan somewhere you will actually see it: a notes app pinned to your home screen, a folder on your desktop, a printed page on your desk.</li>
  <li>Schedule a 5-year plan review for 90 days from today. Put it on your calendar. When that reminder goes off, open the plan and update your progress before you do anything else.</li>
</ul>',
NULL, 4);

END $$;
