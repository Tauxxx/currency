CREATE TABLE currencies (
  code VARCHAR(3) PRIMARY KEY,
  default_name TEXT NOT NULL
);

CREATE TABLE currency_translations (
  currency_code VARCHAR(3) REFERENCES currencies(code),
  locale VARCHAR(5),
  name TEXT NOT NULL,
  PRIMARY KEY (currency_code, locale)
);

CREATE TABLE exchange_rates (
  base_code VARCHAR(3) NOT NULL,
  target_code VARCHAR(3) NOT NULL,
  rate NUMERIC(18,8) NOT NULL,
  rate_date DATE NOT NULL,
  created_at TIMESTAMP DEFAULT now(),
  PRIMARY KEY (base_code, target_code, rate_date)
);

CREATE INDEX idx_rates_date ON exchange_rates(rate_date);