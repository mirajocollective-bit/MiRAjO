-- ═══════════════════════════════════════════════
-- BUSINESS CREDIT & ACCESS TO CAPITAL
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
  'business-credit',
  'Business Credit & Access to Capital',
  'Build the financial identity your business deserves. Six modules covering business credit systems, building your credit profile from zero, traditional funding, CDFIs, social equity as capital access, and grants and strategic funding.',
  0
)
ON CONFLICT (slug) DO NOTHING;

SELECT id INTO v_course_id FROM courses WHERE slug = 'business-credit';

-- ═══════════════════════════════════════════════
-- MODULE 1
-- ═══════════════════════════════════════════════
INSERT INTO modules (course_id, title, position)
VALUES (v_course_id, 'The Truth About Business Credit', 1)
RETURNING id INTO v_mod_id;

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Why Business Credit Is Not the Same as Personal Credit',
'<p>Most people come into this course carrying a weight they do not say out loud: they think their personal credit history is the whole story. If your personal credit has taken hits, you may already be bracing yourself for more bad news. This lesson is not bad news.</p>
<p>Business credit and personal credit are two separate systems. They are tracked by different agencies, scored on different scales, and evaluated for completely different reasons. Your personal credit score lives at Equifax, Experian, and TransUnion. Your business credit profile lives at Dun & Bradstreet, Experian Business, and Equifax Business. These are not the same files, and they do not automatically talk to each other.</p>
<p>When a lender pulls your personal credit, they are asking: how has this person managed their own financial obligations over time? When someone pulls your business credit, they are asking: how does this business pay its bills? Those are two different questions, and the answers can be completely different.</p>
<p>This matters because it means you can start building a strong business credit profile even if your personal credit is a work in progress. You are not starting over, you are starting a new file. A clean one with your business name on it.</p>
<p>The personal guarantee issue is real and worth naming. In the early stages, many lenders will still ask you to personally guarantee a business loan. That means your personal credit does come into play during the application process. But as your business credit profile grows stronger, your reliance on personal guarantees decreases. The goal is to build business credit strong enough to stand on its own.</p>
<p>Think of it this way. Your business is a separate entity with its own financial identity. Right now that entity may have no history. That is not a failure. It is just a starting point, and starting points are what this course is for.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Write down your current personal credit score range (you do not need the exact number, just an idea of where you are)</li>
  <li>Write down your business name and whether it is registered as an LLC, corporation, or sole proprietorship</li>
  <li>Look up whether you have ever applied for anything using your business name and EIN versus your personal SSN</li>
</ul>',
NULL, 1);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'How the Business Credit System Works — Dun & Bradstreet, Experian Business, Equifax Business',
'<p>Nobody teaches you this in school. The business credit system has three main reporting agencies, and each one operates a little differently. If you have never heard of any of them before today, that is not a gap in your intelligence. It is a gap in what most people are taught.</p>
<p>Dun & Bradstreet is the oldest and most widely used business credit bureau. They issue a number called a D-U-N-S number (more on that in Module 2), and they calculate a score called the PAYDEX score. The PAYDEX scale runs from 1 to 100, and a score of 80 or above is generally considered strong. An 80 means you pay your bills on or before the due date. A score above 80 means you sometimes pay early. Lenders and vendors pull this score constantly.</p>
<p>Experian Business runs its own scoring system. Their Intelliscore Plus scale also runs from 1 to 100. They look at payment history, credit utilization, public records, and how long your business has been active. A score above 76 is considered low risk. Experian Business also provides something called a Financial Stability Risk score, which lenders use to predict the likelihood your business will fail in the next 12 months.</p>
<p>Equifax Business scores your company on a scale of 101 to 992. Higher is better. They also generate a Payment Index score on a 0 to 100 scale, similar to PAYDEX, that reflects how timely your business pays its bills. Equifax Business is used heavily by banks and commercial lenders when they are doing deeper due diligence on a loan application.</p>
<p>These three agencies compile information from vendors, lenders, and public records. They do not automatically get your information. Your business has to have accounts that report to them, which is exactly what you will build in Module 2.</p>
<p>You can check your business credit reports directly. Dun & Bradstreet offers reports at dnb.com. Experian Business is at businesscreditfacts.com. Nav.com is a free tool that shows you a summary of your business credit from multiple bureaus in one place and is a solid starting point.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Go to nav.com and create a free account to see your current business credit summary</li>
  <li>Write down which bureaus currently show a file for your business (many will show nothing, and that is expected)</li>
  <li>Bookmark dnb.com, businesscreditfacts.com, and nav.com as your three ongoing monitoring tools</li>
</ul>',
NULL, 2);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Why Your Business Does Not Have Credit Yet (And That Is Normal)',
'<p>If you searched your business name and found nothing, or found a thin file with no score, you are probably feeling one of two things right now: relief that you are not behind, or frustration that you have been in business for years and still have no credit to show for it. Both of those feelings make complete sense.</p>
<p>Business credit does not build itself. The system is not designed to automatically track your business once you register it. Nobody from Dun & Bradstreet shows up when you file your LLC paperwork. The bureaus only build a file when businesses and lenders start reporting your payment activity to them. If you have not had accounts that report, there is no file.</p>
<p>This is one of the places where the system disadvantages people who were never told how it works. If your family ran businesses informally, if you have been operating as a sole proprietor using your SSN, or if you have been paying everything in cash, your business has left no footprint in the credit system. That is not a character flaw. That is just how the system was set up, and most of the people it leaves out are exactly the people this course is designed for.</p>
<p>The good news is that business credit can be built much faster than personal credit. Personal credit takes years to age properly. Business credit, when you do it right, can show meaningful scores within six to twelve months. Some people see a PAYDEX score appear within ninety days of opening their first vendor accounts.</p>
<p>The catch is that you have to be intentional and organized. You cannot just open accounts and hope for the best. You need accounts that actually report to the bureaus. You need to pay them on time or early. And you need to monitor the files to make sure the reporting is actually happening. All of that is what the next three modules walk you through.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Look up whether your business is currently registered with Dun & Bradstreet by searching your business name at dnb.com/find-a-company</li>
  <li>Write down how long your business has been operating and what payment activity exists under your EIN versus your SSN</li>
  <li>Decide on the specific date you will start building your business credit file (not "soon" — pick an actual date this week)</li>
