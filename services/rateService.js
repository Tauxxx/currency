import { pool } from '../db.js';
import { getCache, setCache } from './cache.js';

export async function getRate(fromCurrency, toCurrency, requestedDate) {
  if (fromCurrency === toCurrency) {
    return {
      rate: 1,
      date: requestedDate,
      fromCurrency,
      toCurrency,
      requestedDate
    };
  }
  const key = `${fromCurrency}:${toCurrency}:${requestedDate}`;
  const cached = getCache(key);
  if (cached) return cached;
  // console.warn("Cache miss for key:", key);

  const baseCurrency = 'USD';
  const { rows1 } = await pool.query(
    `
      WITH valid_date AS (
        SELECT rate_date
        FROM exchange_rates
        WHERE base_code = $1
          AND target_code IN ($2, $3)
          AND rate_date <= $4::date
        GROUP BY rate_date
        HAVING COUNT(DISTINCT target_code) = 2
        ORDER BY rate_date DESC
        LIMIT 1
      )
      SELECT 
        target_code, 
        rate,
        rate_date::text AS rate_date
      FROM exchange_rates
      JOIN valid_date USING (rate_date)
      WHERE base_code = $1
        AND target_code IN ($2, $3);
    `,
    [baseCurrency, fromCurrency, toCurrency, requestedDate]
  );

  try {
    // Шаг 1: Ищем данные за ближайшую дату В ПРОШЛОМ (от запрашиваемой)
    const { rows } = await pool.query(
      `
        SELECT 
          target_code, 
          rate,
          rate_date::text AS rate_date
        FROM exchange_rates
        WHERE base_code = $1
          AND target_code IN ($2, $3)
          AND rate_date <= $4::date
          AND rate_date = (
            SELECT MAX(rate_date)
            FROM exchange_rates
            WHERE base_code = $1
              AND target_code IN ($2, $3)
              AND rate_date <= $4::date
            GROUP BY rate_date
            HAVING COUNT(DISTINCT target_code) = 2
            ORDER BY rate_date DESC
            LIMIT 1
          )
      `,
      [baseCurrency, fromCurrency, toCurrency, requestedDate]
    );
    if (rows.length === 2) {
      return processRates(rows, fromCurrency, toCurrency, requestedDate);
    }

    // Шаг 2: Если в прошлом нет данных — берем самые свежие вообще
    const fallbackRows = await pool.query(
      `
        SELECT 
          target_code, 
          rate,
          rate_date::text AS rate_date
        FROM exchange_rates
        WHERE base_code = $1
          AND target_code IN ($2, $3)
          AND rate_date = (
            SELECT MAX(rate_date)
            FROM exchange_rates
            WHERE base_code = $1
              AND target_code IN ($2, $3)
            GROUP BY rate_date
            HAVING COUNT(DISTINCT target_code) = 2
            ORDER BY rate_date DESC
            LIMIT 1
          )
      `,
      [baseCurrency, fromCurrency, toCurrency]
    );

    if (fallbackRows.rows.length === 2) {
      console.warn(
        `No data for ${fromCurrency}/${toCurrency} on or before ${requestedDate}. ` +
        `Using latest available date: ${fallbackRows.rows[0].rate_date}`
      );
      return processRates(fallbackRows.rows, fromCurrency, toCurrency, requestedDate);
    }
    // Шаг 3: Если совсем нет данных — ошибка
    throw new Error(`No rate data available for ${fromCurrency} and ${toCurrency}`);
  } catch (error) {
    throw new Error(`Failed to get rate: ${error.message}`);
  }

  // Вспомогательная функция для обработки данных
  function processRates(rows) {
    const rates = Object.fromEntries(
      rows.map(r => [r.target_code, Number(r.rate)])
    );

    const rate = rates[toCurrency] / rates[fromCurrency];

    let result = {
      rate,
      date: rows[0].rate_date,
      fromCurrency,
      toCurrency,
      requestedDate
    }

    setCache(key, result);

    return result;

    // return {
    //   rate,
    //   date: rows[0].rate_date,
    //   fromCurrency,
    //   toCurrency,
    //   requestedDate
    // };
  }
}

