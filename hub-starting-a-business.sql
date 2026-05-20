-- ═══════════════════════════════════════════════
-- STARTING A BUSINESS: FROM IDEA TO OPEN FOR BUSINESS
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
  'starting-a-business',
  'Starting a Business: From Idea to Open for Business',
  'From idea to first customer. Six modules covering business clarity, legal structure, money foundation, operations, sales, and building for the long term.',
  0
)
ON CONFLICT (slug) DO NOTHING;

SELECT id INTO v_course_id FROM courses WHERE slug = 'starting-a-business';

-- ═══════════════════════════════════════════════
-- MODULE 1
-- ═══════════════════════════════════════════════
INSERT INTO modules (course_id, title, position)
VALUES (v_course_id, 'Before You Start — Getting Clear', 1)
RETURNING id INTO v_mod_id;

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Is This Really a Business Idea or a Hobby?',
'<p>Most people never ask themselves this question honestly. They have an idea, they get excited, they tell a few people about it, and then they start spending money before they know what they actually have. That is not a failure of effort. It is a failure of clarity. Let''s get clear before you spend a dollar.</p>
<p>A hobby is something you love doing. A business is something other people will pay you to do, consistently, at a price that covers your costs and leaves something over for you. Those two things can overlap, but they do not always. And the gap between them is where a lot of people get stuck.</p>
<p>Here is the honest test: Would someone pay you for this today, without you having to convince them for very long? Not your mom. Not your best friend. A stranger with a real problem, real money, and real options. If the answer is yes, you might have a business. If the answer is "eventually," or "once I get more training," or "once I build the website," keep reading because you need to get more specific first.</p>
<p>Some of the strongest businesses come from hobbies. The question is not whether you love it. The question is whether the market cares. Loving to bake does not make a bakery profitable. Knowing how to bake at a price point that covers ingredients, your time, packaging, and overhead, while customers come back and tell their friends, that is a business.</p>
<p>The other trap is the idea that needs too much explanation. If you cannot describe what you sell, to whom, and why they would buy it in two sentences, the idea is not ready yet. That does not mean it is bad. It means you have more thinking to do before you start spending.</p>
<p>Write your two sentences now. If you cannot, that is your first piece of work.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Write what you sell, who buys it, and why they would pick you over doing nothing — in two sentences or less</li>
  <li>Name three people who are not your family or close friends who would buy this today</li>
  <li>List every cost involved in delivering your product or service once (materials, time, tools, delivery)</li>
</ul>',
NULL, 1);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Who Are You Selling To? Getting Specific About Your Customer',
'<p>This is the lesson most people skip. They think "everyone" is their customer. Everyone is no one. The more specific you are about who you are selling to, the easier every other part of running your business becomes — your pricing, your marketing, your messaging, even the way you describe what you do.</p>
<p>Saying your customer is "women who want to feel better" is not a customer. Saying your customer is "women between 35 and 50 who work full time, have kids at home, and feel like their health has slipped since their late 20s, and who are willing to spend $97 to $197 on a solution if it fits their schedule" is a customer. See the difference? Now you know where to find her, what to say to her, and how to price what you sell.</p>
<p>Getting specific does not shrink your market. It focuses your energy. You can always expand later. Right now, you need one customer who you understand deeply enough to build something they actually want.</p>
<p>Think about the customer you already served, or the one you picture when you imagine your best client. How old are they? What do they do? What keeps them up at night? What have they already tried that did not work? What would make them trust you enough to hand over their card number? These answers drive everything.</p>
<p>One more thing: your customer has to have money to spend and a reason to spend it now. A product for people who want something "someday" is a hard sell. A product for people who have a problem today that costs them time, money, or peace of mind, that is a much easier conversation.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Write a one-paragraph description of your single most specific ideal customer — age, situation, problem, what they''ve already tried</li>
  <li>Identify where that person spends time online and in real life (Facebook groups, industry events, specific stores, podcasts they listen to)</li>
  <li>Find three real examples of that person — a social media account, a forum post, a review they left somewhere — and read what they say in their own words</li>
</ul>',
NULL, 2);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'The Business Model — How You Actually Make Money',
'<p>You can have a great product and still not have a business if your model does not work. A business model is simply how money flows to you. And there are more ways to structure that than most people realize.</p>
<p>Do you sell a product once? Do you sell a service by the hour? Do you sell a package at a flat rate? Do you sell a subscription where people pay you monthly? Do you sell in volume at a lower price, or fewer units at a higher price? Every one of these is a different business, even if the underlying thing you do is the same.</p>
<p>Here is a real example. A bookkeeper can charge $47 an hour, or she can charge $497 a month for a monthly package that covers the same hours. The second one gives her predictable income and gives the client a predictable expense. Same work, very different business. The second one is also easier to sell because the client knows exactly what they''re paying.</p>
<p>Think about which model fits the way your customer wants to buy. Some people want to pay once and own it. Some people want to try before they commit. Some businesses work better with retainers. Some work better with one-time project fees. Your job is to match your model to how your customer already thinks about spending.</p>
<p>You also need to think about volume. If you charge $47 for what you do, you need a lot of customers to hit $4,700 a month. If you charge $997, you need five. Both can work. But they require completely different approaches to how you find and close customers, and how much of your time each one takes.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Write down every way you could charge for what you do — per hour, per project, per month, per unit, per seat</li>
  <li>Pick the model that fits your customer''s buying habits and your own capacity</li>
  <li>Calculate how many sales you need at your chosen price to hit $3,000 a month — write that number down</li>