</ul>',
NULL, 3);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Separating Business and Personal — The Foundation Everything Else Requires',
'<p>This lesson might feel basic, but it is the one that trips people up the most. You can go through every step in this course and still undermine your results if you skip this one. Mixing personal and business finances is the most common reason small business owners cannot access capital when they need it.</p>
<p>The separation starts with structure. If your business is a sole proprietorship with no formal registration, everything is tied to your personal credit and your personal taxes. That is a liability, not just a credit issue. The first step toward real business credit is forming a legal entity. An LLC is the most common and least expensive route. In most states you can file one online for between $50 and $500 depending on the state.</p>
<p>After your entity is formed, your business needs its own Employer Identification Number. An EIN is like a Social Security number for your business. You get one free at irs.gov, and it takes about ten minutes. Once you have an EIN, stop using your personal SSN for any business-related applications, accounts, or vendor signups.</p>
<p>Open a dedicated business checking account. It does not have to be at a big bank. Many credit unions and online banks like Relay or Bluevine offer free or low-cost business checking accounts with no minimum balance requirements. The point is that all business income flows into this account and all business expenses come out of it. Nothing personal touches this account.</p>
<p>Get a dedicated business phone number and a business email address on your domain, not a Gmail. Lenders and vendors use these details to verify your business. A business that looks like a real operation from the outside is easier to extend credit to than one that looks informal.</p>
<p>The harder part is consistency. Once you set this up, you have to maintain the separation. No buying personal groceries from the business account. No depositing business checks into your personal account. Lenders look at your bank statements when you apply for funding, and mixed transactions raise immediate red flags.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>If your business is not yet an LLC or corporation, go to your state''s Secretary of State website today and look up the filing requirements</li>
  <li>Apply for a free EIN at irs.gov/businesses/small-businesses-self-employed/apply-for-an-employer-identification-number-ein-online</li>
  <li>Open a dedicated business checking account this week if you do not already have one separate from your personal accounts</li>
</ul>',
NULL, 4);

-- ═══════════════════════════════════════════════
-- MODULE 2
-- ═══════════════════════════════════════════════
INSERT INTO modules (course_id, title, position)
VALUES (v_course_id, 'Building Your Business Credit Profile from Zero', 2)
RETURNING id INTO v_mod_id;

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Getting Your DUNS Number and Business Credit File Started',
'<p>There is something quietly frustrating about being told to "build business credit" when nobody explains where you actually start. It feels like being told to get a job when you need experience to get the job. This lesson breaks down the real first step.</p>
<p>Your D-U-N-S number is a nine-digit identifier assigned by Dun & Bradstreet that becomes the anchor for your business credit file. Lenders, federal agencies, and vendors use it to look your business up. You need one. The good news is it is free. Go to dnb.com and search "get a DUNS number." The free process takes up to thirty days, but if you apply through the federal government''s SAM.gov registration (which is required for federal contracts and grants), it is expedited.</p>
<p>When you register, use your registered business name exactly as it appears on your formation documents. Use your business address, not a P.O. box. Use your business phone number. Inconsistency in how your business information appears across different filings is something bureaus notice, and it can slow down your file-building. If your name is "Simmons Consulting LLC" on your LLC filing, it should say "Simmons Consulting LLC" everywhere, not "Simmons Consulting" or "SC LLC."</p>
<p>After your DUNS number is issued, you can monitor your Dun & Bradstreet file at dnb.com. Initially the file will exist but have no score because there is no payment data yet. That is exactly what Module 2 is designed to fix.</p>
<p>You should also register your business with Experian Business and check for an existing file. You can do this at businesscreditfacts.com. If no file exists, do not panic. It will be created automatically once vendors begin reporting payments.</p>
<p>Consistency is everything in this stage. The same business name, address, phone number, and EIN should appear on your business bank account, your website, your Google Business Profile, your Secretary of State filing, and every vendor account you open. This consistency is what the bureaus use to verify your business is legitimate.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Go to dnb.com and apply for your DUNS number (free — allow up to 30 days or use SAM.gov for faster processing)</li>
  <li>Create a simple document with your exact business name, address, EIN, and phone number to use as a reference every time you open a new account</li>
  <li>Check businesscreditfacts.com to see if Experian Business already has a file on your company</li>
</ul>',
NULL, 1);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Net-30 Vendor Accounts — Your First Business Credit Tradelines',
'<p>This is where most people stall because they do not know these accounts exist. Net-30 vendor accounts are exactly what they sound like: a vendor extends your business credit to purchase supplies or services, and you have 30 days to pay the invoice. When you pay on time or early, that vendor reports your positive payment history to the business credit bureaus.</p>
<p>These accounts are sometimes called "starter accounts" because they are designed for businesses with little or no credit history. You do not need an existing credit score to open most of them. That is the point. They are the ladder you use to climb to the accounts that require a score.</p>
<p>A few specific accounts that report to the business credit bureaus and are accessible to new businesses include Uline, which sells shipping and packaging supplies and reports to Dun & Bradstreet. Quill, which sells office supplies and reports to Dun & Bradstreet and Experian Business. Crown Office Supplies, which reports to all three major bureaus. Grainger, which sells industrial and facility supplies and reports to Dun & Bradstreet. And the Summa Office Supplies account, which is specifically designed as a starter tradeline.</p>
<p>To get the reporting to count, you need to actually buy something on the account and pay it within the net-30 window. Buying nothing means nothing gets reported. Aim to open three to five net-30 accounts in your first ninety days and use each one at least once.</p>
<p>Pay early when you can. A PAYDEX score of 80 means you paid on time. A score of 90 or above means you paid early. Paying five to ten days before the due date signals financial health. On a $75 Quill order, paying in twenty days instead of thirty costs you nothing extra and builds a stronger score.</p>
<p>Keep your purchases reasonable and business-related. You are not trying to run up debt. You are creating a payment history. A $47.50 purchase paid early is more valuable to your credit file than a $500 purchase paid late.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Open an account with Uline at uline.com using your business name, EIN, and business address</li>
  <li>Open an account with Quill at quill.com and note whether they have a net-30 option during checkout</li>
  <li>Make at least one purchase from each account this week and set a calendar reminder to pay it 10 days before the due date</li>
