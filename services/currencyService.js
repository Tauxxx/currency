import { pool } from '../db.js';

export async function getCurrencies(locale) {
  if (locale) {
    const { rows } = await pool.query(
      `SELECT c.code, c.default_name, c.symbol, t.name as translated_name
       FROM currencies c
       LEFT JOIN currency_translations t ON c.code = t.currency_code AND t.locale = $1
       ORDER BY c.code`,
      [locale]
    );
    return rows;
  }

  const { rows } = await pool.query(
    `SELECT code, default_name, symbol FROM currencies ORDER BY code`
  );
  return rows;
}

export async function getCurrency(code, locale) {
  const { rows } = await pool.query(
    `SELECT c.code, c.default_name, c.symbol,
            COALESCE(
              json_agg(
                json_build_object('locale', t.locale, 'name', t.name)
              ) FILTER (WHERE t.locale IS NOT NULL),
              '[]'
            ) as translations
     FROM currencies c
     LEFT JOIN currency_translations t ON c.code = t.currency_code
     WHERE c.code = $1
     GROUP BY c.code, c.default_name, c.symbol`,
    [code.toUpperCase()]
  );

  if (rows.length === 0) {
    return null;
  }

  return rows[0];
}
