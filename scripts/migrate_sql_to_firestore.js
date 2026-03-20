
import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';
import { db } from '../db.js';

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const DUMP_PATH = path.join(__dirname, '../sql/dump.sql');

async function migrate() {
  console.log('Starting migration...');
  const content = fs.readFileSync(DUMP_PATH, 'utf8');
  const lines = content.split('\n');

  const currencies = new Map(); // code -> { code, default_name, symbol, translations: [] }
  const rates = [];

  let currentSection = null;

  for (const line of lines) {
    if (line.startsWith('COPY public.currencies')) {
      currentSection = 'currencies';
      continue;
    } else if (line.startsWith('COPY public.currency_translations')) {
      currentSection = 'translations';
      continue;
    } else if (line.startsWith('COPY public.exchange_rates')) {
      currentSection = 'rates';
      continue;
    } else if (line === '\\.') {
      currentSection = null;
      continue;
    }

    if (!currentSection) continue;

    // Skip empty lines or comments inside COPY block (though usually dump doesn't have them inside COPY)
    if (!line.trim() || line.startsWith('--')) continue;

    const parts = line.split('\t');

    if (currentSection === 'currencies') {
      // code, default_name, symbol
      const [code, default_name, symbol] = parts;
      currencies.set(code, {
        code,
        default_name,
        symbol: symbol === '\\N' ? null : symbol,
        translations: []
      });
    } else if (currentSection === 'translations') {
      // currency_code, locale, name
      const [code, locale, name] = parts;
      if (currencies.has(code)) {
        currencies.get(code).translations.push({ locale, name });
      }
    } else if (currentSection === 'rates') {
      // base_code, target_code, rate, rate_date, created_at
      const [base_code, target_code, rate, rate_date, created_at] = parts;
      rates.push({
        base_code,
        target_code,
        rate: Number(rate),
        rate_date: rate_date, // Keep as string "YYYY-MM-DD" for easy querying or convert to Date?
        // App uses date strings in some places, but Date objects for storage might be better.
        // Existing code casts to date: `rate_date <= $4::date`
        // Let's store as string "YYYY-MM-DD" to match the usage in service where it selects `rate_date::text`.
        // Actually, Firestore Timestamp is better for ordering.
        // But let's stick to string YYYY-MM-DD for simplicity if the app expects strings, 
        // OR convert everything to timestamps.
        // The app compares dates. String comparison works for YYYY-MM-DD.
        created_at: new Date(created_at) // Keep this metadata if useful
      });
    }
  }

  console.log(`Parsed ${currencies.size} currencies and ${rates.length} exchange rates.`);

  // Batch write currencies
  console.log('Migrating currencies...');
  let batch = db.batch();
  let count = 0;

  for (const [code, data] of currencies) {
    const docRef = db.collection('currencies').doc(code);
    batch.set(docRef, data);
    count++;
    if (count >= 400) {
      await batch.commit();
      batch = db.batch();
      count = 0;
      process.stdout.write('.');
    }
  }
  if (count > 0) await batch.commit();
  console.log('\nCurrencies migrated.');

  // Batch write rates
  console.log('Migrating exchange rates...');
  batch = db.batch();
  count = 0;
  let total = 0;

  for (const rate of rates) {
    // Generate an ID or let Firestore generate one. 
    // Since we query by filters, auto-id is fine.
    const docRef = db.collection('exchange_rates').doc();
    batch.set(docRef, rate);
    count++;
    total++;
    if (count >= 400) {
      await batch.commit();
      batch = db.batch();
      count = 0;
      if (total % 1000 === 0) process.stdout.write('.');
    }
  }
  if (count > 0) await batch.commit();
  console.log('\nExchange rates migrated.');
}

migrate().catch(console.error);