</ul>',
NULL, 2);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Business Credit Cards — Which to Get First and How to Use Them',
'<p>Credit cards make people nervous, especially if you have had credit card debt before. That history is valid. But a business credit card used correctly is one of the fastest ways to build your business credit profile, and this lesson is about using it correctly.</p>
<p>The first business credit card most new businesses qualify for is a secured business credit card. A secured card requires a deposit, usually between $200 and $500, which becomes your credit limit. The Capital One Spark Classic and the Bank of America Business Advantage are examples. These report to the business credit bureaus and help establish your profile even when you are just starting out.</p>
<p>Once you have three to six months of payment history and some net-30 tradelines reporting, you may qualify for an unsecured business credit card. The Divvy card (now Bill Spend & Expense) is a strong option for newer businesses because approval is based partly on your business bank account balance rather than only on credit scores. The American Express Blue Business Cash card is another solid option for businesses with growing profiles.</p>
<p>How you use the card matters as much as having it. Keep your balance below 30 percent of your credit limit at all times, and ideally below 10 percent. That means if your limit is $1,000, aim to never carry more than $100 to $300 on the card at any given time. Credit utilization is one of the biggest factors in your business credit score.</p>
<p>Pay the full balance every month. Not the minimum. The full amount. Interest charges are not worth it at business credit card rates, which can run between 19 and 29 percent APR. Use the card for recurring expenses like your business phone bill, a software subscription, or office supplies, and pay it off every month before the due date.</p>
<p>Do not open multiple cards at once. Each application can trigger a hard inquiry. Open one card, use it well for three to six months, and then evaluate whether a second card makes sense.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Research the Capital One Spark Classic or Divvy card as your first business credit card option</li>
  <li>Set a specific monthly spending limit for your business credit card that you know you can pay off in full</li>
  <li>Set up autopay for the full statement balance so you never accidentally miss a payment</li>
</ul>',
NULL, 3);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Monitoring Your Business Credit and Disputing Errors',
'<p>Here is something most people do not realize: business credit reports contain errors at an alarming rate. A 2022 study found that a significant portion of small business credit files contain outdated, incorrect, or incomplete information. And unlike the consumer credit system, the dispute process for business credit is less regulated and harder to navigate. You have to stay on top of this yourself.</p>
<p>Monitoring your business credit is not a once-a-year task. It is a monthly habit, especially in the first year when you are actively building your file. You want to confirm that your vendor accounts are actually reporting, that the payment dates recorded are accurate, and that no unfamiliar accounts or public records have appeared.</p>
<p>Nav.com gives you a free summary of your business credit across bureaus. For your full Dun & Bradstreet report, you can access it at dnb.com. For Experian Business, businesscreditfacts.com offers monitoring plans. The paid tiers are worth it once you are actively applying for credit or funding, but the free tools are enough to start.</p>
<p>When you find an error, contact the bureau directly. For Dun & Bradstreet, disputes go through their data dispute form at dnb.com. For Experian Business, disputes are submitted at businesscreditfacts.com. Unlike the consumer process, there is no equivalent to the Fair Credit Reporting Act protecting your business credit dispute rights. You may need to be persistent and follow up multiple times.</p>
<p>Document everything. If a vendor account is not showing up, contact the vendor first and confirm they report to the bureaus. Some vendors claim to report but do not. Others have a threshold, like a minimum of three purchases, before they begin reporting. Knowing this prevents you from waiting on reporting that was never coming.</p>
<p>Set a recurring calendar reminder every month to check Nav and review your PAYDEX and Intelliscore. Treat it like checking your business bank balance. It is that important.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Set a recurring monthly calendar reminder to check your business credit summary on Nav.com</li>
  <li>After 60 days of using your first net-30 accounts, pull a full Dun & Bradstreet report and confirm those accounts are appearing</li>
  <li>Write down any accounts you have opened and the bureaus they are supposed to report to, so you have a tracking reference</li>
</ul>',
NULL, 4);

-- ═══════════════════════════════════════════════
-- MODULE 3
-- ═══════════════════════════════════════════════
INSERT INTO modules (course_id, title, position)
VALUES (v_course_id, 'Traditional Funding — Banks, SBA, and Credit Lines', 3)
RETURNING id INTO v_mod_id;

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'How Banks Actually Evaluate a Small Business Loan Application',
'<p>Walking into a bank to ask for a business loan is one of the more vulnerable things you can do as a business owner. You are putting your idea and your numbers in front of someone who has the power to say no, and if that person has never been in your shoes or does not understand your industry, that rejection can feel personal even when it is not. This lesson gives you the inside view so you are never walking in blind.</p>
<p>Banks use something called the Five C''s of Credit when evaluating a business loan application: Character, Capacity, Capital, Collateral, and Conditions. Understanding these is not just useful for applying to banks. It applies to almost every formal lending conversation you will ever have.</p>
<p>Character is your credit history and reputation. This is where your personal credit score comes in for newer businesses, along with any business credit history you have built. A banker is asking: does this person pay their debts?</p>
<p>Capacity is your ability to repay. They look at your revenue, your cash flow, and your debt-to-income ratio. They want to see that your business generates enough income to cover the loan payments with room to spare. Most banks want to see a Debt Service Coverage Ratio of at least 1.25, meaning your business earns $1.25 for every $1.00 of debt payments.</p>
<p>Capital is what you have put into the business yourself. Lenders want to see that you have skin in the game. If you are asking for $50,000 and you have put in zero of your own money, that is a harder case to make than if you have invested $10,000 or $15,000 of your own.</p>
<p>Collateral is what the bank can take if you default. Equipment, real estate, inventory, or accounts receivable can all be used as collateral. Many small business owners do not have significant collateral, which is one reason the SBA loan programs exist — they partially guarantee the loan so the bank takes less risk.</p>
<p>Conditions are external factors: the state of the economy, your industry trends, and what you are using the loan for. A bank is more comfortable lending for equipment purchase than for general operating expenses because equipment is a tangible asset.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Pull your last two years of business bank statements and calculate your average monthly revenue</li>
  <li>Write out what you would use a business loan for and whether it is equipment, inventory, hiring, or operating expenses</li>
  <li>Check your personal credit score at annualcreditreport.com and note anything that would concern a lender</li>
