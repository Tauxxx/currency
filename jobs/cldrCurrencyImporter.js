import axios from 'axios';
import { load } from 'cheerio';
import fs from 'fs-extra';
import path from 'path';
import { fileURLToPath } from 'url';
import { pool } from '../db.js';


class CldrCurrencyImporter {
  constructor(config = {}) {
    this.cldrVersion = config.cldrVersion || 'latest';
    this.baseUrl = 'https://raw.githubusercontent.com/unicode-cldr';
    this.locales = config.locales || ['ru', 'en', 'de', 'fr', 'es', 'it', 'pt', 'ja', 'zh', 'ar'];
    this.dbConfig = config.dbConfig;
  }

  async downloadCldrData() {
    console.log('Скачивание данных CLDR...');

    const currencies = {};

    for (const locale of this.locales) {
      // cldr-json/cldr-numbers-full/main
      const url = `${this.baseUrl}/cldr-json/${this.cldrVersion}/cldr-json/cldr-numbers-full/main/${locale}/currencies.json`;
      console.log("------------------", url);
      try {
        // const url = `${this.baseUrl}/cldr-json/${this.cldrVersion}/cldr-json/cldr-numbers-full/main/${locale}/currencies.json`;
        console.log(`Загрузка: ${locale}`);

        const response = await axios.get(url);
        const data = response.data;

        // Извлекаем данные о валютах
        const currencyData = data.main[locale].numbers.currencies;

        for (const [code, info] of Object.entries(currencyData)) {
          if (!currencies[code]) {
            currencies[code] = {
              code: code,
              default_name: info.name || code,
              translations: {}
            };
          }

          if (info.displayName) {
            currencies[code].translations[locale] = info.displayName;
          }
        }

        console.log(`✓ ${locale}: получено ${Object.keys(currencyData).length} валют`);

      } catch (error) {
        console.error(`Ошибка загрузки для ${locale}:`, error.message);
      }

      // Пауза между запросами
      await this.sleep(100);
    }

    return Object.values(currencies);
  }

  async generateSQL(currencies) {
    console.log('\nГенерация SQL файлов...');

    const sqlDir = path.join(__dirname, 'sql');
    await fs.ensureDir(sqlDir);

    // 1. SQL для вставки основных валют
    let currenciesSQL = `-- Основные валюты (currencies)
INSERT INTO currencies (code, default_name) VALUES\n`;

    // 2. SQL для переводов
    let translationsSQL = `-- Переводы валют (currency_translations)
INSERT INTO currency_translations (currency_code, locale, name) VALUES\n`;

    const currencyValues = [];
    const translationValues = [];

    for (const currency of currencies) {
      currencyValues.push(`  ('${currency.code}', '${currency.default_name.replace(/'/g, "''")}')`);

      for (const [locale, name] of Object.entries(currency.translations)) {
        if (name && name !== currency.code) {
          translationValues.push(`  ('${currency.code}', '${locale}', '${name.replace(/'/g, "''")}')`);
        }
      }
    }

    currenciesSQL += currencyValues.join(',\n') + ';\n';
    translationsSQL += translationValues.join(',\n') + ';\n';

    // 3. SQL для обновления существующих данных
    const updateSQL = `-- Обновление существующих данных
DO $$
BEGIN
  -- Обновление названий валют
  UPDATE currencies c 
  SET default_name = v.default_name
  FROM (VALUES ${currencyValues.map(v => v.trim().slice(1, -1)).join(', ')}) 
    AS v(code, default_name)
  WHERE c.code = v.code;
  
  -- Удаление старых переводов и вставка новых
  DELETE FROM currency_translations;
  
  INSERT INTO currency_translations (currency_code, locale, name)
  VALUES ${translationValues.map(v => v.trim().slice(1, -1)).join(', ')};
END $$;
`;

    // Сохраняем файлы
    await fs.writeFile(path.join(sqlDir, '01-currencies.sql'), currenciesSQL);
    await fs.writeFile(path.join(sqlDir, '02-translations.sql'), translationsSQL);
    await fs.writeFile(path.join(sqlDir, '03-update-all.sql'), updateSQL);

    console.log(`✓ Создано SQL файлов: 3`);
    console.log(`✓ Валют: ${currencies.length}`);
    console.log(`✓ Переводов: ${translationValues.length}`);

    return { currencies: currencies.length, translations: translationValues.length };
  }

  async saveToDatabase(currencies) {
    if (!this.dbConfig) {
      console.log('Пропускаем сохранение в БД (не указаны параметры подключения)');
      return;
    }

    console.log('\nСохранение в базу данных...');

    // const client = new Client(this.dbConfig);

    const client = await pool.connect();


    try {

      await client.connect();

      // Начинаем транзакцию
      await client.query('BEGIN');

      // Вставляем основные валюты
      for (const currency of currencies) {
        await client.query(
          `INSERT INTO currencies (code, default_name) 
           VALUES ($1, $2) 
           ON CONFLICT (code) DO UPDATE 
           SET default_name = EXCLUDED.default_name`,
          [currency.code, currency.default_name]
        );

        // Вставляем переводы
        for (const [locale, name] of Object.entries(currency.translations)) {
          if (name && name !== currency.code) {
            await client.query(
              `INSERT INTO currency_translations (currency_code, locale, name) 
               VALUES ($1, $2, $3) 
               ON CONFLICT (currency_code, locale) DO UPDATE 
               SET name = EXCLUDED.name`,
              [currency.code, locale, name]
            );
          }
        }
      }

      await client.query('COMMIT');
      console.log('✓ Данные успешно сохранены в БД');

    } catch (error) {
      await client.query('ROLLBACK');
      console.error('Ошибка при сохранении в БД:', error.message);
      throw error;
    } finally {
      await client.end();
    }
  }

  async saveToJSON(currencies) {
    const outputDir = path.join(__dirname, 'output');
    await fs.ensureDir(outputDir);

    const data = {
      generated_at: new Date().toISOString(),
      cldr_version: this.cldrVersion,
      currencies: currencies
    };

    await fs.writeJson(path.join(outputDir, 'currencies.json'), data, { spaces: 2 });
    console.log(`✓ Данные сохранены в JSON: ${path.join(outputDir, 'currencies.json')}`);
  }

  async sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
  }

  async run(options = {}) {
    console.log('=== Импорт переводов валют из CLDR ===\n');

    const currencies = await this.downloadCldrData();

    if (currencies.length === 0) {
      console.error('Не удалось загрузить данные');
      return;
    }

    await this.generateSQL(currencies);

    if (options.saveToDB) {
      await this.saveToDatabase(currencies);
    }

    if (options.saveToJSON) {
      await this.saveToJSON(currencies);
    }

    console.log('\n=== Импорт завершен ===');
  }
}

// Конфигурация
const config = {
  // Список нужных локалей
  locales: ['ru', 'en', 'de', 'fr', 'es', 'it', 'pt', 'ja', 'ko', 'zh', 'ar', 'tr'],

  // Настройки БД (опционально)
  dbConfig: {
    user: 'postgres',
    host: 'localhost',
    database: 'your_database',
    password: 'your_password',
    port: 5432,
  }
};

// Использование
(async () => {
  const importer = new CldrCurrencyImporter(config);

  await importer.run({
    saveToDB: false,  // измените на true для сохранения в БД
    saveToJSON: true
  });
})();