// ecosystem.config.js
module.exports = {
  apps: [
    // Основной API
    {
      name: 'currency-api',
      script: './app.js',
      instances: 1,
      autorestart: true,
      watch: false,
      max_memory_restart: '500M',
      exec_mode: 'fork',
      env: {
        NODE_ENV: 'production',
        PORT: 3000
      }
    },

    // Фоновая задача: обновление курсов раз в сутки
    {
      name: 'fetch-rates-job',
      script: './jobs/fetchRates.js',
      instances: 1,
      autorestart: false,
      cron_restart: '0 15 * * *',
      exec_mode: 'fork',
      env: {
        NODE_ENV: 'production'
      }
    }
  ]
};