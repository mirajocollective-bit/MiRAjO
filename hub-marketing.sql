-- ═══════════════════════════════════════════════
-- MARKETING FOR ENTREPRENEURS
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
  'marketing-for-entrepreneurs',
  'Marketing for Entrepreneurs',
  'Stop posting and hoping. Six modules covering customer targeting, marketing foundations, social media strategy, email and referrals, paid advertising, and building a repeatable marketing system.',
  0
)
ON CONFLICT (slug) DO NOTHING;

SELECT id INTO v_course_id FROM courses WHERE slug = 'marketing-for-entrepreneurs';

-- ═══════════════════════════════════════════════
-- MODULE 1
-- ═══════════════════════════════════════════════
INSERT INTO modules (course_id, title, position)
VALUES (v_course_id, 'Know Exactly Who You Are Marketing To', 1)
RETURNING id INTO v_mod_id;

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'The Biggest Marketing Mistake — Trying to Reach Everyone',
'<p>Most business owners feel the pressure to cast the widest possible net, because it feels safer. If you are trying to reach everyone, it feels like you are not leaving money on the table. But that fear is exactly what keeps your marketing from working.</p>
<p>When you try to speak to everyone, you end up saying nothing that lands. Your message becomes generic, your offers start to blur together, and the people who actually need you most scroll right past because nothing you said felt like it was meant for them.</p>
<p>This is not about limiting your business. It is about being precise enough that the right people feel seen. A plumber who says "I fix all plumbing issues for homeowners in the South Tampa area" will out-convert the plumber who says "professional plumbing services" every single time.</p>
<p>Think about the last time you read something and thought, "That is exactly what I was thinking." That feeling is what happens when someone has gotten specific. That is what your marketing needs to do for your customer.</p>
<p>The businesses that grow fastest are not the ones reaching the most people. They are the ones reaching the right people with a message that makes those people feel understood before they even contact you.</p>
<p>You do not have to serve fewer people. You have to stop writing marketing copy as if you are trying to convince the entire population at once. When you narrow your focus, your words get sharper, your results improve, and the right customers start coming to you instead of you chasing them.</p>
<p>Start with this: if someone read your homepage, your Instagram bio, or your business card right now, could they immediately tell who you are for and what problem you solve? If the answer is no or maybe, that is where your work starts.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Pull up your current homepage or main social media profile and read the first sentence out loud. Write down exactly who it speaks to, or if it speaks to no one in particular.</li>
  <li>Write one sentence that names your specific customer and their specific problem. Example: "I help first-time homebuyers in Pinellas County understand the mortgage process without the confusion."</li>
  <li>Identify the last 3 paying customers you had and write down what they all had in common (industry, problem, location, life stage).</li>
</ul>',
NULL, 1);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Building Your Customer Profile Down to the Detail',
'<p>There is a reason building a customer profile feels a little uncomfortable. It means making decisions about who you are not going to spend energy on, and that takes confidence you might not feel yet when your business is still growing.</p>
<p>A customer profile is not a checklist you fill out once and file away. It is a living document that shapes every word you write, every offer you make, and every platform you show up on. When it is built correctly, it saves you time and money on marketing that was never going to work anyway.</p>
<p>Start with the basics: age range, income range, where they live, what they do for work. Your customer does not need to be a perfectly defined demographic, but you need enough detail to picture a real human being. Not a type, not a category. A person.</p>
<p>For example, instead of "women who want to start a business," try this: "Women between 34 and 48 who have been working in healthcare or education for at least 8 years, are tired of trading time for a salary that does not reflect what they actually produce, and are ready to build something of their own but are not sure where to start." That second version tells you exactly what to say and exactly where to find her.</p>
<p>Now go deeper. What does she search for on Google at 11pm? What worries her about trying something new? What has she already tried that did not work? What does she tell her friends she wishes existed? These questions are more valuable than any demographic statistic.</p>
<p>The fastest way to build an accurate customer profile is to talk to real people. Send a short, 4-question voice message to your last 5 customers. Ask them what made them choose you, what they were worried about before they hired you, and what has changed since working with you. Those answers will give you more marketing gold than any template.</p>
<p>Once your profile is built, put it somewhere you will see it. Before writing any marketing content, read it. Ask yourself: does this speak to her? Does this address what she is actually afraid of? If the answer is yes, keep writing. If not, start over.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Write a one-paragraph customer profile that includes age range, income or life stage, the main problem they are trying to solve, and one fear they have about solving it.</li>
  <li>List 5 specific phrases your customer might type into Google when looking for what you offer. Not broad terms, actual phrases a real person would use.</li>
  <li>Reach out to 2 past or current customers this week with one question: "What were you most worried about before you started working with me?" Save their exact words.</li>
</ul>',
NULL, 2);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'What Your Customer Actually Wants to Hear',
'<p>Here is something nobody tells you early enough: your customer is not thinking about your business. They are thinking about their problem. The faster you accept that, the better your marketing gets.</p>
<p>Most marketing talks about the business. "We have been serving the community for 12 years." "We offer a full range of services." "Our team is dedicated to excellence." None of that tells the customer whether you can solve what they are dealing with right now.</p>
<p>What your customer wants to hear is that you understand their situation. Not just the surface-level version of it, but the part underneath. A bookkeeper is not selling accounting services. She is selling the feeling of not dreading tax season. A personal trainer is not selling workout plans. He is selling the moment you do not have to suck in your stomach anymore when you walk into a room. The thing your customer wants is always one layer deeper than the thing you are selling.</p>
<p>To get to that layer, you have to know the difference between features and feelings. A feature is what your service includes. A feeling is what your customer experiences because of it. "Monthly reporting" is a feature. "Knowing exactly where your money is every single month without guessing" is the feeling. Lead with the feeling.</p>
<p>Real numbers and real specifics help your customer feel like you actually know what you are talking about. Instead of saying "save time," say "most of my clients get back 6 to 9 hours a week in the first month." Instead of "grow your business," say "three of my clients hit their first $10,000 month within 90 days of working together." Specificity builds credibility faster than any testimonial.</p>
<p>The words your customers use are more powerful than anything you would write yourself. Go back to those answers from your last lesson. If a customer said "I was drowning in my own business," use that. Put it in your copy. People trust language that sounds like them, not language that sounds like a brochure.</p>
<p>Your marketing message should make your ideal customer feel three things in order: seen, understood, and ready to trust you. If your words do all three of those things, you are doing it right.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Write down the top 3 outcomes your customers get from working with you, using their language, not yours. Pull from real feedback if you have it.</li>
  <li>Rewrite your current business description by leading with the feeling your customer wants, not the service you provide. Keep it to 2-3 sentences.</li>
  <li>Identify one phrase you are currently using in your marketing that is vague or generic. Replace it with a specific number, result, or real example.</li>
