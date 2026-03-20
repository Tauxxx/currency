export const LOCALES = ['ru', 'en', 'de', 'fr', 'es', 'it', 'pt', 'ja', 'ko', 'zh', 'ar', 'tr', 'uk'];

export const LOCALE_SET = new Set(LOCALES);

export function isValidLocale(locale) {
  return LOCALE_SET.has(locale);
}