</ul>',
NULL, 3);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Your Why Has to Be Stronger Than Your Fear',
'<p>Before we get into the legal and financial side of starting a business, we need to talk about what actually stops most people. It is not lack of knowledge. It is fear. Fear of failing publicly. Fear of what people will think. Fear of investing money and losing it. Fear that they are not ready, not qualified, not enough.</p>
<p>That fear is real. It is not weakness. It means you care about what you''re building. But if you let it make decisions, it will keep you in "getting ready to get ready" for years.</p>
<p>Here is the truth about fear in business: it does not go away when you get more prepared. It does not go away when you make your first sale. It changes form, but it stays. The people you see who look fearless are not fearless. They just decided to move while afraid.</p>
<p>Your why needs to be bigger than your fear. Not louder, just bigger. If you are starting this business because you want more flexibility to be there for your kids, that is real. If you want to stop trading time for dollars at a job that does not see your value, that is real. If you want to build something that still exists when you are ready to step back, that is real. Write it down. Read it when you want to quit.</p>
<p>This lesson does not have a checklist about taxes or licenses. This one just has one assignment, and it is the most important thing in this entire course.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Write your why in three to five sentences — not the polished version, the real one</li>
  <li>Write the cost of not doing this — what does your life look like in three years if you never start?</li>
  <li>Put both somewhere you will see them when things get hard</li>
</ul>',
NULL, 4);

-- ═══════════════════════════════════════════════
-- MODULE 2
-- ═══════════════════════════════════════════════
INSERT INTO modules (course_id, title, position)
VALUES (v_course_id, 'Making It Legal', 2)
RETURNING id INTO v_mod_id;

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Choosing Your Business Structure',
'<p>Nobody gets excited about business structures. This feels like the boring part. But getting this wrong costs real money, and getting it right protects everything you are building. Take 20 minutes and do this correctly.</p>
<p>The three structures most small business owners choose from are sole proprietorship, LLC, and S-Corp. Each one has a different level of protection, a different tax treatment, and a different level of complexity to maintain.</p>
<p>A sole proprietorship is the default. If you start doing business without filing anything, you are automatically a sole prop. It is easy, it costs nothing to set up, and it is completely legal. The problem is that there is no separation between you and the business. If someone sues your business, they can come after your personal assets. For a very small, low-risk side business, it might be fine to start here. For anything with real money or real liability, move on.</p>
<p>An LLC, which stands for Limited Liability Company, creates a wall between you and the business. If the business gets sued, your personal house, car, and savings are generally protected as long as you keep the business and personal finances separate. An LLC in most states costs between $50 and $500 to register, and it files a simple return at tax time. For most small businesses, this is the right starting point.</p>
<p>An S-Corp is a tax election, not a separate structure. You typically start with an LLC and then elect S-Corp status with the IRS. The benefit is that once your business is making more than about $40,000 a year in profit, you can save money on self-employment taxes by paying yourself a reasonable salary and taking the rest as a distribution. Talk to a CPA before you elect S-Corp status. The savings are real, but the paperwork is more involved.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Decide which structure fits your business right now — if you''re unsure, start with LLC</li>
  <li>Look up your state''s LLC filing fee and the Secretary of State website where you register</li>
  <li>If you already have revenue coming in, book a one-time consultation with a CPA before you file anything</li>
</ul>',
NULL, 1);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Registering Your Business and Getting Your EIN',
'<p>Once you know your structure, the actual registration process is simpler than most people expect. This is one of those things that feels overwhelming from the outside and takes about 45 minutes once you sit down and do it.</p>
<p>To register your LLC, go to your state''s Secretary of State website. Search for "LLC registration" plus your state name. You will fill out a form with your business name, your registered agent (which can be yourself in most states), your address, and your member information. Pay the fee, submit the form, and within a few days to a few weeks depending on your state, you will receive your Articles of Organization. Keep that document somewhere safe.</p>
<p>Your business name needs to be available in your state. Before you fall in love with a name, search the Secretary of State''s business name database. Also check whether the domain name is available, and whether the social media handles are available. All three matter. A name that is legally available but has no domain and a conflicting Instagram account is going to create problems.</p>
<p>Your EIN is your Employer Identification Number. Think of it as your business''s Social Security number. You need it to open a business bank account, hire employees, and file taxes. You get it from the IRS at IRS.gov and it is completely free. The online application takes about 10 minutes and gives you your EIN immediately. Do not pay a third-party service to do this for you.</p>
<p>Once you have your Articles of Organization and your EIN, you have a real, legal business. Everything else builds from here.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Search your state''s Secretary of State website to confirm your business name is available</li>
  <li>Check that your business name domain (.com) is available — if not, decide now whether to adjust the name</li>
  <li>Complete your LLC registration and apply for your EIN at IRS.gov before moving to the next lesson</li>
