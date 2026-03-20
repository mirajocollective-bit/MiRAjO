import Stripe from 'stripe';

const stripe = new Stripe(process.env.STRIPE_SECRET_KEY);

export default async function handler(req, res) {
  if (req.method !== 'POST') {
    return res.status(405).json({ error: 'Method not allowed' });
  }

  const { email } = req.body || {};

  try {
    const session = await stripe.checkout.sessions.create({
      payment_method_types: ['card'],
      ...(email ? { customer_email: email } : {}),
      billing_address_collection: 'required',
      phone_number_collection: { enabled: true },
      line_items: [
        {
          price: 'price_1TCtXJGUBsX8ruvFuVwKGXwD',
          quantity: 1,
        },
      ],
      mode: 'payment',
      success_url: `${process.env.SITE_URL}/programs/confirm?checkout=success`,
      cancel_url: `${process.env.SITE_URL}/25daysand25nights`,
      metadata: {
        course_slug: '25-days-and-25-nights',
      },
    });

    res.status(200).json({ url: session.url });
  } catch (err) {
    console.error('Stripe error:', err);
    res.status(500).json({ error: 'Failed to create checkout session' });
  }
}
