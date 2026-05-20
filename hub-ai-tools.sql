-- ═══════════════════════════════════════════════
-- AI TOOLS FOR ENTREPRENEURS
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
  'ai-tools-for-entrepreneurs',
  'AI Tools for Entrepreneurs',
  'You do not need to be technical to use AI in your business. Six modules covering what AI actually is and what it can do for small businesses, using AI for content creation and marketing, automating customer service and admin tasks, AI tools for financial management, building AI into your daily workflow, and what is coming next so you are never caught off guard again.',
  0
)
ON CONFLICT (slug) DO NOTHING;

SELECT id INTO v_course_id FROM courses WHERE slug = 'ai-tools-for-entrepreneurs';

-- ═══════════════════════════════════════════════
-- MODULE 1
-- ═══════════════════════════════════════════════
INSERT INTO modules (course_id, title, position)
VALUES (v_course_id, 'What AI Actually Is and What It Means for Your Business (No Tech Degree Required)', 1)
RETURNING id INTO v_mod_id;

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'The Honest Truth About AI — What It Is, What It Is Not',
'<p>If the word "artificial intelligence" makes you feel like this conversation is not for you, that is exactly where we need to start. The technology industry has done a terrible job of explaining AI to regular people, especially business owners who did not go to school for tech and do not have time to read white papers. So let''s get honest and plain about what this actually is.</p>
<p>AI, at its most basic, is software that has been trained to recognize patterns. That is it. You feed a program millions of examples of text, images, or audio, and it learns to predict what comes next based on those patterns. ChatGPT has read an enormous amount of the internet and learned how text tends to work. So when you ask it a question, it predicts the most likely useful response based on everything it has processed. It is not thinking. It is not conscious. It is pattern matching at a massive scale.</p>
<p>That explanation matters because it sets the right expectations. AI is a very powerful tool. It is also a tool that can be confidently wrong, that can miss nuance, that can produce content that sounds perfect and is completely inaccurate. It does not know your business. It does not know your customers. It does not have your judgment. You do. That is why you are not replaceable by it.</p>
<p>What changed in the last few years is not that AI became intelligent. What changed is that it became accessible. You used to need a team of engineers to use AI tools in a business. Now you need a browser and sometimes a credit card. The barrier dropped from millions of dollars to around twenty dollars a month. That shift is what makes this conversation relevant to every business owner, regardless of size.</p>
<p>Here is what AI can genuinely help you with: writing first drafts, answering common questions, sorting and summarizing information, generating images and visuals, automating repetitive tasks, and analyzing data without a spreadsheet degree. Those are real, practical things. And you do not need to understand the code behind any of it to use it.</p>
<p>Here is what AI cannot do: replace your relationships, make ethical decisions for you, understand the cultural context of your specific community, or guarantee accuracy. Every output it produces needs a human review, especially for anything that represents your business publicly.</p>
<p>The entrepreneurs who benefit most from AI are not the ones who hand everything over to it. They are the ones who stay in the driver''s seat, use AI to handle the repetitive and time-consuming parts, and keep their own judgment in the loop for anything that matters.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Write down two tasks in your business that eat up your time but do not require your specific expertise or judgment. Keep that list. You are going to use it in this course.</li>
  <li>Go to chat.openai.com or claude.ai and create a free account if you do not already have one. You do not need to do anything with it yet.</li>
  <li>Write down honestly: what has kept you from exploring AI tools until now? Fear of getting it wrong, not knowing where to start, feeling like it is for someone else? Name it so you can move past it.</li>
</ul>',
NULL, 1);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'The AI Tools You Actually Need to Know About',
'<p>You have probably heard the names. ChatGPT. Claude. Gemini. Canva AI. Midjourney. Zapier. The list keeps growing and it can feel overwhelming. Good news: you do not need all of them. You need to know which category of tool does what, and then you can pick one or two to start with.</p>
<p>Let''s break them down by what they do. Conversational AI tools, meaning ChatGPT, Claude, and Google Gemini, are the ones you type a question or request to and they write back. These are your general-purpose AI assistants. ChatGPT is from OpenAI and is the most widely known. Claude is from Anthropic and tends to do very well with longer, more detailed writing tasks. Gemini is from Google and connects well to your existing Google tools like Docs and Gmail. All three have free tiers that are worth exploring before you pay for anything.</p>
<p>Image generation tools like Canva AI, Adobe Firefly, and Midjourney create visuals from your text descriptions. You describe what you want to see and the tool generates an image. Canva AI is the easiest starting point if you are already using Canva for your marketing materials, because it is built right in. Midjourney produces higher-quality images but has a steeper learning curve and requires a Discord account.</p>
<p>Automation tools like Zapier and Make (formerly Integromat) let you connect different apps together and create workflows that run without you. These are not conversational AI in the same way, but they use AI logic to route information between your tools. You set up a trigger and a result. For example: when someone fills out my contact form, automatically add them to my email list and send them a welcome email.</p>
<p>Specialized AI tools exist for specific functions. Notion AI helps with notes and documents. Otter.ai transcribes meetings. Descript edits audio and video. Klaviyo and Mailchimp now have AI features built into email marketing. You do not need to explore all of these right now. You need to know they exist and that most of them are available free to start.</p>
<p>The most important thing right now is not picking the perfect tool. It is picking one and using it enough that it becomes familiar. A tool you use imperfectly is worth ten tools you have accounts for but never opened.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Open ChatGPT (chat.openai.com) or Claude (claude.ai) and ask it one real question about your business. Something you would otherwise Google. See what comes back.</li>
  <li>Look at your current Canva account (if you use Canva) and find where the AI features live. They show up in the design editor. You do not have to use them yet.</li>
  <li>Write down the three biggest time drains in your business operations this week. Not projects, but tasks you did that you could have handed to something else if that something else existed.</li>
</ul>',
NULL, 2);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'How AI Actually Learns — and Why That Matters for How You Use It',
'<p>One of the most common mistakes business owners make with AI tools is treating them like a search engine. You type in a quick question, you get a quick answer, you move on. That approach works for some things. For most business tasks, it leaves a lot of value on the table.</p>
<p>The way conversational AI works is through a concept called context. The more specific information you give it about what you need, who you are, what the output is for, and what constraints matter, the more useful the result. A vague prompt gives you a generic answer. A specific prompt gives you something you can actually use.</p>
<p>Think about it this way. If you hired a freelance writer and you texted them "write me a social media post," they would have to guess everything: your brand voice, your audience, the platform, the goal of the post. They might get it right. More likely they will produce something that sounds like everyone else. But if you said "I run a financial coaching business for first-generation entrepreneurs in their 30s. I want a LinkedIn post that acknowledges how hard it is to manage business finances without a financial background, and then points them to my free budget tool. Keep it under 150 words and do not use corporate language," now they have something to work with.</p>
<p>AI works exactly the same way. The prompt is your instruction. The more complete the instruction, the more useful the output. You do not need to learn to code to get better results. You need to learn to communicate clearly, which you already know how to do.</p>
<p>There is also a concept called conversation memory. Within a single chat session, the AI remembers what you have already told it. So you can give it context once at the beginning of the conversation and it will carry that through. You can say "For this conversation, you are writing as the voice of my brand. My business is [describe it]. My audience is [describe them]. My tone is conversational, direct, and never condescending." Then every prompt you send after that will operate within that context.</p>
<p>What AI tools do not do is remember you between sessions unless you specifically set up a memory feature or paste your context in each time. Claude''s Project feature and ChatGPT''s Memory feature are both designed to help with this. It is worth setting those up once so you do not have to explain yourself every time.</p>
<p>The more you use these tools, the better your prompts will get. And better prompts mean dramatically better output. This is a skill that pays for itself over and over.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Go back to the AI tool you opened in the last lesson. This time, write a more detailed prompt. Include: who you are, who your audience is, what you need, what platform or format it is for, and any tone notes. Notice whether the output is different.</li>
  <li>Copy this sentence and paste it at the start of your next AI conversation: "For this conversation, you are writing as my business''s voice. My business is [fill in]. My audience is [fill in]. My tone is [fill in]. I want you to keep your language conversational and specific, never generic or corporate." Save this somewhere you can paste it again.</li>
  <li>Write down one thing about AI that you are still not sure about. You will either get the answer in this course or you will know what to search for.</li>