</ul>',
NULL, 2);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Business Banking — Why You Cannot Mix Personal and Business Money',
'<p>This one is non-negotiable. No exceptions. You need a separate business bank account, and you need to use it only for business income and business expenses. Mixing personal and business money is one of the most expensive mistakes a new business owner makes, and most people do not realize it until tax time.</p>
<p>Here is what happens when you mix: you cannot clearly see what your business is actually making. You spend hours sorting through statements trying to figure out which charges were business and which were personal. Your accountant charges you more because the work takes longer. You miss deductions because you cannot track what was business-related. And if you are ever audited, mixed finances are a red flag that costs you time, money, and stress.</p>
<p>Opening a business bank account is straightforward. Bring your EIN, your Articles of Organization, your personal ID, and an opening deposit. Most banks require between $25 and $100 to open a business checking account. Some business accounts have monthly fees, so compare a few options. Many credit unions and online banks offer free business checking for small businesses. Chase, Bank of America, and Wells Fargo are common choices, but check local credit unions too because they often have better rates and fewer fees.</p>
<p>Once your account is open, every dollar your business earns goes into that account. Every business expense comes out of it. If you need to pay yourself, transfer money from the business account to your personal account and call it an owner''s draw. That is the correct way to do it.</p>
<p>Get a business debit card connected to the account. Consider a business credit card as a second step, once the account is established. Business credit cards build your business credit profile, which we cover in a later course.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Open a dedicated business checking account this week — bring your EIN and Articles of Organization</li>
  <li>Transfer any business income currently sitting in your personal account to the new business account</li>
  <li>Set a rule for yourself: every business transaction goes through the business account, starting today</li>
</ul>',
NULL, 3);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Licenses, Permits, and What You Actually Need in Your State',
'<p>Here is where people either over-research for months or skip it entirely and hope for the best. Neither approach is right. What you need depends entirely on where you are, what you do, and whether you have employees. Let''s cut through the noise.</p>
<p>The basics that almost every business needs: your LLC registration (done), your EIN (done), and a business license from your city or county. That local business license is separate from your state registration. Go to your city or county government website and search "business license." Most cost between $25 and $75 per year. Some cities do not require one. Find out which category yours falls into.</p>
<p>Beyond the basics, your requirements depend on your industry. A home-based consulting business has very different requirements than a food business, a childcare business, or a construction company. If you are in a licensed profession like real estate, cosmetology, accounting, or contracting, you need a professional license in addition to your business registration. Those are issued by your state''s licensing board for that profession.</p>
<p>If you sell physical products, you likely need to collect sales tax in your state. Register with your state''s Department of Revenue for a sales tax permit. If you are selling services, most states do not tax services, but some do. Check your state''s rules.</p>
<p>If you plan to operate from home, check your local zoning laws. Many residential areas allow home-based businesses with restrictions, such as no customer traffic to your home, no signage, or limits on the type of business. Most home-based consultants, coaches, and service providers have no issues. But it is worth a quick check.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Search your city or county website for "business license" and determine if one is required and how much it costs</li>
  <li>Identify whether your industry requires any professional or occupational license in your state</li>
  <li>Check whether you need to collect sales tax and register with your state''s Department of Revenue if so</li>
</ul>',
NULL, 4);

-- ═══════════════════════════════════════════════
-- MODULE 3
-- ═══════════════════════════════════════════════
INSERT INTO modules (course_id, title, position)
VALUES (v_course_id, 'The Money Foundation', 3)
RETURNING id INTO v_mod_id;

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'How Much Does It Cost to Start? Being Honest With Yourself',
'<p>Most people either wildly underestimate what it costs to start a business or they overestimate because they think they need everything set up perfectly before they can launch. Both lead to the same outcome: they do not start, or they start broke and unprepared. Let''s get to the actual number.</p>
<p>The honest cost of starting depends on your business type. A service-based business — consulting, coaching, bookkeeping, cleaning, photography, lawn care — can often be started for under $1,000. A product-based business has inventory and packaging costs. A food business has health permits and commercial kitchen requirements. A brick-and-mortar anything has rent, build-out, and deposits.</p>
<p>Break your startup costs into two categories: what you need to make your first dollar, and what you would like to have once you''re making money. Most people mix these and convince themselves they need $15,000 before they can start when they actually need $847 to get to their first client.</p>
<p>What you need to make your first dollar: your legal registration ($50 to $500), your business bank account (minimal opening deposit), a way to get paid (a free Square or Stripe account), and the ability to deliver what you''re selling. That might be your skills, a tool you already own, or a small amount of supplies. For most service businesses, this is under $500.</p>
<p>What you would like to have: a professional website, business cards, a logo, software tools, a marketing budget. These are real, but they are not what stands between you and your first client. Do not let them be your excuse.</p>
<p>Write down both lists. Total them separately. Then focus your energy and your initial money on the first list only.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>List every cost you need to pay before you can deliver your product or service once — total that number</li>
  <li>List every cost that would be nice to have but is not required for your first sale — total that separately</li>
  <li>Decide how you will fund your startup costs: savings, income from your current job, or a specific amount you can set aside each month</li>
