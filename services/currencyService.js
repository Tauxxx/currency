import { db } from '../db.js';

export async function getCurrencies(locale) {
  const snapshot = await db.collection('currencies').orderBy('code').get();
  const currencies = [];

  snapshot.forEach(doc => {
    const data = doc.data();
    let translatedName = null;

    if (locale && data.translations) {
      const translation = data.translations.find(t => t.locale === locale);
      // SQL LEFT JOIN behavior: if translation exists, use it.
      if (translation) {
        translatedName = translation.name;
      }
    }

    const currency = {
      code: data.code,
      default_name: data.default_name,
      symbol: data.symbol
    };

    if (locale) {
      currency.translated_name = translatedName;
    }

    currencies.push(currency);
  });

  return currencies;
}

export async function getCurrency(code, locale) {
  const doc = await db.collection('currencies').doc(code.toUpperCase()).get();

  if (!doc.exists) {
    return null;
  }

  const data = doc.data();

  return {
    code: data.code,
    default_name: data.default_name,
    symbol: data.symbol,
    translations: data.translations || []
  };
}