</ul>',
NULL, 3);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Message-Market Fit — When Your Words Match Their Problem',
'<p>This lesson is about a feeling you have probably experienced as a customer but maybe not yet created as a business owner: that moment when you land on a website, an Instagram post, or an email subject line and think, "This person is talking directly to me."</p>
<p>That experience is called message-market fit. It is not luck. It is the result of knowing exactly who you are talking to, understanding their specific problem, and saying something true about it in the exact language they would use themselves.</p>
<p>Message-market fit is not about being clever or writing beautiful copy. It is about alignment. Your message has to match the moment your customer is actually in. If they are panicking about not having enough clients, your message should meet that panic. If they are exhausted and questioning whether they made the right choice leaving their job, your message should meet that exhaustion.</p>
<p>A practical way to test your message-market fit is to show your main marketing message to someone who fits your customer profile, ideally someone who does not already know you. Ask them three things: Does this feel like it is for you? Do you understand what the offer is? Does it make you want to know more? If the answer to any of those is no, your message and your market are not aligned yet.</p>
<p>Here is a fast exercise. Take your current marketing tagline or main message and run it through this filter: Does it name the person it is for? Does it name the problem? Does it point toward the result? If it does not do all three, rewrite it until it does.</p>
<p>An example: "Marketing help for small businesses" does none of those things. Compare it to "Marketing strategy for service-based entrepreneurs who are tired of posting every day and seeing no results." The second one names the person (service-based entrepreneurs), names the problem (posting with no results), and implies the result (a strategy that works). That is message-market fit.</p>
<p>This will feel like you are narrowing yourself down too much. You are not. You are making it possible for the exact right person to recognize themselves in your words, which is the only thing that leads to them actually buying.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Write your business''s core message using this structure: "I help [specific person] who [specific problem] to [specific result] without [specific fear or sacrifice]."</li>
  <li>Test your message by reading it to someone who fits your customer profile. Ask if it sounds like it was written for them.</li>
  <li>Compare your current website or bio language to your rewritten message. List 3 places where the old language needs to be updated.</li>
</ul>',
NULL, 4);

-- ═══════════════════════════════════════════════
-- MODULE 2
-- ═══════════════════════════════════════════════
INSERT INTO modules (course_id, title, position)
VALUES (v_course_id, 'Your Marketing Foundation', 2)
RETURNING id INTO v_mod_id;

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'What Makes You Different and Why That Has to Come Through in Everything',
'<p>It is uncomfortable to say out loud what makes you different. It feels like bragging, or worse, like you might be wrong about it. But if you cannot say what makes you different, your customers certainly cannot figure it out on their own.</p>
<p>Being different is not about being better in some abstract way. It is about being specific and honest about what you bring that other options do not. This is called your differentiator, and it is not a line on your website. It is the through-line in everything you put out.</p>
<p>Most small businesses try to differentiate on quality. "We do excellent work." "We are committed to your success." "We care about our customers." Every single one of your competitors says the same thing, including the ones who are not actually good. Quality is a baseline expectation, not a differentiator.</p>
<p>Your real differentiator is often something you take for granted because it feels normal to you. Maybe it is your background. A contractor who built houses for 12 years before starting a flooring business knows more about load-bearing walls and project timelines than a flooring-only company ever will. That knowledge is a differentiator. Maybe it is your process. Maybe it is your speed, your communication style, or the way you make people feel when they work with you.</p>
<p>To find your real differentiator, ask your current customers why they chose you over someone else. Then ask what they would miss most if you closed tomorrow. Their answers will almost always point to something specific that you have been underselling.</p>
<p>Once you know your differentiator, it has to show up everywhere. Your social media bio. Your email signature. The way you describe yourself at networking events. The angle of every piece of content you post. When your differentiator is consistent, it builds recognition over time. When it is inconsistent or hidden, customers treat you as interchangeable with everyone else.</p>
<p>Your differentiator is also permission to stop trying to compete on everything. You do not have to be the fastest, the cheapest, the most experienced, and the most available all at once. Pick the lane where you are genuinely the best option and drive in it on purpose.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Ask 3 current or past customers why they chose you specifically. Write down their exact words.</li>
  <li>Write your differentiator in one sentence that does not use the words "quality," "care," "dedicated," or "committed."</li>
  <li>Audit your social media bio and website homepage. Check that your differentiator shows up clearly in both. Update anywhere it is missing.</li>
</ul>',
NULL, 1);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Your Brand Story — The Version That Actually Connects',
'<p>Sharing your story feels vulnerable, and that vulnerability is exactly why most business owners keep their "About" page generic. But the story version that stays safe is also the one that nobody remembers.</p>
<p>People do not buy products. They buy from people they trust. Your brand story is one of the fastest ways to build that trust, but only the real version of it. Not the version that makes everything sound perfectly planned and professionally executed. The version that tells the truth about why you started this, what it cost you, and what you learned.</p>
<p>Your story does not need to be dramatic. It needs to be honest. Maybe you started your business after a layoff. Maybe you got tired of watching other people profit from your work. Maybe you saw a problem in your community that nobody was solving and you had the skills to solve it. All of those are compelling. None of them require perfection.</p>
<p>The structure that works best for a brand story has four parts. First, the before: who you were and what you were struggling with. Second, the moment: the thing that made you decide something had to change. Third, the journey: what you built, learned, or went through to get here. Fourth, the now: where you are, what you do, and who you do it for.</p>
<p>Here is what to keep out of your brand story: anything that centers your credentials over your customer''s experience. Nobody needs to know every certification you hold in paragraph two. They need to know that you understand their world because you have lived something adjacent to it.</p>
<p>Keep your brand story to 3 to 4 short paragraphs. It should be readable in 90 seconds. If it takes longer, you have included things that are true but not necessary. Cut anything that does not make the reader feel more connected to you.</p>
<p>Your brand story belongs on your About page, your email welcome sequence, your pitch when you speak on panels, and your introductions at networking events. It is not a one-time thing. It is a tool you use to turn strangers into people who feel like they already know you.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Write a rough first draft of your brand story using the four-part structure: before, moment, journey, now. Do not edit while you write. Just get it out.</li>
  <li>Read it out loud and mark any sentence that sounds formal, vague, or like a press release. Rewrite those sentences to sound like how you talk.</li>
  <li>Post your brand story or a version of it in the next 7 days. It can be your About page, a social post, or an email. It does not have to be perfect to be useful.</li>