</ul>',
NULL, 1);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Pricing Your Product or Service Without Undercharging',
'<p>Undercharging is the most common financial mistake new business owners make. It feels safe. It feels humble. It feels like it will attract more customers. It does the opposite. It attracts customers who cannot afford real rates, it trains them to expect low prices from you, and it makes your business unsustainable before it ever gets off the ground.</p>
<p>Here is the formula for pricing a service. Start with your target hourly rate. If you want to make $60,000 a year and you plan to work roughly 1,000 billable hours (which accounts for admin time, sales time, and time you are not working), your rate needs to be $60 an hour minimum. That is before business expenses. Add your expenses on top of that.</p>
<p>Now look at your market. What do others charge for the same thing? You do not have to be the cheapest. In most markets, the cheapest option is also the least trusted. Customers who shop purely on price are often the hardest to work with and the most likely to complain. Price in the middle to upper-middle of your market and compete on quality, reliability, and how you make people feel.</p>
<p>For products, start with your cost to produce one unit, multiply by three as a starting point, then check whether that price makes sense in your market. If your product costs you $14 to make and your 3x price is $42, check what similar products sell for. If the market supports $42, start there. If it supports $58, price higher. If it only supports $22, you have a cost problem to solve.</p>
<p>Never price based on what you think people can afford. Price based on the value you deliver and what the market charges. Then let the market tell you if the price is right.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Calculate your minimum hourly rate based on your income goal and realistic billable hours (or your product''s cost times three)</li>
  <li>Research what three competitors or comparable businesses charge for the same thing</li>
  <li>Set your launch price — write it down, say it out loud, and commit to it</li>
</ul>',
NULL, 2);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Your First Budget — Revenue, Expenses, and Break-Even',
'<p>A budget is not a punishment. It is just a plan for your money. And in a business, knowing your break-even number is one of the most important things you can know. It tells you exactly how much you need to sell before you stop losing money every month.</p>
<p>Your break-even is the point where your revenue covers your expenses and you make zero profit. Below that, you are losing money. Above it, you are making money. You want to know that number before you open your doors, not six months in when you''re wondering why the business account is empty.</p>
<p>Start with your monthly fixed expenses. These are the costs that exist whether you make one sale or a hundred. Examples: your LLC annual fee divided by 12, software subscriptions, a website hosting fee, your phone if it is used for business, your business bank account fee if any. Add those up. Let''s say they total $287 a month.</p>
<p>Now add your variable expenses. These change based on how many sales you make: supplies, shipping, payment processing fees (Stripe charges 2.9% plus 30 cents per transaction), packaging. Estimate these per unit or per client.</p>
<p>Now divide your fixed expenses by your profit per sale. If your fixed costs are $287 a month and you make $73 profit per client after variable costs, you need to close four clients a month just to break even. Your fifth client is where you start making money. Knowing that number changes how you think about sales.</p>
<p>Build a simple spreadsheet with three columns: projected revenue, projected expenses, and the difference. Update it every month with actual numbers. The gap between what you projected and what actually happened is your best teacher.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>List every monthly business expense you have or expect to have — fixed and variable</li>
  <li>Calculate your break-even: monthly fixed expenses divided by profit per sale</li>
  <li>Build a simple monthly budget spreadsheet — even a basic one in Google Sheets is enough to start</li>
</ul>',
NULL, 3);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Funding Options — Self-Fund, Loans, Grants, and Investors',
'<p>Most businesses should be self-funded in the beginning. Not because loans and grants do not exist, but because starting lean forces discipline, proves your concept with real customers before you take on risk, and keeps you from owing money to someone else before you know whether the business works.</p>
<p>Self-funding means you start with what you have. You use savings, income from your current job, or revenue from early sales to cover startup costs. This is slower. It is also how most profitable small businesses start. You do not need a lot of money to start most service businesses. You need clarity, skill, and the willingness to sell before you feel ready.</p>
<p>Microloans are designed for businesses that need capital but do not qualify for traditional bank loans. The SBA Microloan program offers loans up to $50,000 through nonprofit intermediaries. Organizations like Kiva offer interest-free loans for small businesses. If you need capital to buy equipment or inventory, look here before you go to a bank.</p>
<p>Grants are money you do not pay back. They also take significant time to find and apply for. The competition is real. There are grants specifically for women-owned businesses, minority-owned businesses, and businesses in specific industries. The SBA, your state''s economic development office, and local community foundations are good starting points. Do not count on a grant to fund your launch. Pursue grants as a supplement to a business that is already running.</p>
<p>Investors want equity, meaning ownership, in exchange for capital. This is appropriate for businesses designed to scale fast. For most small service businesses and lifestyle businesses, taking on investors is not the right move. You give up control and a percentage of every dollar you ever make.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Decide your funding strategy: self-fund, microloan, grant pursuit, or combination — write down which and why</li>
  <li>If self-funding, identify the specific savings or income source you will draw from and the dollar amount available</li>
  <li>Search "SBA Microloan" and your state name, plus "small business grants for women" plus your state name — bookmark two to three programs to revisit once your business is registered</li>
