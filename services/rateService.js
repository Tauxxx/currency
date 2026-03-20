import { pool } from '../db.js';
import { getCache, setCache } from './cache.js';

export async function getRate(base, target, requestedDate) {
  if (base === target) {
    return {
      rate: 1,
      date: requestedDate,
      requested_date: requestedDate
    };
  }
  const key = `${base}:${target}:${requestedDate}`;
  const cached = getCache(key);
  // if (cached) return cached;

  const targets = [base, target];
  const usd = 'USD';

  const { rows } = await pool.query(
    `
    SELECT target_code, rate, rate_date::text as rate_date
    FROM exchange_rates
    WHERE base_code = $1
      AND target_code = ANY($2::text[])
      AND rate_date IN (
        SELECT rate_date
        FROM exchange_rates
        WHERE base_code = $1
          AND target_code = ANY($2::text[])
        GROUP BY rate_date
        HAVING COUNT(DISTINCT target_code) = $3
      )
    ORDER BY rate_date DESC
    LIMIT 20;
  `,
    [usd, targets, targets.length]
  );

  if (rows.length < 2) {
    throw new Error('Rate not found');
  }
  console.log("*******", rows);
  const rateDate = rows[0].rate_date;

  const rates = Object.fromEntries(
    rows.map(r => [r.target_code, Number(r.rate)])
  );
  console.log("*******", base, target, rows, rates);
  const rate = rates[target] / rates[base];

  const result = {
    base,
    target,
    rate,
    date: rateDate,
    requested_date: requestedDate
  };
  setCache(key, result);
  console.log(result);

  return result;
}