</ul>',
NULL, 3);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'What AI Cannot Do — and Why That Is Actually Good News',
'<p>This is the lesson the AI companies do not lead with, but it is the one that will actually protect your business. AI has real limitations, and understanding them means you use it well instead of letting it embarrass you.</p>
<p>AI can be confidently wrong. This is called hallucination, which is the industry term for when an AI tool produces false information as if it were true. It might cite a statistic that does not exist. It might give you legal or tax information that sounds authoritative but is incorrect. It might write a bio for a person and include details that never happened. It produces these errors with the same confident tone it uses when it is correct. There is no "I am not sure" signal built into the output. That means you cannot take anything at face value that has real stakes attached to it.</p>
<p>The fix is simple: use AI as a first draft tool, not a final authority. Anything that involves legal claims, financial numbers, health information, or specific facts that your customer will rely on needs a human review before it goes out. Not because AI is useless, but because you are the professional. You are accountable. The AI is not.</p>
<p>AI also does not know your audience the way you do. It can write content that sounds like your industry. It cannot write content that sounds like your community unless you teach it. If you serve Black women in their 40s in Atlanta who are building second careers, ChatGPT does not automatically know the cultural nuance, the reference points, the specific skepticism or hope your audience carries. You have to bring that. You have to read the output and ask yourself whether it actually resonates with the real humans you serve.</p>
<p>AI does not understand relationships. It cannot pick up on the history between you and a long-term client. It cannot know that a specific customer has been through something hard this year and needs a different kind of communication. It cannot replace the human moment in your business. The human moment is often why customers stay loyal and why your referrals are warm rather than cold.</p>
<p>What this means for you is that AI handles the volume and you handle the quality. AI helps you get to a first draft of fifty things instead of carefully handcrafting two. Your job is to refine what matters, apply your judgment, and make sure your voice and your standards are present in the final product.</p>
<p>The entrepreneurs who are afraid AI will take over have it backwards. The entrepreneurs who use AI well will be more productive, more creative, and more present for the high-value work. That is where you want to be.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Take one piece of content AI wrote for you in this module and read it out loud. Mark anything that does not sound like you, anything that feels generic, or anything you are not sure is accurate. Edit it. Notice how fast that editing process is compared to starting from scratch.</li>
  <li>Write down two categories of business content where you will always review AI output before it goes public. Start building that habit now.</li>
  <li>Look at your website or most recent social post. Write one sentence that captures something specific about your voice that AI would not know unless you told it.</li>
</ul>',
NULL, 4);

-- ═══════════════════════════════════════════════
-- MODULE 2
-- ═══════════════════════════════════════════════
INSERT INTO modules (course_id, title, position)
VALUES (v_course_id, 'AI for Content Creation — Writing, Images, Video, and Social Media', 2)
RETURNING id INTO v_mod_id;

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Using AI to Write Content Without Losing Your Voice',
'<p>If there is one thing business owners tell me they never have enough time for, it is content. Writing the social posts, the newsletters, the website copy, the blog articles, the captions, the email follow-ups. All of it takes time, and most business owners are already stretched thin before they open a blank page to write.</p>
<p>AI changes this, but not by writing everything for you. It changes it by handling the blank page problem. The hardest part of writing is starting. AI is very good at giving you something to react to, edit, and build from. That is how you want to think about it.</p>
<p>Here is a practical workflow. You open ChatGPT or Claude. You give it context about your business and your audience. You say "write me three different Instagram captions promoting my budget coaching program. My audience is first-generation entrepreneurs who often feel shame around their finances. My tone is warm, direct, and never condescending. Each caption should be under 120 words and include a call to action." It gives you three options. You pick the closest one, edit it to sound like you, and post it. What took you 45 minutes now takes 8.</p>
<p>The key phrase in that workflow is "edit it to sound like you." AI will give you a structure and a starting point. Your job is to read it and ask: does this actually sound like me talking to my customers? If the answer is no, you revise. You add the specific words you actually use. You cut the phrases that feel corporate or generic. You add the real example from your experience. AI gives you the scaffold. You build the house.</p>
<p>Your voice is made up of very specific things: the words you naturally reach for, the analogies you use, the way you open a sentence, the references that feel natural to your community. You can teach these to the AI over time by including examples in your prompts. You can say "here is an example of how I write" and paste in something you have already written. The AI will use that as a style guide.</p>
<p>What you cannot do is skip the review. Content that does not sound like you, that is generic and hollow, does not build trust. It fills a feed. Your audience can feel the difference, even if they cannot name it. The goal is never volume for its own sake. The goal is consistent, genuine communication that builds a relationship over time.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Open your AI tool and write a prompt asking it to create three social media captions for one of your current offers. Include your audience, your tone, and the platform. Then pick the best one and rewrite any sentence that does not sound like you.</li>
  <li>Paste one paragraph from something you have already written into your AI conversation and say "use this as an example of my writing style going forward in this conversation." See how the next output differs.</li>
  <li>Schedule 30 minutes this week specifically for content creation using AI. You are not learning the tool anymore. You are producing something real.</li>
</ul>',
NULL, 1);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'AI for Images and Visual Content — Canva AI, Adobe Firefly, and More',
'<p>Most small business owners are not graphic designers, but they need graphics constantly. Social media images, presentation slides, flyers, event banners, email headers, website images. Historically, you had two options: hire a designer (expensive) or wrestle with design tools until something looked okay-ish. AI has added a third option that is faster and cheaper than both.</p>
<p>Canva AI is the place to start if you are already using Canva, which most small business owners are. Inside any Canva design, you will find AI features under the "Apps" tab on the left side. Magic Write generates text content directly inside your design. Magic Design generates an entire design layout based on your description. Magic Media generates images from a text prompt. Text to Image lets you describe an image and Canva will create it. You do not need to pay for a Canva Pro subscription to use these, though the free tier has limits on how many AI-generated assets you can create per month.</p>
<p>Adobe Firefly is Adobe''s AI image generation tool. If you use Adobe products like Photoshop or Express, Firefly is already integrated. If you do not, you can use it as a standalone tool at firefly.adobe.com. Firefly was specifically trained on licensed content, which matters if you are using AI images for commercial purposes and want to avoid copyright concerns. For most small business content like social posts and presentations, this distinction matters less. For anything you are going to trademark or put on product packaging, it matters more.</p>
<p>Midjourney produces some of the highest-quality AI images available right now, but it works through Discord, which adds a learning curve. If you are willing to spend an hour getting set up, the output quality is excellent and very distinctive. It is worth exploring once you are comfortable with simpler tools.</p>
<p>A few practical rules for using AI images in your business: always review what the AI produces before publishing, because AI image generators still struggle with human hands, text in images, and certain cultural representations. Never use an AI-generated image to represent real people or to create misleading impressions about your business, products, or results. And make sure the visual style of your AI-generated images is consistent with your brand, not just generic or trendy.</p>
<p>Brand consistency is still your responsibility. AI will generate whatever you ask for, including things that look completely different from your established brand colors, fonts, and style. You have to be the art director. You give the direction. The AI executes.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Open Canva and create a new design for a social media post. Find the "Apps" section on the left and explore the Magic Media or Text to Image tool. Describe the image you want in as much detail as possible (mood, colors, setting, style). Generate it and see what you get.</li>
  <li>Compare the AI-generated image to your current brand visuals. Does it match? If not, what would you add to the prompt to bring it closer?</li>
  <li>Write a short image prompt template you could reuse for your brand. Include your color palette, the feeling you want to convey, and any style preferences. Save it somewhere you can paste it again.</li>