</ul>',
NULL, 2);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Your Marketing Channels — Picking the Right Two Instead of All Six',
'<p>If you have ever felt like you were supposed to be everywhere at once, posting on Instagram and LinkedIn and TikTok and Facebook and sending emails and updating your Google Business profile all at the same time, that feeling is exhausting and it is also wrong.</p>
<p>The pressure to be on every platform is a myth built by people who sell marketing services. The truth is that two channels done consistently will always outperform six channels done poorly. Your job is to figure out which two channels are actually where your customers are, and then show up there on purpose.</p>
<p>The first filter for choosing your channels is where your specific customer already spends time. If you serve local homeowners, Facebook and Google Business Profile will almost always outperform TikTok. If you serve other business owners or corporate clients, LinkedIn will carry more weight than Instagram. If your customer is a woman between 28 and 45 with a lifestyle focus, Instagram is worth your attention. Follow the customer, not the trend.</p>
<p>The second filter is which channel you can create content for without burning out in 30 days. If you hate making videos, TikTok and Reels will drain you and your content will show it. If writing comes naturally to you, LinkedIn and email marketing will be more sustainable. The best channel is the one you will actually maintain.</p>
<p>The third filter is where you have already seen some traction, even a small amount. If you notice that your Facebook posts get more engagement than your Instagram posts, that signal matters. Start where momentum already exists rather than fighting for attention on a platform where nothing has clicked yet.</p>
<p>Picking two channels does not mean you cannot eventually expand. It means you build a real presence in two places before spreading yourself thin. A business with 847 engaged followers on Instagram and 400 email subscribers who open every newsletter will outperform a business with 3,000 scattered followers spread across six platforms with no real engagement on any of them.</p>
<p>Once you choose your two channels, write down exactly what you will post, how often, and what the goal of each post is. That clarity is what makes a channel work.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>List every platform you are currently trying to maintain. Be honest about which ones you post on consistently and which ones you feel guilty about.</li>
  <li>Identify the 2 channels where your specific customer is most likely to find and trust you. Commit to those two for the next 90 days.</li>
  <li>For each of your two chosen channels, write down the posting frequency you can realistically maintain without burning out. One post per week on LinkedIn consistently beats four posts in one week and then silence for a month.</li>
</ul>',
NULL, 3);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Building a Simple Marketing Plan You Will Actually Stick To',
'<p>The reason most marketing plans fail is not that the person was lazy or unmotivated. It is that the plan was built for an imaginary version of their schedule, not the real one.</p>
<p>A marketing plan that works has to fit your actual life, not an idealized version of it. If you have 4 hours a week for marketing, build a plan that runs in 4 hours. If you do your best writing on Sunday nights, schedule your writing time then. Your plan has to work with who you actually are or it will not work at all.</p>
<p>Start with your goal. What does success look like in 90 days? Not a vague goal like "grow my business," but a specific one. "Get 12 new clients at $347 per month" or "build my email list to 300 subscribers" or "book 8 discovery calls per month." Your marketing activities need to connect directly to that goal.</p>
<p>Next, work backward from the goal. If you need 12 new clients in 90 days and roughly 1 out of 5 discovery calls converts, you need 60 discovery calls in 90 days. That is about 5 per week. If 1 out of every 10 people who see your content books a call, you need to reach 50 new people per week with your content. Now you know what you are actually trying to accomplish with every post, every email, and every conversation.</p>
<p>A simple marketing plan has three components: what you will create (content type and topic), where you will put it (your two chosen channels), and how often. That is it. It does not need a 20-page spreadsheet. It needs clarity and consistency.</p>
<p>Build in flexibility. Life happens, especially for entrepreneurs who are also managing every other part of their business. If you miss a week, your plan should make it easy to pick back up without starting over. Pre-writing content in batches helps. Writing 4 social posts in one sitting is faster and better than writing one post four separate times.</p>
<p>Review your marketing plan once per month, not once per year. What worked in January might not make sense in March. Your plan should evolve as your business evolves, your offers change, and your customer base grows.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Write your specific 90-day marketing goal using real numbers. Revenue target, new clients, email subscribers, or discovery calls, pick one primary metric and name it.</li>
  <li>Build your weekly marketing schedule. Write down the exact time blocks you will use for content creation, posting, and engagement each week.</li>
  <li>Set a calendar reminder for 30 days from today to review what is working and what needs to change.</li>
</ul>',
NULL, 4);

-- ═══════════════════════════════════════════════
-- MODULE 3
-- ═══════════════════════════════════════════════
INSERT INTO modules (course_id, title, position)
VALUES (v_course_id, 'Social Media That Converts', 3)
RETURNING id INTO v_mod_id;

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Content That Builds Trust vs. Content That Just Fills the Feed',
'<p>There is a moment that a lot of business owners hit after about 6 months of posting, when they realize they have been consistent but nothing is moving. The followers are growing slowly, the engagement is fine, but the phone is not ringing. That moment is frustrating, and it usually means you have been filling your feed instead of building trust.</p>
<p>Filling the feed looks like posting because you know you should. Trust-building looks like posting because you have something real to say that your specific customer needs to hear. The difference is not always visible in the post itself. It is in the intention behind it.</p>
<p>Trust-building content falls into three categories. The first is education: teaching your audience something specific and useful that they can apply without having to hire you. This sounds counterintuitive, but people who learn from you for free are far more likely to pay you than people who have never experienced your thinking. The second is social proof: real stories, real results, real transformations. Not "great service" reviews but specific outcomes with specific details. The third is personality: the parts of you that make you someone people want to work with, not just someone capable of doing the job.</p>
<p>Feed-filling content is the opposite. It is generic inspiration quotes that anyone could post. It is product shots with no story. It is announcements of things that matter to you but not to your audience. It is reposted content that has nothing to do with what your customer is actually struggling with.</p>
<p>A practical rule: before you post anything, ask whether this specific piece of content would make your ideal customer stop scrolling. Not stop scrolling because it is pretty. Because it said something true about their life.</p>
<p>Here is a formula that works. Every week, aim for one educational post, one story or proof post, and one post that shows who you are as a person or business. Three posts per week in those three categories will build more trust than seven posts of random content.</p>
<p>Track which of your posts get saved or shared rather than just liked. Saves and shares are the signals that something you said was valuable enough for someone to want to return to it or share it with someone else. Those are your best posts. Make more of those.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Audit your last 12 posts. Label each one as education, proof, or personality. Note how many fall into none of those categories.</li>
  <li>Write one post for each of the three trust-building categories this week. Schedule them before you end your work day today.</li>
  <li>Look at your last 90 days of posts and identify the 2 or 3 that got the most saves or shares. Write down what made them different.</li>
