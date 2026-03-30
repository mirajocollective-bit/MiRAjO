import Stripe from 'stripe';

const stripe = new Stripe(process.env.STRIPE_SECRET_KEY);

// ─── Stripe Price IDs — swap placeholders once created in Stripe dashboard ───
// Individual Monthly: $7/month
// Individual Annual:  $59/year
// Family Monthly:     $10/month
// Family Annual:      $84/year
const PRICES = {
  individual_monthly: 'price_MM_IND_MONTHLY',
  individual_annual:  'price_MM_IND_ANNUAL',
  family_monthly:     'price_MM_FAM_MONTHLY',
  family_annual:      'price_MM_FAM_ANNUAL',
};

export default async function handler(req, res) {
  if (req.method !== 'POST') {
    return res.status(405).json({ error: 'Method not allowed' });
  }

  const { email, plan = 'individual', billing = 'monthly' } = req.body || {};

  const priceKey = `${plan}_${billing}`;
  const priceId  = PRICES[priceKey];

  if (!priceId) {
    return res.status(400).json({ error: `Invalid plan: ${priceKey}` });
  }

  try {
    const session = await stripe.checkout.sessions.create({
      payment_method_types: ['card'],
      ...(email ? { customer_email: email } : {}),
      billing_address_collection: 'required',
      line_items: [{ price: priceId, quantity: 1 }],
      mode: 'subscription',
      subscription_data: {
        metadata: { plan, billing },
      },
      success_url: `${process.env.SITE_URL}/tools/money-moves/confirm?checkout=success`,
      cancel_url:  `${process.env.SITE_URL}/tools/money-moves`,
      metadata: { product: 'money-moves', plan, billing },
    });

    res.status(200).json({ url: session.url });
  } catch (err) {
    console.error('Money Moves checkout error:', err);
    res.status(500).json({ error: err.message || 'Failed to create checkout session' });
  }
}