</ul>',
NULL, 2);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'AI for Video Content — Scripts, Editing, and Repurposing',
'<p>Video is where most entrepreneurs feel the biggest gap between what they know they should do and what they actually get done. You know video performs well. You know showing your face builds trust faster than any other content type. You also know that making a video feels like a production, even when it should not.</p>
<p>AI does not film the video for you. What it does is remove two of the biggest friction points: figuring out what to say and handling the time-consuming editing work afterward.</p>
<p>For scripting, AI is genuinely excellent. You give it the topic, the audience, the platform, and the length, and it gives you a full script. For a 60-second Instagram Reel or TikTok, it will give you something you can review, adjust to your voice, and record in one take. For a longer YouTube video or training, it will give you a structured outline with talking points. The scripts will not be perfect out of the box, but they will get you from blank page to ready-to-record in a fraction of the time.</p>
<p>Descript is a tool worth knowing for editing. You upload your video, it transcribes the audio, and then you can edit the video by editing the text. You delete a sentence in the transcript and the video clip for that sentence disappears. This is a game-changer for anyone who spends time in a traditional video editor. Descript also has a feature called Overdub that can match your voice to fix small audio mistakes without re-recording.</p>
<p>Opus Clip is a tool specifically for repurposing long videos. You upload a longer recording, a webinar, a YouTube video, a training session, and it identifies the most engaging moments and automatically clips them into short-form content for Reels, TikTok, and YouTube Shorts. One piece of long-form content becomes seven or ten short clips, with captions added automatically.</p>
<p>Captions are worth talking about separately. AI-generated captions are now accurate enough that you do not need to write them by hand. CapCut, which is free, auto-captions videos with good accuracy. Descript does the same. Getting captions on every video is not optional anymore if you want to reach the full audience, because a significant portion of people watch video without sound.</p>
<p>The practical shift AI makes for video is this: you can record once and get many more uses out of it. Record a 10-minute training. Use Opus Clip to pull five short clips. Use Descript to clean the audio and add captions. Use ChatGPT to write a social post for each clip. One recording session, one week of content.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Open your AI tool and ask it to write a 60-second video script about one problem your business solves. Include your audience and the platform (Instagram, TikTok, LinkedIn). Read it out loud. Edit what does not sound like you. Record it.</li>
  <li>Download CapCut on your phone if you do not already have it. Record a 30-second video about anything related to your business and use CapCut''s auto-caption feature. See how accurate it is.</li>
  <li>List three pieces of longer content you already have (a previous webinar recording, a training video, a Facebook Live) that could be repurposed into shorter clips. You now have a content backlog you did not have to create from scratch.</li>
</ul>',
NULL, 3);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'AI for Social Media Strategy — Not Just Posting, But Planning',
'<p>Most entrepreneurs use social media reactively. They post when they have something to share, when they remember, or when a platform algorithm makes them feel guilty for being quiet. AI can help you move from reactive to strategic without adding a full-time social media manager to your payroll.</p>
<p>Strategic social media means you know what you are posting, why you are posting it, what you want the audience to do after they see it, and how each piece of content connects to a business goal. That is not complicated, but it takes planning. AI can do the planning with you in about an hour.</p>
<p>Here is how to build a month of social media content using AI. Start by telling your AI tool your business goals for the month. What are you promoting? What do you want people to know? Who do you want to attract? Then ask it to create a 30-day content calendar with themes for each week and post ideas for each day. It will give you a full structured plan that you can review, adjust, and start filling in.</p>
<p>Then work through each post idea one at a time. You can ask the AI to write the caption for each one, or you can use the ideas as prompts to write your own captions faster. Either way, you are starting with structure instead of starting from nothing.</p>
<p>Hashtag research is another area where AI saves real time. Ask your AI tool "what hashtags should a business coaching firm serving first-generation entrepreneurs in Florida use on Instagram?" and it will give you a starting list. Cross-reference those with Instagram''s own search to check current volume. You now have a hashtag set in ten minutes instead of an hour.</p>
<p>Engagement responses are something business owners often overlook when it comes to AI. When someone comments on your post or sends you a DM asking about a service, AI can help you draft a thoughtful, warm response quickly. You review it, personalize it, and send. This is particularly useful for handling common questions the same way every time, which builds consistency in how your brand communicates.</p>
<p>One caution: authenticity still matters more than volume. Ten genuine posts a month that actually connect with your audience will outperform thirty generic posts that people scroll past. Use AI to make your content better, not just more frequent.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Ask your AI tool to create a two-week social media content plan for your business. Give it your current focus, your primary platform, and your audience. Review the output and highlight the five ideas that feel most aligned with what you actually want to say.</li>
  <li>Ask the AI to write three different captions for your next post. Pick the one that resonates most and rewrite any part of it that does not sound like you.</li>
  <li>Write down the one business goal you most want social media to support this month. Make sure at least two posts per week connect back to that goal.</li>
</ul>',
NULL, 4);

-- ═══════════════════════════════════════════════
-- MODULE 3
-- ═══════════════════════════════════════════════
INSERT INTO modules (course_id, title, position)
VALUES (v_course_id, 'AI for Customer Service and Business Operations', 3)
RETURNING id INTO v_mod_id;

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Using AI to Answer Customer Questions — Without Being Glued to Your Phone',
'<p>If you are running your business solo or with a small team, you already know this problem. A potential customer sends a question at 9pm. Another one sends the same question on Saturday morning. You are not available, and by the time you respond, they have already gone somewhere else or they have lost the momentum that made them reach out in the first place.</p>
<p>AI cannot replace the personal relationship you build with customers. But it can make sure no one is waiting in the dark for basic information.</p>
<p>The most accessible way to start is with a chatbot on your website. Tools like Tidio, Intercom, and Drift all have AI-powered features that let you train a chatbot on your specific business information. You tell it what your services are, what your prices are, what your process looks like, your frequently asked questions, and how to direct someone to book a call or purchase. The chatbot handles the first layer of questions automatically and hands off to you when something needs a human.</p>
<p>Setting up a basic chatbot takes a few hours the first time. After that, it runs without you. Every question it answers at midnight is a question you did not have to answer at midnight. Every potential customer who got a response in two minutes instead of twelve hours is more likely to still be interested when you follow up in the morning.</p>
<p>For businesses that primarily communicate through social media DMs or email, AI can still help. You can use ChatGPT or Claude to draft templated responses for your ten most common customer questions. Save those templates in a document or in a tool like TextExpander or your email client''s saved responses. When a question comes in, you paste the closest template, adjust the personal details, and send. What used to take five minutes now takes ninety seconds.</p>
<p>If you use Gmail, there is a built-in AI feature called Help Me Write that will draft email responses based on a brief description of what you want to say. Google Workspace users also have access to Gemini throughout their tools. Microsoft 365 users have Copilot built into Outlook. These are not perfect, but they are fast, and they remove the blank-screen problem from email the same way AI removes it from content creation.</p>
<p>The goal is not to make your customer communication feel robotic. The goal is to make sure no one waits longer than they need to for information that already exists in your business.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Write down your five most frequently asked customer questions. For each one, write a templated answer that you could save and reuse. Use AI to help you write or refine those answers.</li>
  <li>Look at your website and find the place where a first-time visitor would most likely have a question. If you do not have any kind of chat or FAQ there, add one. Tidio has a free tier and takes about an hour to set up.</li>
  <li>Calculate how many hours per week you currently spend answering the same questions repeatedly. That number is your baseline. Your goal is to cut it in half within 30 days.</li>