</ul>',
NULL, 1);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Instagram and Facebook for Small Business — What Actually Works',
'<p>Instagram and Facebook are two different platforms with two different audiences and two different behaviors, and treating them the same way is one of the most common mistakes small business owners make. What works on one does not always work on the other.</p>
<p>Instagram rewards visual quality, consistency, and a clear point of view. Your grid is still a first impression. When someone clicks on your profile for the first time, they look at your bio and your last 9 posts and decide in about 8 seconds whether to follow you. Your bio needs to say who you are for and what you do in plain language. And your last 9 posts should make it obvious what kind of content you put out.</p>
<p>For small business on Instagram, Reels still carry the most reach for new audiences, but carousel posts carry the most saves and time-on-post for people who already follow you. A realistic strategy for a solo entrepreneur or small team is 2 to 3 Reels per month for reach and 1 to 2 carousels or educational posts per week for the people who already know you.</p>
<p>Facebook works differently. Organic reach on business pages has been declining for years, but Facebook Groups and Facebook Marketplace are still powerful for local and community-based businesses. If your customer is 35 to 55 years old and local, Facebook is still one of the most effective places to find them. Local community Facebook groups, in particular, can drive real business, especially for service-based businesses.</p>
<p>For Facebook, prioritize your personal profile over your business page for organic reach. The algorithm still shows personal posts to more people than business page posts. This does not mean mixing your personal life with your business content. It means showing up as yourself, the business owner, in authentic posts that naturally include what you do.</p>
<p>Stories on both platforms are underused by small business owners and overused by large brands running ads. For small business, Stories are the best place for behind-the-scenes content, quick updates, polls, and personal moments that make people feel like they know you. You do not need to produce Stories, you just need to share them.</p>
<p>The single most effective thing you can do on either platform today is respond to every comment and DM within 24 hours. The algorithm rewards engagement, but more importantly, the person who took the time to comment or message you is a warm lead. Treat them like it.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Update your Instagram bio today using the formula: what you do + who you do it for + one specific result or differentiator. Keep it under 3 lines.</li>
  <li>Look up 2 to 3 local Facebook groups relevant to your business or customer. Join them, introduce yourself without pitching, and commit to being genuinely helpful for 30 days before promoting anything.</li>
  <li>Set a phone reminder for 9am and 7pm every day this week to respond to any comments or DMs within that window.</li>
</ul>',
NULL, 2);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'LinkedIn for Entrepreneurs — Why Most People Use It Wrong',
'<p>Most small business owners either avoid LinkedIn because it feels corporate and stiff, or they use it the same way they use Instagram and wonder why nothing happens. Both approaches miss what LinkedIn is actually built for.</p>
<p>LinkedIn is a platform built on professional trust. The people who use it are in a professional mindset when they are there. They are thinking about their career, their business, and the challenges they face as professionals. That is exactly the mindset you want your potential client or referral partner to be in when they encounter your content.</p>
<p>The biggest mistake on LinkedIn is treating it like a resume or a broadcast channel. Posting company announcements, sharing links to articles with no commentary, or only talking about what you offer is the fastest way to get ignored. LinkedIn rewards personal insight, professional experience, and real perspective on problems your audience faces.</p>
<p>What actually works on LinkedIn is what most people are afraid to post: honest, specific takes on what you have learned building your business. "Here is what I got wrong in year one." "Here is what happened when I raised my prices for the first time." "Here is the conversation with a client that changed how I do everything." That kind of post performs consistently well because it is the opposite of what most people put out there.</p>
<p>LinkedIn is also the most underused networking tool for service-based entrepreneurs. Sending a genuine connection request with a personal note costs nothing. Following up with a real message that references something from their profile is more effective than any paid ad targeting. If your customer or referral partner is a business owner, HR professional, nonprofit director, or corporate leader, they are on LinkedIn and they are far more reachable there than anywhere else.</p>
<p>For posting frequency, 2 to 3 times per week is enough to build momentum on LinkedIn without burning out. Each post should be focused on one idea, written plainly, and short enough to read in under 90 seconds. Long posts work when they tell a real story. Short posts work when they make one sharp point. Both are better than a post that tries to say six things at once.</p>
<p>Your LinkedIn profile is also a sales page. The headline should say what you do for who, not your job title. The About section should read like your brand story: who you help, what you have learned, and what you bring. Most LinkedIn profiles read like a resume. Yours should read like an invitation.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Rewrite your LinkedIn headline to say what you do + who you help + one specific result. Job titles alone tell nobody anything useful.</li>
  <li>Write and publish one post this week about something real you learned building your business. No polish required. Specific and honest beats perfect.</li>
  <li>Send 5 personalized connection requests this week to people who fit your referral partner or ideal client profile. Include a one-sentence note about why you are connecting.</li>
</ul>',
NULL, 3);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Posting Consistently Without Burning Out',
'<p>The consistency problem is real and it is not a discipline problem. You do not need more motivation to post. You need a system that fits your actual capacity, not a standard built for someone with a full marketing team.</p>
<p>Burnout around social media almost always comes from one of three places. The first is creating everything from scratch in the moment, which means every post requires starting from zero. The second is posting on too many platforms without the bandwidth to support them. The third is measuring the wrong thing, posting for vanity metrics like follower count rather than for the actual business outcomes you care about.</p>
<p>The solution to creating from scratch is batching. Pick one day per week or one block of time every two weeks and create all your content in that window. Write your captions, shoot your photos or videos, and schedule everything before you close your laptop. When Monday comes, your content is already done. This single shift removes more friction than any other change you can make.</p>
<p>A content calendar does not need to be complicated. It can be a simple notes document or a free Trello board with three columns: to write, ready to post, and published. The goal is not a perfect system. The goal is knowing what you are posting next without having to think about it in the moment.</p>
<p>Another way to remove friction is to build a content bank. Every time you have a conversation with a client that teaches you something, write it down. Every time someone asks you a question you have answered a hundred times, that question is a post. Every time something in your business does not go the way you expected, that is a post. You are living your content every single day. The content bank is just the habit of capturing it.</p>
<p>Reusing content is not cheating. If you wrote a post 6 months ago that performed well, refresh it and post it again. Most of your followers were not following you 6 months ago, and the ones who were do not remember every post. A post that helped someone once will help someone new.</p>
<p>Finally, give yourself permission to have off weeks. The goal is a pattern of consistency over time, not perfection every single week. A business that posts 3 times a week for 40 weeks of the year will build more trust and reach than a business that posts every day for 4 weeks and then disappears.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Choose one 2-hour block per week or one 4-hour block every two weeks as your dedicated content creation time. Put it in your calendar as a recurring event.</li>
  <li>Start a content bank today. Open a note on your phone and write down the last 3 questions a customer or prospect asked you. Each one is a potential post.</li>
  <li>Identify your best-performing post from the last 3 months and rewrite it with a fresh angle or updated example. Schedule it for this week.</li>
</ul>',
NULL, 4);