</ul>',
NULL, 1);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'SBA Loans — 7(a), Microloans, and What Each One Is For',
'<p>The SBA loan landscape is one of the most talked-about and least understood parts of small business funding. People hear "SBA loan" and think it is one thing. It is not. The Small Business Administration offers multiple loan programs that work completely differently and serve different needs. This lesson breaks down the ones that matter most to small business owners building from the ground up.</p>
<p>The SBA 7(a) loan is the most common SBA loan program. Loan amounts go up to $5 million, but most small business owners apply for amounts between $50,000 and $350,000. The SBA does not lend you money directly. Instead, they guarantee a portion of the loan to an approved bank or credit union, which reduces the lender''s risk and makes them more willing to say yes to businesses that do not qualify for conventional loans. Interest rates on 7(a) loans are capped by the SBA and are generally lower than what you would get from an alternative lender.</p>
<p>The SBA Microloan program is specifically designed for businesses that need smaller amounts, up to $50,000. Microloans are issued through SBA-approved nonprofit lenders, not banks. These lenders often work with newer businesses, businesses in underserved communities, and businesses owned by women and minorities. The average SBA microloan is around $13,000. Many microloan lenders also provide technical assistance and coaching alongside the funding.</p>
<p>The SBA 504 loan is designed for major fixed assets: real estate, construction, or large equipment. If you are buying a commercial property or a $200,000 piece of manufacturing equipment, this is the program to research. It is not designed for working capital.</p>
<p>For most people in this course, the Microloan program and the 7(a) program are the two most relevant options. The Microloan is often the better starting point because the lenders are mission-driven, the application requirements are more accessible, and you are more likely to get a yes when you are earlier in your business journey.</p>
<p>You can find SBA-approved lenders and microloan intermediaries at sba.gov/local-assistance.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Go to sba.gov/local-assistance and find the SBA district office closest to you</li>
  <li>Look up SBA microloan intermediaries in your state and note which ones serve your type of business</li>
  <li>Write down how much funding you would need, what you would use it for, and what your current annual revenue is — these are the first three things every lender will ask</li>
</ul>',
NULL, 2);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Business Lines of Credit — How They Work and When to Use One',
'<p>A business line of credit is not a loan. That distinction matters because people often use them the same way and end up in trouble. A line of credit is a pool of money you can draw from as needed, up to a set limit, and you only pay interest on what you actually use. When you pay it back, the funds become available again. It is revolving, like a credit card, but usually with higher limits and lower interest rates.</p>
<p>Lines of credit are designed for cash flow management, not for making major purchases. If your business has a slow month and payroll is coming up, a line of credit covers the gap. If you have a large order coming in and you need supplies to fulfill it before the client pays you, a line of credit bridges that gap. Using a line of credit to buy equipment or fund a renovation is not what it is designed for, and it is an easy way to create a debt cycle.</p>
<p>To qualify for a business line of credit at a traditional bank, lenders typically want to see two or more years in business, annual revenue of at least $100,000, a personal credit score above 680, and a business credit profile with positive history. If you do not meet all of those criteria yet, that is normal. Community banks, credit unions, and online lenders often have more flexible requirements.</p>
<p>Online lenders like Bluevine and Fundbox offer business lines of credit to businesses with shorter operating histories. Bluevine requires at least six months in business and $120,000 or more in annual revenue. Fundbox requires three months in business and $100,000 in annual revenue. Interest rates from online lenders are higher than from banks, typically ranging from 7 to 26 percent APR, but the access and speed can be worth it for the right situation.</p>
<p>Once you have a line of credit, treat it carefully. Draw from it strategically, pay it back quickly, and do not treat it as income. It is a tool. Use it like one.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Write down your average monthly revenue and your highest-cost month for expenses to identify your actual cash flow gap</li>
  <li>Research whether your current business bank offers a line of credit and what their minimum requirements are</li>
  <li>If you have been in business less than two years, look up Bluevine and Fundbox as alternative options and compare their current rates</li>
</ul>',
NULL, 3);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'What to Have Ready Before You Walk Into Any Lender',
'<p>Most loan applications do not fail because the business was not qualified. They fail because the owner was not prepared, or because the paperwork painted a different picture than the one they intended. Showing up to a lender meeting without the right documents does not just slow things down. It signals disorganization, and lenders notice that.</p>
<p>Here is the core set of documents most lenders will ask for: two years of business tax returns, two years of personal tax returns, three to six months of business bank statements, a current profit and loss statement, a current balance sheet, a business plan or executive summary with financial projections, proof of business registration and EIN, and any existing business debt schedule showing what you already owe.</p>
<p>If your business is less than two years old, you may not have business tax returns yet. In that case, lenders will lean harder on your personal tax returns, your bank statements, and your business plan. Your projections need to be realistic and backed by real numbers, not wishful thinking. A lender who has seen hundreds of projections knows immediately when the numbers are not grounded.</p>
<p>Your business plan does not need to be fifty pages. A strong executive summary with a market overview, your revenue model, your management background, and your financial projections can be more effective than a thick document full of filler. The goal is to show that you understand your business and have a clear plan for how the funding will help it grow.</p>
<p>One often-overlooked item: know your use of funds exactly. "Working capital" is not an answer. "Purchasing $47,500 in equipment to fulfill a contract with X client, with a projected revenue increase of $8,000 per month" is an answer. The more specific you are, the more confident a lender can be that you know what you are doing.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Create a single folder, either on your computer or in Google Drive, that holds all of your key business documents</li>
  <li>Make sure your profit and loss statement is current to within the last 30 days — if it is not, update it before any lender meeting</li>
  <li>Write out your use of funds in one clear paragraph with specific numbers before you apply for anything</li>
</ul>',
NULL, 4);