</ul>',
NULL, 1);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'AI for Automating Repetitive Tasks — Where Zapier Comes In',
'<p>There is a category of work that every business owner does every week that is necessary but not skilled. Moving information from one place to another. Sending follow-up emails after a purchase. Adding new leads to a spreadsheet. Posting on social media. Sending appointment reminders. Tagging customers in your email system based on what they bought. None of this requires your expertise. All of it takes your time.</p>
<p>Automation tools like Zapier and Make are designed to handle this entire category of work. They connect the apps you already use and create workflows, called Zaps in Zapier''s case, that run automatically when a trigger event happens. You define the trigger. You define the action. The workflow runs without you.</p>
<p>Zapier connects over 5,000 apps. Your checkout page, your email list, your calendar, your spreadsheet, your CRM, your social scheduler, your accounting software. If you use it for your business, Zapier can probably connect it to something else.</p>
<p>A simple example: when someone purchases a course on your website (trigger), Zapier automatically adds them to your email list in Mailchimp or ConvertKit (action) and sends them a welcome email (second action) and logs their purchase in a Google Sheet (third action). You set this up once. It runs for every single future purchase without you touching it.</p>
<p>Another example: when someone fills out your contact form (trigger), Zapier creates a task in your project management tool like Asana or Trello (action), sends you a Slack message or text (action), and adds the person to your CRM (action). You never miss a lead because nothing was logged.</p>
<p>AI has been built into Zapier now in a meaningful way. You can describe a workflow you want in plain language and Zapier''s AI will suggest how to build it. This removes the need to understand the technical structure before you start. You say what you want to happen, the AI builds the skeleton, and you fill in the details.</p>
<p>Zapier has a free tier that allows a limited number of Zaps and tasks per month. For most small business owners starting out, the free tier is enough to build two or three high-value automations that will save you several hours per week. Paid tiers start around $20 per month and unlock more complex multi-step workflows.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Go to zapier.com and create a free account. On the home screen, you will see suggested Zap templates. Browse through them and identify one workflow that maps to something you currently do manually.</li>
  <li>Write down three repetitive tasks you do at least once a week that involve moving information from one place to another. These are your automation candidates.</li>
  <li>Build one Zap this week. Start with something simple, like adding new email subscribers to a Google Sheet, or sending yourself a text when a new contact form submission comes in. Get one automation running before you try to build a complex system.</li>
</ul>',
NULL, 2);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'AI for Scheduling, Admin, and the Small Tasks That Add Up',
'<p>Every business owner has a category of tasks that individually feel small but collectively eat entire mornings. Scheduling meetings. Writing proposals. Following up on invoices. Organizing notes from a call. Drafting contracts. None of these are your highest-value work. All of them are things AI can help with substantially.</p>
<p>Scheduling is one of the fastest wins. If you are still going back and forth over email to find a time that works for both people, you are wasting time that could be automated. Calendly is the most widely used scheduling tool and it has AI features that suggest meeting times, send automatic reminders, and integrate with your calendar, Zoom, and payment tools. You send someone a link. They pick a time that works for them. It lands on your calendar. The reminder emails go out automatically. No back and forth.</p>
<p>For note-taking and meeting summaries, Otter.ai is worth knowing. You start a recording in Otter during a call or meeting and it transcribes everything in real time. Afterward, it generates a summary with key points and action items. Instead of spending 20 minutes after a client call writing down what was discussed, you have a transcript in front of you and a summary you can review and send within minutes.</p>
<p>Proposals and quotes are another area where AI saves significant time. You can use ChatGPT or Claude to create a proposal template for your most common service packages. Include placeholders for the client name, specific scope details, timeline, and pricing. When a new prospect comes in, you fill in the placeholders, review the document, and send. What used to take two hours takes 20 minutes.</p>
<p>For invoices and follow-ups, most accounting tools like QuickBooks, Wave, and FreshBooks now have AI features or automated reminders built in. Wave is free and handles invoicing, expense tracking, and basic accounting for most small businesses. It will send automatic payment reminders to clients who have not paid by the due date, which removes the uncomfortable task of manually chasing money.</p>
<p>The principle here is the same one running through this entire module: your time is finite and every hour you spend on administrative tasks is an hour you are not spending on the work only you can do. AI and automation handle the category of tasks that do not require your skill. You focus your energy on the category that does.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>If you do not have a scheduling link, create a free Calendly account today and set up one meeting type. Send it to the next person who asks to set up a call with you.</li>
  <li>Download Otter.ai on your phone. The next time you have a client call or internal meeting, record it and let Otter transcribe it. Review the summary afterward.</li>
  <li>Open your AI tool and ask it to create a professional proposal template for one of your service packages. Include all the sections a client would need to see. Save the result and use it as your starting point for the next proposal you write.</li>
</ul>',
NULL, 3);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'AI for Client Communication and Relationship Management',
'<p>Your client relationships are the core of your business. The trust, the history, the understanding of each person''s specific situation and goals. None of that is replaceable by AI. But the communication volume that surrounds client relationships, the check-in emails, the follow-up sequences, the onboarding messages, the feedback requests, all of that is something AI can help you handle at a quality level that feels personal without consuming hours of your week.</p>
<p>Client onboarding is a great place to start. When a new client signs on with you, there is a set of things they need to receive and know. A welcome message. Information about how you work together. What to expect in the first week. How to reach you. What they need to prepare. You probably send some version of this to every new client, but each time it takes you time to write and assemble. AI can help you create an onboarding sequence that you review once, load into your email tool, and let run automatically for every new client going forward.</p>
<p>Regular check-ins are another area where AI helps. If you coach clients, consult with businesses, or manage ongoing service relationships, you probably know you should be checking in more consistently than you do. The reason you do not is that writing a personal check-in message takes time and mental energy, especially when you have ten clients. AI can draft a check-in email based on a few notes you provide, and you review and personalize it before sending. The result is more consistent communication with every client, not just the ones you happened to think about this week.</p>
<p>For CRM tools, meaning software that tracks your client relationships and communication history, AI has become embedded in many of the major platforms. HubSpot has a free CRM tier with AI features for email drafting and follow-up suggestions. Salesforce, Zoho, and others have similar AI assistants. If you are currently tracking clients in a spreadsheet, moving to even a free CRM tool with AI support will save you time and make your follow-through more consistent.</p>
<p>One of the most underused applications of AI for client communication is gathering feedback. Asking for reviews, testimonials, or feedback after a project or program is something most business owners know they should do and most of them do inconsistently or not at all. AI can write the feedback request email, suggest the timing for when to send it, and even help you create a simple survey using tools like Typeform or Google Forms.</p>
<p>The boundary to hold here is authenticity. Use AI to handle the structure and volume of client communication, but keep your human judgment in anything that involves a sensitive situation, a difficult conversation, or a moment that requires real empathy. Those moments define relationships. Be present for them yourself.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Ask your AI tool to write a three-email client onboarding sequence for your business. Tell it what clients need to know in the first week, your communication style, and your typical process. Review the output and edit it to match your voice.</li>
  <li>Identify one client you have not been in touch with for more than 30 days. Use AI to help you draft a check-in message that feels genuine, not automated. Send it today.</li>
  <li>Write down three points in your client relationship where AI-assisted communication could make you more consistent: onboarding, mid-point check-in, and end-of-engagement feedback request. Plan when each of those touchpoints happens.</li>
</ul>',
NULL, 4);

