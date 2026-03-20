import dotenv from 'dotenv';
import { pool } from '../db.js';

dotenv.config();

const url = `https://v6.exchangerate-api.com/v6/${process.env.EXCHANGE_API_KEY}/latest/USD`;

const res = await fetch(url);
const data = await res.json();

if (data.result !== 'success') {
  throw new Error('Exchange API error');
}

const rateDate = data.time_last_update_utc.slice(0, 16);
const date = new Date(rateDate).toISOString().slice(0, 10);

const client = await pool.connect();
try {
  await client.query('BEGIN');

  for (const [code, rate] of Object.entries(data.conversion_rates)) {
    await client.query(
      `
      INSERT INTO exchange_rates (base_code, target_code, rate, rate_date)
      VALUES ('USD', $1, $2, $3)
      ON CONFLICT DO NOTHING
      `,
      [code, rate, date]
    );
  }

  await client.query('COMMIT');
  console.log('Rates updated:', date);
} catch (e) {
  await client.query('ROLLBACK');
  throw e;
} finally {
  client.release();
}