-- ═══════════════════════════════════════════════
-- MODULE 4
-- ═══════════════════════════════════════════════
INSERT INTO modules (course_id, title, position)
VALUES (v_course_id, 'CDFIs and Community Capital', 4)
RETURNING id INTO v_mod_id;

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'What a CDFI Is and Why It Exists',
'<p>There is a reason you probably have not heard of CDFIs before. They do not advertise on billboards. They do not have the marketing budgets of big banks. And the communities they serve are often the same communities that mainstream financial systems have historically ignored. But CDFIs are real, they are funded, and they exist specifically for businesses like yours.</p>
<p>CDFI stands for Community Development Financial Institution. It is a term created by federal law, the Riegle Community Development Banking and Financial Institutions Act of 1994, and it refers to any financial institution that has been certified by the U.S. Treasury''s CDFI Fund as meeting specific criteria. The core requirement is that the institution must direct a significant portion of its lending and services to low-income and underserved communities.</p>
<p>CDFIs come in several forms: community development banks, credit unions, loan funds, and venture capital funds. Not all of them do the same thing. Some focus on home mortgages. Some focus on small business lending. Some focus on affordable housing development. For the purposes of this course, you are looking specifically for CDFI loan funds and community development credit unions that serve small business owners.</p>
<p>The CDFI Fund at the U.S. Treasury certifies these institutions and, in many years, provides grants and tax credit allocations to support their work. That federal backing is part of why CDFIs can offer terms that traditional banks cannot. They have access to capital that was specifically appropriated to help them serve underserved borrowers.</p>
<p>CDFIs exist in every state and in many cities. Some are small and hyper-local, focused on one county or one neighborhood. Others, like Opportunity Finance Network members, operate regionally or nationally. The industry is real and growing. As of 2023, there were more than 1,400 certified CDFIs in the United States, collectively managing tens of billions of dollars in lending.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Go to the CDFI Fund locator at cdfifund.gov and search for CDFIs in your state</li>
  <li>Look up whether Opportunity Finance Network (ofn.org) has member organizations in your area</li>
  <li>Write down the names and contact information for at least two CDFIs that serve small businesses near you</li>
</ul>',
NULL, 1);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'How CDFIs Differ From Banks — Mission, Terms, and Who They Serve',
'<p>If you have been turned down by a bank, or if the idea of walking into a bank feels out of reach right now, understanding how CDFIs operate differently is one of the most important things you can take from this course. The differences are not small. They are structural.</p>
<p>Traditional banks are profit-driven institutions. Their primary obligation is to shareholders and depositors. When they evaluate a loan, the default question is: what is the risk to us? A borrower with thin credit history, a newer business, or a gap in documentation is often a no before the conversation even starts. Banks have regulators who require them to maintain certain portfolio standards, and that pressure flows downhill to borrowers.</p>
<p>CDFIs have a different mandate. Their primary obligation is to their community mission. They measure success not just by financial returns but by community impact: jobs created, businesses supported, neighborhoods strengthened. That mission is baked into their certification requirements and their board governance. It changes how they evaluate applications.</p>
<p>CDFIs consider factors that banks often will not. They may look at your character references and community relationships. They may accept alternative documentation of income. They may offer technical assistance and coaching as part of the lending relationship, not just the loan. Many CDFIs have loan officers who will work with you to strengthen your application rather than just processing it and sending a rejection.</p>
<p>CDFI loan terms are often more favorable than alternative lenders but may be slightly higher than prime bank rates. A business loan through a CDFI might carry an interest rate of 7 to 15 percent, compared to 6 to 9 percent at a conventional bank and 20 to 40 percent through an online alternative lender. The difference in the mission and the relationship is often worth the rate differential.</p>
<p>CDFIs are not charity. They expect repayment. But they structure loans to be repayable given the real financial situation of the borrower, which is a fundamentally different approach from a system designed to serve borrowers who already have every advantage.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Call or email one CDFI from your list in Lesson 1 and ask for their small business loan requirements and minimum loan amounts</li>
  <li>Ask specifically whether they offer technical assistance or financial coaching alongside their loans</li>
  <li>Write down the comparison: what a bank requires versus what this CDFI requires, and note the differences</li>
</ul>',
NULL, 2);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Finding the CDFI in Your Area and What to Expect',
'<p>The search process is less complicated than it sounds, and once you know where to look, you will probably find more options than you expected. The challenge is that CDFIs tend to be quieter about their services, so you often have to go find them rather than waiting for them to find you.</p>
<p>The CDFI Fund''s award database at cdfifund.gov/programs-training/programs/cdfi-program/Pages/awardees.aspx lets you search by state and type of institution. You can also use the Opportunity Finance Network''s member directory at ofn.org. Another strong resource is your local Small Business Development Center (SBDC). SBDCs are funded through the SBA and exist in every state. SBDC advisors often know the CDFI landscape in their region better than anyone and can make warm introductions.</p>
<p>When you contact a CDFI, expect a different kind of conversation than a bank loan interview. Many CDFI loan officers will ask about your story, your community ties, your business vision, and the challenges you have faced, not just your financials. They may ask for a business plan but be more flexible about its format. They are often looking for someone who is serious and committed, not just someone who already fits a financial profile.</p>
<p>Be honest about where you are. Do not overstate your revenue or minimize your challenges. CDFIs work with real numbers and real situations. A loan officer who finds out mid-process that your numbers were inflated will not trust the rest of your application. Transparency builds relationships, and relationships at a CDFI matter.</p>
<p>Expect the process to take four to twelve weeks from application to funding. It is slower than an online lender but faster than a traditional bank. Some CDFIs have emergency or rapid-response loan programs for businesses in crisis situations that move faster.</p>
<p>After you receive a CDFI loan, keep the relationship warm. Many CDFIs offer ongoing financial coaching, connections to grants and other capital, and referrals to other lenders as your business grows. Treating your CDFI as a long-term partner rather than a one-time transaction is one of the best financial decisions you can make.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Go to sba.gov/local-assistance and find your nearest Small Business Development Center, then schedule a free consultation</li>
  <li>At your SBDC meeting, specifically ask which CDFIs they work with and whether they can make a warm introduction</li>
  <li>Prepare a two-minute verbal summary of your business, what you need funding for, and what you will do with it before making any CDFI contact</li>