-- ═══════════════════════════════════════════════
-- MODULE 4
-- ═══════════════════════════════════════════════
INSERT INTO modules (course_id, title, position)
VALUES (v_course_id, 'AI for Financial Management, Reporting, and Planning', 4)
RETURNING id INTO v_mod_id;

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Using AI to Understand Your Numbers Without a Finance Degree',
'<p>Money is where a lot of entrepreneurs feel the most behind. Not because they are not smart, but because financial language was designed for people who already know it. P&L statements, cash flow projections, gross margin, accounts receivable. The language is a barrier before you even get to the math. AI can be your translator.</p>
<p>The most straightforward use of AI for financial understanding is explanation. If your accountant sends you a report and you do not fully understand what it is telling you, paste it into ChatGPT or Claude (removing any sensitive personal information first) and ask it to explain what the numbers mean in plain language. Ask it what the report is telling you about the health of your business. Ask it what questions you should be asking based on what you see. You will get a plain-language explanation that helps you come to your next accountant conversation better prepared.</p>
<p>AI is also useful for helping you interpret trends in your own data. If you track your monthly revenue and expenses in a spreadsheet, you can paste that data into an AI conversation and ask it to identify patterns. Are expenses rising faster than revenue in a specific category? Is there a seasonal pattern in your income that you should be planning around? The AI can help you see things in your numbers that you might miss when you are looking at them alone.</p>
<p>For business owners using QuickBooks, Wave, or FreshBooks, these tools are increasingly integrating AI features directly into their dashboards. QuickBooks has a feature called QuickBooks Money Insights that uses AI to flag unusual spending patterns, predict your cash flow for the next 90 days, and highlight which customers have outstanding balances. Wave has similar reporting features and it is free for small businesses. These built-in AI features are worth turning on and actually reading.</p>
<p>One important note about privacy and AI: do not paste your actual account numbers, Social Security number, full client names with financial details, or other sensitive identifying information into a public AI tool like ChatGPT. When using AI for financial analysis, describe the categories and numbers without including personally identifying information. If you want to use AI with your actual detailed financial data, look at tools that have enterprise-level privacy protections or that are integrated directly into your accounting software.</p>
<p>The goal of this lesson is to reduce the anxiety around your financial numbers by giving you a thinking partner you can use anytime. Your accountant sees you a few times a year. AI is available every day.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Find your most recent monthly profit and loss summary, even if it is just a rough spreadsheet. Remove any personally identifying information. Paste the numbers into your AI tool and ask it to explain what the report is telling you about your business health.</li>
  <li>Ask your AI tool: "What are the five financial metrics a small service business should be tracking every month?" Write down the answer and compare it to what you are currently tracking.</li>
  <li>If you are using Wave, QuickBooks, or FreshBooks, log in and look for any AI-powered insights or reports you have not explored. Turn them on and spend 15 minutes reading what they surface.</li>
</ul>',
NULL, 1);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'AI for Budgeting and Cash Flow Planning',
'<p>Cash flow is the life and death issue for small businesses. More businesses fail from cash flow problems than from any other cause, including slow sales. You can be generating revenue and still run out of money if the timing of your income and expenses is not managed. AI can help you get ahead of this.</p>
<p>Budgeting with AI starts with having your numbers somewhere. If you do not have them in a formal accounting tool, even a Google Sheet with monthly income and expense columns is enough to start. Once you have a record of the last three to six months, you can use AI to help you build a forward-looking budget.</p>
<p>Here is how that conversation looks. You tell the AI your average monthly revenue for the past six months, your fixed monthly expenses (rent, software subscriptions, insurance, loan payments), your variable expenses (contractors, supplies, marketing), and any irregular expenses you know are coming. The AI will help you build a monthly budget template that accounts for all of those categories and shows you what your projected end-of-month position should be. It will also help you identify where you have more control over your spending and where you do not.</p>
<p>Cash flow forecasting is something a lot of business owners think requires a financial analyst. It does not. A cash flow forecast is just a projection of what money is coming in and what money is going out, week by week or month by month, so you can see in advance whether you are going to have a gap. AI can help you build a simple 90-day cash flow forecast in a spreadsheet by walking you through the inputs and calculating the projections.</p>
<p>The MiRAjO Budget Calendar tool is designed specifically for this, and it connects the visual nature of a calendar to the reality of how money moves through time. If you have not set it up, Module 1 of the Budget Calendar course walks you through it completely. Using the Budget Calendar alongside AI planning gives you both the structured tracking tool and the thinking partner that can help you interpret what you see.</p>
<p>Scenario planning is another place AI earns its keep in financial management. You can ask it "if I raise my prices by 15 percent and lose 10 percent of my clients, what does that do to my monthly revenue?" and it will run the math for you and explain what it means for your business. You can test assumptions before you make decisions, rather than making decisions and hoping the numbers work out.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Pull together your last three months of revenue and expenses, even rough numbers. Open your AI tool and share those numbers (without identifying details). Ask it to help you identify your top three expense categories and whether your spending ratio to revenue is healthy.</li>
  <li>Ask your AI tool to help you build a simple 90-day cash flow forecast. Tell it your average monthly income, your fixed monthly costs, and any irregular income or expenses you know are coming. Have it walk you through the projection.</li>
  <li>If you are not using the MiRAjO Budget Calendar yet, go to mirajoco.org/tools/money-moves and start your free trial. The first module of the Budget Calendar course is your next step for getting your numbers organized.</li>
</ul>',
NULL, 2);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'AI for Invoicing, Expense Tracking, and Tax Preparation',
'<p>The administrative side of business finances is where hours disappear. Creating invoices, tracking which ones have been paid, categorizing expenses, gathering documentation for taxes. None of this requires expertise. All of it requires time and consistency. AI and automation can handle most of it.</p>
<p>Invoicing is the first thing to automate. If you are creating invoices manually in Word or emailing PDFs you built in Canva, you are spending more time on invoicing than you need to. Wave (free) and FreshBooks (paid, starts around $17/month) both allow you to create professional invoices, set up recurring invoices for retainer clients, and send automatic payment reminders when invoices are overdue. The reminder feature alone is worth the setup time. You will never have to awkwardly chase a payment by email again.</p>
<p>Expense tracking is the next priority. Every business expense you do not track is a potential tax deduction you will miss. AI-integrated tools like Expensify use your phone''s camera to scan receipts and automatically categorize the expense. You take a photo. The app reads the amount, the vendor, and the date, and logs it in the correct category. At the end of the month, your expenses are already sorted. At tax time, the report is already built.</p>
<p>For tax preparation, AI can help in two ways. First, it can help you understand what deductions you are eligible for as a business owner. You can ask your AI tool "what expenses can a home-based service business deduct?" and get a detailed list you can cross-reference with your own spending. Second, AI-integrated accounting tools like QuickBooks and Wave generate tax-ready reports that give your accountant or tax preparer exactly what they need without requiring you to dig through months of records manually.</p>
<p>One area where AI genuinely saves anxiety is in helping business owners understand what they owe before tax season arrives. You can ask your AI tool to help you estimate your quarterly tax liability based on your net income. You are not replacing a CPA with this exercise. You are getting a baseline so you are not surprised.</p>
<p>The most important thing in this lesson is consistency. Set up your invoicing tool, set up your expense tracking, and touch your financial records at least once a week. AI tools are most useful when there is actual data to work with. Give them the data and they give you the insight.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>If you are not already using a digital invoicing tool, sign up for a free Wave account today at wave.com. Create one invoice for your most recent or upcoming client work. Send it using Wave instead of your usual method.</li>
  <li>Download an expense tracking app, Expensify or the Wave Receipts app, and scan the last five business receipts sitting in your wallet, your email, or your phone photos. Get them logged.</li>
  <li>Ask your AI tool: "What are the most commonly missed tax deductions for small business owners who work from home or run a service-based business?" Save the list and compare it to what you tracked last year.</li>
