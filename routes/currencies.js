import { getCurrencies, getCurrency } from '../services/currencyService.js';
import { isValidLocale } from '../config/locales.js';
import { getCache, setCache, TTL } from '../services/cache.js';


export default async function (fastify) {
  // GET /currencies?locale=en
  fastify.get('/currencies', async (req, reply) => {
    const locale = isValidLocale(req.query.locale) ? req.query.locale : 'en';

    const cacheKey = `currencies:${locale}`;
    let result = getCache(cacheKey);
    if (result === null) {
      result = await getCurrencies(locale);
      setCache(cacheKey, result);
    }

    reply.header('Cache-Control', 'public, max-age=' + TTL / 1000);

    return result;
  });

  // GET /currencies/EUR
  fastify.get('/currencies/:code', async (req, reply) => {
    const { code } = req.params;
    const cacheKey = `currencies:${code}`;
    let result = getCache(cacheKey);
    if (result === null) {
      result = await getCurrency(code);
      setCache(cacheKey, result);
    }

    if (!result) {
      reply.code(404);
      return { error: 'Currency not found' };
    }

    reply.header('Cache-Control', 'public, max-age=' + TTL / 1000);

    return result;
  });
}