</ul>',
NULL, 3);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Microloan Programs — Kiva, Accion, and Other Community Lenders',
'<p>The word "microloan" sometimes makes people feel like it is not a real amount of money. But a $10,000 loan at the right moment, for the right purpose, can change the entire trajectory of a small business. Microloan programs exist because the smallest businesses, the ones with the most growth potential and the fewest existing resources, are the ones most consistently left out of traditional lending.</p>
<p>Kiva is a global microlending platform that works differently from any other lender in this course. Kiva loans are crowdfunded by individual lenders from around the world, and they carry zero percent interest. That is not a typo. The loans range from $1,000 to $15,000. The process involves a social fundraising component where you share your loan request with your personal network first, and then Kiva opens your campaign to their global community of lenders. Kiva borrowers also typically receive mentorship and business support. Visit kiva.org/borrow to start an application.</p>
<p>Accion Opportunity Fund is one of the largest nonprofit small business lenders in the country. They lend to businesses that are too new or too small for traditional bank loans, with a specific focus on women, people of color, and low-income business owners. Loan amounts range from $5,000 to $250,000. Their interest rates are higher than CDFIs but lower than online alternative lenders. They also offer one-on-one coaching and financial education. Visit accionopportunityfund.org to learn more.</p>
<p>LiftFund operates primarily in the South and Southwest and serves small businesses with loans from $500 to $1 million, with a focus on underserved communities. Grameen America specifically serves women living in poverty who want to start or grow a business, with a group-lending model and individual loans starting at $2,000.</p>
<p>Before applying to any microloan program, understand what you are using the money for and have a specific plan. "I need working capital" is less compelling than "I need $7,500 to purchase the inventory for three confirmed wholesale orders that will generate $14,200 in revenue." Specificity signals readiness, and readiness is what microloan lenders are looking for.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Go to kiva.org/borrow and read the eligibility requirements to see if your business qualifies for a Kiva loan</li>
  <li>Visit accionopportunityfund.org and look at their loan requirements and current interest rates</li>
  <li>Write out a one-paragraph description of why you need a specific dollar amount and what you will use it for — be exact</li>
</ul>',
NULL, 4);

-- ═══════════════════════════════════════════════
-- MODULE 5
-- ═══════════════════════════════════════════════
INSERT INTO modules (course_id, title, position)
VALUES (v_course_id, 'Social Equity as Capital Access', 5)
RETURNING id INTO v_mod_id;

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'What Social Equity Means as a Business Strategy — Not Just a Buzzword',
'<p>The term "social equity" gets used a lot in political conversations, and that can make it easy to dismiss as abstract or irrelevant to your day-to-day business. It is neither. As a capital access strategy, social equity is one of the most practical tools available to small business owners who are building outside of traditional financial pathways. This lesson explains what it actually means and why it matters for your business.</p>
<p>Social equity as a business concept refers to the value, ownership stake, and community relationships that your business builds over time. It includes the actual equity you hold in your own company, the assets your business accumulates, the relationships you have built in your community, and the reputation of your brand among the people it serves. These are forms of wealth that do not always show up on a bank statement but that directly affect your ability to access capital.</p>
<p>The financial system was largely built to serve people who already had capital. That is not a conspiracy theory. It is just history. Redlining, discriminatory lending, and the exclusion of certain communities from asset-building opportunities over generations created compounding disadvantages that show up today as credit gaps, wealth gaps, and access gaps. Social equity strategies exist partly as a response to those gaps.</p>
<p>For your business, thinking about equity means asking: what do you own? Not just in terms of legal ownership of your LLC, but in terms of real assets. Equipment, intellectual property, a building, a customer list, a recognizable brand. These are all forms of equity. When you own them, you have collateral that can be used to access capital and a foundation that holds value over time.</p>
<p>It also means thinking about your position in your community. Businesses that are embedded in their communities, that have loyal customers, that have partnerships with other organizations, have a form of social capital that makes them more fundable and more resilient. That is not soft language. It is what community investors and CDFIs look at when they are deciding who to fund.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>List every asset your business currently owns, including equipment, vehicles, intellectual property, domain names, and proprietary processes</li>
  <li>Write down three community relationships your business has that could be considered assets (partnerships, loyal clients, referral networks)</li>
  <li>Assess whether you are building equity in your business or just generating revenue that flows out without leaving anything behind</li>
</ul>',
NULL, 1);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Revenue Share and Community Investment — Raising Capital Without a Bank',
'<p>This lesson is about a question most small business owners do not even know they can ask: what if instead of borrowing money and paying interest to a bank, you raise money from people who believe in your business and pay them back as a share of your revenue? That is revenue share financing, and it is a real and growing option.</p>
<p>Revenue share financing, also called revenue-based financing, means an investor provides capital to your business and receives a percentage of your monthly or quarterly revenue until a set repayment amount is reached. There is no fixed monthly payment, no interest rate in the traditional sense, and no equity stake that dilutes your ownership. You pay more when revenue is strong and less when it is slower. The total repayment is typically 1.3 to 2 times the original investment.</p>
<p>This model is especially useful for businesses with predictable but seasonal revenue, businesses in cash-intensive industries, and businesses that do not want to give up equity to a traditional investor but also do not qualify for or want a traditional loan. The trade-off is that the effective cost of capital is often higher than a bank loan when you calculate it fully. Going in with clear eyes about that is important.</p>
<p>Community investment takes this concept further. In some models, a business raises capital directly from its community, from customers, neighbors, and supporters, through legal structures that allow everyday people to invest small amounts. The federal JOBS Act and its Regulation CF (crowdfunding) made this more accessible. Platforms like Honeycomb Credit and Wefunder allow small businesses to raise between $10,000 and $5 million from their communities through small individual investments.</p>
<p>This is not about GoFundMe. It is about structured investment where your community members become stakeholders in your growth. When the people who care about your business are also invested in it financially, you build a base of advocates who have a personal reason to see you succeed.</p>
<p>The requirements vary by platform and by the structure used. Most platforms charge a fee on funds raised, typically between 3 and 7 percent. You will need basic financial statements and a clear description of your business and how the funds will be used.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Research Honeycomb Credit (honeycombcredit.com) and Wefunder (wefunder.com) to see their eligibility requirements and fee structures</li>
  <li>Think about your existing customer base and whether there are 50 to 100 people who would invest $500 to $2,500 in your business if given the option</li>
  <li>Write down one business initiative that would be well-suited for community investment, with a specific dollar goal</li>