</ul>',
NULL, 3);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Using AI to Make Better Business Decisions',
'<p>The most valuable use of AI in financial management is not handling the data. It is helping you think through decisions with your data in hand. Every business owner faces decisions where the right answer depends on numbers they may not have run yet, comparisons they have not made, and scenarios they have not modeled. AI can be your thinking partner for all of that.</p>
<p>Here is an example. You are considering hiring a part-time virtual assistant for 20 hours per week at $25 per hour. That is $500 a week or about $2,000 a month. The question is whether that investment will generate more than $2,000 in additional revenue or time value per month. You can take this question to your AI tool, share your current revenue numbers, what you would use the VA for, and what value you estimate that work would free up for you. The AI will help you think through the math and the logic, identifying assumptions you may not have considered.</p>
<p>Pricing decisions are another area where AI supports better thinking. Many entrepreneurs underprice their services because pricing is uncomfortable and they do not have a methodology. You can share your costs, your time investment per client, your market, and your positioning with an AI tool and ask it to help you build a pricing model. It will walk you through cost-plus pricing, value-based pricing, and competitive pricing approaches, and help you see what a rate increase would do to your revenue at different retention scenarios.</p>
<p>Business growth decisions like whether to add a new service, expand to a new market, or invest in a new tool can all benefit from AI-assisted analysis. You give the AI the relevant numbers and context, and it helps you build a decision framework. What are the costs? What are the potential returns? What assumptions are you making? What would need to be true for this to work? These are the questions a business advisor would walk you through. AI does not replace a good advisor, but it gives you a way to think through decisions more rigorously on your own timeline.</p>
<p>Revenue goal setting with AI is also worth trying. Tell the AI your current revenue, your personal income goal, and the structure of your business, and ask it to help you figure out what would need to change to reach that goal. It will calculate how many clients you need at your current pricing, what a 20 percent price increase would do, what a new revenue stream would need to generate to bridge the gap. These numbers make your goals feel real and actionable instead of aspirational.</p>
<p>AI does not make the decision for you. You do. What AI does is make sure you are making decisions with more information and clearer thinking than you would have on your own, and faster than you could get from scheduling a meeting with a financial advisor.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Write down one business decision you are currently sitting on. Open your AI tool and describe the decision, the options you are considering, and any relevant numbers you have. Ask it to help you think through the tradeoffs.</li>
  <li>Ask your AI tool to help you calculate what your business needs to generate per month to pay yourself a specific salary, cover your business expenses, and set aside a 15 percent profit buffer. Use real numbers.</li>
  <li>Write down one financial goal for the next 90 days, a specific revenue number, a debt you want to eliminate, or a savings target. Ask your AI tool to help you reverse-engineer what you would need to do each week to reach it.</li>
</ul>',
NULL, 4);

-- ═══════════════════════════════════════════════
-- MODULE 5
-- ═══════════════════════════════════════════════
INSERT INTO modules (course_id, title, position)
VALUES (v_course_id, 'Building AI Into Your Daily Workflow — Saving Real Hours Every Week', 5)
RETURNING id INTO v_mod_id;

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Auditing Your Time — Where AI Can Replace You',
'<p>Before you can build AI into your workflow, you need an honest picture of how you actually spend your time right now. Most business owners think they know. Most are surprised when they actually track it. This lesson is about the audit that makes everything else in this module possible.</p>
<p>For three days this week, track every task you do in your business in 30-minute blocks. You can use a simple spreadsheet, a notes app, or a time-tracking tool like Toggl Track, which is free. Write down what you did, how long it took, and whether the task required your specific expertise and judgment or whether it was something that could be handled with the right instructions or tools.</p>
<p>At the end of three days, sort your tasks into three buckets. Bucket one: only I can do this. Client sessions, high-level strategy, relationship decisions, anything that requires your specific knowledge, experience, or authority. Bucket two: someone or something else could do this if I gave them the right information. Writing first drafts, answering common questions, data entry, scheduling, formatting documents. Bucket three: I do not know why I am doing this and I am not sure it needs to happen at all.</p>
<p>Bucket two is your AI opportunity list. Every task in that bucket is a candidate for AI assistance or full automation. In bucket two, you will likely find things like social media content creation, email drafting, customer FAQ responses, appointment reminders, expense logging, and report generation. These are tasks you have been solving with your time when you could be solving them with tools.</p>
<p>One important thing to notice as you do this audit: how much of your time is spent on tasks that feel urgent but are not high-value? Responding to DMs that could be answered by an FAQ page. Formatting documents that could be templated. Manually sending reminders that could be automated. The urgency of these tasks makes them feel important. They are not. They are just loud.</p>
<p>Once you have your audit, you have a map. The rest of this module is about systematically building AI into the tasks on that map, starting with the ones that take the most time and require the least of you.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Download Toggl Track on your phone or open a new Google Sheet and track your business tasks for three days. Write down what you did and how long it took. Do not estimate from memory after the fact.</li>
  <li>After three days, categorize every task into: only I can do this, someone or something else could do this, or I am not sure this needs to happen. Count how many hours are in each category.</li>
  <li>Circle the single most time-consuming task in bucket two. That is the first thing you are going to address in this module.</li>
</ul>',
NULL, 1);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Building Your Personal AI Workflow — Start Simple, Scale Up',
'<p>Now that you know where your time goes, it is time to build a system. The word "system" sounds large. What you are actually building is a set of habits and tools that make AI assistance a natural part of how you work, not a separate thing you remember to do occasionally.</p>
<p>The foundation of a good AI workflow is a prompt library. A prompt library is simply a document where you save the prompts that work well for your most common tasks. Over time, this document becomes one of the most valuable things in your business. It is the difference between taking two minutes to get a great result and taking twenty minutes to figure out why the result keeps being generic.</p>
<p>Start your prompt library today. Open a Google Doc or a Notion page and create sections for each content type you regularly produce: social media captions, email newsletters, client proposals, FAQ responses, meeting summaries, and anything else you do on a regular basis. For each section, write the prompt template you will use. Include instructions for filling in the variable parts. Save it somewhere you can get to it quickly.</p>
<p>For your daily workflow, the goal is to build a habit of opening your AI tool the same way you would open email. Before you write anything, check whether this is something your prompt library can accelerate. Before you research something, check whether a conversation with AI would save you the search time. Before you draft a document from scratch, check whether AI can give you a solid starting point in two minutes.</p>
<p>Notion AI is worth mentioning for business owners who already use Notion or who are willing to adopt it. Notion is an all-in-one workspace where you can keep notes, project plans, databases, client records, and documents. Notion AI is built in and can summarize pages, draft content, generate action items from meeting notes, and translate your rough notes into polished documents. If you are already juggling multiple tools for these functions, Notion can consolidate them while adding AI capability throughout.</p>
<p>A simple daily AI routine looks like this: in the morning, ask AI for a brief summary of your priorities for the day based on what you share with it about your schedule. Use AI to draft any emails or content you need to send that day. In the afternoon, paste your meeting notes into AI and ask it to pull out action items and decisions. At the end of the day, use AI to help you write your task list for tomorrow. This routine adds no more than 15 minutes to your day and removes significant friction from your most common tasks.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Create a new document titled "My AI Prompt Library" in Google Docs, Notion, or wherever you keep your business documents. Add at least three prompts you have already found useful in this course.</li>
  <li>Build a simple daily AI routine. Write down: what you will use AI for in the morning, during the day, and at the end of the day. Keep it realistic, two or three specific tasks, not a comprehensive overhaul.</li>
  <li>Ask your AI tool to summarize your top three business priorities for the coming week based on what you describe to it. See how useful that summary is when you actually sit down to work.</li>