-- ═══════════════════════════════════════════════
-- MODULE 4
-- ═══════════════════════════════════════════════
INSERT INTO modules (course_id, title, position)
VALUES (v_course_id, 'Beyond Social Media', 4)
RETURNING id INTO v_mod_id;

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Email Marketing — Why Your List Is Worth More Than Your Followers',
'<p>Here is the uncomfortable truth about your social media following: you do not own it. If Instagram or Facebook changed its algorithm tomorrow, or if your account was flagged and taken down, your access to every one of those followers would be gone. Your email list is yours. Nobody can take it away.</p>
<p>Email marketing has a higher return on investment than any other marketing channel for small business. The industry average is $36 returned for every $1 spent on email marketing. That is not because email is magic. It is because the people on your list chose to hear from you, which makes them far more likely to buy than someone who scrolled past an ad.</p>
<p>The reason most small business owners avoid building an email list is that it feels slow. You are not going to build 1,000 subscribers overnight, and watching a list grow by 3 people a week feels discouraging when you see brands talking about their 50,000 followers. But 300 engaged email subscribers who open every email and trust you will generate more real business than 5,000 social followers who scroll past everything.</p>
<p>Your email list is also a direct line to your customer without any algorithm in between. When you send an email, 100% of the list receives it, even if only 23% open it. On Instagram, organic posts typically reach 3% to 7% of your followers. The math strongly favors email.</p>
<p>Email works best when it builds relationship, not just when it sells. A good email marketing approach mixes value, story, and offer in a ratio of roughly 3:1. For every email that is primarily a promotion, send 3 that are primarily useful or personal. Your subscribers will stay subscribed and will pay attention when you do make an offer.</p>
<p>You do not need a complicated email platform to start. Free plans on platforms like Mailchimp or Kit support up to 1,000 subscribers, which means there is no cost barrier to getting started today. The platform matters less than the habit of emailing your list at least twice a month.</p>
<p>Treat your email list like a relationship, not a broadcast tool. Write like you are talking to one person. Use their name. Tell real stories. Share the things you are learning. When you email your list and it feels like getting a note from someone who knows you, that is what builds the kind of trust that eventually leads to sales.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>If you do not have an email list, sign up for a free email marketing account today (Mailchimp, Kit, or MailerLite all have free tiers). Do not wait for it to be perfect.</li>
  <li>Write down the names of 10 people you currently communicate with through text, DM, or phone who would benefit from your content. Personally invite each of them to join your list this week.</li>
  <li>Plan your first email or next email. It should be 200 to 400 words, tell one real story or teach one specific thing, and close with one simple invitation for them to reply or take a next step.</li>
</ul>',
NULL, 1);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Building Your Email List From Zero',
'<p>Starting from zero feels daunting. Zero subscribers is a number that makes you want to wait until you have more to say or more to offer before you start. But the list does not grow while you are waiting to start it.</p>
<p>The most effective tool for building your email list is a lead magnet. A lead magnet is something specific and immediately useful that you give away in exchange for someone''s email address. The key word is specific. A lead magnet called "10 Business Tips" will get far fewer signups than "A 3-Page Checklist for Pricing Your Services So You Stop Leaving Money on the Table."</p>
<p>Your lead magnet does not have to be a 40-page guide. In fact, shorter and more specific lead magnets perform better than long, comprehensive ones. A 1-page checklist, a 5-minute audio training, a short email series, a simple template, or a quiz with personalized results, all of those work. The question is: what does your specific customer need badly enough to hand over their email address to get it?</p>
<p>Once you have a lead magnet, you need a place for people to sign up. This is a landing page, which is just a simple webpage with a headline, a few bullet points about what they are getting, and a form to enter their email. Most email platforms have free landing page builders built in. You do not need to pay for a separate website tool to get started.</p>
<p>Then you need to send traffic to that page. This is where most people get stuck because they think they need paid ads to build a list. You do not, especially not at first. Your existing network is the most underused audience you have. Post your lead magnet on your social media with a clear call to action. Share it in relevant Facebook groups. Mention it to clients after every successful project. Add the link to your email signature. Put it in your Instagram bio.</p>
<p>A realistic growth rate for an email list built without paid ads is 15 to 40 new subscribers per month if you are actively promoting your lead magnet. That means in 6 months, you could have 90 to 240 people on your list who signed up specifically because they wanted what you offered. That is not a vanity number. That is a genuinely interested audience.</p>
<p>Set a small, specific goal. Getting to 100 subscribers before you run any paid ads is a reasonable benchmark. Those first 100 people will tell you, through their open rates and what they click on, exactly what to send more of.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Choose one lead magnet idea based on the most common question your customers ask you. Write it in one sitting. Done and specific beats polished and broad.</li>
  <li>Set up a simple landing page for your lead magnet using whatever email platform you are on. Keep the copy to one headline, 3 bullet points, and a form.</li>
  <li>Share your lead magnet in at least 3 places this week: your social media, your email signature, and directly to 5 people in your network who fit your customer profile.</li>
</ul>',
NULL, 2);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Referral Marketing — Turning Happy Customers Into Your Sales Team',
'<p>Asking for referrals makes most business owners uncomfortable. It feels like asking for a favor, like you are imposing on someone or admitting that you need help. But a referral from a happy customer is not a favor. It is them doing something good for someone they know.</p>
<p>Referral marketing is the highest-converting marketing you will ever do. Someone who reaches out because a friend told them to use you is already warm. They already trust you before they make the first contact. Close rates on referred leads are typically 3 to 5 times higher than cold leads from ads or organic content. And it costs you almost nothing.</p>
<p>The reason referrals do not happen automatically, even when your customers love you, is that people do not think to recommend you until they are reminded. They are busy. Your business is not the thing they are thinking about on a random Thursday. Your job is to make it easy for them to think of you when the right moment comes up.</p>
<p>The simplest referral system is a direct ask, made at the right time. The right time is after a success moment, when a client just hit a milestone, finished a project, gave you a positive piece of feedback, or told you something has improved. In that moment, you say: "I am so glad this has been working for you. If you know anyone else who could use [what you offer], I would love if you sent them my way." That is it. No complicated system required.</p>
<p>You can also build a small incentive into your referral process. This does not mean paying for referrals, which can feel transactional in some service businesses. It can be something simple: a discount on a future service, a free add-on, a handwritten thank-you note, or a small gift. The gesture communicates that you noticed and that you appreciate it.</p>
<p>A structured referral program adds more scale. A referral card or a personalized referral link that your best customers can share. A simple email you send to past clients every 90 days that reminds them of what you do and asks them to forward it to anyone who might need it. These are not complicated systems. They are reminders, built into your process, that referrals matter.</p>
<p>Track your referral sources. Know which customers have sent you the most business and make sure they are your highest-priority relationships. A client who has sent you 4 referrals is worth more to your business than almost any marketing investment.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Make a list of your top 5 happiest current or past clients. Plan to reach out to each one this week, not to pitch them, but to check in and reconnect.</li>
  <li>Write a referral ask you feel comfortable using. Practice it out loud until it does not feel awkward. Use it at the next right moment.</li>
  <li>Set up a quarterly email reminder to your past clients that includes a brief update on what you are working on and a clear, specific ask for referrals.</li>