</ul>',
NULL, 2);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Cooperative Ownership and Equity Structures for Small Business',
'<p>Cooperative business structures are some of the oldest and most stable forms of business ownership in the world. Agricultural cooperatives, credit unions, and food co-ops have operated on this model for generations. But many small business owners have never considered whether a cooperative structure could work for their business, or whether cooperating with other small businesses could be a path to capital access that none of them could access alone.</p>
<p>A cooperative is a business owned and democratically controlled by its members. In a worker cooperative, the workers own and govern the business. In a consumer cooperative, the customers own the business. In a multi-stakeholder cooperative, ownership is shared among workers, customers, and community members. The cooperative model distributes both risk and reward, and it creates a built-in community of invested stakeholders.</p>
<p>For a small business owner, one of the most practical applications of cooperative thinking is joining or forming a purchasing cooperative. When multiple small businesses in the same industry pool their purchasing power, they can negotiate terms that none of them could get alone: lower prices, net-60 terms, bulk pricing, shared shipping costs. This is not merging your businesses. It is coordinating your purchasing to increase your collective access.</p>
<p>Shared equity structures between business partners are another form of cooperative thinking. If you are a contractor and a supplier, forming a formal equity partnership where you both own shares in a combined operation can create access to larger contracts, combined credit capacity, and shared risk. These structures require legal documentation and clear operating agreements, but they can dramatically expand what each business can do alone.</p>
<p>For businesses in communities that have been systematically excluded from capital, cooperatives can also be a mechanism for pooling community investment. Some CDFIs specialize in financing cooperative businesses because the collective ownership model reduces default risk and creates community accountability.</p>
<p>The Democracy at Work Institute (institute.coop) is one of the best resources for understanding cooperative conversions and startup structures.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Look up whether there is a purchasing cooperative or trade association in your industry that you could join</li>
  <li>Research the Democracy at Work Institute at institute.coop and read about cooperative conversions for established small businesses</li>
  <li>Identify one other business owner in your network with whom a formal equity partnership or resource-sharing structure might be worth discussing</li>
</ul>',
NULL, 3);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Building Your Own Equity — Assets, Ownership, and Long-Term Capital Creation',
'<p>Everything in this module comes back to one idea: the most durable form of capital access is the equity you build in things you own. Loans get paid off. Grants get spent. But assets and ownership compound over time and create options that income alone cannot create. This lesson is about thinking strategically about what your business is building, not just what it is earning.</p>
<p>Business equity is the difference between what your business owns and what it owes. If your business has $85,000 in assets and $30,000 in liabilities, your equity is $55,000. That number matters because it is what a buyer would pay for your business, it is what you have to show a lender when they ask about collateral, and it is what you would walk away with if you ever sold. Building equity means deliberately increasing that number over time.</p>
<p>Owning equipment rather than renting it is one form of equity building. Equipment can be used as collateral for future loans. Owning your commercial space rather than leasing it is a more significant form of equity building, and SBA 504 loans exist specifically to help small businesses do this. Owning intellectual property: your brand, your system, your course, your process, creates an asset that can be licensed, sold, or used to attract investors.</p>
<p>Your personal real estate ownership, if you have it, can also factor into your business capital access. Many small business owners have used a home equity line of credit as startup capital. This carries real risk, specifically the risk of your home, and should be considered carefully. But it is one of the most common ways that business owners in the early stages access larger amounts of capital.</p>
<p>Long-term equity building also means thinking about what your business is worth as an entity. A business with documented systems, recurring revenue, and loyal customers is worth more than a business that is entirely dependent on the founder''s personal time and relationships. As you build systems and document your processes, you are not just working more efficiently. You are building equity.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Calculate your current business equity: list everything your business owns and subtract everything it owes</li>
  <li>Identify one asset you currently rent or lease that you could own instead within the next 12 to 24 months</li>
  <li>Write down what your business would be worth to a buyer today, and what you would need to change to double that number</li>
</ul>',
NULL, 4);

-- ═══════════════════════════════════════════════
-- MODULE 6
-- ═══════════════════════════════════════════════
INSERT INTO modules (course_id, title, position)
VALUES (v_course_id, 'Grants, Competitions, and Strategic Funding', 6)
RETURNING id INTO v_mod_id;

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Business Grants — What Is Real and What Is a Waste of Time',
'<p>There is so much noise around business grants that it is hard to know what to believe. You have probably seen ads promising thousands of dollars in free money for small businesses. Some of those ads are real. A lot of them are designed to sell you a list, a course, or a membership. This lesson is about sorting out the difference so you spend your time on what is actually available.</p>
<p>Real business grants exist and are awarded every year. Federal agencies, state economic development offices, nonprofit foundations, and corporations all offer grant programs. The defining characteristic of a real grant is that it does not ask you to pay anything to apply, it has a documented sponsor with a verifiable history of awards, and it has a clear application process with a deadline.</p>
<p>Fake or misleading grant opportunities are characterized by vague promises, upfront fees, or programs that ask you to pay for a "grant kit" or a database subscription before you can access the application. Legitimate grant databases are free. The primary federal grant database is grants.gov, which lists federal grants including those from the USDA, Department of Commerce, Economic Development Administration, and others. GrantWatch.com is a paid database but offers a free trial and is used by nonprofits and small businesses alike.</p>
<p>The reality of business grants is that they are competitive, often require specific qualifications, and frequently require that your business match or demonstrate specific outcomes. A grant for $25,000 might require 50 to 100 hours of work across the application, reporting, and compliance process. That time investment is worth it when the grant is a strong match. It is not worth it for a $500 grant that has 2,000 applicants.</p>
<p>The strongest grant strategy is to identify two or three grant programs that are a strong fit for your specific business type, location, industry, or demographic characteristics, and focus your energy on applying excellently to those rather than spraying applications everywhere.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Create a free account at grants.gov and search for grants relevant to your business type or industry</li>
  <li>Search your state''s economic development agency website for small business grant programs currently accepting applications</li>
  <li>Write down your business''s key characteristics: woman-owned, minority-owned, veteran-owned, rural, specific industry, and use that list to narrow your grant search</li>