</ul>',
NULL, 2);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Connecting Your Tools — Creating a Workflow That Runs Itself',
'<p>The difference between using AI occasionally and genuinely saving hours every week is integration. When your tools talk to each other and your AI assistants are embedded in your workflow rather than existing as a separate tab you open sometimes, the time savings compound.</p>
<p>Integration means your Calendly scheduling links connect to your CRM, which connects to your email tool, which sends the onboarding sequence, which triggers a task in your project management system. You do not do any of that manually. You set it up once. It runs.</p>
<p>Zapier is the connective tissue for most of this. You have already been introduced to Zapier in Module 3. Now it is time to think about it more broadly as the infrastructure for your AI-assisted business. Every time you find yourself manually moving information from one tool to another, that is a potential Zapier automation.</p>
<p>Here are some high-value automations worth building once you have your core tools in place. When a new client books through Calendly, create a task in Asana or Trello with their name and appointment details, add them to your CRM, and send them a preparation email. When someone purchases a course or program, add them to a specific email list segment, send a welcome email, and create a client folder in your Google Drive. When you receive a new contact form submission, add the person to your CRM, send yourself a Slack or text notification, and add a follow-up task to your calendar.</p>
<p>Make, formerly called Integromat, is an alternative to Zapier that many business owners prefer for more complex workflows. It has a free tier and tends to offer more flexibility in how you structure multi-step automations. Both tools are worth understanding, and it is worth starting with whichever one feels more intuitive to you.</p>
<p>For business owners who are ready for a more advanced setup, there are AI-powered tools that can manage workflows using natural language. You describe what you want to happen and the tool builds the automation. Relay.app is one example. Bardeen is another, specifically designed for automating browser-based tasks that other tools cannot reach, things like pulling data from a website or automatically filling in a form.</p>
<p>The mindset shift this lesson is pushing toward is this: if you are doing something manually more than twice, it is worth asking whether that task can be automated. Not everything can be. But more can than you think. Every hour of automation setup pays for itself in reclaimed time within weeks.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Map out on paper or in a document the three most common workflows in your business from trigger to outcome. For example: new lead comes in, what happens next, and next, until they become a client. Identify every manual step in that flow.</li>
  <li>Build one new Zapier automation this week based on a workflow you currently do manually. Focus on the workflow with the most steps or the one that happens most frequently.</li>
  <li>Look at every tool you currently pay for or use regularly and make a list. Then check which ones are available in Zapier''s integration library. You may find connection opportunities you did not know existed.</li>
</ul>',
NULL, 3);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Staying Consistent — Making AI a Habit, Not an Experiment',
'<p>The biggest mistake entrepreneurs make with new tools is treating them as experiments. They try something for two weeks, get inconsistent results because they are still learning, and conclude the tool is not for them. Then they start over with a different tool six months later. This cycle costs money and time and leaves you no further ahead.</p>
<p>AI tools reward consistency and investment. The more you use them, the better your prompts get. The more you build your prompt library, the faster your results are. The more automations you set up, the less manual work you do. The compound effect of consistent AI use over six months is dramatically more valuable than six rounds of two-week experiments.</p>
<p>Building AI into a habit means attaching it to something you already do. You already write emails. Add the habit of checking your prompt library before you start drafting. You already plan your week. Add the habit of sharing your priorities with your AI tool and asking it to help you identify where you are over-committing. You already create content. Add the habit of letting AI draft first so you are editing rather than starting from nothing.</p>
<p>Accountability helps. Find one other business owner who is also working on incorporating AI tools and check in with each other once a week. Share what worked, what did not, and what you are going to try next. The combination of accountability and shared learning accelerates both of your progress faster than either of you would go alone.</p>
<p>It is also worth acknowledging that AI tools change fast. A workflow you build today might look different in six months because the tools have improved. That is not a reason to avoid building. It is a reason to build lightly, meaning create systems that are easy to update rather than systems so complex that any change breaks the whole thing. Simple workflows are more durable than complex ones.</p>
<p>Finally, block time for this. Not learning time, not experiment time, production time. A 90-minute block each week where you use AI tools to actually produce things for your business, content, proposals, plans, automations. Treat it like a meeting with yourself that does not get moved. That block, over a year, is the equivalent of getting back several full work weeks.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Pick one AI-assisted workflow you have started in this module and commit to using it every week for the next 30 days without modification. At the end of 30 days, evaluate whether it is saving time and whether it needs to be refined.</li>
  <li>Add a 90-minute AI production block to your calendar for the next four weeks. Label it clearly so you do not move it for something that feels more urgent.</li>
  <li>Send a message to one entrepreneur you know who might benefit from using AI tools more consistently. Share one specific thing that has worked for you in this course. Teaching it reinforces your own learning and helps your community.</li>
</ul>',
NULL, 4);

-- ═══════════════════════════════════════════════
-- MODULE 6
-- ═══════════════════════════════════════════════
INSERT INTO modules (course_id, title, position)
VALUES (v_course_id, 'What Is Coming Next and How to Stay Ahead of It', 6)
RETURNING id INTO v_mod_id;

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Where AI Is Headed — What Entrepreneurs Need to Know',
'<p>The pace of AI development is faster than almost any other technology shift in history. What was cutting-edge eighteen months ago is now standard. What is cutting-edge today will be the baseline in another eighteen months. That might feel overwhelming. Approached the right way, it is actually an advantage for business owners who are paying attention.</p>
<p>The most important trend to understand is that AI is moving from a tool you interact with to a system that acts on your behalf. Right now, you open ChatGPT and type a prompt. You review the output and decide what to do with it. That is the current model. The next stage is AI agents, systems that can take a sequence of actions based on a goal, without you approving each step.</p>
<p>AI agents already exist in early forms. You can use tools like AutoGPT or Claude''s computer use feature to give an AI a goal and let it break the goal into steps, execute each step, and report back on what it did. These tools are still early and require careful oversight. But the direction is clear: AI is moving toward doing things, not just generating text.</p>
<p>For business owners, this means two things. First, the time you invest now in understanding AI tools positions you to adopt agent-based AI early, when it will create the biggest competitive advantage. Second, the judgment and oversight skills you are building in this course, reviewing AI output, knowing where AI can be wrong, maintaining your own voice and standards, become more valuable as AI takes on more autonomous tasks, not less.</p>
<p>Multi-modal AI is another trend worth understanding. Multi-modal means AI that can process and generate text, images, audio, and video together. GPT-4o from OpenAI and Google Gemini Ultra are already multi-modal. You can show them an image and ask a question about it. You can speak to them and they speak back. You can upload a document and ask them to extract specific information. As this capability matures, the applications for business owners multiply significantly.</p>
<p>Voice AI is advancing quickly as well. Tools like ElevenLabs can clone your voice from a sample and generate audio content in your voice. This has implications for podcast production, course narration, customer service audio, and accessibility. It also raises important ethical questions about consent and authenticity that business owners will need to navigate carefully.</p>
<p>The entrepreneurs who will benefit most from what is coming are the ones who have built the foundational habits now: prompt writing, workflow integration, consistent use, and staying informed. You are building that foundation in this course.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Look up one recent AI news story from the past 30 days. It can be from any source. Write down one thing it tells you about where AI is headed that is relevant to your business.</li>
  <li>Go to the settings in your primary AI tool (ChatGPT, Claude, or Gemini) and look at what features you have not used yet. Pick one and try it this week.</li>
  <li>Write down one thing AI currently cannot do that, if it could, would significantly change how you run your business. Keep that on your radar. It may be closer than you think.</li>
