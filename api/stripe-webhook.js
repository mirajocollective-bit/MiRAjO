import Stripe from 'stripe';
import { createClient } from '@supabase/supabase-js';
import { addTag } from './_kit.js';
import { queueSequence } from './_emails.js';

const stripe = new Stripe(process.env.STRIPE_SECRET_KEY);
const supabase = createClient(
  process.env.SUPABASE_URL,
  process.env.SUPABASE_SERVICE_ROLE_KEY
);

export const config = { api: { bodyParser: false } };


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
    const email = session.customer_details?.email || session.customer_email;
    const courseSlug = session.metadata?.course_slug;

    if (!email || !courseSlug) {
      return res.status(400).json({ error: 'Missing email or course slug' });
    }

    // Extract name and contact details from Stripe billing info
    const fullName = session.customer_details?.name || '';
    const nameParts = fullName.trim().split(' ');
    const firstName = nameParts[0] || '';
    const lastName = nameParts.slice(1).join(' ') || '';
    const phone = session.customer_details?.phone || '';
    const city = session.customer_details?.address?.city || '';
    const country = session.customer_details?.address?.country || '';

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

    // Look up user — create if they don't exist
    const { data: { users } } = await supabase.auth.admin.listUsers();
    let user = users?.find(u => u.email === email);

    if (!user) {
      const { data: created, error: createError } = await supabase.auth.admin.createUser({
        email,
        email_confirm: true,
        user_metadata: { first_name: firstName, last_name: lastName },
      });

      if (createError || !created?.user) {
        console.error('Failed to create user:', createError);
        return res.status(500).json({ error: 'Failed to create user account' });
      }

      user = created.user;
      console.log(`Created new Supabase account for ${email}`);
    }

    // Enroll in course (ignore if already enrolled)
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

    if (courseSlug === 'couples-in-entrepreneurship') {
      // Create the couple record (partner B linked later via invite)
      await supabase
        .from('couples')
        .insert({
          course_id: course.id,
          partner_a_user_id: user.id,
          stripe_session_id: session.id,
        });

      // Tag Partner A in Kit
      await addTag(email, 'enrolled-couples-cie', {
        first_name: firstName,
        fields: { last_name: lastName, phone, city, country },
      });

      console.log(`Couples enrollment: Partner A (${email}) enrolled, couple record created`);
    } else {
      // 25D25N flow
      await addTag(email, 'enrolled-25d25n', {
        first_name: firstName,
        fields: { last_name: lastName, phone, city, country },
      });
      await queueSequence(supabase, email, 'enrolled-25d25n', firstName);

      console.log(`Enrolled ${email} (${fullName}) in course ${courseSlug}`);
    }
  }

  res.status(200).json({ received: true });
}
