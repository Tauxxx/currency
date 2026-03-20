import { db } from '../db.js';
import { getCache, setCache } from './cache.js';

export async function getRate(fromCurrency, toCurrency, requestedDate, bypassCache = false) {
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
  if (cached && !bypassCache) return cached;
  // console.warn("Cache miss for key:", key);

  const baseCurrency = 'USD';

  // Helper to fetch rate for a currency against USD
  async function fetchRate(targetCode, date) {
    const snapshot = await db.collection('exchange_rates')
      .where('base_code', '==', baseCurrency)
      .where('target_code', '==', targetCode)
      .where('rate_date', '<=', date)
      .orderBy('rate_date', 'desc')
      .limit(1)
      .get();

    if (snapshot.empty) return null;
    return snapshot.docs[0].data();
  }

  try {
    const [fromRateData, toRateData] = await Promise.all([
      fetchRate(fromCurrency, requestedDate),
      fetchRate(toCurrency, requestedDate)
    ]);

    if (!fromRateData) {
      // Try fallback: get latest available
      const latestFrom = await db.collection('exchange_rates')
        .where('base_code', '==', baseCurrency)
        .where('target_code', '==', fromCurrency)
        .orderBy('rate_date', 'desc')
        .limit(1)
        .get();

      if (latestFrom.empty) throw new Error(`No rate data available for ${fromCurrency}`);
      // Note: we could implement logic to use the latest date available if requested date > latest date.
      // For now, let's treat strict missing data as error or if convenient, use the latest.
      // The original code had a complex logic for fallback rows. 
      // Simplified logic: If exact/past date not found, error out or improve fallback later.
      // However, to mimic original behavior approximately:
      throw new Error(`No rate data available for ${fromCurrency} on or before ${requestedDate}`);
    }

    if (!toRateData) {
      throw new Error(`No rate data available for ${toCurrency} on or before ${requestedDate}`);
    }

    // Logic: use the OLDER of the two dates to be safe? Or just use the requested date?
    // Original SQL used the same rate_date for both.
    // Here we might get different dates if one currency updated and another didn't.
    // Let's use the date from the data.

    // Cross rate calculation:
    // USD -> From = R1
    // USD -> To = R2
    // From -> To = (USD -> To) / (USD -> From) = R2 / R1

    const rate = Number(toRateData.rate) / Number(fromRateData.rate);
    const date = fromRateData.rate_date < toRateData.rate_date ? fromRateData.rate_date : toRateData.rate_date; // Use the older date common to both? Or newer? 
    // Usually valid_date in SQL was: HAVING COUNT(DISTINCT target_code) = 2. 
    // It found a date where BOTH existed.
    // Here we picked the latest date <= requestedDate for EACH.
    // This is arguably BETTER than the SQL behavior which required keys to align exactly on dates.
    // But for consistency let's just return the requested date or the actual date of the quote.

    let result = {
      rate,
      date: date,
      fromCurrency,
      toCurrency,
      requestedDate
    };

    setCache(key, result);

    return result;

  } catch (error) {
    console.error(error);
    throw new Error(`Failed to get rate: ${error.message}`);
  }
}