</ul>',
NULL, 1);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'AI Ethics for Business Owners — What You Are Responsible For',
'<p>Using AI in your business comes with responsibilities that no one is going to enforce for you. There is no governing body that shows up when you post AI-generated content without disclosing it. There is no alarm that sounds when your AI chatbot gives a customer incorrect information. The responsibility for how AI is used in your business rests entirely with you. That means you need to think through it deliberately.</p>
<p>The first ethical area is disclosure. Customers increasingly want to know when they are interacting with AI versus a human. If your website chat is an AI bot, there is a strong case that you should say so, especially if a customer asks directly. If your content is AI-generated, especially in contexts where your audience values authenticity (personal essays, testimonials, first-person stories), consider whether that needs to be disclosed. Different business owners will land in different places on this question. The important thing is that you have actually thought about it rather than defaulting to whatever is most convenient.</p>
<p>Accuracy is a direct responsibility. When your AI chatbot tells a customer something incorrect about your product or your refund policy, the customer experience problem is your problem. When AI-generated content on your website contains a health or legal claim that is not accurate, the liability is yours. This is not a reason to avoid AI. It is a reason to build in consistent review, especially for anything that involves facts your customers will rely on.</p>
<p>Privacy matters significantly. If you are using AI tools that process customer data, you need to understand what those tools do with the data they receive. Most major AI tools like ChatGPT, Claude, and Gemini have enterprise privacy options where your conversations are not used for training. If you are handling customer information in your AI workflows, use tools with clear privacy policies and, where necessary, data processing agreements.</p>
<p>Bias is a technical reality of AI that business owners should understand at a basic level. AI systems are trained on data that reflects historical human behavior, including historical biases. This can show up in generated content, in image generation, and in any AI-powered decision-making tool. Reviewing your AI outputs through the lens of how they represent different people is not political. It is quality control.</p>
<p>The human experience you create for your customers is still your brand. A business that substitutes AI for every human touchpoint loses something. The customers who connect with you, who feel seen and heard and understood, are not connecting with your chatbot. They are connecting with you and what you represent. Use AI to expand your capacity to be present and responsive. Do not let it replace the moments that actually matter.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Review your AI-assisted customer touchpoints, your chatbot, your automated emails, and your social media content. For each one, ask: is there anything here that could mislead a customer or create a gap in their experience? Fix what you find.</li>
  <li>Write a one-paragraph internal policy for your business on how you will use AI and what review process you will put in place before AI-generated content or responses go out publicly. Post it somewhere you will see it.</li>
  <li>Look at the AI tools you currently use and find the privacy policy for one of them. Identify what happens to the conversations and data you enter. Make sure you are comfortable with it.</li>
</ul>',
NULL, 2);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'How to Keep Learning Without Getting Overwhelmed',
'<p>The AI landscape changes so fast that keeping up can feel like a full-time job by itself. It is not. What you need is a simple system for staying informed without drowning in information, and a set of criteria for deciding which new tools are worth your attention.</p>
<p>First, limit your information sources to two or three you actually trust and read. For AI business news, Morning Brew''s tech section, TLDR Newsletter (free, daily), and The AI Exchange by Nathan Lands are all accessible, non-technical, and focused on practical business applications rather than engineering details. Subscribe to one or two and read them when you have five minutes, not when you feel obligated.</p>
<p>Second, build a filter for evaluating new AI tools. Every month there are dozens of new tools claiming to revolutionize something. Most of them are either variations on tools you already have or products that will not survive their first funding round. Before you adopt a new tool, ask: does this solve a problem I actually have? Is there a tool I already use that could do this if I used it more fully? Is this tool from a company that seems stable, or is it a startup that may not exist in 12 months? These three questions will save you from chasing every shiny object.</p>
<p>Community is one of the best learning systems available for AI tools. Other business owners who are using these tools in practical contexts will show you workflows, time-saving tricks, and applications you would never find from a product tutorial. LinkedIn and Reddit have active communities around AI for business owners. The MiRAjO community is a place to share what is working with other entrepreneurs who are at a similar stage.</p>
<p>Scheduled experimentation is better than random exploration. Once a month, block 90 minutes to try one new AI tool or feature you have not used before. Document what it does, whether it is useful, and whether it fits into your existing workflow. At the end of six months, you have explored six new tools in a structured way instead of sporadically trying things and forgetting what you learned.</p>
<p>The most important thing is to keep using what already works. The temptation to keep learning about AI without actually using it is real. You can spend all your time in courses and newsletters and videos and never actually save a single hour in your business. Use what you have learned in this course first. Use it consistently. Then add new tools on top of a working foundation.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Subscribe to one AI-focused newsletter today. TLDR Tech (tldr.tech/ai) is free, takes three minutes to read, and focuses on practical AI developments. Commit to reading it for 30 days before evaluating whether to keep it.</li>
  <li>Write down your three criteria for evaluating whether a new AI tool is worth your time. Use the questions from this lesson as a starting point and adjust them to fit your business context.</li>
  <li>Open your calendar and block a 90-minute AI exploration session for next month. Put "new tool experiment" in the title. Protect it the same way you would protect a client appointment.</li>
</ul>',
NULL, 3);

INSERT INTO lessons (module_id, title, content, video_url, position) VALUES (v_mod_id, 'Your AI Action Plan — What You Do Next',
'<p>You have covered a lot of ground in this course. What AI is and what it actually does. Content creation. Customer service. Operations. Financial management. Daily workflow. Where things are headed. Now the question is what you actually do next.</p>
<p>The biggest risk at the end of a course is knowing more without doing more. Knowledge without action changes nothing in your business. So this last lesson is not about teaching you something new. It is about helping you build the specific, realistic plan that makes sure what you learned becomes what you do.</p>
<p>Start with your wins from this course. You have already taken some actions, built some prompts, tried some tools. Write those down. Not to feel good about them, but to acknowledge that you are already further along than you were before the first lesson. That baseline matters.</p>
<p>Next, identify your top three AI priorities for the next 30 days. Not ten things. Three. Pick the ones with the highest return on your time investment. For most business owners, those three will be: a content workflow that uses AI to draft and you to refine, at least one automation that removes a manual repetitive task, and a structured approach to using AI for one specific business challenge you are currently working through.</p>
<p>Create your personal AI toolkit. Write down the tools you are committing to use going forward. You do not need more than three or four. Your primary conversational AI tool (ChatGPT, Claude, or Gemini). A design tool with AI features (Canva AI). An automation tool (Zapier). And one tool specific to your biggest time drain, whether that is Otter for meetings, Calendly for scheduling, or Wave for invoicing. Simple is sustainable.</p>
<p>Build accountability into your plan. Who else in your network is working on this? Tell one person what you are committing to and ask them to check in with you in 30 days. Post in the MiRAjO community and share your plan. The more public your commitment, the more real your follow-through tends to be.</p>
<p>Finally, remember why you are doing this. You are not adopting AI to be trendy or to keep up with a tech conversation. You are doing it to get real hours back, to serve your customers more consistently, to grow your business with less friction. Keep that purpose in front of you when the learning gets tedious or a tool does not work the way you expected. The payoff is not the tool. The payoff is the life and business it helps you build.</p>
<h3>Do this now:</h3>
<ul class="checklist">
  <li>Write down your three AI priorities for the next 30 days. Be specific: not "use AI more" but "use Claude to draft all social media captions for the next four weeks" or "build a Zapier automation to add new contact form submissions to my CRM by Friday."</li>
  <li>List the four AI tools you are committing to as your core toolkit. For each one, write one specific way you will use it this week.</li>
  <li>Share your plan with one person today. Text a fellow entrepreneur, post in the MiRAjO Hub community, or write it in a message to yourself that you will find in 30 days when it is time to check in.</li>
</ul>',
NULL, 4);

END $$;
