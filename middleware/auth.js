export async function auth(req, reply) {
  const key = req.headers['x-app-key'];

  if (!key) {
    if (process.env.ALLOW_NO_AUTH === 'true') return;
    return reply.code(401).send({ error: 'App key required' });
  }

  if (key !== process.env.APP_KEY) {
    return reply.code(403).send({ error: 'Invalid app key' });
  }
}