</ul>',
NULL, 3);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Networking That Leads to Real Business',
'<p>Networking has a reputation problem. The version most people have experienced is a room full of people handing out business cards, reciting elevator pitches, and thinking about themselves instead of the person they are talking to. That version does not lead to real business. Real networking is different.</p>
<p>Real networking is built on genuine curiosity. The person in front of you is dealing with something. They are building something. They have a need that might connect directly to you, or they know someone who does. The only way to find out is to ask real questions and actually listen to the answers.</p>
<p>The most common networking mistake is leading with what you need instead of what you offer. Walking into a room and thinking "I need clients" broadcasts itself in every conversation you have. Walking in and thinking "I want to learn what people in this room are struggling with" changes the entire dynamic. People can feel the difference, and they respond to the second version.</p>
<p>Choosing the right networking events matters more than going to many events. A local chamber of commerce meeting, a women''s business organization, an industry-specific meetup, a mastermind, or even a community event can be more valuable than a general "business networking mixer." Go where your actual customer or referral partner is most likely to be, not just where other entrepreneurs gather.</p>
<p>The follow-up is where networking either turns into business or dies. If you meet someone promising and do not follow up within 48 hours, the momentum is gone. Your follow-up does not have to be a sales email. It can be a LinkedIn connection with a personal note, a resource you mentioned in your conversation, or a simple "it was great to meet you" email that includes one thing you remember about what they were working on.</p>
<p>Online networking is underused and underappreciated. LinkedIn conversations, Facebook Group participation, and Twitter or Instagram replies to people in your space are all forms of networking. Being genuinely helpful in a Facebook Group for your target market, answering questions without any expectation of immediate return, builds the kind of reputation that generates referrals from people who have never met you in person.</p>
<p>The goal of every networking interaction is not to close a deal on the spot. The goal is to make a real impression that someone remembers when the right opportunity comes up, whether that is a week later or 8 months later.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Identify 2 networking events, groups, or communities where your ideal customer or referral partner is likely to be. Register for or join them this week.</li>
  <li>After your next networking conversation, write down one specific thing the person shared with you and use it in your follow-up within 48 hours.</li>
  <li>Join one relevant online community (LinkedIn group, Facebook group, or forum) and commit to contributing genuinely for 30 days before promoting anything.</li>
</ul>',
NULL, 4);

-- ═══════════════════════════════════════════════
-- MODULE 5
-- ═══════════════════════════════════════════════
INSERT INTO modules (course_id, title, position)
VALUES (v_course_id, 'Paid Advertising Without Wasting Money', 5)
RETURNING id INTO v_mod_id;

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Should You Run Ads? Knowing When You Are Ready',
'<p>Paid ads feel like the answer when everything else feels slow. If you are not getting clients, it is tempting to think that throwing money at Facebook or Google will fix it. Sometimes it will. But running ads before you are ready is one of the fastest ways to waste money you cannot afford to lose.</p>
<p>Before you run a single ad, you need to have three things in place. The first is a clear, tested offer. If you cannot close sales consistently without ads, ads will not fix that. They will just send more people into a leaky process. The second is a place to send people. This means a landing page, website, or booking system that works, loads fast, and makes it easy for someone to take the next step. The third is a minimum ad budget you can spend without it hurting your business. For Facebook or Instagram, $15 to $25 per day is the minimum that will generate meaningful data. For Google, it depends on your market, but $20 to $40 per day is a realistic floor for local service businesses.</p>
<p>The signal that you are ready to run ads is that your organic marketing is working. When you post content, you get engagement. When you reach out to warm leads, some of them convert. When you ask for referrals, you get them. Ads amplify what is already working. They do not create something from nothing.</p>
<p>Another readiness signal is that you understand your numbers. Specifically: what is a new customer worth to you over 12 months? If a single client is worth $2,400 to your business and your ads cost $247 to acquire one new client, your ads are working. If you do not know what a client is worth, you cannot know whether your ad spend makes sense.</p>
<p>The right time to run ads is when you have a specific offer, a clear audience, a place to send people, and a budget you can sustain for at least 60 days. Running ads for two weeks, seeing no immediate results, and stopping is not testing ads. It is burning money. The learning curve for ad platforms is real, and most campaigns need 30 to 45 days before the algorithm finds its rhythm.</p>
<p>If you are not at that point yet, the decision is not "never run ads." It is "not yet." Use that time to build your organic foundation, test your messaging, and get clear on your numbers. That work will make every dollar you eventually put into ads worth more.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Calculate what a single new customer is worth to your business over 12 months. Write it down as a specific number.</li>
  <li>Audit the destination you would send ad traffic to right now. Does it load in under 3 seconds? Is the next step clear? Would you buy from it if you were a stranger?</li>
  <li>Be honest about whether organic marketing is working first. Write down your current monthly leads from organic sources. If that number is zero, fix organic before adding paid.</li>
</ul>',
NULL, 1);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Facebook and Instagram Ads — What Works for Small Budgets',
'<p>Running Facebook and Instagram ads on a small budget requires a different approach than what you see from brands spending $50,000 a month. The strategies that work at scale will waste your money at the $500 to $1,500 per month level. Here is what actually works when your budget is limited.</p>
<p>Start with a retargeting audience before you build a cold audience campaign. Retargeting means showing ads only to people who have already interacted with you: your website visitors, your Instagram followers, your Facebook page fans, people who have watched your videos. These people already know who you are. The cost to convert them into a lead or a customer is significantly lower than convincing a cold stranger. A small daily budget of $10 to $15 on a retargeting campaign is often more effective than $50 per day on cold traffic.</p>
<p>Your ad creative matters more than almost everything else on a small budget. "Creative" means the image or video paired with your copy. On Facebook and Instagram, ads that look like organic posts, not like ads, almost always outperform polished, professional-looking ad graphics. A video of you talking directly to the camera about a problem your customer is dealing with will outperform a designed graphic with your logo and tagline in almost every test.</p>
<p>Keep your targeting simple. Facebook''s audience targeting has gotten less precise over the last several years as data privacy changes have taken effect. The more you try to layer in specific interests and behaviors, the more you restrict the algorithm from finding the right people. For a small budget, it is often better to define a geographic area, an age range, and let the creative do the work of filtering the right audience.</p>
<p>Test one variable at a time. If you run 4 different ads with different images, different copy, different audiences, and different objectives all at once, you will not know what made any of them work or fail. Run one ad, watch it for 7 days, then change one thing and compare.</p>
<p>Your objective matters. If you want people to book a call, use a conversion or leads objective, not a traffic objective. If you want video views, use a video views objective. Meta''s algorithm optimizes toward whatever goal you set. Setting the wrong objective is a common and costly mistake.</p>
<p>Budget pacing: a $500 per month budget is $16.67 per day. That is enough to run a focused retargeting campaign or a single lead generation test. It is not enough to run six simultaneous campaigns. Choose one goal, one audience, one creative, and run it long enough to see results.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Set up a Facebook Pixel or Meta Pixel on your website if you have not already. This is the foundation of all retargeting and is free to install.</li>
  <li>Create one retargeting audience using your website visitors and Instagram or Facebook engagers. Set a minimum ad spend of $10 per day on a single ad targeting this audience for 14 days.</li>
  <li>Film a 60-second video today of you speaking directly to your ideal customer about one specific problem they have. No studio required. Use your phone, good lighting, and clear audio. This is your first ad creative.</li>
