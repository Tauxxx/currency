--
-- PostgreSQL database dump
--

\restrict iWeCtbZ1gR5DBcqLujRMy9Y8JbYJagGPV9tAXhdaKB9w3J21OTioyJxYhdFpPRt

-- Dumped from database version 14.20 (Homebrew)
-- Dumped by pg_dump version 14.20 (Homebrew)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: tau
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO tau;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: tau
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: currencies; Type: TABLE; Schema: public; Owner: tau
--

CREATE TABLE public.currencies (
    code character varying(3) NOT NULL,
    default_name text NOT NULL,
    symbol character(3)
);


ALTER TABLE public.currencies OWNER TO tau;

--
-- Name: currency_translations; Type: TABLE; Schema: public; Owner: tau
--

CREATE TABLE public.currency_translations (
    currency_code character varying(3) NOT NULL,
    locale character varying(5) NOT NULL,
    name text
);


ALTER TABLE public.currency_translations OWNER TO tau;

--
-- Name: exchange_rates; Type: TABLE; Schema: public; Owner: tau
--

CREATE TABLE public.exchange_rates (
    base_code character varying(3) NOT NULL,
    target_code character varying(3) NOT NULL,
    rate numeric(18,8) NOT NULL,
    rate_date date NOT NULL,
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.exchange_rates OWNER TO tau;

--
-- Name: currencies currencies_pkey; Type: CONSTRAINT; Schema: public; Owner: tau
--

ALTER TABLE ONLY public.currencies
    ADD CONSTRAINT currencies_pkey PRIMARY KEY (code);


--
-- Name: currency_translations currency_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: tau
--

ALTER TABLE ONLY public.currency_translations
    ADD CONSTRAINT currency_translations_pkey PRIMARY KEY (currency_code, locale);


--
-- Name: exchange_rates exchange_rates_pkey; Type: CONSTRAINT; Schema: public; Owner: tau
--

ALTER TABLE ONLY public.exchange_rates
    ADD CONSTRAINT exchange_rates_pkey PRIMARY KEY (base_code, target_code, rate_date);


--
-- Name: idx_rates_date; Type: INDEX; Schema: public; Owner: tau
--

CREATE INDEX idx_rates_date ON public.exchange_rates USING btree (rate_date);


--
-- Name: currency_translations currency_translations_currency_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tau
--

ALTER TABLE ONLY public.currency_translations
    ADD CONSTRAINT currency_translations_currency_code_fkey FOREIGN KEY (currency_code) REFERENCES public.currencies(code);


--
-- PostgreSQL database dump complete
--

\unrestrict iWeCtbZ1gR5DBcqLujRMy9Y8JbYJagGPV9tAXhdaKB9w3J21OTioyJxYhdFpPRt

