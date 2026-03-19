// TEMPORARY TEST ONLY — delete after testing
import Stripe from 'stripe';

const stripe = new Stripe(process.env.STRIPE_SECRET_KEY);

export default async function handler(req, res) {
  if (req.method !== 'POST') return res.status(405).end();

  const { email, priceId } = req.body;
  if (!email || !priceId) return res.status(400).json({ error: 'Missing email or priceId' });

  try {
    const session = await stripe.checkout.sessions.create({
      payment_method_types: ['card'],
      customer_email: email,
      line_items: [{ price: priceId, quantity: 1 }],
      mode: 'payment',
      success_url: `${process.env.SITE_URL}/programs/confirm?checkout=success`,
      cancel_url: `${process.env.SITE_URL}/25daysand25nights`,
      metadata: { course_slug: '25-days-and-25-nights' },
    });

    res.status(200).json({ url: session.url });
  } catch (err) {
    console.error('Test checkout error:', err);
    res.status(500).json({ error: err.message });
  }
}
