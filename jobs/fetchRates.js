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

// Подготавливаем данные
const rates = Object.entries(data.conversion_rates)
  .map(([code, rate]) => ['USD', code, rate, date]);

// Формируем VALUES для множественного INSERT
const valuesPlaceholders = rates.map((_, i) => `($${i * 4 + 1}, $${i * 4 + 2}, $${i * 4 + 3}, $${i * 4 + 4})`).join(', ');
// console.log('Values placeholders:', valuesPlaceholders);

// Собираем все параметры в один плоский массив
const allParams = rates.flat();
const client = await pool.connect();

try {
  await client.query('BEGIN');

  await client.query(
    `
      INSERT INTO exchange_rates (base_code, target_code, rate, rate_date)
      VALUES ${valuesPlaceholders}
      ON CONFLICT DO NOTHING
    `,
    allParams
  );

  await client.query('COMMIT');
  console.log('Rates updated:', date);
} catch (e) {
  await client.query('ROLLBACK');
  throw e;
} finally {
  client.release();
}