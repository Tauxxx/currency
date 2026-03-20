import dotenv from 'dotenv';
import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';
import { pool } from '../db.js';

import { LOCALES } from '../config/locales.js';

dotenv.config();

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const CLDR_PATH = path.join(__dirname, '../node_modules/cldr-numbers-full/main');

function loadCurrencies(locale) {
  const filePath = path.join(CLDR_PATH, locale, 'currencies.json');
  const data = JSON.parse(fs.readFileSync(filePath, 'utf8'));
  return data.main[locale].numbers.currencies;
}

const client = await pool.connect();

try {
  // Get existing currency codes from exchange_rates
  const { rows } = await client.query('SELECT DISTINCT target_code FROM exchange_rates');
  const validCodes = new Set(rows.map(r => r.target_code));

  console.log(`Found ${validCodes.size} currencies in exchange_rates`);

  // Load English data for default names and symbols
  const enCurrencies = loadCurrencies('en');

  await client.query('BEGIN');

  // Insert currencies
  let insertedCurrencies = 0;
  for (const code of validCodes) {
    const currencyData = enCurrencies[code];
    if (!currencyData) {
      console.warn(`Currency ${code} not found in CLDR data`);
      continue;
    }

    const defaultName = currencyData.displayName || code;
    const symbol = currencyData.symbol ? currencyData.symbol.slice(0, 3) : null;

    await client.query(
      `INSERT INTO currencies (code, default_name, symbol)
       VALUES ($1, $2, $3)
       ON CONFLICT (code) DO UPDATE SET default_name = $2, symbol = $3`,
      [code, defaultName, symbol]
    );
    insertedCurrencies++;
  }

  console.log(`Inserted/updated ${insertedCurrencies} currencies`);

  // Insert translations for each locale
  let insertedTranslations = 0;
  for (const locale of LOCALES) {
    const currencies = loadCurrencies(locale);

    for (const code of validCodes) {
      const currencyData = currencies[code];
      if (!currencyData) continue;

      // Use displayName-count-one if available, fallback to displayName
      const name = currencyData['displayName-count-one'] || currencyData.displayName || null;
      if (!name) continue;

      await client.query(
        `INSERT INTO currency_translations (currency_code, locale, name)
         VALUES ($1, $2, $3)
         ON CONFLICT (currency_code, locale) DO UPDATE SET name = $3`,
        [code, locale, name]
      );
      insertedTranslations++;
    }
  }

  await client.query('COMMIT');
  console.log(`Inserted/updated ${insertedTranslations} translations`);
  console.log('Currency seed completed successfully');
} catch (e) {
  await client.query('ROLLBACK');
  console.error('Error seeding currencies:', e);
  throw e;
} finally {
  client.release();
  await pool.end();
}
