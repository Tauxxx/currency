import { getRate } from '../services/rateService.js';

export default async function (fastify) {
  fastify.get('/rates/:base/:target', async (req, reply) => {
    const { base, target } = req.params;
    const requestedDate =
      req.query.date ?? new Date().toISOString().slice(0, 10);

    const result = await getRate(base, target, requestedDate);

    reply.header('Cache-Control', 'public, max-age=3600');
    return result;
  });
}