</ul>',
NULL, 1);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Women-Owned, Minority-Owned, and Small Business Set-Aside Grants',
'<p>If your business qualifies for any of these designations, you have access to a distinct category of funding opportunities that most businesses cannot touch. The frustrating part is that many eligible business owners never apply because they do not know the programs exist or they underestimate their chances. This lesson changes that.</p>
<p>The federal government''s Small Business Administration administers several key certification programs. The Woman-Owned Small Business (WOSB) certification gives eligible businesses access to federal contracts set aside specifically for women-owned firms. More than $4 billion in federal contracts are set aside for WOSBs every year. You do not have to be a government contractor to get certified, but the certification opens doors to programs and relationships that carry benefits beyond contracts alone.</p>
<p>The 8(a) Business Development Program, administered by the SBA, is designed for businesses owned by socially and economically disadvantaged individuals. 8(a) certification provides access to over $18 billion in federal sole-source and set-aside contracts annually. The application process is detailed and the program includes a nine-year development timeline, but for businesses positioned to pursue federal work, it is one of the most powerful programs available.</p>
<p>The Minority Business Development Agency (MBDA) operates Business Centers across the country that help minority-owned businesses access capital, contracts, and markets. MBDA centers provide free consulting and can connect you to grant opportunities, loan programs, and contract opportunities.</p>
<p>Several private foundations and corporations also run grant programs specifically for women and minority entrepreneurs. The Amber Grant, run by WomensNet, awards $10,000 monthly and $25,000 annually to women-owned businesses. The iFundWomen platform offers grants and crowdfunding specifically for women entrepreneurs. The NAACP Entrepreneurs Fund supports Black-owned businesses with capital and coaching.</p>
<p>Getting certified takes time, typically several months for federal certifications, but it is a one-time investment that opens recurring opportunities. Start with the certifications that align with your business now.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Go to sba.gov/federal-contracting/contracting-assistance-programs/women-owned-small-business-federal-contracting-program and check your eligibility for WOSB certification</li>
  <li>Look up the MBDA Business Center nearest to you at mbda.gov</li>
  <li>Search "Amber Grant" and "iFundWomen" to read current application requirements and upcoming deadlines</li>
</ul>',
NULL, 2);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Pitch Competitions — How to Find Them, What to Expect, and How to Win',
'<p>Pitch competitions may feel like something for Silicon Valley startups, not for your business. That is not true anymore, and it has not been true for a while. Pitch competitions have proliferated across every industry, geography, and demographic. There are pitch competitions specifically for women entrepreneurs, for Black-owned businesses, for rural businesses, for businesses in specific industries, and for businesses at specific revenue stages. The total prize money available across U.S. pitch competitions runs into hundreds of millions of dollars annually.</p>
<p>Finding pitch competitions takes intentional searching. Local resources are often the most overlooked: your local chamber of commerce, your Small Business Development Center, your regional economic development authority, and local banks and credit unions often sponsor or promote pitch events. Community foundations, universities, and business incubators in your area are also frequent hosts.</p>
<p>National competitions worth knowing about include the Tory Burch Foundation Fellows Program, which awards $5,000 grants and programming to women entrepreneurs. The Hello Alice pitch competitions, organized through their platform at helloalice.com, run throughout the year and cover multiple categories. The SBA''s Startup of the Year competition is hosted by Startup Week events in cities across the country.</p>
<p>What judges are looking for in a pitch is consistent across almost every competition: a clear problem and solution, evidence that there is a real market, some proof that the business model works, a realistic financial picture, and a founder who clearly knows their business and their customer. You do not need a PowerPoint with twenty slides. You need to know your numbers, tell your story clearly, and be honest about where your business is and where it is going.</p>
<p>Winning a pitch competition often has value beyond the prize money. Visibility, press coverage, investor introductions, and partnerships that come from a well-placed competition can far outweigh the check. Treat every pitch as a full presentation of your business, regardless of the prize amount.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Go to helloalice.com and search for current grant and pitch competitions you are eligible for</li>
  <li>Contact your local SBDC and chamber of commerce and ask what pitch competitions or small business showcases are coming up in your region</li>
  <li>Write a two-minute verbal pitch for your business: the problem you solve, who you serve, how you make money, and what you need — practice it until it feels natural</li>
</ul>',
NULL, 3);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Building a Funding Strategy That Uses Multiple Sources Over Time',
'<p>The biggest mistake most business owners make with funding is treating it as a single event. They need money, they look for one source, they either get it or they do not, and then the conversation stops. A real funding strategy is not a single event. It is an ongoing, layered system that you build and adjust over time.</p>
<p>The strongest small business funding strategies combine multiple sources in a sequence that matches where the business actually is. In year one, a typical combination might include personal investment, a Kiva microloan or CDFI microloan, two or three net-30 vendor accounts to build credit, and one small grant applied for and won. Those things together give you funding AND credit building AND relationships, all at the same time.</p>
<p>In year two, with credit history established, revenue documented, and relationships built, the options expand. A business line of credit becomes accessible. Larger grant programs that require proof of operating history are now open to you. SBA microloan programs that were borderline in year one are more reachable. A pitch competition with your documented revenue numbers tells a better story.</p>
<p>By year three and beyond, if you have been intentional, your business credit profile is established, you have working relationships with at least one CDFI, you have applied for and possibly won grants, and you have a track record that a bank can evaluate. Conventional bank financing, SBA 7(a) loans, and business lines of credit are now real options.</p>
<p>The key principle is that every funding action you take should also build something for the next application. Getting a Kiva loan builds credit history and proves repayability. Getting an SBA microloan builds your relationship with a mission-aligned lender who can refer you to larger programs. Winning a pitch competition builds credibility that makes the next grant application stronger.</p>
<p>Keep a funding calendar. Set aside time once a quarter to assess where your business is, what funding opportunities are open now, what you are building toward in the next six to twelve months, and what specific steps you will take this quarter toward both immediate and future funding goals.</p>
<p>The system was not built with you in mind. But you can build a strategy that works inside it, around it, and in community with others doing the same thing. That is what this course has been preparing you to do.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Write out a three-year funding timeline: what sources you will pursue in year one, year two, and year three, in that order</li>
  <li>Identify one action from this course you will complete within the next seven days and put it on your calendar right now</li>
  <li>Join one small business owner community, whether online or local, where you can share resources, referrals, and funding leads with other founders who are building the same way you are</li>
</ul>',
NULL, 4);

END $$;