</ul>',
NULL, 4);

-- ═══════════════════════════════════════════════
-- MODULE 4
-- ═══════════════════════════════════════════════
INSERT INTO modules (course_id, title, position)
VALUES (v_course_id, 'Setting Up to Operate', 4)
RETURNING id INTO v_mod_id;

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Your Business Address, Phone, and Professional Presence',
'<p>Running a business from home is completely normal and completely legitimate. But there are a few things you need to handle intentionally so your business looks and operates professionally, your personal address is not publicly listed, and your personal phone is not your only point of contact.</p>
<p>Your business address: if you register an LLC in most states, your address becomes part of the public record. If you operate from home, you may not want your home address searchable online. A few options: a UPS Store mailbox (typically $20 to $30 a month) gives you a real street address, not a P.O. box, which looks more professional. A virtual office service gives you an address plus sometimes a receptionist or conference room access. Or, in some states, you can use your registered agent''s address for official filings only. Figure out what works for your situation.</p>
<p>Your business phone: you do not need a second physical phone. Google Voice gives you a free business phone number that rings to your existing cell. Calls and texts come in through the app. You can set business hours so calls go to voicemail after a certain time. For a small business that is just getting started, this is completely sufficient and costs nothing.</p>
<p>Your professional email: no Gmail addresses with your personal name for business communications. Get a business email at your domain. Miranda@yourcompanyname.com is free through Google Workspace at $6 a month or through Microsoft 365. This single change makes you look significantly more established.</p>
<p>Your website does not need to be elaborate. A clean, simple site with your name, what you do, who you help, how to contact you, and a way to book or buy is enough to start. You can build on Squarespace, Wix, or Showit for $16 to $45 a month without knowing how to code.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Set up a Google Voice number for your business or research a virtual phone option</li>
  <li>Create a professional email address at your business domain — even if the website is not finished yet</li>
  <li>Decide on your business mailing address solution and set it up this week</li>
</ul>',
NULL, 1);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Tools You Actually Need vs. Tools You''re Stalling With',
'<p>New business owners love to buy tools. Project management software, CRM systems, scheduling apps, email marketing platforms, design tools, accounting software — all of it. Most of it is unnecessary at the start, and buying it feels like progress while actually being a form of procrastination.</p>
<p>Here is the short list of what you actually need in the first 90 days: a way to get paid (Square, Stripe, or PayPal), a way to communicate with clients (email and phone), a way to track your money (a simple spreadsheet or a free Wave account), and a way to deliver what you sell. That is it.</p>
<p>The tools that are useful once you have clients and revenue coming in: accounting software (QuickBooks Simple Start is $17 a month, Wave is free), a scheduling tool if clients need to book time with you (Calendly free plan is enough to start), a simple CRM to track leads and follow-ups (a Google Sheet works until you have more than 20 active leads), and an email marketing tool if you are building a list (most have free plans for under 500 contacts).</p>
<p>The tools you do not need yet: full CRM software at $89 a month, a project management platform with more features than a team of 10 needs, a social media scheduler for seven platforms, or a custom app for anything. These are not wrong tools. They are tools for a different stage of business.</p>
<p>Every tool you buy has a learning curve and a monthly cost. Both cost you time and money. Only add a tool when you have a specific problem it solves and you know you will use it consistently.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>List every tool or subscription you currently have or are planning to buy for your business</li>
  <li>Circle only the ones you need to make your first sale — cancel or delay the rest</li>
  <li>Set up a free Wave account or a simple Google Sheet to track your income and expenses starting now</li>
</ul>',
NULL, 2);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Building Your Process — How the Work Gets Done',
'<p>One of the biggest differences between a business and a freelance hustle is whether it can run the same way every time, without you having to reinvent the wheel for each client or customer. A process is just a documented sequence of steps. You probably already do things in a sequence. Write it down.</p>
<p>Why does this matter early? Because when you are the only person in the business, a documented process is what keeps you consistent, keeps clients knowing what to expect, and keeps you from burning out recreating everything from scratch. When you grow and need help, a process is what allows you to train someone else.</p>
<p>Start with your client or customer journey. From the moment someone expresses interest to the moment the work is complete and the invoice is paid, what happens? List every step. Who does what? What information do you need from the client before you can start? What do you deliver and how? How do you communicate along the way? When and how do you invoice?</p>
<p>For a service business, your core process might look like this: inquiry comes in, send a response within 24 hours, schedule a discovery call, send a proposal within 48 hours of the call, client signs and pays a deposit, work begins, check-in at the midpoint, deliver the final product, request payment of the balance, ask for a review. Write that down. That is your process.</p>
<p>For a product business: order comes in, pick and pack within one business day, ship with tracking, follow up at delivery with a thank-you and care instructions, follow up 14 days later with a check-in and review request. Write that down.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Map every step from first contact to payment received for your business — write it out linearly</li>
  <li>Identify any steps that feel inconsistent or unclear and write a standard for how you will handle them</li>
  <li>Create a simple client intake form (Google Forms is free) that collects everything you need before work starts</li>