</ul>',
NULL, 2);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Google Ads Basics for Local and Service Businesses',
'<p>Google Ads are different from social media ads in one important way: on Google, someone is already looking for what you offer. On Facebook and Instagram, you are interrupting someone''s scroll to show them something they were not searching for. On Google, you are showing up exactly when someone types in "landscaping company near me" or "marketing coach for small business." That intent makes Google Ads incredibly powerful for local and service-based businesses.</p>
<p>The most effective Google Ads campaign for a small local business is a Search campaign targeting your city or service area with keywords directly related to what you offer. This is not complicated to set up, but the details matter.</p>
<p>Start with your keyword list. Choose 8 to 15 very specific keywords, not broad terms. "Plumber" is too broad and will cost you a lot of money. "Emergency plumber in St. Petersburg FL" is specific and will reach someone who needs you right now. The more specific your keywords, the less you will pay per click and the higher the quality of the person clicking your ad.</p>
<p>Use exact match or phrase match keyword types, not broad match. Broad match tells Google to show your ad for anything remotely related to your keyword. This sounds good but results in your plumbing ad showing up for people searching "plumbing careers" or "plumbing history." Exact and phrase match keep your budget going toward people actually looking to hire you.</p>
<p>Write your ad copy with one goal: get the right person to click. Your headline should include the keyword they searched. Your description should tell them what makes you the right choice and what to do next. "Licensed and Insured — Same-Day Service — Call Now for a Free Estimate" is more effective than "Professional Plumbing Services at Competitive Prices."</p>
<p>Your Google ad should send people to a landing page, not your homepage. The landing page should be directly relevant to what they searched for. If someone searches "emergency plumber near me" and clicks your ad, they should land on a page that immediately confirms you offer emergency plumbing in their area and makes it easy to call or book. Sending them to a general homepage costs you clicks and conversions.</p>
<p>A realistic starting budget for Google Search Ads for a local service business is $20 to $40 per day. In a low-competition market, that can generate meaningful traffic within the first week. In a high-competition market, your cost per click might be $8 to $15, which means that $20 to $40 per day generates 2 to 5 clicks. Track those clicks carefully and adjust your keywords if your cost per click is eating your budget without converting.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Make a list of 10 specific keyword phrases your customer might type into Google when looking for what you offer. Include your city or service area in at least 5 of them.</li>
  <li>Set up a Google Ads account if you do not have one. Google often offers a $500 credit for new accounts, which gives you a low-risk way to test your first campaign.</li>
  <li>Create a simple landing page (or dedicate one page on your site) specifically for Google ad traffic with a clear headline, 3 bullet points of what you offer, and one call to action.</li>
</ul>',
NULL, 3);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'How to Know If Your Ads Are Working',
'<p>Throwing money into ads without tracking what comes back is the most common and most expensive mistake in paid advertising. The good news is that tracking is not complicated. It does require looking at the numbers on a regular basis and knowing which numbers actually matter.</p>
<p>The first number that matters is cost per lead, not cost per click. A click means someone visited your page. A lead means someone gave you their contact information or took a meaningful action. If you are spending $1.23 per click but it takes 47 clicks to get one lead, your real cost per lead is $57.81. That might be worth it or it might not, but you need to know that number before you can decide.</p>
<p>The second number that matters is cost per acquisition, which is what it costs you to get one paying customer through ads. If your cost per lead is $57.81 and you convert 1 out of every 4 leads into a paying client, your cost per acquisition is $231.24. If your client is worth $347 per month, that math works. If your client pays you $197 once, that math is much tighter.</p>
<p>For Facebook and Instagram ads, the metrics to watch are: cost per result (Facebook calls it this in your Ads Manager), link click-through rate (CTR), and landing page conversion rate. A healthy CTR for a cold audience is 1% to 2%. A landing page conversion rate of 20% to 30% on a lead generation page is solid. If your landing page is converting at 8%, the issue is not your ad. It is the page the ad sends people to.</p>
<p>For Google Ads, watch your click-through rate, your conversion rate, and your quality score. Quality score is Google''s rating of how relevant your ad and landing page are to the keyword someone searched. A quality score of 7 or above means your setup is solid. A score of 3 or 4 means Google thinks your ad or landing page does not match what the person was looking for, which drives up your cost per click.</p>
<p>Give every ad test at least 14 days before making major changes. The algorithm needs time to learn. Making daily adjustments based on two days of data is like checking the weather every hour and changing your travel plans every time.</p>
<p>Set a monthly review date for your ad performance. Look at what your money produced. Not just clicks and impressions, but leads and clients. If your ads are running for 60 days and you cannot trace a single paying client back to them, something fundamental needs to change.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Set up conversion tracking in your Meta Ads Manager or Google Ads account. This is the technical step most small business owners skip and then regret.</li>
  <li>Calculate your target cost per acquisition. Take what a new customer is worth to you and decide the maximum you are willing to spend to get one. Write that number down and use it as your benchmark.</li>
  <li>Schedule a 30-minute monthly ad review on your calendar. Pull your cost per lead, cost per acquisition, and conversion rates and compare them to your benchmark.</li>
</ul>',
NULL, 4);

-- ═══════════════════════════════════════════════
-- MODULE 6
-- ═══════════════════════════════════════════════
INSERT INTO modules (course_id, title, position)
VALUES (v_course_id, 'Building a System That Runs Without You Reinventing It', 6)
RETURNING id INTO v_mod_id;

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Your Marketing Calendar — Planning 30 Days at a Time',
'<p>There is a specific kind of mental exhaustion that comes from waking up every Monday and not knowing what you are going to post, write, or send that week. It is not the work that drains you. It is the constant low-grade decision fatigue of figuring out what to do next. A marketing calendar fixes that.</p>
<p>A marketing calendar is not a rigid schedule that tells you exactly what to post on October 14th in August. It is a framework for the month ahead that removes the daily question of what to do and replaces it with the simpler work of executing a plan you already made.</p>
<p>Building a 30-day marketing calendar takes about 45 minutes if you have a clear structure. Start with the anchor points: any promotions, launches, or events happening that month. Then fill in your content themes for each week. Then map out your specific posts, emails, or other content against those themes.</p>
<p>A sample structure for a solo entrepreneur might look like this: week 1 focuses on education (teach something specific about your area of expertise), week 2 focuses on social proof (share a client result or story), week 3 focuses on your offer (be clear about what you sell and who it is for), and week 4 focuses on connection (personality, behind-the-scenes, community). Rotating through those four themes keeps your content balanced without requiring you to invent a new strategy every month.</p>
<p>Your calendar should also include your email send days, your promotional windows, and any dates that are relevant to your customer, whether those are industry events, seasonal business cycles, or holidays that affect your audience.</p>
<p>One of the most important parts of your calendar is what is NOT on it. If you have decided to post 3 times per week on Instagram and once per week on LinkedIn, your calendar should show 4 content pieces per week. Not 7. Leaving room in your calendar is not laziness. It is protecting yourself from the overcommitment that leads to falling off entirely.</p>
<p>At the end of each month, spend 20 minutes reviewing the calendar before building the next one. What landed? What felt forced? What got the most response? Let those answers shape next month''s plan.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Open a document or free tool (Google Sheets, Trello, Notion, or even a paper calendar) and map out your marketing activities for the next 30 days. Include content topics, send dates for emails, and any promotions.</li>
  <li>Assign a content theme to each week of the month using the four-theme rotation: education, proof, offer, connection.</li>
  <li>Set a recurring 45-minute monthly calendar planning session at the end of each month to build the following month''s plan before it starts.</li>
