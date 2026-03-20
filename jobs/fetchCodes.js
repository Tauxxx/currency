import dotenv from 'dotenv';
import { pool } from '../db.js';

dotenv.config();

const url = `https://v6.exchangerate-api.com/v6/${process.env.EXCHANGE_API_KEY}/codes`;

const res = await fetch(url);
const data = await res.json();

if (data.result !== 'success') {
  throw new Error('Codes API error');
}

const client = await pool.connect();
try {
  await client.query('BEGIN');

  for (const [code, name] of data.supported_codes) {
    await client.query(
      `
      INSERT INTO currencies (code, default_name)
      VALUES ($1, $2)
      ON CONFLICT (code) DO NOTHING
      `,
      [code, name]
    );

    await client.query(
      `
      INSERT INTO currency_translations (currency_code, locale, name)
      VALUES ($1, 'en', $2)
      ON CONFLICT DO NOTHING
      `,
      [code, name]
    );
  }

  await client.query('COMMIT');
  console.log('Currency codes loaded');
} catch (e) {
  await client.query('ROLLBACK');
  throw e;
} finally {
  client.release();
}