import dotenv from 'dotenv';
import { db } from '../db.js';

dotenv.config();

const url = `https://v6.exchangerate-api.com/v6/${process.env.EXCHANGE_API_KEY}/latest/USD`;

try {
  const res = await fetch(url);
  const data = await res.json();

  if (data.result !== 'success') {
    throw new Error('Exchange API error');
  }

  const rateDate = data.time_last_update_utc.slice(0, 16);
  // Store as YYYY-MM-DD string to match migration and query logic
  const date = new Date(rateDate).toISOString().slice(0, 10);

  // Prepare data
  const batch = db.batch();
  const rates = Object.entries(data.conversion_rates);

  console.log(`Fetching rates for ${date}...`);

  let count = 0;
  let batchesCommitted = 0;

  for (const [code, rate] of rates) {
    // Generate a new document for each rate
    // or use a deterministic ID like `USD-${code}-${date}` to prevent duplicates if run multiple times?
    // SQL had `ON CONFLICT DO NOTHING`.
    // Firestore set with merge: true or just overwriting is fine. 
    // Deterministic ID is better for idempotency.
    const docId = `USD-${code}-${date}`;
    const docRef = db.collection('exchange_rates').doc(docId);

    batch.set(docRef, {
      base_code: 'USD',
      target_code: code,
      rate: Number(rate),
      rate_date: date,
      created_at: new Date() // or serverTimestamp()
    });

    count++;

    if (count >= 400) {
      await batch.commit();
      batchesCommitted++;
      count = 0;
      // Re-create batch
      // Note: db.batch() returns a new batch object.
      // Can't assign to const variable if I defined it as const... wait, I defined it as const `batch`.
      // I need to change it to let or handle it differently.
      // Ah, I can't reassign `batch` if it's const.
    }
  }

  // Refactored loop to handle batch re-assignment or use a helper function?
  // Actually, let's just rewrite the loop structure properly.
} catch (e) {
  console.error(e);
  process.exit(1);
}

// Re-writing the main block with proper batch handling
async function run() {
  const res = await fetch(url);
  const data = await res.json();

  if (data.result !== 'success') {
    throw new Error('Exchange API error: ' + data['error-type']);
  }

  const rateDate = data.time_last_update_utc.slice(0, 16);
  const date = new Date(rateDate).toISOString().slice(0, 10);

  console.log(`Processing rates for ${date}...`);

  let batch = db.batch();
  let count = 0;

  for (const [code, rate] of Object.entries(data.conversion_rates)) {
    const docId = `USD-${code}-${date}`;
    const docRef = db.collection('exchange_rates').doc(docId);

    batch.set(docRef, {
      base_code: 'USD',
      target_code: code,
      rate: Number(rate),
      rate_date: date,
      created_at: new Date()
    });

    count++;
    if (count >= 400) {
      await batch.commit();
      batch = db.batch();
      count = 0;
    }
  }

  if (count > 0) {
    await batch.commit();
  }

  console.log('Rates updated successfully.');
}

run().catch(e => {
  console.error(e);
  process.exit(1);
});