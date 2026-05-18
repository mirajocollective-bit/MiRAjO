import { SEQUENCES } from './_emails.js';

export default async function handler(req, res) {
  if (req.method !== 'POST') return res.status(405).end();

  const { username, password, sequence, step } = req.body || {};

  if (!username || !password ||
      username !== process.env.ADMIN_USERNAME ||
      password !== process.env.ADMIN_PASSWORD) {
    return res.status(401).json({ error: 'Unauthorized' });
  }

  const steps = SEQUENCES[sequence];
  if (!steps) return res.status(404).json({ error: 'Sequence not found' });

  const stepNum  = parseInt(step, 10);
  const stepData = steps.find(s => s.step === stepNum);
  if (!stepData) return res.status(404).json({ error: 'Step not found' });

  const subject = typeof stepData.subject === 'function'
    ? stepData.subject({})
    : stepData.subject;

  const html = stepData.body('[First Name]', {});

  return res.status(200).json({ subject, html });
}