</ul>',
NULL, 1);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Repurposing Content So One Idea Becomes Five',
'<p>Creating content from scratch for every platform, every week, is unsustainable for most small business owners who are also running their entire business. Repurposing is the practice of taking one piece of content and adapting it for multiple formats and platforms, and it is one of the highest-leverage things you can do with limited time.</p>
<p>Repurposing is not copying and pasting the same caption across five platforms. It is taking one core idea and expressing it in the way that fits each platform''s format and audience behavior.</p>
<p>Here is a real example of how one idea becomes five pieces of content. You write a 600-word blog post or LinkedIn article about the 3 biggest pricing mistakes service business owners make. That same content becomes: a carousel post on Instagram walking through each mistake with one slide per point; a short-form video where you talk through one mistake on camera for 60 seconds; an email to your list with a personal story about a pricing mistake you made and what it cost you; a pull quote from the article that becomes a standalone text post on Instagram or Facebook; and a Stories series where you share a poll about which mistake your audience has made most often.</p>
<p>The core idea is the same. The format, tone, and visual approach are different for each platform. A text-heavy LinkedIn article does not belong on Instagram. A short punchy caption does not belong in your email newsletter. Repurposing well means understanding what each platform''s audience is there for and translating your idea accordingly.</p>
<p>The most efficient place to start with repurposing is your best-performing content. Look at what has gotten the most engagement, saves, or replies in the last 90 days. Those ideas have already proven themselves. Repurpose those first, not the ones you thought were good but nobody engaged with.</p>
<p>Long-form content is the most repurposable asset you can create. A detailed email newsletter, a long LinkedIn post, a podcast episode, or a recorded training can be broken into 8 to 12 pieces of shorter content. This is why many content strategists recommend starting with long-form and going short, rather than trying to create short content for every platform from scratch every week.</p>
<p>You do not need a tool to repurpose. You need a habit. After you write or record anything, ask: what else could this become? The answer is almost always "more than I thought."</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Pick one piece of content you created in the last 60 days that performed well. Map out 3 different ways you could express that same idea in a different format or on a different platform.</li>
  <li>Create one repurposed version of that content this week. Do not make it identical. Adapt it for the platform and the format.</li>
  <li>Add "what can this become?" to your content creation checklist. Make it a standard question every time you finish a piece of content.</li>
</ul>',
NULL, 2);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Tracking What Is Working and Cutting What Is Not',
'<p>Most business owners either track nothing and guess constantly, or they track everything and get overwhelmed by spreadsheets that never change anything. Neither extreme is useful. What works is tracking a small number of meaningful metrics consistently.</p>
<p>The fear around data and analytics is usually not technical. It is the fear of finding out that something you have been working hard on is not working. That finding is uncomfortable, but it is also the most valuable thing analytics can tell you. The sooner you know what is not working, the sooner you can stop spending time and money on it.</p>
<p>The metrics that matter most for a small business marketing system are: website traffic and where it comes from, email open rate and click rate, social media post reach and engagement rate, lead count by source (where are your leads actually coming from), and new clients by source. That is it. Five categories. If you are tracking those consistently, you have enough data to make good decisions.</p>
<p>For website traffic, Google Analytics is free and gives you everything you need. Look at which pages people visit most and which pages they leave from immediately. A high exit rate on your services page means something on that page is not convincing people to take the next step.</p>
<p>For email, a healthy open rate for a small business list is 28% to 38%. If you are consistently below 20%, the problem is usually your subject lines, your send frequency, or that your list has gone stale and needs a re-engagement campaign. A click rate above 2.5% is solid. Below that, your emails need a clearer call to action.</p>
<p>For social media, ignore follower count as a primary metric. Focus on engagement rate (total engagements divided by total reach) and, more importantly, how many leads or customers can you trace back to social media each month. Engagement rate above 3% on Instagram is healthy for a small account.</p>
<p>Review your numbers once a month, not once a quarter. A monthly review lets you catch problems before they become expensive habits. If your email open rate has dropped from 34% to 19% over 90 days, a monthly review catches it at 60 days. A quarterly review catches it when it has been broken for months.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Set up Google Analytics on your website if it is not already there. It takes about 15 minutes and is free.</li>
  <li>Pull your email open rate and click rate from the last 3 months. Write down the trend line: is it going up, down, or holding steady?</li>
  <li>Identify the one marketing activity you have been doing for 60 or more days with no measurable result. Make a decision: change it significantly or cut it.</li>
</ul>',
NULL, 3);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Marketing as You Grow — When to Get Help and What to Hand Off',
'<p>There is a point in every growing business when marketing goes from something you squeeze into the spare hours at the end of the day to something you cannot afford to keep doing alone. Recognizing that point before it becomes a crisis is the difference between planned growth and frantic scrambling.</p>
<p>The decision to get help with marketing is not the same as the decision to spend money you do not have. There is a progression: first, you use systems and tools to extend your own capacity. Then, you bring in a part-time contractor for specific tasks. Then, eventually, you hire or bring in someone more substantial. The mistake is skipping straight to the end when the middle option would serve you better.</p>
<p>The first things to hand off are almost always the most time-consuming and the least strategic: scheduling social media posts, monitoring comments and messages, managing your email newsletter design and send, basic graphic creation for templates you have already designed. These are tasks that someone else can do with clear instructions. They do not require your thinking. Paying a virtual assistant $15 to $25 per hour for 5 hours a week to handle those tasks frees you to spend your time on the work only you can do.</p>
<p>The last things to hand off are the most strategic: your brand voice and messaging, your offer strategy, the core content that reflects your thinking and expertise. Even if you eventually have a full marketing team, those elements need to start with you or they will not sound like you.</p>
<p>Before you hire anyone, document your marketing system. What platforms do you use, how often, with what content, and what is the goal of each? What tone and voice rules apply? What images and colors are approved? What is off-limits? This documentation is what allows someone else to execute your marketing without requiring you to supervise every decision.</p>
<p>When evaluating contractors or agencies, be cautious about anyone who promises a specific number of followers or a specific revenue increase from marketing. Good marketing increases your leads and your visibility over time. Anyone promising exact results in a fixed time frame is either guessing or selling you something they cannot guarantee.</p>
<p>The right time to invest in marketing help is when your time is worth more than what you would spend on help, and when you have enough consistent revenue that the investment is not a risk to your stability. Not a moment before that, and not much later than that either.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Write down every marketing task you currently do in a week, including how long each takes. Mark each one as either "only I can do this" or "someone else could do this with good instructions."</li>
  <li>If the "someone else" list totals more than 4 hours per week, research virtual assistant rates in your area or on platforms like Upwork. Calculate what that time is worth to you and whether the math makes sense.</li>
  <li>Write a one-page "Brand Voice Guide" that covers your tone, your audience, your key messages, and your visual rules. This document is what makes it possible for anyone else to help you without guessing.</li>
</ul>',
NULL, 4);

END $$;
