import Stripe from 'stripe';
import { createClient } from '@supabase/supabase-js';

const stripe = new Stripe(process.env.STRIPE_SECRET_KEY);
const supabase = createClient(
  process.env.SUPABASE_URL,
  process.env.SUPABASE_SERVICE_ROLE_KEY
);

export const config = { api: { bodyParser: false } };

async function tagSubscriber(email, tag) {
  const apiSecret = process.env.CONVERTKIT_API_SECRET;
  const tagsRes = await fetch(`https://api.convertkit.com/v3/tags?api_secret=${apiSecret}`);
  const tagsData = await tagsRes.json();
  const tagObj = tagsData.tags?.find(t => t.name === tag);
  if (!tagObj) return;
  await fetch(`https://api.convertkit.com/v3/tags/${tagObj.id}/subscribe`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ api_secret: apiSecret, email }),
  });
}

async function getRawBody(req) {
  return new Promise((resolve, reject) => {
    const chunks = [];
    req.on('data', chunk => chunks.push(chunk));
    req.on('end', () => resolve(Buffer.concat(chunks)));
    req.on('error', reject);
  });
}

export default async function handler(req, res) {
  if (req.method !== 'POST') {
    return res.status(405).json({ error: 'Method not allowed' });
  }

  const rawBody = await getRawBody(req);
  const sig = req.headers['stripe-signature'];

  let event;
  try {
    event = stripe.webhooks.constructEvent(rawBody, sig, process.env.STRIPE_WEBHOOK_SECRET);
  } catch (err) {
    console.error('Webhook signature error:', err.message);
    return res.status(400).send(`Webhook Error: ${err.message}`);
  }

  if (event.type === 'checkout.session.completed') {
    const session = event.data.object;
    const email = session.customer_email;
    const courseSlug = session.metadata?.course_slug;

    if (!email || !courseSlug) {
      return res.status(400).json({ error: 'Missing email or course slug' });
    }

    // Look up the course by slug
    const { data: course, error: courseError } = await supabase
      .from('courses')
      .select('id')
      .eq('slug', courseSlug)
      .single();

    if (courseError || !course) {
      console.error('Course not found:', courseSlug);
      return res.status(404).json({ error: 'Course not found' });
    }

    // Look up or create the user
    const { data: { users }, error: userError } = await supabase.auth.admin.listUsers();
    const user = users?.find(u => u.email === email);

    if (!user) {
      console.error('User not found for email:', email);
      // Still return 200 — we'll handle this edge case manually
      return res.status(200).json({ received: true, note: 'User not found, enroll manually' });
    }

    // Create enrollment (ignore if already exists)
    const { error: enrollError } = await supabase
      .from('enrollments')
      .upsert(
        { user_id: user.id, course_id: course.id },
        { onConflict: 'user_id,course_id' }
      );

    if (enrollError) {
      console.error('Enrollment error:', enrollError);
      return res.status(500).json({ error: 'Failed to enroll user' });
    }

    // Tag in Kit → triggers welcome email automation
    await tagSubscriber(email, 'enrolled-25d25n');

    console.log(`Enrolled ${email} in course ${courseSlug}`);
  }

  res.status(200).json({ received: true });
}
