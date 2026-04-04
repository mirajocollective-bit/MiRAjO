import Stripe from 'stripe';

const stripe = new Stripe(process.env.STRIPE_SECRET_KEY);

export default async function handler(req, res) {
  if (req.method !== 'POST') {
    return res.status(405).json({ error: 'Method not allowed' });
  }

  const { email, couponId } = req.body || {};

  const VALID_COUPONS = new Set(['fVbGdG1L']);
  if (couponId && !VALID_COUPONS.has(couponId)) {
    return res.status(400).json({ error: 'Invalid coupon' });
  }

  try {
    const session = await stripe.checkout.sessions.create({
      payment_method_types: ['card'],
      ...(email ? { customer_email: email } : {}),
      billing_address_collection: 'required',
      phone_number_collection: { enabled: true },
      line_items: [
        {
          price: 'price_1TEKuWGUBsX8ruvFcGLbB5FK', // $997 live
          quantity: 1,
        },
      ],
      mode: 'payment',
      ...(couponId ? { discounts: [{ coupon: couponId }] } : {}),
      success_url: `${process.env.SITE_URL}/programs/couples-confirm?checkout=success`,
      cancel_url: `${process.env.SITE_URL}/couplesinentrepreneurship`,
      metadata: {
        course_slug: 'couples-in-entrepreneurship',
      },
    });

    res.status(200).json({ url: session.url });
  } catch (err) {
    console.error('Stripe error:', err);
    res.status(500).json({ error: err.message || 'Failed to create checkout session' });
  }
}
