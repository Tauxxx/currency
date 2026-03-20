import dotenv from 'dotenv';
import { db } from '../db.js';
import { FieldValue } from '@google-cloud/firestore';

dotenv.config();

const url = `https://v6.exchangerate-api.com/v6/${process.env.EXCHANGE_API_KEY}/codes`;

async function run() {
  const res = await fetch(url);
  const data = await res.json();

  if (data.result !== 'success') {
    throw new Error('Codes API error');
  }

  console.log(`Found ${data.supported_codes.length} codes.`);

  let batch = db.batch();
  let count = 0;

  for (const [code, name] of data.supported_codes) {
    const docRef = db.collection('currencies').doc(code);

    // We use set with merge: true.
    // This creates the document if it doesn't exist.
    // We update/set default_name and add the english translation.
    // Note: This effectively works as an Upsert, which is slightly different from "ON CONFLICT DO NOTHING",
    // but ensures data consistency.
    batch.set(docRef, {
      code,
      default_name: name,
      translations: FieldValue.arrayUnion({ locale: 'en', name: name })
    }, { merge: true });

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
  console.log('Currency codes updated');
}

run().catch(e => {
  console.error(e);
  process.exit(1);
});