</ul>',
NULL, 3);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Hiring Help — Contractors, Employees, and When to Bring Someone In',
'<p>Most business owners wait too long to get help, then hire in a panic when they are already underwater. The right time to bring someone in is before you are desperate, when you have enough consistent revenue to sustain the cost and enough work to justify the help.</p>
<p>The first decision is contractor versus employee. A contractor is someone you pay to complete a specific task or project. They set their own hours, use their own tools, and work for multiple clients. You pay them their agreed rate, send a 1099 at the end of the year if you paid them more than $600, and you are not responsible for their taxes. This is the right choice for most early-stage small businesses.</p>
<p>An employee is someone who works for you exclusively or primarily, uses your tools, works your hours, and follows your direction closely. When you hire an employee, you are responsible for payroll taxes, unemployment insurance, and potentially benefits. This is more complex and more expensive. It makes sense once your business has consistent revenue and you need someone doing a specific role full time.</p>
<p>The roles you should consider outsourcing first: bookkeeping (even two to four hours a month from a part-time bookkeeper pays for itself in clarity and tax savings), admin tasks (scheduling, email, data entry), and anything that takes you hours but is not the core thing you sell. Your time spent on the thing you actually sell is your highest-value activity. Protect it.</p>
<p>When you bring someone in, even as a contractor, have a written contract. It does not need to be elaborate. It needs to say what the work is, what it pays, the timeline, and who owns the work product. A simple one-page agreement protects both of you.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>List the tasks in your business that take time but do not require your specific skill or expertise</li>
  <li>Identify which of those could be handed to a contractor, and research what that type of help costs in your area</li>
  <li>Download a simple independent contractor agreement template (the SBA website and LegalZoom have free versions) and save it for when you are ready to hire</li>
</ul>',
NULL, 4);

-- ═══════════════════════════════════════════════
-- MODULE 5
-- ═══════════════════════════════════════════════
INSERT INTO modules (course_id, title, position)
VALUES (v_course_id, 'Getting Your First Customer', 5)
RETURNING id INTO v_mod_id;

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Your Offer — What Exactly Are You Selling and for How Much?',
'<p>Before you can sell anything, you need a clear, specific offer. Not a description of your services. Not a list of what you do. An offer is a specific thing, at a specific price, that solves a specific problem for a specific person. The clearer your offer, the easier it is to sell.</p>
<p>Most people describe what they do instead of what they sell. "I help businesses with their social media" is not an offer. "I manage your Instagram and Facebook for $797 a month — two posts a day, community engagement, and a monthly performance report" is an offer. Someone can say yes or no to the second one. The first one starts a conversation that never ends.</p>
<p>Your offer needs four components: what it is, what it includes, who it is for, and what it costs. Everything else is details. Write those four things out right now, clearly enough that someone who has never heard of you could read it and immediately know whether they need it.</p>
<p>For a service: "I offer a 90-day financial clarity package for self-employed women. You get three one-hour video sessions, a personalized budget template built for your income type, and 30 days of email support. The investment is $1,197, paid in full or split into three payments of $419."</p>
<p>For a product: "I sell handmade soy candles in three sizes. The 8 oz candle is $24, the 12 oz is $34, and the 16 oz is $44. They ship within three business days and last 45 to 60 hours."</p>
<p>Notice the specificity. Price, timeline, deliverables, who it is for. That is what converts interest into a purchase.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Write your core offer using the four components: what it is, what it includes, who it is for, what it costs</li>
  <li>Read it to someone outside your industry — if they cannot immediately understand it, rewrite it simpler</li>
  <li>Decide how people pay you: payment link, invoice, in-person card reader — set that up before you need it</li>
</ul>',
NULL, 1);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Where Your Customers Are and How to Find Them',
'<p>The most common mistake in marketing a new business is trying to be everywhere at once. You cannot be everywhere, and you do not need to be. You need to be where your specific customer already spends their time, and you need to show up there consistently.</p>
<p>Go back to your ideal customer description from Module 1. Where do they spend time? If your customer is a small business owner in a specific industry, they are probably in industry-specific Facebook groups, attending local chamber events, or reading specific trade publications. If your customer is a busy working parent, they might be on Instagram, in neighborhood Facebook groups, or at school events. If your customer is a corporate professional, they are probably on LinkedIn.</p>
<p>Pick one or two channels and go deep rather than spreading thin across six. One channel you show up on consistently every week will always outperform six channels you touch inconsistently. This is one of the most important things to accept early: consistency beats presence.</p>
<p>Warm outreach is still the fastest way to get your first clients. Warm outreach means reaching out to people who already know you, even loosely, not cold strangers. Send a personal message, not a group blast. Tell them what you are doing, who you help, and ask if they know anyone who might need it. Most first clients come from people you already know or from referrals one step removed.</p>
<p>Content is a long game. Posting on social media builds awareness over time, but it rarely converts quickly. Use it to build credibility and trust, not as your only strategy for finding clients. Pair content with direct outreach and you will move much faster.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Identify the one or two places your ideal customer already spends time — online or in person</li>
  <li>Write a short, personal outreach message you could send to 10 people in your network today — not a pitch, just a real conversation starter about what you are building</li>
  <li>Send those 10 messages this week</li>
</ul>',
NULL, 2);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Your First Sale — How to Ask for the Business Without Feeling Weird',
'<p>Most people never ask for the sale. They have great conversations, they send information, they follow up once, and then they wait. And they wonder why they are not getting clients. The business does not come to you. You have to ask for it.</p>
<p>Asking for the sale does not mean being pushy. It means being clear. There is a difference. Pushy is pressuring someone to buy something they do not need. Clear is helping someone who does need what you offer take the next step.</p>
<p>The simplest closing question in the world: "Does this sound like something that would help you? If so, I can send over the details to get started." Or: "Are you ready to move forward? Here is how we would do that." Or, for a product: "Would you like to go ahead and order? I can get it shipped by Thursday."</p>
<p>You will feel awkward the first time. Say it anyway. The awkwardness is yours, not theirs. Most people who are interested are waiting for you to ask. They are not going to volunteer to give you money. You have to create the moment.</p>
<p>What to do when someone says "let me think about it": ask what they need to think through. Most of the time, "let me think about it" is a polite way of saying they have a question they have not asked yet, or they have a concern they have not voiced. Ask: "Absolutely — what questions do you still have?" That one question will often reveal what is actually in the way.</p>
<p>Your conversion rate in the beginning will be somewhere between 20% and 50%. That means for every 10 real conversations you have with potential clients, two to five of them will buy. This is normal. Sales is a numbers game layered on top of a relationship game.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Write out the exact words you will use to ask for the sale — practice saying them out loud three times</li>
  <li>Have five real conversations with potential customers or clients this week — not pitches, conversations about their problem and whether you can help</li>
  <li>Set a goal: your first sale by a specific date — write that date down</li>
</ul>',
NULL, 3);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Following Up — The Money Is in the Follow-Through',
'<p>Most sales do not happen on the first conversation. Most happen on the third, fourth, or fifth follow-up. Most business owners give up after one. This is where the money is sitting, uncollected, because someone felt like they were bothering people.</p>
<p>Following up is not bothering people. Following up is doing your job. If someone expressed interest and then went quiet, they are not uninterested — they are busy. Life happened. Something else came up. A follow-up from you is a reminder that you are still there and still ready to help.</p>
<p>The rule is simple: follow up until you get a yes or a no. A yes means they are moving forward. A no means you can stop following up and redirect your energy. What you do not want is to leave a warm lead hanging in silence because you assumed their silence meant no.</p>
<p>A good follow-up sequence for a service business: follow up 48 hours after your initial conversation, then again at one week, then at two weeks, then monthly until you hear a clear answer. Each follow-up should add value. Reference something they mentioned. Share a relevant article. Ask a specific question about how their situation has evolved. Do not just say "checking in" — that tells them nothing and gives them nothing.</p>
<p>For product businesses, follow-up looks different. Retargeting ads reach people who visited your site but did not buy. An abandoned cart email sequence catches people who added to cart and left. A follow-up email sequence after a purchase asks for a review and introduces them to complementary products.</p>
<p>One more thing: ask for referrals. Every satisfied client or customer is a potential referral source. A simple "Do you know anyone else who might need what you just experienced?" gets results. Most people are happy to refer someone they trust to people they care about. You just have to ask.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Write a follow-up sequence for any leads you currently have — what you will say and when</li>
  <li>Contact every warm lead you have not followed up with in the last two weeks — today</li>
  <li>After your next satisfied customer or client interaction, ask them directly if they know anyone else who could use your help</li>
</ul>',
NULL, 4);

-- ═══════════════════════════════════════════════
-- MODULE 6
-- ═══════════════════════════════════════════════
INSERT INTO modules (course_id, title, position)
VALUES (v_course_id, 'Building for the Long Term', 6)
RETURNING id INTO v_mod_id;

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Tracking Your Numbers Every Single Week',
'<p>Most business owners do not look at their numbers until they have to — tax season, a slow month that suddenly gets scary, or a moment when they realize the bank account is lower than expected. By then, the information is too old to help. You need your numbers weekly.</p>
<p>Weekly financial check-ins do not take long. Fifteen minutes is enough. What you are looking for: what came in this week, what went out, and what the difference is. That is your net cash flow for the week. You are also keeping a running total of your monthly revenue so you can see whether you are on track to hit your income goal or whether you need to sell more.</p>
<p>The four numbers every business owner should know at all times: monthly revenue to date, monthly expenses to date, money owed to you (outstanding invoices), and money you owe to others. If you know those four numbers, you know the state of your business.</p>
<p>Tools for this: Wave is free and connects to your bank account to automatically categorize transactions. QuickBooks Simple Start is $17 a month and is more robust. At minimum, a Google Sheet with four columns: date, description, income, expense. Total the income and expense columns at the bottom. Update it every week. That is a functional system.</p>
<p>What you track, you can manage. What you ignore tends to get worse. A lot of businesses fail not because they were not making money but because the owner did not know what was happening with the money until it was too late to course-correct.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Set a recurring weekly calendar block — 15 minutes — labeled "Money Check-In"</li>
  <li>Write down your four numbers right now: revenue this month, expenses this month, what you are owed, what you owe</li>
  <li>Choose your tracking tool and set it up today — Wave, QuickBooks, or a simple Google Sheet</li>
</ul>',
NULL, 1);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'When to Quit Your Job and Go Full Time',
'<p>This is one of the most personal decisions in business, and there is no single right answer. But there are some clear signals that make the timing either safe or premature, and getting this wrong in either direction costs you.</p>
<p>Quitting too early means you are running on savings and hope before the business has proven itself. The pressure of needing income to survive makes it harder to be strategic and easier to take clients or customers that are wrong for your business. Financial stress clouds judgment. Do not underestimate this.</p>
<p>Staying too long means you are limiting your business''s growth because you only have nights and weekends. Some businesses cannot grow beyond a certain point with a part-time owner. If you are there, you will feel it.</p>
<p>A reasonable threshold before going full time: your business is generating consistent revenue for at least three to six months (not one good month, consistent months), you have three to six months of personal living expenses saved, and your business revenue, if it continued at the current level, would cover your minimum personal expenses. Ideally, you are at 70% to 80% of your current take-home pay from the business before you make the jump.</p>
<p>The month before you leave, increase your savings if possible, line up additional clients or inventory, and tell your network that you are going full time. Announce it. Commitment is a sales tool. People are more likely to send you referrals when they know you are all in.</p>
<p>You will never feel completely ready. But you can wait until the math makes sense before you jump.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Write down your personal monthly expenses — every fixed cost you have to cover to keep your life running</li>
  <li>Calculate what percentage of that amount your business currently covers</li>
  <li>Set a specific revenue target and savings target that, when both are met, signals you are ready to go full time</li>
</ul>',
NULL, 2);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Protecting Yourself — Insurance, Contracts, and Basic Legal Protection',
'<p>Most new business owners skip this part. They assume nothing will go wrong, or they assume that if something does, they will figure it out then. That is a risk you do not have to take. Basic protection is not expensive and is much easier to set up before you need it.</p>
<p>Business insurance: if you provide a service, you need general liability insurance and possibly professional liability insurance, which is also called errors and omissions or E&amp;O. General liability covers things like a client injuring themselves on your property or damage to their property while you are working. Professional liability covers claims that your work caused financial harm. Both policies for a small service business typically run between $300 and $800 a year through providers like NEXT Insurance, Hiscox, or your existing home insurance carrier''s business rider.</p>
<p>Contracts: every client engagement should have a signed contract or agreement before work begins. Not because you expect conflict, but because a contract sets clear expectations on both sides, which reduces conflict. Your contract should cover: what you will deliver, the timeline, the payment terms, what happens if the client changes the scope of the work, and what happens if either party needs to end the engagement early. You can find templates through HoneyBook, Dubsado, or a simple search for "freelance service agreement template" — just review any template with an attorney before you rely on it heavily.</p>
<p>Intellectual property: if you create content, designs, or systems for clients, make sure your contract is clear about who owns what. If you are creating something for a client and they are paying you to create it, they typically own it. If you are licensing something you already created, make that distinction explicit.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Get a quote for general liability insurance — NEXT Insurance allows you to get a quote in about five minutes online</li>
  <li>Find or create a client services agreement template — review it and customize it for your business</li>
  <li>Send your contract to every active client or project who does not currently have a signed agreement with you</li>
</ul>',
NULL, 3);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'What Year Two Looks Like — Planning Beyond Survival Mode',
'<p>Most business owners spend their first year surviving. They are figuring out the work, finding clients, managing cash flow, learning how to run a business while running a business. That is normal. Year two is when you have enough experience to actually build something, and that requires a different kind of thinking.</p>
<p>In year two, you shift from reactive to intentional. You know what works and what does not. You know which clients are your best clients and which ones take twice the time for half the money. You know which marketing actually brings in business and which just makes you feel busy. Use what you know.</p>
<p>Year two is when you raise your prices. If you have been fully booked or turning away work, your prices are too low. A price increase of 15% to 25% loses you some clients and keeps the ones who value your work most. It also increases your revenue without adding more hours.</p>
<p>Year two is when you build systems that do not depend entirely on you. Standard operating procedures for recurring tasks. Templates for common communications. Automated invoicing and payment reminders. These are the things that let you take a week off without the business stopping.</p>
<p>Year two is also when you plan for taxes more seriously. In year one, many business owners get surprised by the self-employment tax, which is 15.3% on top of income tax. In year two, you should be making estimated quarterly tax payments (due in April, June, September, and January) so that bill does not arrive all at once in April.</p>
<p>Plan your year two on paper before year one ends. Set a revenue goal. Set a goal for your pricing. Set a goal for how many hours a week you want to be working. Then build backward from those goals into specific actions you will take each quarter.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Write your year two revenue goal and calculate what that requires in monthly sales</li>
  <li>Identify two or three things in your business that currently depend entirely on you that you want to systematize or delegate in the next 12 months</li>
  <li>If you are not yet making estimated quarterly tax payments, look up the next due date and calculate what you owe — set that money aside in a separate savings account now</li>
</ul>',
NULL, 4);

END $$;
