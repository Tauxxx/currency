--
-- PostgreSQL database dump
--

\restrict 6ONrdjpGaXC8m9l6TnieFgyqeohu1BUWIFz7O75Nx5C7AkqdDO0c3kP6a9Af0O9

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
-- Data for Name: currencies; Type: TABLE DATA; Schema: public; Owner: tau
--

COPY public.currencies (code, default_name, symbol) FROM stdin;
FOK	Faroese Króna	\N
GGP	Guernsey Pound	\N
IMP	Manx Pound	\N
JEP	Jersey Pound	\N
KID	Kiribati Dollar	\N
TVD	Tuvaluan Dollar	\N
RUB	Russian Ruble	₽  
XCG	Caribbean guilder	Cg.
THB	Thai Baht	THB
CDF	Congolese Franc	CDF
HKD	Hong Kong Dollar	HK$
IDR	Indonesian Rupiah	IDR
CLF	Chilean Unit of Account (UF)	\N
TRY	Turkish Lira	TRY
ETB	Ethiopian Birr	ETB
ILS	Israeli New Shekel	₪  
MOP	Macanese Pataca	MOP
SYP	Syrian Pound	SYP
AOA	Angolan Kwanza	AOA
SCR	Seychellois Rupee	SCR
MRU	Mauritanian Ouguiya	MRU
HRK	Croatian Kuna	HRK
GTQ	Guatemalan Quetzal	GTQ
SLL	Sierra Leonean Leone (1964—2022)	SLL
HUF	Hungarian Forint	HUF
MXN	Mexican Peso	MX$
CVE	Cape Verdean Escudo	CVE
JMD	Jamaican Dollar	JMD
AWG	Aruban Florin	AWG
ZAR	South African Rand	ZAR
SAR	Saudi Riyal	SAR
BWP	Botswanan Pula	BWP
TOP	Tongan Paʻanga	TOP
MNT	Mongolian Tugrik	MNT
IRR	Iranian Rial	IRR
UYU	Uruguayan Peso	UYU
TTD	Trinidad & Tobago Dollar	TTD
MYR	Malaysian Ringgit	MYR
BND	Brunei Dollar	BND
ANG	Netherlands Antillean Guilder	ANG
BTN	Bhutanese Ngultrum	BTN
QAR	Qatari Riyal	QAR
SHP	St. Helena Pound	SHP
CUP	Cuban Peso	CUP
BMD	Bermudan Dollar	BMD
SDG	Sudanese Pound	SDG
LAK	Laotian Kip	LAK
AED	United Arab Emirates Dirham	AED
CLP	Chilean Peso	CLP
RSD	Serbian Dinar	RSD
KGS	Kyrgyz Som	KGS
KES	Kenyan Shilling	KES
XPF	CFP Franc	CFP
AZN	Azerbaijani Manat	AZN
XCD	East Caribbean Dollar	EC$
AFN	Afghan Afghani	AFN
ERN	Eritrean Nakfa	ERN
AUD	Australian Dollar	A$ 
CNH	Chinese Yuan (offshore)	CNH
NGN	Nigerian Naira	NGN
BGN	Bulgarian Lev	BGN
TWD	New Taiwan Dollar	NT$
LYD	Libyan Dinar	LYD
NPR	Nepalese Rupee	NPR
PLN	Polish Zloty	PLN
COP	Colombian Peso	COP
CRC	Costa Rican Colón	CRC
BHD	Bahraini Dinar	BHD
PKR	Pakistani Rupee	PKR
XOF	West African CFA Franc	F C
GBP	British Pound	£  
ZWG	Zimbabwean Gold	ZWG
TND	Tunisian Dinar	TND
OMR	Omani Rial	OMR
MZN	Mozambican Metical	MZN
GYD	Guyanaese Dollar	GYD
CZK	Czech Koruna	CZK
MGA	Malagasy Ariary	MGA
DKK	Danish Krone	DKK
KYD	Cayman Islands Dollar	KYD
GIP	Gibraltar Pound	GIP
MVR	Maldivian Rufiyaa	MVR
SSP	South Sudanese Pound	SSP
RON	Romanian Leu	RON
STN	São Tomé & Príncipe Dobra	STN
RWF	Rwandan Franc	RWF
NAD	Namibian Dollar	NAD
JOD	Jordanian Dinar	JOD
VUV	Vanuatu Vatu	VUV
BBD	Barbadian Dollar	BBD
UAH	Ukrainian Hryvnia	UAH
CHF	Swiss Franc	CHF
SOS	Somali Shilling	SOS
CAD	Canadian Dollar	CA$
GEL	Georgian Lari	GEL
LKR	Sri Lankan Rupee	LKR
BOB	Bolivian Boliviano	BOB
YER	Yemeni Rial	YER
ZWL	Zimbabwean Dollar (2009–2024)	\N
ZMW	Zambian Kwacha	ZMW
XAF	Central African CFA Franc	FCF
XDR	Special Drawing Rights	\N
MDL	Moldovan Leu	MDL
NZD	New Zealand Dollar	NZ$
MMK	Myanmar Kyat	MMK
LRD	Liberian Dollar	LRD
VND	Vietnamese Dong	₫  
PGK	Papua New Guinean Kina	PGK
VES	Venezuelan Bolívar	VES
PYG	Paraguayan Guarani	PYG
BZD	Belize Dollar	BZD
SRD	Surinamese Dollar	SRD
SEK	Swedish Krona	SEK
DZD	Algerian Dinar	DZD
ARS	Argentine Peso	ARS
KHR	Cambodian Riel	KHR
FJD	Fijian Dollar	FJD
PEN	Peruvian Sol	PEN
UZS	Uzbekistani Som	UZS
DJF	Djiboutian Franc	DJF
BRL	Brazilian Real	R$ 
HNL	Honduran Lempira	HNL
LBP	Lebanese Pound	LBP
EGP	Egyptian Pound	EGP
TJS	Tajikistani Somoni	TJS
USD	US Dollar	$  
FKP	Falkland Islands Pound	FKP
TMT	Turkmenistani Manat	TMT
PHP	Philippine Peso	₱  
LSL	Lesotho Loti	LSL
ISK	Icelandic Króna	ISK
SBD	Solomon Islands Dollar	SBD
SLE	Sierra Leonean Leone	SLE
MUR	Mauritian Rupee	MUR
CNY	Chinese Yuan	CN¥
PAB	Panamanian Balboa	PAB
BAM	Bosnia-Herzegovina Convertible Mark	BAM
NOK	Norwegian Krone	NOK
KMF	Comorian Franc	KMF
BDT	Bangladeshi Taka	BDT
INR	Indian Rupee	₹  
HTG	Haitian Gourde	HTG
ALL	Albanian Lek	ALL
MWK	Malawian Kwacha	MWK
MAD	Moroccan Dirham	MAD
GMD	Gambian Dalasi	GMD
AMD	Armenian Dram	AMD
UGX	Ugandan Shilling	UGX
KRW	South Korean Won	₩  
DOP	Dominican Peso	DOP
MKD	Macedonian Denar	MKD
KWD	Kuwaiti Dinar	KWD
EUR	Euro	€  
TZS	Tanzanian Shilling	TZS
BYN	Belarusian Ruble	BYN
NIO	Nicaraguan Córdoba	NIO
KZT	Kazakhstani Tenge	KZT
SGD	Singapore Dollar	SGD
JPY	Japanese Yen	¥  
IQD	Iraqi Dinar	IQD
WST	Samoan Tala	WST
BIF	Burundian Franc	BIF
GHS	Ghanaian Cedi	GHS
SZL	Swazi Lilangeni	SZL
BSD	Bahamian Dollar	BSD
GNF	Guinean Franc	GNF
\.


--
-- Data for Name: currency_translations; Type: TABLE DATA; Schema: public; Owner: tau
--

COPY public.currency_translations (currency_code, locale, name) FROM stdin;
FOK	en	Faroese Króna
GGP	en	Guernsey Pound
IMP	en	Manx Pound
JEP	en	Jersey Pound
KID	en	Kiribati Dollar
TVD	en	Tuvaluan Dollar
EUR	en	euro
THB	ru	таиландский бат
CDF	ru	конголезский франк
HKD	ru	гонконгский доллар
IDR	ru	индонезийская рупия
CLF	ru	Условная расчетная единица Чили
TRY	ru	турецкая лира
ETB	ru	эфиопский быр
ILS	ru	новый израильский шекель
MOP	ru	патака Макао
SYP	ru	сирийский фунт
AOA	ru	ангольская кванза
SCR	ru	сейшельская рупия
MRU	ru	мавританская угия
HRK	ru	хорватская куна
GTQ	ru	гватемальский кетсаль
SLL	ru	леоне (1964—2022)
HUF	ru	венгерский форинт
MXN	ru	мексиканский песо
CVE	ru	эскудо Кабо-Верде
RUB	ru	российский рубль
JMD	ru	ямайский доллар
AWG	ru	арубанский флорин
ZAR	ru	южноафриканский рэнд
SAR	ru	саудовский риял
BWP	ru	ботсванская пула
TOP	ru	тонганская паанга
MNT	ru	монгольский тугрик
IRR	ru	иранский риал
UYU	ru	уругвайский песо
TTD	ru	доллар Тринидада и Тобаго
MYR	ru	малайзийский ринггит
BND	ru	брунейский доллар
ANG	ru	нидерландский антильский гульден
BTN	ru	бутанский нгултрум
QAR	ru	катарский риал
SHP	ru	фунт острова Святой Елены
CUP	ru	кубинский песо
BMD	ru	бермудский доллар
SDG	ru	суданский фунт
LAK	ru	лаосский кип
AED	ru	дирхам ОАЭ
CLP	ru	чилийский песо
RSD	ru	сербский динар
KGS	ru	киргизский сом
KES	ru	кенийский шиллинг
XPF	ru	французский тихоокеанский франк
AZN	ru	азербайджанский манат
XCD	ru	восточно-карибский доллар
AFN	ru	афгани
ERN	ru	эритрейская накфа
AUD	ru	австралийский доллар
CNH	ru	китайский офшорный юань
NGN	ru	нигерийская найра
BGN	ru	болгарский лев
TWD	ru	новый тайваньский доллар
LYD	ru	ливийский динар
NPR	ru	непальская рупия
PLN	ru	польский злотый
COP	ru	колумбийский песо
CRC	ru	костариканский колон
BHD	ru	бахрейнский динар
PKR	ru	пакистанская рупия
XOF	ru	франк КФА ВСЕАО
GBP	ru	британский фунт стерлингов
ZWG	ru	зимбабвийский золотой
TND	ru	тунисский динар
OMR	ru	оманский риал
MZN	ru	мозамбикский метикал
GYD	ru	гайанский доллар
CZK	ru	чешская крона
MGA	ru	малагасийский ариари
DKK	ru	датская крона
KYD	ru	доллар Островов Кайман
GIP	ru	гибралтарский фунт
MVR	ru	мальдивская руфия
SSP	ru	южносуданский фунт
RON	ru	румынский лей
STN	ru	добра Сан-Томе и Принсипи
RWF	ru	франк Руанды
NAD	ru	доллар Намибии
JOD	ru	иорданский динар
VUV	ru	вату Вануату
BBD	ru	барбадосский доллар
UAH	ru	украинская гривна
CHF	ru	швейцарский франк
SOS	ru	сомалийский шиллинг
CAD	ru	канадский доллар
GEL	ru	грузинский лари
LKR	ru	шри-ланкийская рупия
BOB	ru	боливийский боливиано
MDL	ru	молдавский лей
NZD	ru	новозеландский доллар
MMK	ru	мьянманский кьят
LRD	ru	либерийский доллар
VND	ru	вьетнамский донг
PGK	ru	кина Папуа – Новой Гвинеи
XCG	ru	карибский гульден
VES	ru	венесуэльский боливар
PYG	ru	парагвайский гуарани
BZD	ru	белизский доллар
SRD	ru	суринамский доллар
SEK	ru	шведская крона
DZD	ru	алжирский динар
ARS	ru	аргентинский песо
KHR	ru	камбоджийский риель
FJD	ru	доллар Фиджи
PEN	ru	перуанский соль
UZS	ru	узбекский сум
DJF	ru	франк Джибути
BRL	ru	бразильский реал
HNL	ru	гондурасская лемпира
LBP	ru	ливанский фунт
EGP	ru	египетский фунт
TJS	ru	таджикский сомони
USD	ru	доллар США
FKP	ru	фунт Фолклендских островов
TMT	ru	новый туркменский манат
PHP	ru	филиппинский песо
LSL	ru	лоти
ISK	ru	исландская крона
YER	ru	йеменский риал
SBD	ru	доллар Соломоновых Островов
SLE	ru	леоне
MUR	ru	маврикийская рупия
CNY	ru	китайский юань
PAB	ru	панамский бальбоа
BAM	ru	конвертируемая марка Боснии и Герцеговины
NOK	ru	норвежская крона
KMF	ru	коморский франк
BDT	ru	бангладешская така
INR	ru	индийская рупия
HTG	ru	гаитянский гурд
ALL	ru	албанский лек
MWK	ru	малавийская квача
MAD	ru	марокканский дирхам
GMD	ru	гамбийский даласи
AMD	ru	армянский драм
UGX	ru	угандийский шиллинг
KRW	ru	южнокорейская вона
DOP	ru	доминиканский песо
MKD	ru	македонский денар
KWD	ru	кувейтский динар
EUR	ru	евро
ZWL	ru	Доллар Зимбабве (2009)
TZS	ru	танзанийский шиллинг
BYN	ru	белорусский рубль
ZMW	ru	замбийская квача
XAF	ru	франк КФА ВЕАС
NIO	ru	никарагуанская кордоба
KZT	ru	казахский тенге
SGD	ru	сингапурский доллар
JPY	ru	японская иена
IQD	ru	иракский динар
WST	ru	самоанская тала
BIF	ru	бурундийский франк
GHS	ru	ганский седи
XDR	ru	СДР (специальные права заимствования)
SZL	ru	свазилендский лилангени
BSD	ru	багамский доллар
GNF	ru	гвинейский франк
THB	en	Thai baht
CDF	en	Congolese franc
HKD	en	Hong Kong dollar
IDR	en	Indonesian rupiah
CLF	en	Chilean unit of account (UF)
TRY	en	Turkish lira
ETB	en	Ethiopian birr
ILS	en	Israeli new shekel
MOP	en	Macanese pataca
SYP	en	Syrian pound
AOA	en	Angolan kwanza
SCR	en	Seychellois rupee
MRU	en	Mauritanian ouguiya
HRK	en	Croatian kuna
GTQ	en	Guatemalan quetzal
SLL	en	Sierra Leonean leone (1964—2022)
HUF	en	Hungarian forint
MXN	en	Mexican peso
CVE	en	Cape Verdean escudo
RUB	en	Russian ruble
JMD	en	Jamaican dollar
AWG	en	Aruban florin
ZAR	en	South African rand
SAR	en	Saudi riyal
BWP	en	Botswanan pula
TOP	en	Tongan paʻanga
MNT	en	Mongolian tugrik
IRR	en	Iranian rial
UYU	en	Uruguayan peso
TTD	en	Trinidad & Tobago dollar
MYR	en	Malaysian ringgit
BND	en	Brunei dollar
ANG	en	Netherlands Antillean guilder
BTN	en	Bhutanese ngultrum
QAR	en	Qatari riyal
SHP	en	St. Helena pound
CUP	en	Cuban peso
BMD	en	Bermudan dollar
SDG	en	Sudanese pound
LAK	en	Laotian kip
AED	en	UAE dirham
CLP	en	Chilean peso
RSD	en	Serbian dinar
KGS	en	Kyrgyz som
KES	en	Kenyan shilling
XPF	en	CFP franc
AZN	en	Azerbaijani manat
XCD	en	East Caribbean dollar
AFN	en	Afghan Afghani
ERN	en	Eritrean nakfa
AUD	en	Australian dollar
CNH	en	Chinese yuan (offshore)
NGN	en	Nigerian naira
BGN	en	Bulgarian lev
TWD	en	New Taiwan dollar
LYD	en	Libyan dinar
NPR	en	Nepalese rupee
PLN	en	Polish zloty
COP	en	Colombian peso
CRC	en	Costa Rican colón
BHD	en	Bahraini dinar
PKR	en	Pakistani rupee
XOF	en	West African CFA franc
GBP	en	British pound
ZWG	en	Zimbabwean gold
TND	en	Tunisian dinar
OMR	en	Omani rial
MZN	en	Mozambican metical
GYD	en	Guyanaese dollar
CZK	en	Czech koruna
MGA	en	Malagasy ariary
DKK	en	Danish krone
KYD	en	Cayman Islands dollar
GIP	en	Gibraltar pound
MVR	en	Maldivian rufiyaa
SSP	en	South Sudanese pound
RON	en	Romanian leu
STN	en	São Tomé & Príncipe dobra
RWF	en	Rwandan franc
NAD	en	Namibian dollar
JOD	en	Jordanian dinar
VUV	en	Vanuatu vatu
BBD	en	Barbadian dollar
UAH	en	Ukrainian hryvnia
CHF	en	Swiss franc
SOS	en	Somali shilling
CAD	en	Canadian dollar
GEL	en	Georgian lari
LKR	en	Sri Lankan rupee
BOB	en	Bolivian boliviano
MDL	en	Moldovan leu
NZD	en	New Zealand dollar
MMK	en	Myanmar kyat
LRD	en	Liberian dollar
VND	en	Vietnamese dong
PGK	en	Papua New Guinean kina
XCG	en	Caribbean guilder
VES	en	Venezuelan bolívar
PYG	en	Paraguayan guarani
BZD	en	Belize dollar
SRD	en	Surinamese dollar
SEK	en	Swedish krona
DZD	en	Algerian dinar
ARS	en	Argentine peso
KHR	en	Cambodian riel
FJD	en	Fijian dollar
PEN	en	Peruvian sol
UZS	en	Uzbekistani som
DJF	en	Djiboutian franc
BRL	en	Brazilian real
HNL	en	Honduran lempira
LBP	en	Lebanese pound
EGP	en	Egyptian pound
TJS	en	Tajikistani somoni
USD	en	US dollar
FKP	en	Falkland Islands pound
TMT	en	Turkmenistani manat
PHP	en	Philippine peso
LSL	en	Lesotho loti
ISK	en	Icelandic króna
YER	en	Yemeni rial
SBD	en	Solomon Islands dollar
SLE	en	Sierra Leonean leone
MUR	en	Mauritian rupee
CNY	en	Chinese yuan
PAB	en	Panamanian balboa
BAM	en	Bosnia-Herzegovina convertible mark
NOK	en	Norwegian krone
KMF	en	Comorian franc
BDT	en	Bangladeshi taka
INR	en	Indian rupee
HTG	en	Haitian gourde
ALL	en	Albanian lek
MWK	en	Malawian kwacha
MAD	en	Moroccan dirham
GMD	en	Gambian dalasi
AMD	en	Armenian dram
UGX	en	Ugandan shilling
KRW	en	South Korean won
DOP	en	Dominican peso
MKD	en	Macedonian denar
KWD	en	Kuwaiti dinar
ZWL	en	Zimbabwean dollar (2009–2024)
TZS	en	Tanzanian shilling
BYN	en	Belarusian ruble
ZMW	en	Zambian kwacha
XAF	en	Central African CFA franc
NIO	en	Nicaraguan córdoba
KZT	en	Kazakhstani tenge
SGD	en	Singapore dollar
JPY	en	Japanese yen
IQD	en	Iraqi dinar
WST	en	Samoan tala
BIF	en	Burundian franc
GHS	en	Ghanaian cedi
XDR	en	special drawing rights
SZL	en	Swazi lilangeni
BSD	en	Bahamian dollar
GNF	en	Guinean franc
THB	de	Thailändischer Baht
CDF	de	Kongo-Franc
HKD	de	Hongkong-Dollar
IDR	de	Indonesische Rupiah
CLF	de	Chilenische Unidades de Fomento
TRY	de	Türkische Lira
ETB	de	Äthiopischer Birr
ILS	de	Israelischer Neuer Schekel
MOP	de	Macao-Pataca
SYP	de	Syrisches Pfund
AOA	de	Angolanischer Kwanza
SCR	de	Seychellen-Rupie
MRU	de	Mauretanischer Ouguiya
HRK	de	Kroatischer Kuna
GTQ	de	Guatemaltekischer Quetzal
SLL	de	Sierra-leonischer Leone (1964–2022)
HUF	de	Ungarischer Forint
MXN	de	Mexikanischer Peso
CVE	de	Cabo-Verde-Escudo
RUB	de	Russischer Rubel
JMD	de	Jamaika-Dollar
AWG	de	Aruba-Florin
ZAR	de	Südafrikanischer Rand
SAR	de	Saudi-Rial
BWP	de	Botswanischer Pula
TOP	de	Tongaischer Paʻanga
MNT	de	Mongolischer Tögrög
IRR	de	Iranischer Rial
UYU	de	Uruguayischer Peso
TTD	de	Trinidad-und-Tobago-Dollar
MYR	de	Malaysischer Ringgit
BND	de	Brunei-Dollar
ANG	de	Niederländische-Antillen-Gulden
BTN	de	Bhutan-Ngultrum
QAR	de	Katar-Riyal
SHP	de	St.-Helena-Pfund
CUP	de	Kubanischer Peso
BMD	de	Bermuda-Dollar
SDG	de	Sudanesisches Pfund
LAK	de	Laotischer Kip
AED	de	VAE-Dirham
CLP	de	Chilenischer Peso
RSD	de	Serbischer Dinar
KGS	de	Kirgisischer Som
KES	de	Kenia-Schilling
XPF	de	CFP-Franc
AZN	de	Aserbaidschan-Manat
XCD	de	Ostkaribischer Dollar
AFN	de	Afghanischer Afghani
ERN	de	Eritreischer Nakfa
AUD	de	Australischer Dollar
CNH	de	Renminbi-Yuan (Offshore)
NGN	de	Nigerianischer Naira
BGN	de	Bulgarischer Lew
TWD	de	Neuer Taiwan-Dollar
LYD	de	Libyscher Dinar
NPR	de	Nepalesische Rupie
PLN	de	Polnischer Złoty
COP	de	Kolumbianischer Peso
CRC	de	Costa-Rica-Colón
BHD	de	Bahrain-Dinar
PKR	de	Pakistanische Rupie
XOF	de	CFA-Franc (BCEAO)
GBP	de	Britisches Pfund
ZWG	de	Simbabwe-Gold
TND	de	Tunesischer Dinar
OMR	de	Omanischer Rial
MZN	de	Mosambikanischer Metical
GYD	de	Guyana-Dollar
CZK	de	Tschechische Krone
MGA	de	Madagaskar-Ariary
DKK	de	Dänische Krone
KYD	de	Kaiman-Dollar
GIP	de	Gibraltar-Pfund
MVR	de	Malediven-Rufiyaa
SSP	de	Südsudanesisches Pfund
RON	de	Rumänischer Leu
STN	de	São-toméischer Dobra
RWF	de	Ruanda-Franc
NAD	de	Namibia-Dollar
JOD	de	Jordanischer Dinar
VUV	de	Vanuatu-Vatu
BBD	de	Barbados-Dollar
UAH	de	Ukrainische Hrywnja
CHF	de	Schweizer Franken
SOS	de	Somalia-Schilling
CAD	de	Kanadischer Dollar
GEL	de	Georgischer Lari
LKR	de	Sri-Lanka-Rupie
BOB	de	Bolivianischer Boliviano
MDL	de	Moldau-Leu
NZD	de	Neuseeland-Dollar
MMK	de	Myanmarischer Kyat
LRD	de	Liberianischer Dollar
VND	de	Vietnamesischer Dong
PGK	de	Papua-neuguineischer Kina
XCG	de	Karibischer Gulden
VES	de	Venezolanischer Bolívar
PYG	de	Paraguayischer Guaraní
BZD	de	Belize-Dollar
SRD	de	Suriname-Dollar
SEK	de	Schwedische Krone
DZD	de	Algerischer Dinar
ARS	de	Argentinischer Peso
KHR	de	Kambodschanischer Riel
FJD	de	Fidschi-Dollar
PEN	de	Peruanischer Sol
UZS	de	Usbekistan-Sum
DJF	de	Dschibuti-Franc
BRL	de	Brasilianischer Real
HNL	de	Honduras-Lempira
LBP	de	Libanesisches Pfund
EGP	de	Ägyptisches Pfund
TJS	de	Tadschikistan-Somoni
USD	de	US-Dollar
FKP	de	Falkland-Pfund
TMT	de	Turkmenistan-Manat
PHP	de	Philippinischer Peso
LSL	de	Loti
ISK	de	Isländische Krone
YER	de	Jemen-Rial
SBD	de	Salomonen-Dollar
SLE	de	Sierra-leonischer Leone
MUR	de	Mauritius-Rupie
CNY	de	Chinesischer Yuan
PAB	de	Panamaischer Balboa
BAM	de	Konvertible Mark Bosnien und Herzegowina
NOK	de	Norwegische Krone
KMF	de	Komoren-Franc
BDT	de	Bangladesch-Taka
INR	de	Indische Rupie
HTG	de	Haitianische Gourde
ALL	de	Albanischer Lek
MWK	de	Malawi-Kwacha
MAD	de	Marokkanischer Dirham
GMD	de	Gambia-Dalasi
AMD	de	Armenischer Dram
UGX	de	Uganda-Schilling
KRW	de	Südkoreanischer Won
DOP	de	Dominikanischer Peso
MKD	de	Mazedonischer Denar
KWD	de	Kuwait-Dinar
EUR	de	Euro
ZWL	de	Simbabwe-Dollar (2009)
TZS	de	Tansania-Schilling
BYN	de	Weißrussischer Rubel
ZMW	de	Kwacha
XAF	de	CFA-Franc (BEAC)
NIO	de	Nicaragua-Córdoba
KZT	de	Kasachischer Tenge
SGD	de	Singapur-Dollar
JPY	de	Japanischer Yen
IQD	de	Irakischer Dinar
WST	de	Samoanischer Tala
BIF	de	Burundi-Franc
GHS	de	Ghanaischer Cedi
XDR	de	Sonderziehungsrechte
SZL	de	Swasiländischer Lilangeni
BSD	de	Bahamas-Dollar
GNF	de	Guinea-Franc
THB	fr	baht thaïlandais
CDF	fr	franc congolais
HKD	fr	dollar de Hong Kong
IDR	fr	roupie indonésienne
CLF	fr	unité d’investissement chilienne
TRY	fr	livre turque
ETB	fr	birr éthiopien
ILS	fr	nouveau shekel israélien
MOP	fr	pataca macanaise
SYP	fr	livre syrienne
AOA	fr	kwanza angolais
SCR	fr	roupie des Seychelles
MRU	fr	ouguiya mauritanien
HRK	fr	kuna croate
GTQ	fr	quetzal guatémaltèque
SLL	fr	leone sierra-léonais (1964—2022)
HUF	fr	forint hongrois
MXN	fr	peso mexicain
CVE	fr	escudo capverdien
RUB	fr	rouble russe
JMD	fr	dollar jamaïcain
AWG	fr	florin arubais
ZAR	fr	rand sud-africain
SAR	fr	riyal saoudien
BWP	fr	pula botswanais
TOP	fr	pa’anga tongan
MNT	fr	tugrik mongol
IRR	fr	riyal iranien
UYU	fr	peso uruguayen
TTD	fr	dollar de Trinité-et-Tobago
MYR	fr	ringgit malais
BND	fr	dollar brunéien
ANG	fr	florin antillais
BTN	fr	ngultrum bouthanais
QAR	fr	riyal qatari
SHP	fr	livre de Sainte-Hélène
CUP	fr	peso cubain
BMD	fr	dollar bermudien
SDG	fr	livre soudanaise
LAK	fr	kip laotien
AED	fr	dirham des Émirats arabes unis
CLP	fr	peso chilien
RSD	fr	dinar serbe
KGS	fr	som kirghize
KES	fr	shilling kényan
XPF	fr	franc CFP
AZN	fr	manat azéri
XCD	fr	dollar des Caraïbes orientales
AFN	fr	afghani afghan
ERN	fr	nafka érythréen
AUD	fr	dollar australien
CNH	fr	yuan chinois (zone extracôtière)
NGN	fr	naira nigérian
BGN	fr	lev bulgare
TWD	fr	nouveau dollar taïwanais
LYD	fr	dinar libyen
NPR	fr	roupie népalaise
PLN	fr	zloty polonais
COP	fr	peso colombien
CRC	fr	colón costaricain
BHD	fr	dinar bahreïni
PKR	fr	roupie pakistanaise
XOF	fr	franc CFA (BCEAO)
GBP	fr	livre sterling
ZWG	fr	or du Zimbabwe
TND	fr	dinar tunisien
OMR	fr	riyal omanais
MZN	fr	metical mozambicain
GYD	fr	dollar du Guyana
CZK	fr	couronne tchèque
MGA	fr	ariary malgache
DKK	fr	couronne danoise
KYD	fr	dollar des îles Caïmans
GIP	fr	livre de Gibraltar
MVR	fr	rufiyaa maldivienne
SSP	fr	livre sud-soudanaise
RON	fr	leu roumain
STN	fr	dobra santoméen
RWF	fr	franc rwandais
NAD	fr	dollar namibien
JOD	fr	dinar jordanien
VUV	fr	vatu vanuatuan
BBD	fr	dollar barbadien
UAH	fr	hryvnia ukrainienne
CHF	fr	franc suisse
SOS	fr	shilling somalien
CAD	fr	dollar canadien
GEL	fr	lari géorgien
LKR	fr	roupie srilankaise
BOB	fr	boliviano bolivien
MDL	fr	leu moldave
NZD	fr	dollar néo-zélandais
MMK	fr	kyat myanmarais
LRD	fr	dollar libérien
VND	fr	dông vietnamien
PGK	fr	kina papouan-néo-guinéen
XCG	fr	florin caribéen
VES	fr	bolivar vénézuélien
PYG	fr	guaraní paraguayen
BZD	fr	dollar bélizéen
SRD	fr	dollar surinamais
SEK	fr	couronne suédoise
DZD	fr	dinar algérien
ARS	fr	peso argentin
KHR	fr	riel cambodgien
FJD	fr	dollar fidjien
PEN	fr	sol péruvien
UZS	fr	sum ouzbek
DJF	fr	franc djiboutien
BRL	fr	réal brésilien
HNL	fr	lempira hondurien
LBP	fr	livre libanaise
EGP	fr	livre égyptienne
TJS	fr	somoni tadjik
USD	fr	dollar des États-Unis
FKP	fr	livre des îles Malouines
TMT	fr	nouveau manat turkmène
PHP	fr	peso philippin
LSL	fr	loti lesothan
ISK	fr	couronne islandaise
YER	fr	riyal yéménite
SBD	fr	dollar des îles Salomon
SLE	fr	leone sierra-léonais
MUR	fr	roupie mauricienne
CNY	fr	yuan renminbi chinois
PAB	fr	balboa panaméen
BAM	fr	mark convertible bosniaque
NOK	fr	couronne norvégienne
KMF	fr	franc comorien
BDT	fr	taka bangladeshi
INR	fr	roupie indienne
HTG	fr	gourde haïtienne
ALL	fr	lek albanais
MWK	fr	kwacha malawite
MAD	fr	dirham marocain
GMD	fr	dalasi gambien
AMD	fr	dram arménien
UGX	fr	shilling ougandais
KRW	fr	won sud-coréen
DOP	fr	peso dominicain
MKD	fr	denar macédonien
KWD	fr	dinar koweïtien
EUR	fr	euro
ZWL	fr	dollar zimbabwéen (2009)
TZS	fr	shilling tanzanien
BYN	fr	rouble biélorusse
ZMW	fr	kwacha zambien
XAF	fr	franc CFA (BEAC)
NIO	fr	córdoba oro nicaraguayen
KZT	fr	tenge kazakh
SGD	fr	dollar de Singapour
JPY	fr	yen japonais
IQD	fr	dinar irakien
WST	fr	tala samoan
BIF	fr	franc burundais
GHS	fr	cédi ghanéen
XDR	fr	droit de tirage spécial
SZL	fr	lilangeni swazi
BSD	fr	dollar bahaméen
GNF	fr	franc guinéen
THB	es	bat tailandés
CDF	es	franco congoleño
HKD	es	dólar hongkonés
IDR	es	rupia indonesia
CLF	es	unidad de fomento chilena
TRY	es	lira turca
ETB	es	bir etíope
ILS	es	nuevo séquel israelí
MOP	es	pataca macaense
SYP	es	libra siria
AOA	es	kuanza angoleño
SCR	es	rupia seychellense
MRU	es	uguiya mauritano
HRK	es	kuna croata
GTQ	es	quetzal guatemalteco
SLL	es	leona sierraleonesa (1964–2022)
HUF	es	forinto húngaro
MXN	es	peso mexicano
CVE	es	escudo de Cabo Verde
RUB	es	rublo ruso
JMD	es	dólar jamaicano
AWG	es	florín arubeño
ZAR	es	rand sudafricano
SAR	es	rial saudí
BWP	es	pula botsuano
TOP	es	paanga tongano
MNT	es	tugrik mongol
IRR	es	rial iraní
UYU	es	peso uruguayo
TTD	es	dólar de Trinidad y Tobago
MYR	es	ringit malasio
BND	es	dólar bruneano
ANG	es	florín antillano
BTN	es	gultrum butanés
QAR	es	rial catarí
SHP	es	libra de Santa Elena
CUP	es	peso cubano
BMD	es	dólar bermudeño
SDG	es	libra sudanesa
LAK	es	kip laosiano
AED	es	dírham de los Emiratos Árabes Unidos
CLP	es	peso chileno
RSD	es	dinar serbio
KGS	es	som kirguís
KES	es	chelín keniano
XPF	es	franco CFP
AZN	es	manat azerbaiyano
XCD	es	dólar del Caribe Oriental
AFN	es	afgani afgano
ERN	es	nakfa eritreo
AUD	es	dólar australiano
CNH	es	yuan chino (extracontinental)
NGN	es	naira nigeriano
BGN	es	leva búlgara
TWD	es	nuevo dólar taiwanés
LYD	es	dinar libio
NPR	es	rupia nepalí
PLN	es	esloti polaco
COP	es	peso colombiano
CRC	es	colón costarricense
BHD	es	dinar bareiní
PKR	es	rupia pakistaní
XOF	es	franco CFA de África Occidental
GBP	es	libra esterlina
ZWG	es	oro zimbabuense
TND	es	dinar tunecino
OMR	es	rial omaní
MZN	es	metical mozambiqueño
GYD	es	dólar guyanés
CZK	es	corona checa
MGA	es	ariari malgache
DKK	es	corona danesa
KYD	es	dólar de las Islas Caimán
GIP	es	libra gibraltareña
MVR	es	rufiya maldiva
SSP	es	libra sursudanesa
RON	es	leu rumano
STN	es	dobra santotomense
RWF	es	franco ruandés
NAD	es	dólar namibio
JOD	es	dinar jordano
VUV	es	vatu vanuatense
BBD	es	dólar barbadense
UAH	es	grivna ucraniana
CHF	es	franco suizo
SOS	es	chelín somalí
CAD	es	dólar canadiense
GEL	es	lari georgiano
LKR	es	rupia esrilanquesa
BOB	es	boliviano
MDL	es	leu moldavo
NZD	es	dólar neozelandés
MMK	es	kiat de Myanmar
LRD	es	dólar liberiano
VND	es	dong vietnamita
PGK	es	kina papú
XCG	es	florín caribeño
VES	es	bolívar venezolano
PYG	es	guaraní paraguayo
BZD	es	dólar beliceño
SRD	es	dólar surinamés
SEK	es	corona sueca
DZD	es	dinar argelino
ARS	es	peso argentino
KHR	es	riel camboyano
FJD	es	dólar fiyiano
PEN	es	sol peruano
UZS	es	sum uzbeko
DJF	es	franco yibutiano
BRL	es	real brasileño
HNL	es	lempira hondureño
LBP	es	libra libanesa
EGP	es	libra egipcia
TJS	es	somoni tayiko
USD	es	dólar estadounidense
FKP	es	libra malvinense
TMT	es	manat turcomano
PHP	es	peso filipino
LSL	es	loti lesotense
ISK	es	corona islandesa
YER	es	rial yemení
SBD	es	dólar salomonense
SLE	es	leona sierraleonesa
MUR	es	rupia mauriciana
CNY	es	yuan renminbi
PAB	es	balboa panameño
BAM	es	marco convertible de Bosnia y Herzegovina
NOK	es	corona noruega
KMF	es	franco comorense
BDT	es	taka bangladesí
INR	es	rupia india
HTG	es	gurde haitiano
ALL	es	lek albanés
MWK	es	kuacha malauí
MAD	es	dírham marroquí
GMD	es	dalasi gambiano
AMD	es	dram armenio
UGX	es	chelín ugandés
KRW	es	won surcoreano
DOP	es	peso dominicano
MKD	es	dinar macedonio
KWD	es	dinar kuwaití
EUR	es	euro
ZWL	es	dólar zimbabuense
TZS	es	chelín tanzano
BYN	es	rublo bielorruso
ZMW	es	kuacha zambiano
XAF	es	franco CFA de África Central
NIO	es	córdoba oro
KZT	es	tengue kazajo
SGD	es	dólar singapurense
JPY	es	yen japonés
IQD	es	dinar iraquí
WST	es	tala samoano
BIF	es	franco burundés
GHS	es	cedi ghanés
XDR	es	derechos especiales de giro
SZL	es	lilangeni esuatiní
BSD	es	dólar bahameño
GNF	es	franco guineano
THB	it	baht thailandese
CDF	it	franco congolese
HKD	it	dollaro di Hong Kong
IDR	it	rupia indonesiana
CLF	it	unidades de fomento chilene
TRY	it	lira turca
ETB	it	birr etiope
ILS	it	nuovo siclo israeliano
MOP	it	pataca di Macao
SYP	it	lira siriana
AOA	it	kwanza angolano
SCR	it	rupia delle Seychelles
MRU	it	ouguiya della Mauritania
HRK	it	kuna croata
GTQ	it	quetzal guatemalteco
SLL	it	leone della Sierra Leone (1964–2022)
HUF	it	fiorino ungherese
MXN	it	peso messicano
CVE	it	escudo capoverdiano
RUB	it	rublo russo
JMD	it	dollaro giamaicano
AWG	it	fiorino di Aruba
ZAR	it	rand sudafricano
SAR	it	riyal saudita
BWP	it	pula del Botswana
TOP	it	paʻanga tongano
MNT	it	tugrik mongolo
IRR	it	rial iraniano
UYU	it	peso uruguayano
TTD	it	dollaro di Trinidad e Tobago
MYR	it	ringgit malese
BND	it	dollaro del Brunei
ANG	it	fiorino delle Antille olandesi
BTN	it	ngultrum bhutanese
QAR	it	rial qatariano
SHP	it	sterlina di Sant’Elena
CUP	it	peso cubano
BMD	it	dollaro delle Bermuda
SDG	it	sterlina sudanese
LAK	it	kip laotiano
AED	it	dirham degli EAU
CLP	it	peso cileno
RSD	it	dinaro serbo
KGS	it	som kirghiso
KES	it	scellino keniota
XPF	it	franco CFP
AZN	it	manat azero
XCD	it	dollaro dei Caraibi orientali
AFN	it	afghani
ERN	it	nakfa eritreo
AUD	it	dollaro australiano
CNH	it	renmimbi cinese offshore
NGN	it	naira nigeriana
BGN	it	lev bulgaro
TWD	it	nuovo dollaro taiwanese
LYD	it	dinaro libico
NPR	it	rupia nepalese
PLN	it	zloty polacco
COP	it	peso colombiano
CRC	it	colón costaricano
BHD	it	dinaro del Bahrein
PKR	it	rupia pakistana
XOF	it	franco CFA BCEAO
GBP	it	sterlina britannica
ZWG	it	Zimbabwe Gold
TND	it	dinaro tunisino
OMR	it	rial omanita
MZN	it	metical mozambicano
GYD	it	dollaro della Guyana
CZK	it	corona ceca
MGA	it	ariary malgascio
DKK	it	corona danese
KYD	it	dollaro delle Isole Cayman
GIP	it	sterlina di Gibilterra
MVR	it	rufiyaa delle Maldive
SSP	it	sterlina sud-sudanese
RON	it	leu rumeno
STN	it	dobra di Sao Tomé e Príncipe
RWF	it	franco ruandese
NAD	it	dollaro namibiano
JOD	it	dinaro giordano
VUV	it	vatu di Vanuatu
BBD	it	dollaro di Barbados
UAH	it	grivnia ucraina
CHF	it	franco svizzero
SOS	it	scellino somalo
CAD	it	dollaro canadese
GEL	it	lari georgiano
LKR	it	rupia di Sri Lanka
BOB	it	boliviano
MDL	it	leu moldavo
NZD	it	dollaro neozelandese
MMK	it	kyat di Myanmar
LRD	it	dollaro liberiano
VND	it	dong vietnamita
PGK	it	kina papuana
XCG	it	fiorino caraibico
VES	it	bolívar venezuelano
PYG	it	guaraní paraguayano
BZD	it	dollaro del Belize
SRD	it	dollaro del Suriname
SEK	it	corona svedese
DZD	it	dinaro algerino
ARS	it	peso argentino
KHR	it	riel cambogiano
FJD	it	dollaro delle Figi
PEN	it	sol peruviano
UZS	it	sum uzbeco
DJF	it	franco di Gibuti
BRL	it	real brasiliano
HNL	it	lempira honduregna
LBP	it	lira libanese
EGP	it	sterlina egiziana
TJS	it	somoni tagiko
USD	it	dollaro statunitense
FKP	it	sterlina delle Falkland
TMT	it	manat turkmeno
PHP	it	peso filippino
LSL	it	loti del Lesotho
ISK	it	corona islandese
YER	it	rial yemenita
SBD	it	dollaro delle Isole Salomone
SLE	it	leone della Sierra Leone
MUR	it	rupia mauriziana
CNY	it	yuan cinese
PAB	it	balboa panamense
BAM	it	marco convertibile della Bosnia-Herzegovina
NOK	it	corona norvegese
KMF	it	franco comoriano
BDT	it	taka bengalese
INR	it	rupia indiana
HTG	it	gourde haitiano
ALL	it	lek albanese
MWK	it	kwacha malawiano
MAD	it	dirham marocchino
GMD	it	dalasi gambiano
AMD	it	dram armeno
UGX	it	scellino ugandese
KRW	it	won sudcoreano
DOP	it	peso dominicano
MKD	it	dinaro macedone
KWD	it	dinaro kuwaitiano
EUR	it	euro
ZWL	it	dollaro zimbabwiano (2009)
TZS	it	scellino della Tanzania
BYN	it	rublo bielorusso
ZMW	it	kwacha zambiano
XAF	it	franco CFA BEAC
NIO	it	córdoba nicaraguense
KZT	it	tenge kazako
SGD	it	dollaro di Singapore
JPY	it	yen giapponese
IQD	it	dinaro iracheno
WST	it	tala samoano
BIF	it	franco del Burundi
GHS	it	cedi ghanese
XDR	it	diritti speciali di incasso
SZL	it	lilangeni
BSD	it	dollaro delle Bahamas
GNF	it	franco della Guinea
THB	pt	Baht tailandês
CDF	pt	Franco congolês
HKD	pt	Dólar de Hong Kong
IDR	pt	Rupia indonésia
CLF	pt	Unidade de fomento chilena
TRY	pt	Lira turca
ETB	pt	Birr etíope
ILS	pt	Novo shekel israelense
MOP	pt	Pataca macaense
SYP	pt	Libra síria
AOA	pt	Kwanza angolano
SCR	pt	Rupia seichelense
MRU	pt	Ouguiya mauritana
HRK	pt	Kuna croata
GTQ	pt	Quetzal guatemalteco
SLL	pt	Leone de Serra Leoa (1964—2022)
HUF	pt	Florim húngaro
MXN	pt	Peso mexicano
CVE	pt	Escudo cabo-verdiano
RUB	pt	Rublo russo
JMD	pt	Dólar jamaicano
AWG	pt	Florim arubano
ZAR	pt	Rand sul-africano
SAR	pt	Riyal saudita
BWP	pt	Pula botsuanesa
TOP	pt	Paʻanga tonganesa
MNT	pt	Tugrik mongol
IRR	pt	Rial iraniano
UYU	pt	Peso uruguaio
TTD	pt	Dólar de Trinidad e Tobago
MYR	pt	Ringgit malaio
BND	pt	Dólar bruneano
ANG	pt	Florim das Antilhas Holandesas
BTN	pt	Ngultrum butanês
QAR	pt	Rial catariano
SHP	pt	Libra de Santa Helena
CUP	pt	Peso cubano
BMD	pt	Dólar bermudense
SDG	pt	Libra sudanesa
LAK	pt	Kip laosiano
AED	pt	Dirham dos EAU
CLP	pt	Peso chileno
RSD	pt	Dinar sérvio
KGS	pt	Som quirguiz
KES	pt	Xelim queniano
XPF	pt	Franco CFP
AZN	pt	Manat azeri
XCD	pt	Dólar do Caribe Oriental
AFN	pt	Afegane afegão
ERN	pt	Nakfa da Eritreia
AUD	pt	Dólar australiano
CNH	pt	Yuan chinês (offshore)
NGN	pt	Naira nigeriana
BGN	pt	Lev búlgaro
TWD	pt	Novo dólar taiwanês
LYD	pt	Dinar líbio
NPR	pt	Rupia nepalesa
PLN	pt	Zloty polonês
COP	pt	Peso colombiano
CRC	pt	Colón costarriquenho
BHD	pt	Dinar bareinita
PKR	pt	Rupia paquistanesa
XOF	pt	Franco CFA de BCEAO
GBP	pt	Libra esterlina
ZWG	pt	Ouro zimbabueano
TND	pt	Dinar tunisiano
OMR	pt	Rial omanense
MZN	pt	Metical moçambicano
GYD	pt	Dólar guianense
CZK	pt	Coroa tcheca
MGA	pt	Ariary malgaxe
DKK	pt	Coroa dinamarquesa
KYD	pt	Dólar das Ilhas Cayman
GIP	pt	Libra de Gibraltar
MVR	pt	Rupia maldivana
SSP	pt	Libra sul-sudanesa
RON	pt	Leu romeno
STN	pt	Dobra de São Tomé e Príncipe
RWF	pt	Franco ruandês
NAD	pt	Dólar namibiano
JOD	pt	Dinar jordaniano
VUV	pt	Vatu de Vanuatu
BBD	pt	Dólar barbadense
UAH	pt	Hryvnia ucraniano
CHF	pt	Franco suíço
SOS	pt	Xelim somali
CAD	pt	Dólar canadense
GEL	pt	Lari georgiano
LKR	pt	Rupia cingalesa
BOB	pt	Boliviano da Bolívia
MDL	pt	Leu moldávio
NZD	pt	Dólar neozelandês
MMK	pt	Quiate mianmarense
LRD	pt	Dólar liberiano
VND	pt	Dong vietnamita
PGK	pt	Kina papuásia
XCG	pt	Florim do Caribe
VES	pt	Bolívar venezuelano
PYG	pt	Guarani paraguaio
BZD	pt	Dólar belizenho
SRD	pt	Dólar surinamês
SEK	pt	Coroa sueca
DZD	pt	Dinar argelino
ARS	pt	Peso argentino
KHR	pt	Riel cambojano
FJD	pt	Dólar fijiano
PEN	pt	Novo sol peruano
UZS	pt	Som uzbeque
DJF	pt	Franco djiboutiano
BRL	pt	Real brasileiro
HNL	pt	Lempira hondurenha
LBP	pt	Libra libanesa
EGP	pt	Libra egípcia
TJS	pt	Somoni tadjique
USD	pt	Dólar americano
FKP	pt	Libra malvinense
TMT	pt	Manat turcomeno
PHP	pt	Peso filipino
LSL	pt	Loti lesotiano
ISK	pt	Coroa islandesa
YER	pt	Rial iemenita
SBD	pt	Dólar das Ilhas Salomão
SLE	pt	Leone de Serra Leoa
MUR	pt	Rupia mauriciana
CNY	pt	Yuan chinês
PAB	pt	Balboa panamenho
BAM	pt	Marco conversível da Bósnia e Herzegovina
NOK	pt	Coroa norueguesa
KMF	pt	Franco comoriano
BDT	pt	Taka bengali
INR	pt	Rupia indiana
HTG	pt	Gourde haitiano
ALL	pt	Lek albanês
MWK	pt	Kwacha malauiana
MAD	pt	Dirham marroquino
GMD	pt	Dalasi gambiano
AMD	pt	Dram armênio
UGX	pt	Xelim ugandense
KRW	pt	Won sul-coreano
DOP	pt	Peso dominicano
MKD	pt	Dinar macedônio
KWD	pt	Dinar kuwaitiano
EUR	pt	Euro
ZWL	pt	Dólar do Zimbábue (2009)
TZS	pt	Xelim tanzaniano
BYN	pt	Rublo bielorrusso
ZMW	pt	Kwacha zambiano
XAF	pt	Franco CFA de BEAC
NIO	pt	Córdoba nicaraguense
KZT	pt	Tenge cazaque
SGD	pt	Dólar singapuriano
JPY	pt	Iene japonês
IQD	pt	Dinar iraquiano
WST	pt	Tala samoano
BIF	pt	Franco burundiano
GHS	pt	Cedi ganês
XDR	pt	Direitos de desenho especiais
SZL	pt	Lilangeni suazi
BSD	pt	Dólar bahamense
GNF	pt	Franco guineano
THB	ja	タイ バーツ
CDF	ja	コンゴ フラン
HKD	ja	香港ドル
IDR	ja	インドネシア ルピア
CLF	ja	チリ ウニダ・デ・フォメント (UF)
TRY	ja	トルコ リラ
ETB	ja	エチオピア ブル
ILS	ja	イスラエル新シェケル
MOP	ja	マカオ パタカ
SYP	ja	シリア ポンド
AOA	ja	アンゴラ クワンザ
SCR	ja	セーシェル ルピー
MRU	ja	モーリタニア ウギア
HRK	ja	クロアチア クーナ
GTQ	ja	グアテマラ ケツァル
SLL	ja	シエラレオネ レオン (1964—2022)
HUF	ja	ハンガリー フォリント
MXN	ja	メキシコ ペソ
CVE	ja	カーボベルデ エスクード
RUB	ja	ロシア ルーブル
JMD	ja	ジャマイカ ドル
AWG	ja	アルバ フロリン
ZAR	ja	南アフリカ ランド
SAR	ja	サウジ リヤル
BWP	ja	ボツワナ プラ
TOP	ja	トンガ パ・アンガ
MNT	ja	モンゴル トグログ
IRR	ja	イラン リアル
UYU	ja	ウルグアイ ペソ
TTD	ja	トリニダード・トバゴ ドル
MYR	ja	マレーシア リンギット
BND	ja	ブルネイ ドル
ANG	ja	オランダ領アンティル ギルダー
BTN	ja	ブータン ニュルタム
QAR	ja	カタール リアル
SHP	ja	セントヘレナ ポンド
CUP	ja	キューバ ペソ
BMD	ja	バミューダ ドル
SDG	ja	スーダン ポンド
LAK	ja	ラオス キープ
AED	ja	アラブ首長国連邦ディルハム
CLP	ja	チリ ペソ
RSD	ja	セルビア ディナール
KGS	ja	キルギス ソム
KES	ja	ケニア シリング
XPF	ja	CFP フラン
AZN	ja	アゼルバイジャン マナト
XCD	ja	東カリブ ドル
AFN	ja	アフガニスタン アフガニー
ERN	ja	エリトリア ナクファ
AUD	ja	オーストラリア ドル
CNH	ja	中国人民元(オフショア)
NGN	ja	ナイジェリア ナイラ
BGN	ja	ブルガリア 新レフ
TWD	ja	新台湾ドル
LYD	ja	リビア ディナール
NPR	ja	ネパール ルピー
PLN	ja	ポーランド ズウォティ
COP	ja	コロンビア ペソ
CRC	ja	コスタリカ コロン
BHD	ja	バーレーン ディナール
PKR	ja	パキスタン ルピー
XOF	ja	西アフリカ CFA フラン
GBP	ja	英国ポンド
ZWG	ja	ジンバブエ ゴールド
TND	ja	チュニジア ディナール
OMR	ja	オマーン リアル
MZN	ja	モザンビーク メティカル
GYD	ja	ガイアナ ドル
CZK	ja	チェコ コルナ
MGA	ja	マダガスカル アリアリ
DKK	ja	デンマーク クローネ
KYD	ja	ケイマン諸島 ドル
GIP	ja	ジブラルタル ポンド
MVR	ja	モルディブ ルフィア
SSP	ja	南スーダン ポンド
RON	ja	ルーマニア レイ
STN	ja	サントメ・プリンシペ ドブラ
RWF	ja	ルワンダ フラン
NAD	ja	ナミビア ドル
JOD	ja	ヨルダン ディナール
VUV	ja	バヌアツ バツ
BBD	ja	バルバドス ドル
UAH	ja	ウクライナ フリヴニャ
CHF	ja	スイス フラン
SOS	ja	ソマリア シリング
CAD	ja	カナダ ドル
GEL	ja	ジョージア ラリ
LKR	ja	スリランカ ルピー
BOB	ja	ボリビア ボリビアーノ
MDL	ja	モルドバ レイ
NZD	ja	ニュージーランド ドル
MMK	ja	ミャンマー チャット
LRD	ja	リベリア ドル
VND	ja	ベトナム ドン
PGK	ja	パプアニューギニア キナ
XCG	ja	カリブ ギルダー
VES	ja	ベネズエラ ボリバル
PYG	ja	パラグアイ グアラニ
BZD	ja	ベリーズ ドル
SRD	ja	スリナム ドル
SEK	ja	スウェーデン クローナ
DZD	ja	アルジェリア ディナール
ARS	ja	アルゼンチン ペソ
KHR	ja	カンボジア リエル
FJD	ja	フィジー ドル
PEN	ja	ペルー ソル
UZS	ja	ウズベキスタン スム
DJF	ja	ジブチ フラン
BRL	ja	ブラジル レアル
HNL	ja	ホンジュラス レンピラ
LBP	ja	レバノン ポンド
EGP	ja	エジプト ポンド
TJS	ja	タジキスタン ソモニ
USD	ja	米ドル
FKP	ja	フォークランド（マルビナス）諸島 ポンド
TMT	ja	トルクメニスタン マナト
PHP	ja	フィリピン ペソ
LSL	ja	レソト ロティ
ISK	ja	アイスランド クローナ
YER	ja	イエメン リアル
SBD	ja	ソロモン諸島 ドル
SLE	ja	シエラレオネ レオン
MUR	ja	モーリシャス ルピー
CNY	ja	中国人民元
PAB	ja	パナマ バルボア
BAM	ja	ボスニア・ヘルツェゴビナ 兌換マルク (BAM)
NOK	ja	ノルウェー クローネ
KMF	ja	コモロ フラン
BDT	ja	バングラデシュ タカ
INR	ja	インド ルピー
HTG	ja	ハイチ グールド
ALL	ja	アルバニア レク
MWK	ja	マラウィ クワチャ
MAD	ja	モロッコ ディルハム
GMD	ja	ガンビア ダラシ
AMD	ja	アルメニア ドラム
UGX	ja	ウガンダ シリング
KRW	ja	韓国ウォン
DOP	ja	ドミニカ ペソ
MKD	ja	マケドニア デナル
KWD	ja	クウェート ディナール
EUR	ja	ユーロ
ZWL	ja	ジンバブエ ドル (2009)
TZS	ja	タンザニア シリング
BYN	ja	ベラルーシ ルーブル
ZMW	ja	ザンビア クワチャ
XAF	ja	中央アフリカ CFA フラン
NIO	ja	ニカラグア コルドバ オロ
KZT	ja	カザフスタン テンゲ
SGD	ja	シンガポール ドル
JPY	ja	日本円
IQD	ja	イラク ディナール
WST	ja	サモア タラ
BIF	ja	ブルンジ フラン
GHS	ja	ガーナ セディ
XDR	ja	特別引き出し権
SZL	ja	スワジランド リランゲニ
BSD	ja	バハマ ドル
GNF	ja	ギニア フラン
THB	ko	태국 바트
CDF	ko	콩고 프랑
HKD	ko	홍콩 달러
IDR	ko	인도네시아 루피아
CLF	ko	칠레 (UF)
TRY	ko	튀르키예 리라
ETB	ko	에티오피아 비르
ILS	ko	이스라엘 신권 세켈
MOP	ko	마카오 파타카
SYP	ko	시리아 파운드
AOA	ko	앙골라 콴자
SCR	ko	세이셸 루피
MRU	ko	모리타니 우기야
HRK	ko	크로아티아 쿠나
GTQ	ko	과테말라 케트살
SLL	ko	시에라리온 리온(1964~2022)
HUF	ko	헝가리 포린트
MXN	ko	멕시코 페소
CVE	ko	카보베르데 에스쿠도
RUB	ko	러시아 루블
JMD	ko	자메이카 달러
AWG	ko	아루바 플로린
ZAR	ko	남아프리카 랜드
SAR	ko	사우디아라비아 리얄
BWP	ko	보츠와나 풀라
TOP	ko	통가 파앙가
MNT	ko	몽골 투그릭
IRR	ko	이란 리얄
UYU	ko	우루과이 페소
TTD	ko	트리니다드 토바고 달러
MYR	ko	말레이시아 링깃
BND	ko	부루나이 달러
ANG	ko	네덜란드령 안틸레스 길더
BTN	ko	부탄 눌투눔
QAR	ko	카타르 리얄
SHP	ko	세인트헬레나 파운드
CUP	ko	쿠바 페소
BMD	ko	버뮤다 달러
SDG	ko	수단 파운드
LAK	ko	라오스 키프
AED	ko	아랍에미리트 디르함
CLP	ko	칠레 페소
RSD	ko	세르비아 디나르
KGS	ko	키르기스스탄 솜
KES	ko	케냐 실링
XPF	ko	CFP 프랑
AZN	ko	아제르바이잔 마나트
XCD	ko	동카리브 달러
AFN	ko	아프가니스탄 아프가니
ERN	ko	에리트레아 낙파
AUD	ko	호주 달러
CNH	ko	중국 위안화(역외)
NGN	ko	나이지리아 나이라
BGN	ko	불가리아 레프
TWD	ko	신 타이완 달러
LYD	ko	리비아 디나르
NPR	ko	네팔 루피
PLN	ko	폴란드 즈워티
COP	ko	콜롬비아 페소
CRC	ko	코스타리카 콜론
BHD	ko	바레인 디나르
PKR	ko	파키스탄 루피
XOF	ko	서아프리카 CFA 프랑
GBP	ko	영국 파운드
ZWG	ko	짐바브웨 골드
TND	ko	튀니지 디나르
OMR	ko	오만 리알
MZN	ko	모잠비크 메티칼
GYD	ko	가이아나 달러
CZK	ko	체코 코루나
MGA	ko	마다가스카르 아리아리
DKK	ko	덴마크 크로네
KYD	ko	케이맨 제도 달러
GIP	ko	지브롤터 파운드
MVR	ko	몰디브 제도 루피아
SSP	ko	남수단 파운드
RON	ko	루마니아 레우
STN	ko	상투메 프린시페 도브라
RWF	ko	르완다 프랑
NAD	ko	나미비아 달러
JOD	ko	요르단 디나르
VUV	ko	바누아투 바투
BBD	ko	바베이도스 달러
UAH	ko	우크라이나 그리브나
CHF	ko	스위스 프랑
SOS	ko	소말리아 실링
CAD	ko	캐나다 달러
GEL	ko	조지아 라리
LKR	ko	스리랑카 루피
BOB	ko	볼리비아 볼리비아노
MDL	ko	몰도바 레이
NZD	ko	뉴질랜드 달러
MMK	ko	미얀마 키얏
LRD	ko	라이베리아 달러
VND	ko	베트남 동
PGK	ko	파푸아뉴기니 키나
XCG	ko	카리브 길더
VES	ko	베네수엘라 볼리바르
PYG	ko	파라과이 과라니
BZD	ko	벨리즈 달러
SRD	ko	수리남 달러
SEK	ko	스웨덴 크로나
DZD	ko	알제리 디나르
ARS	ko	아르헨티나 페소
KHR	ko	캄보디아 리엘
FJD	ko	피지 달러
PEN	ko	페루 솔
UZS	ko	우즈베키스탄 숨
DJF	ko	지부티 프랑
BRL	ko	브라질 레알
HNL	ko	온두라스 렘피라
LBP	ko	레바논 파운드
EGP	ko	이집트 파운드
TJS	ko	타지키스탄 소모니
USD	ko	미국 달러
FKP	ko	포클랜드제도 파운드
TMT	ko	투르크메니스탄 마나트
PHP	ko	필리핀 페소
LSL	ko	레소토 로티
ISK	ko	아이슬란드 크로나
YER	ko	예멘 리알
SBD	ko	솔로몬 제도 달러
SLE	ko	시에라리온 리온
MUR	ko	모리셔스 루피
CNY	ko	중국 위안화
PAB	ko	파나마 발보아
BAM	ko	보스니아-헤르체고비나 태환 마르크
NOK	ko	노르웨이 크로네
KMF	ko	코모르 프랑
BDT	ko	방글라데시 타카
INR	ko	인도 루피
HTG	ko	아이티 구르드
ALL	ko	알바니아 레크
MWK	ko	말라위 콰차
MAD	ko	모로코 디르함
GMD	ko	감비아 달라시
AMD	ko	아르메니아 드람
UGX	ko	우간다 실링
KRW	ko	대한민국 원
DOP	ko	도미니카 페소
MKD	ko	마케도니아 디나르
KWD	ko	쿠웨이트 디나르
EUR	ko	유로
ZWL	ko	짐바브웨 달러 (2009)
TZS	ko	탄자니아 실링
BYN	ko	벨라루스 루블
ZMW	ko	잠비아 콰차
XAF	ko	중앙아프리카 CFA 프랑
NIO	ko	니카라과 코르도바
KZT	ko	카자흐스탄 텡게
SGD	ko	싱가포르 달러
JPY	ko	일본 엔화
IQD	ko	이라크 디나르
WST	ko	서 사모아 탈라
BIF	ko	부룬디 프랑
GHS	ko	가나 세디
XDR	ko	특별인출권
SZL	ko	스와질란드 릴랑게니
BSD	ko	바하마 달러
GNF	ko	기니 프랑
THB	zh	泰铢
CDF	zh	刚果法郎
HKD	zh	港元
IDR	zh	印度尼西亚卢比
CLF	zh	智利（资金）
TRY	zh	土耳其里拉
ETB	zh	埃塞俄比亚比尔
ILS	zh	以色列新谢克尔
MOP	zh	澳门币
SYP	zh	叙利亚镑
AOA	zh	安哥拉宽扎
SCR	zh	塞舌尔卢比
MRU	zh	毛里塔尼亚乌吉亚
HRK	zh	克罗地亚库纳
GTQ	zh	危地马拉格查尔
SLL	zh	塞拉利昂利昂
HUF	zh	匈牙利福林
MXN	zh	墨西哥比索
CVE	zh	佛得角埃斯库多
RUB	zh	俄罗斯卢布
JMD	zh	牙买加元
AWG	zh	阿鲁巴弗罗林
ZAR	zh	南非兰特
SAR	zh	沙特里亚尔
BWP	zh	博茨瓦纳普拉
TOP	zh	汤加潘加
MNT	zh	蒙古图格里克
IRR	zh	伊朗里亚尔
UYU	zh	乌拉圭比索
TTD	zh	特立尼达和多巴哥元
MYR	zh	马来西亚林吉特
BND	zh	文莱元
ANG	zh	荷属安的列斯盾
BTN	zh	不丹努尔特鲁姆
QAR	zh	卡塔尔里亚尔
SHP	zh	圣赫勒拿群岛磅
CUP	zh	古巴比索
BMD	zh	百慕大元
SDG	zh	苏丹镑
LAK	zh	老挝基普
AED	zh	阿联酋迪拉姆
CLP	zh	智利比索
RSD	zh	塞尔维亚第纳尔
KGS	zh	吉尔吉斯斯坦索姆
KES	zh	肯尼亚先令
XPF	zh	太平洋法郎
AZN	zh	阿塞拜疆马纳特
XCD	zh	东加勒比元
AFN	zh	阿富汗尼
ERN	zh	厄立特里亚纳克法
AUD	zh	澳大利亚元
CNH	zh	人民币（离岸）
NGN	zh	尼日利亚奈拉
BGN	zh	保加利亚列弗
TWD	zh	新台币
LYD	zh	利比亚第纳尔
NPR	zh	尼泊尔卢比
PLN	zh	波兰兹罗提
COP	zh	哥伦比亚比索
CRC	zh	哥斯达黎加科朗
BHD	zh	巴林第纳尔
PKR	zh	巴基斯坦卢比
XOF	zh	西非法郎
GBP	zh	英镑
ZWG	zh	津巴布韦金元
TND	zh	突尼斯第纳尔
OMR	zh	阿曼里亚尔
MZN	zh	莫桑比克美提卡
GYD	zh	圭亚那元
CZK	zh	捷克克朗
MGA	zh	马达加斯加阿里亚里
DKK	zh	丹麦克朗
KYD	zh	开曼元
GIP	zh	直布罗陀镑
MVR	zh	马尔代夫卢菲亚
SSP	zh	南苏丹镑
RON	zh	罗马尼亚列伊
STN	zh	圣多美和普林西比多布拉
RWF	zh	卢旺达法郎
NAD	zh	纳米比亚元
JOD	zh	约旦第纳尔
VUV	zh	瓦努阿图瓦图
BBD	zh	巴巴多斯元
UAH	zh	乌克兰格里夫纳
CHF	zh	瑞士法郎
SOS	zh	索马里先令
CAD	zh	加拿大元
GEL	zh	格鲁吉亚拉里
LKR	zh	斯里兰卡卢比
BOB	zh	玻利维亚诺
MDL	zh	摩尔多瓦列伊
NZD	zh	新西兰元
MMK	zh	缅甸元
LRD	zh	利比里亚元
VND	zh	越南盾
PGK	zh	巴布亚新几内亚基那
XCG	zh	加勒比盾
VES	zh	委内瑞拉玻利瓦尔
PYG	zh	巴拉圭瓜拉尼
BZD	zh	伯利兹元
SRD	zh	苏里南元
SEK	zh	瑞典克朗
DZD	zh	阿尔及利亚第纳尔
ARS	zh	阿根廷比索
KHR	zh	柬埔寨瑞尔
FJD	zh	斐济元
PEN	zh	秘鲁索尔
UZS	zh	乌兹别克斯坦苏姆
DJF	zh	吉布提法郎
BRL	zh	巴西雷亚尔
HNL	zh	洪都拉斯伦皮拉
LBP	zh	黎巴嫩镑
EGP	zh	埃及镑
TJS	zh	塔吉克斯坦索莫尼
USD	zh	美元
FKP	zh	福克兰群岛镑
TMT	zh	土库曼斯坦马纳特
PHP	zh	菲律宾比索
LSL	zh	莱索托洛蒂
ISK	zh	冰岛克朗
YER	zh	也门里亚尔
SBD	zh	所罗门群岛元
SLE	zh	塞拉利昂新利昂
MUR	zh	毛里求斯卢比
CNY	zh	人民币
PAB	zh	巴拿马巴波亚
BAM	zh	波斯尼亚-黑塞哥维那可兑换马克
NOK	zh	挪威克朗
KMF	zh	科摩罗法郎
BDT	zh	孟加拉塔卡
INR	zh	印度卢比
HTG	zh	海地古德
ALL	zh	阿尔巴尼亚列克
MWK	zh	马拉维克瓦查
MAD	zh	摩洛哥迪拉姆
GMD	zh	冈比亚达拉西
AMD	zh	亚美尼亚德拉姆
UGX	zh	乌干达先令
KRW	zh	韩元
DOP	zh	多米尼加比索
MKD	zh	马其顿第纳尔
KWD	zh	科威特第纳尔
EUR	zh	欧元
ZWL	zh	津巴布韦元 (2009)
TZS	zh	坦桑尼亚先令
BYN	zh	白俄罗斯卢布
ZMW	zh	赞比亚克瓦查
XAF	zh	中非法郎
NIO	zh	尼加拉瓜科多巴
KZT	zh	哈萨克斯坦坚戈
SGD	zh	新加坡元
JPY	zh	日元
IQD	zh	伊拉克第纳尔
WST	zh	萨摩亚塔拉
BIF	zh	布隆迪法郎
GHS	zh	加纳塞地
XDR	zh	特别提款权
SZL	zh	斯威士兰里兰吉尼
BSD	zh	巴哈马元
GNF	zh	几内亚法郎
THB	ar	باخت تايلاندي
CDF	ar	فرنك كونغولي
HKD	ar	دولار هونغ كونغ
IDR	ar	روبية إندونيسية
TRY	ar	ليرة تركية
ETB	ar	بير أثيوبي
ILS	ar	شيكل إسرائيلي جديد
MOP	ar	باتاكا ماكاوي
SYP	ar	ليرة سورية
AOA	ar	كوانزا أنغولي
SCR	ar	روبية سيشيلية
MRU	ar	أوقية موريتانية
HRK	ar	كونا كرواتي
GTQ	ar	كوتزال غواتيمالا
SLL	ar	ليون سيراليوني - 1964-2022
HUF	ar	فورينت هنغاري
MXN	ar	بيزو مكسيكي
CVE	ar	اسكودو الرأس الأخضر
RUB	ar	روبل روسي
JMD	ar	دولار جامايكي
AWG	ar	فلورن أروبي
ZAR	ar	راند جنوب أفريقيا
SAR	ar	ريال سعودي
BWP	ar	بولا بتسواني
TOP	ar	بانغا تونغا
MNT	ar	توغروغ منغولي
IRR	ar	ريال إيراني
UYU	ar	بيزو اوروغواي
TTD	ar	دولار ترينداد وتوباغو
MYR	ar	رينغيت ماليزي
BND	ar	دولار بروناي
ANG	ar	غيلدر أنتيلي هولندي
BTN	ar	نولتوم بوتاني
QAR	ar	ريال قطري
SHP	ar	جنيه سانت هيلين
CUP	ar	بيزو كوبي
BMD	ar	دولار برمودي
SDG	ar	جنيه سوداني
LAK	ar	كيب لاوسي
AED	ar	درهم إماراتي
CLP	ar	بيزو تشيلي
RSD	ar	دينار صربي
KGS	ar	سوم قيرغستاني
KES	ar	شلن كينيي
XPF	ar	فرنك سي إف بي
AZN	ar	مانت أذربيجاني
XCD	ar	دولار شرق الكاريبي
AFN	ar	أفغاني أفغانستاني
ERN	ar	ناكفا أريتري
AUD	ar	دولار أسترالي
CNH	ar	يوان صيني (في الخارج)
NGN	ar	نايرا نيجيري
BGN	ar	ليف بلغاري
TWD	ar	دولار تايواني
LYD	ar	دينار ليبي
NPR	ar	روبية نيبالي
PLN	ar	زلوتي بولندي
COP	ar	بيزو كولومبي
CRC	ar	كولن كوستاريكي
BHD	ar	دينار بحريني
PKR	ar	روبية باكستاني
XOF	ar	فرنك غرب أفريقي
GBP	ar	جنيه إسترليني
ZWG	ar	ذهب زيمبابوي
TND	ar	دينار تونسي
OMR	ar	ريال عماني
MZN	ar	متكال موزمبيقي
GYD	ar	دولار غيانا
CZK	ar	كرونة تشيكية
MGA	ar	أرياري مدغشقر
DKK	ar	كرونة دنماركية
KYD	ar	دولار جزر كيمن
GIP	ar	جنيه جبل طارق
MVR	ar	روفيه جزر المالديف
SSP	ar	جنيه جنوب السودان
RON	ar	ليو روماني
STN	ar	دوبرا ساو تومي وبرينسيبي
RWF	ar	فرنك رواندي
NAD	ar	دولار ناميبي
JOD	ar	دينار أردني
VUV	ar	فاتو فانواتو
BBD	ar	دولار بربادوسي
UAH	ar	هريفنيا أوكراني
CHF	ar	فرنك سويسري
SOS	ar	شلن صومالي
CAD	ar	دولار كندي
GEL	ar	لاري جورجي
LKR	ar	روبية سريلانكية
BOB	ar	بوليفيانو بوليفي
MDL	ar	ليو مولدوفي
NZD	ar	دولار نيوزيلندي
MMK	ar	كيات ميانمار
LRD	ar	دولار ليبيري
VND	ar	دونج فيتنامي
PGK	ar	كينا بابوا غينيا الجديدة
XCG	ar	غيلدر كاريبي
VES	ar	بوليفار فنزويلي
PYG	ar	غواراني باراغواي
BZD	ar	دولار بليزي
SRD	ar	دولار سورينامي
SEK	ar	كرونة سويدية
DZD	ar	دينار جزائري
ARS	ar	بيزو أرجنتيني
KHR	ar	رييال كمبودي
FJD	ar	دولار فيجي
PEN	ar	سول بيروفي
UZS	ar	سوم أوزبكستاني
DJF	ar	فرنك جيبوتي
BRL	ar	ريال برازيلي
HNL	ar	ليمبيرا هندوراس
LBP	ar	جنيه لبناني
EGP	ar	جنيه مصري
TJS	ar	سوموني طاجيكستاني
USD	ar	دولار أمريكي
FKP	ar	جنيه جزر فوكلاند
TMT	ar	مانات تركمانستان
PHP	ar	بيزو فلبيني
LSL	ar	لوتي ليسوتو
ISK	ar	كرونة أيسلندية
YER	ar	ريال يمني
SBD	ar	دولار جزر سليمان
SLE	ar	ليون سيراليوني
MUR	ar	روبية موريشيوسية
CNY	ar	يوان صيني
PAB	ar	بالبوا بنمي
BAM	ar	مارك البوسنة والهرسك قابل للتحويل
NOK	ar	كرونة نرويجية
KMF	ar	فرنك جزر القمر
BDT	ar	تاكا بنغلاديشي
INR	ar	روبية هندي
HTG	ar	جوردى هايتي
ALL	ar	ليك ألباني
MWK	ar	كواشا مالاوي
MAD	ar	درهم مغربي
GMD	ar	دلاسي غامبي
AMD	ar	درام أرميني
UGX	ar	شلن أوغندي
KRW	ar	وون كوريا الجنوبية
DOP	ar	بيزو الدومنيكان
MKD	ar	دينار مقدوني
KWD	ar	دينار كويتي
EUR	ar	يورو
ZWL	ar	دولار زمبابوي 2009
TZS	ar	شلن تنزاني
BYN	ar	روبل بيلاروسي
ZMW	ar	كواشا زامبي
XAF	ar	فرنك وسط أفريقي
NIO	ar	قرطبة نيكاراغوا
KZT	ar	تينغ كازاخستاني
SGD	ar	دولار سنغافوري
JPY	ar	ين ياباني
IQD	ar	دينار عراقي
WST	ar	تالا ساموا
BIF	ar	فرنك بروندي
GHS	ar	سيدي غانا
XDR	ar	حقوق السحب الخاصة
SZL	ar	ليلانجيني سوازيلندي
BSD	ar	دولار باهامي
GNF	ar	فرنك غينيا
THB	tr	Tayland bahtı
CDF	tr	Kongo frangı
HKD	tr	Hong Kong doları
IDR	tr	Endonezya rupisi
CLF	tr	Şili Unidades de Fomento
TRY	tr	Türk lirası
ETB	tr	Etiyopya birri
ILS	tr	Yeni İsrail şekeli
MOP	tr	Makao patakası
SYP	tr	Suriye lirası
AOA	tr	Angola kvanzası
SCR	tr	Seyşeller rupisi
MRU	tr	Moritanya ugiyası
HRK	tr	Hırvatistan kunası
GTQ	tr	Guatemala quetzalı
SLL	tr	Sierra Leone leonesi (1964–2022)
HUF	tr	Macar forinti
MXN	tr	Meksika pesosu
CVE	tr	Cape Verde esküdosu
RUB	tr	Rus rublesi
JMD	tr	Jamaika doları
AWG	tr	Aruba florini
ZAR	tr	Güney Afrika randı
SAR	tr	Suudi Arabistan riyali
BWP	tr	Botsvana pulası
TOP	tr	Tonga paʻangası
MNT	tr	Moğolistan tugriki
IRR	tr	İran riyali
UYU	tr	Uruguay pesosu
TTD	tr	Trinidad ve Tobago doları
MYR	tr	Malezya ringgiti
BND	tr	Brunei doları
ANG	tr	Hollanda Antilleri guldeni
BTN	tr	Butan ngultrumu
QAR	tr	Katar riyali
SHP	tr	Saint Helena lirası
CUP	tr	Küba pesosu
BMD	tr	Bermuda doları
SDG	tr	Sudan lirası
LAK	tr	Laos kipi
AED	tr	BAE dirhemi
CLP	tr	Şili pesosu
RSD	tr	Sırp dinarı
KGS	tr	Kırgızistan somu
KES	tr	Kenya şilini
XPF	tr	CFP frangı
AZN	tr	Azerbaycan manatı
XCD	tr	Doğu Karayip doları
AFN	tr	Afganistan afganisi
ERN	tr	Eritre nakfası
AUD	tr	Avustralya doları
CNH	tr	Çin yuanı (offshore)
NGN	tr	Nijerya nairası
BGN	tr	Bulgar levası
TWD	tr	Yeni Tayvan doları
LYD	tr	Libya dinarı
NPR	tr	Nepal rupisi
PLN	tr	Polonya zlotisi
COP	tr	Kolombiya pesosu
CRC	tr	Kosta Rika kolonu
BHD	tr	Bahreyn dinarı
PKR	tr	Pakistan rupisi
XOF	tr	Batı Afrika CFA frangı
GBP	tr	İngiliz sterlini
ZWG	tr	Zimbabve altını
TND	tr	Tunus dinarı
OMR	tr	Umman riyali
MZN	tr	Mozambik metikali
GYD	tr	Guyana doları
CZK	tr	Çek korunası
MGA	tr	Madagaskar ariarisi
DKK	tr	Danimarka kronu
KYD	tr	Cayman Adaları doları
GIP	tr	Cebelitarık lirası
MVR	tr	Maldiv rufiyaası
SSP	tr	Güney Sudan lirası
RON	tr	Romen leyi
STN	tr	Sao Tome ve Principe dobrası
RWF	tr	Ruanda frangı
NAD	tr	Namibya doları
JOD	tr	Ürdün dinarı
VUV	tr	Vanuatu vatusu
BBD	tr	Barbados doları
UAH	tr	Ukrayna grivnası
CHF	tr	İsviçre frangı
SOS	tr	Somali şilini
CAD	tr	Kanada doları
GEL	tr	Gürcistan larisi
LKR	tr	Sri Lanka rupisi
BOB	tr	Bolivya bolivyanosu
MDL	tr	Moldova leyi
NZD	tr	Yeni Zelanda doları
MMK	tr	Myanmar kyatı
LRD	tr	Liberya doları
VND	tr	Vietnam dongu
PGK	tr	Papua Yeni Gine kinası
XCG	tr	Karayip guldeni
VES	tr	Venezuela bolivarı
PYG	tr	Paraguay guaranisi
BZD	tr	Belize doları
SRD	tr	Surinam doları
SEK	tr	İsveç kronu
DZD	tr	Cezayir dinarı
ARS	tr	Arjantin pesosu
KHR	tr	Kamboçya rieli
FJD	tr	Fiji doları
PEN	tr	Peru solü
UZS	tr	Özbekistan somu
DJF	tr	Cibuti frangı
BRL	tr	Brezilya reali
HNL	tr	Honduras lempirası
LBP	tr	Lübnan lirası
EGP	tr	Mısır lirası
TJS	tr	Tacikistan somonisi
USD	tr	ABD doları
FKP	tr	Falkland Adaları lirası
TMT	tr	Türkmenistan manatı
PHP	tr	Filipinler pesosu
LSL	tr	Lesotho lotisi
ISK	tr	İzlanda kronu
YER	tr	Yemen riyali
SBD	tr	Solomon Adaları doları
SLE	tr	Sierra Leone leonesi
MUR	tr	Mauritius rupisi
CNY	tr	Çin yuanı
PAB	tr	Panama balboası
BAM	tr	Konvertibl Bosna Hersek markı
NOK	tr	Norveç kronu
KMF	tr	Komorlar frangı
BDT	tr	Bangladeş takası
INR	tr	Hindistan rupisi
HTG	tr	Haiti gurdu
ALL	tr	Arnavutluk leki
MWK	tr	Malavi kvaçası
MAD	tr	Fas dirhemi
GMD	tr	Gambiya dalasisi
AMD	tr	Ermenistan dramı
UGX	tr	Uganda şilini
KRW	tr	Güney Kore wonu
DOP	tr	Dominik pesosu
MKD	tr	Makedonya dinarı
KWD	tr	Kuveyt dinarı
EUR	tr	Euro
ZWL	tr	Zimbabve Doları (2009)
TZS	tr	Tanzanya şilini
BYN	tr	Belarus rublesi
ZMW	tr	Zambiya kvaçası
XAF	tr	Orta Afrika CFA frangı
NIO	tr	Nikaragua kordobası
KZT	tr	Kazakistan tengesi
SGD	tr	Singapur doları
JPY	tr	Japon yeni
IQD	tr	Irak dinarı
WST	tr	Samoa talası
BIF	tr	Burundi frangı
GHS	tr	Gana sedisi
XDR	tr	Özel Çekme Hakkı (SDR)
SZL	tr	Svaziland lilangenisi
BSD	tr	Bahama doları
GNF	tr	Gine frangı
THB	uk	таїландський бат
CDF	uk	конголезький франк
HKD	uk	гонконгський долар
IDR	uk	індонезійська рупія
CLF	uk	чилійський юнідадес де фоменто
TRY	uk	турецька ліра
ETB	uk	ефіопський бир
ILS	uk	ізраїльський новий шекель
MOP	uk	патака Макао
SYP	uk	сирійський фунт
AOA	uk	ангольська кванза
SCR	uk	сейшельська рупія
MRU	uk	мавританська угія
HRK	uk	хорватська куна
GTQ	uk	гватемальський кетсаль
SLL	uk	леоне Сьєрра-Леоне (1964—2022)
HUF	uk	угорський форинт
MXN	uk	мексиканський песо
CVE	uk	ескудо Кабо-Верде
RUB	uk	російський рубль
JMD	uk	ямайський долар
AWG	uk	арубський флорин
ZAR	uk	південноафриканський ранд
SAR	uk	саудівський ріал
BWP	uk	ботсванська пула
TOP	uk	тонганська паанга
MNT	uk	монгольський тугрик
IRR	uk	іранський ріал
UYU	uk	уругвайський песо
TTD	uk	долар Тринідаду і Тобаго
MYR	uk	малайзійський рингіт
BND	uk	брунейський долар
ANG	uk	нідерландський антильський гульден
BTN	uk	бутанський нгултрум
QAR	uk	катарський ріал
SHP	uk	фунт острова Святої Єлени
CUP	uk	кубинський песо
BMD	uk	бермудський долар
SDG	uk	суданський фунт
LAK	uk	лаоський кіп
AED	uk	дирхам ОАЕ
CLP	uk	чилійський песо
RSD	uk	сербський динар
KGS	uk	киргизький сом
KES	uk	кенійський шилінг
XPF	uk	французький тихоокеанський франк
AZN	uk	азербайджанський манат
XCD	uk	східнокарибський долар
AFN	uk	афганський афгані
ERN	uk	еритрейська накфа
AUD	uk	австралійський долар
CNH	uk	китайський офшорний юань
NGN	uk	нігерійська найра
BGN	uk	болгарський лев
TWD	uk	новий тайванський долар
LYD	uk	лівійський динар
NPR	uk	непальська рупія
PLN	uk	польський злотий
COP	uk	колумбійський песо
CRC	uk	костариканський колон
BHD	uk	бахрейнський динар
PKR	uk	пакистанська рупія
XOF	uk	західноафриканський франк
GBP	uk	англійський фунт
ZWG	uk	зімбабвійський золотий
TND	uk	туніський динар
OMR	uk	оманський ріал
MZN	uk	мозамбіцький метикал
GYD	uk	гаянський долар
CZK	uk	чеська крона
MGA	uk	малагасійський аріарі
DKK	uk	данська крона
KYD	uk	долар Кайманових островів
GIP	uk	гібралтарський фунт
MVR	uk	мальдівська руфія
SSP	uk	південносуданський фунт
RON	uk	румунський лей
STN	uk	добра Сан-Томе і Прінсіпі
RWF	uk	руандійський франк
NAD	uk	намібійський долар
JOD	uk	йорданський динар
VUV	uk	вануатський вату
BBD	uk	барбадоський долар
UAH	uk	українська гривня
CHF	uk	швейцарський франк
SOS	uk	сомалійський шилінг
CAD	uk	канадський долар
GEL	uk	грузинський ларі
LKR	uk	шрі-ланкійська рупія
BOB	uk	болівійський болівіано
MDL	uk	молдовський лей
NZD	uk	новозеландський долар
MMK	uk	кʼят Мʼянми
LRD	uk	ліберійський долар
VND	uk	вʼєтнамський донг
PGK	uk	кіна Папуа-Нової Ґвінеї
XCG	uk	карибський гульден
VES	uk	венесуельський болівар
PYG	uk	парагвайський гуарані
BZD	uk	белізький долар
SRD	uk	суринамський долар
SEK	uk	шведська крона
DZD	uk	алжирський динар
ARS	uk	аргентинський песо
KHR	uk	камбоджійський рієль
FJD	uk	фіджійський долар
PEN	uk	перуанський новий сол
UZS	uk	узбецький сум
DJF	uk	джибутійський франк
BRL	uk	бразильський реал
HNL	uk	гондураська лемпіра
LBP	uk	ліванський фунт
EGP	uk	єгипетський фунт
TJS	uk	таджицький сомоні
USD	uk	долар США
FKP	uk	фунт Фолклендських островів
TMT	uk	туркменський манат
PHP	uk	філіппінський песо
LSL	uk	лесотський лоті
ISK	uk	ісландська крона
YER	uk	єменський ріал
SBD	uk	долар Соломонових Островів
SLE	uk	леоне Сьєрра-Леоне
MUR	uk	маврикійська рупія
CNY	uk	китайський юань
PAB	uk	панамське бальбоа
BAM	uk	конвертована марка Боснії і Герцеговини
NOK	uk	норвезька крона
KMF	uk	коморський франк
BDT	uk	бангладеська така
INR	uk	індійська рупія
HTG	uk	гаїтянський гурд
ALL	uk	албанський лек
MWK	uk	малавійська квача
MAD	uk	марокканський дирхам
GMD	uk	гамбійський даласі
AMD	uk	вірменський драм
UGX	uk	угандійський шилінг
KRW	uk	південнокорейський вон
DOP	uk	домініканський песо
MKD	uk	македонський денар
KWD	uk	кувейтський динар
EUR	uk	євро
ZWL	uk	зімбабвійський долар (2009)
TZS	uk	танзанійський шилінг
BYN	uk	білоруський рубль
ZMW	uk	замбійська квача
XAF	uk	центральноафриканський франк
NIO	uk	нікарагуанська кордоба
KZT	uk	казахстанський тенге
SGD	uk	сінгапурський долар
JPY	uk	японська єна
IQD	uk	іракський динар
WST	uk	самоанська тала
BIF	uk	бурундійський франк
GHS	uk	ганський седі
XDR	uk	спеціальні права запозичення
SZL	uk	свазілендський лілангені
BSD	uk	багамський долар
GNF	uk	гвінейський франк
\.


--
-- Data for Name: exchange_rates; Type: TABLE DATA; Schema: public; Owner: tau
--

COPY public.exchange_rates (base_code, target_code, rate, rate_date, created_at) FROM stdin;
USD	USD	1.00000000	2026-01-10	2026-01-11 17:30:15.957001
USD	AED	3.67250000	2026-01-10	2026-01-11 17:30:15.957001
USD	AFN	66.08390000	2026-01-10	2026-01-11 17:30:15.957001
USD	ALL	82.68510000	2026-01-10	2026-01-11 17:30:15.957001
USD	AMD	381.35460000	2026-01-10	2026-01-11 17:30:15.957001
USD	ANG	1.79000000	2026-01-10	2026-01-11 17:30:15.957001
USD	AOA	919.42760000	2026-01-10	2026-01-11 17:30:15.957001
USD	ARS	1452.25000000	2026-01-10	2026-01-11 17:30:15.957001
USD	AUD	1.49550000	2026-01-10	2026-01-11 17:30:15.957001
USD	AWG	1.79000000	2026-01-10	2026-01-11 17:30:15.957001
USD	AZN	1.70010000	2026-01-10	2026-01-11 17:30:15.957001
USD	BAM	1.68030000	2026-01-10	2026-01-11 17:30:15.957001
USD	BBD	2.00000000	2026-01-10	2026-01-11 17:30:15.957001
USD	BDT	122.18560000	2026-01-10	2026-01-11 17:30:15.957001
USD	BGN	1.66370000	2026-01-10	2026-01-11 17:30:15.957001
USD	BHD	0.37600000	2026-01-10	2026-01-11 17:30:15.957001
USD	BIF	2968.08810000	2026-01-10	2026-01-11 17:30:15.957001
USD	BMD	1.00000000	2026-01-10	2026-01-11 17:30:15.957001
USD	BND	1.28660000	2026-01-10	2026-01-11 17:30:15.957001
USD	BOB	6.92990000	2026-01-10	2026-01-11 17:30:15.957001
USD	BRL	5.38220000	2026-01-10	2026-01-11 17:30:15.957001
USD	BSD	1.00000000	2026-01-10	2026-01-11 17:30:15.957001
USD	BTN	90.15810000	2026-01-10	2026-01-11 17:30:15.957001
USD	BWP	13.78340000	2026-01-10	2026-01-11 17:30:15.957001
USD	BYN	2.95160000	2026-01-10	2026-01-11 17:30:15.957001
USD	BZD	2.00000000	2026-01-10	2026-01-11 17:30:15.957001
USD	CAD	1.38910000	2026-01-10	2026-01-11 17:30:15.957001
USD	CDF	2245.57680000	2026-01-10	2026-01-11 17:30:15.957001
USD	CHF	0.80090000	2026-01-10	2026-01-11 17:30:15.957001
USD	CLF	0.02269000	2026-01-10	2026-01-11 17:30:15.957001
USD	CLP	896.92560000	2026-01-10	2026-01-11 17:30:15.957001
USD	CNH	6.97640000	2026-01-10	2026-01-11 17:30:15.957001
USD	CNY	6.99670000	2026-01-10	2026-01-11 17:30:15.957001
USD	COP	3732.96190000	2026-01-10	2026-01-11 17:30:15.957001
USD	CRC	497.18370000	2026-01-10	2026-01-11 17:30:15.957001
USD	CUP	24.00000000	2026-01-10	2026-01-11 17:30:15.957001
USD	CVE	94.73020000	2026-01-10	2026-01-11 17:30:15.957001
USD	CZK	20.86760000	2026-01-10	2026-01-11 17:30:15.957001
USD	DJF	177.72100000	2026-01-10	2026-01-11 17:30:15.957001
USD	DKK	6.41010000	2026-01-10	2026-01-11 17:30:15.957001
USD	DOP	63.46510000	2026-01-10	2026-01-11 17:30:15.957001
USD	DZD	129.94110000	2026-01-10	2026-01-11 17:30:15.957001
USD	EGP	47.28330000	2026-01-10	2026-01-11 17:30:15.957001
USD	ERN	15.00000000	2026-01-10	2026-01-11 17:30:15.957001
USD	ETB	154.11220000	2026-01-10	2026-01-11 17:30:15.957001
USD	EUR	0.85910000	2026-01-10	2026-01-11 17:30:15.957001
USD	FJD	2.27670000	2026-01-10	2026-01-11 17:30:15.957001
USD	FKP	0.74550000	2026-01-10	2026-01-11 17:30:15.957001
USD	FOK	6.41010000	2026-01-10	2026-01-11 17:30:15.957001
USD	GBP	0.74550000	2026-01-10	2026-01-11 17:30:15.957001
USD	GEL	2.69560000	2026-01-10	2026-01-11 17:30:15.957001
USD	GGP	0.74550000	2026-01-10	2026-01-11 17:30:15.957001
USD	GHS	10.73020000	2026-01-10	2026-01-11 17:30:15.957001
USD	GIP	0.74550000	2026-01-10	2026-01-11 17:30:15.957001
USD	GMD	73.87350000	2026-01-10	2026-01-11 17:30:15.957001
USD	GNF	8747.55900000	2026-01-10	2026-01-11 17:30:15.957001
USD	GTQ	7.66520000	2026-01-10	2026-01-11 17:30:15.957001
USD	GYD	209.15160000	2026-01-10	2026-01-11 17:30:15.957001
USD	HKD	7.79430000	2026-01-10	2026-01-11 17:30:15.957001
USD	HNL	26.37020000	2026-01-10	2026-01-11 17:30:15.957001
USD	HRK	6.47300000	2026-01-10	2026-01-11 17:30:15.957001
USD	HTG	130.96790000	2026-01-10	2026-01-11 17:30:15.957001
USD	HUF	331.12770000	2026-01-10	2026-01-11 17:30:15.957001
USD	IDR	16817.17850000	2026-01-10	2026-01-11 17:30:15.957001
USD	ILS	3.16020000	2026-01-10	2026-01-11 17:30:15.957001
USD	IMP	0.74550000	2026-01-10	2026-01-11 17:30:15.957001
USD	INR	90.18020000	2026-01-10	2026-01-11 17:30:15.957001
USD	IQD	1310.62980000	2026-01-10	2026-01-11 17:30:15.957001
USD	IRR	42085.05800000	2026-01-10	2026-01-11 17:30:15.957001
USD	ISK	126.57430000	2026-01-10	2026-01-11 17:30:15.957001
USD	JEP	0.74550000	2026-01-10	2026-01-11 17:30:15.957001
USD	JMD	158.13260000	2026-01-10	2026-01-11 17:30:15.957001
USD	JOD	0.70900000	2026-01-10	2026-01-11 17:30:15.957001
USD	JPY	157.74080000	2026-01-10	2026-01-11 17:30:15.957001
USD	KES	128.97320000	2026-01-10	2026-01-11 17:30:15.957001
USD	KGS	87.39150000	2026-01-10	2026-01-11 17:30:15.957001
USD	KHR	4018.70210000	2026-01-10	2026-01-11 17:30:15.957001
USD	KID	1.49550000	2026-01-10	2026-01-11 17:30:15.957001
USD	KMF	422.65650000	2026-01-10	2026-01-11 17:30:15.957001
USD	KRW	1457.37940000	2026-01-10	2026-01-11 17:30:15.957001
USD	KWD	0.30720000	2026-01-10	2026-01-11 17:30:15.957001
USD	KYD	0.83330000	2026-01-10	2026-01-11 17:30:15.957001
USD	KZT	510.50960000	2026-01-10	2026-01-11 17:30:15.957001
USD	LAK	21687.23950000	2026-01-10	2026-01-11 17:30:15.957001
USD	LBP	89500.00000000	2026-01-10	2026-01-11 17:30:15.957001
USD	LKR	309.62930000	2026-01-10	2026-01-11 17:30:15.957001
USD	LRD	179.14110000	2026-01-10	2026-01-11 17:30:15.957001
USD	LSL	16.50350000	2026-01-10	2026-01-11 17:30:15.957001
USD	LYD	5.41550000	2026-01-10	2026-01-11 17:30:15.957001
USD	MAD	9.22790000	2026-01-10	2026-01-11 17:30:15.957001
USD	MDL	16.86130000	2026-01-10	2026-01-11 17:30:15.957001
USD	MGA	4597.65180000	2026-01-10	2026-01-11 17:30:15.957001
USD	MKD	52.81510000	2026-01-10	2026-01-11 17:30:15.957001
USD	MMK	2103.02990000	2026-01-10	2026-01-11 17:30:15.957001
USD	MNT	3559.19100000	2026-01-10	2026-01-11 17:30:15.957001
USD	MOP	8.02820000	2026-01-10	2026-01-11 17:30:15.957001
USD	MRU	39.96710000	2026-01-10	2026-01-11 17:30:15.957001
USD	MUR	46.59490000	2026-01-10	2026-01-11 17:30:15.957001
USD	MVR	15.44020000	2026-01-10	2026-01-11 17:30:15.957001
USD	MWK	1744.79060000	2026-01-10	2026-01-11 17:30:15.957001
USD	MXN	17.98540000	2026-01-10	2026-01-11 17:30:15.957001
USD	MYR	4.06880000	2026-01-10	2026-01-11 17:30:15.957001
USD	MZN	63.58650000	2026-01-10	2026-01-11 17:30:15.957001
USD	NAD	16.50350000	2026-01-10	2026-01-11 17:30:15.957001
USD	NGN	1423.06290000	2026-01-10	2026-01-11 17:30:15.957001
USD	NIO	36.80370000	2026-01-10	2026-01-11 17:30:15.957001
USD	NOK	10.09970000	2026-01-10	2026-01-11 17:30:15.957001
USD	NPR	144.25290000	2026-01-10	2026-01-11 17:30:15.957001
USD	NZD	1.74500000	2026-01-10	2026-01-11 17:30:15.957001
USD	OMR	0.38450000	2026-01-10	2026-01-11 17:30:15.957001
USD	PAB	1.00000000	2026-01-10	2026-01-11 17:30:15.957001
USD	PEN	3.36180000	2026-01-10	2026-01-11 17:30:15.957001
USD	PGK	4.26480000	2026-01-10	2026-01-11 17:30:15.957001
USD	PHP	59.26660000	2026-01-10	2026-01-11 17:30:15.957001
USD	PKR	282.00580000	2026-01-10	2026-01-11 17:30:15.957001
USD	PLN	3.61690000	2026-01-10	2026-01-11 17:30:15.957001
USD	PYG	6712.36710000	2026-01-10	2026-01-11 17:30:15.957001
USD	QAR	3.64000000	2026-01-10	2026-01-11 17:30:15.957001
USD	RON	4.36850000	2026-01-10	2026-01-11 17:30:15.957001
USD	RSD	100.60160000	2026-01-10	2026-01-11 17:30:15.957001
USD	RUB	79.33540000	2026-01-10	2026-01-11 17:30:15.957001
USD	RWF	1459.43770000	2026-01-10	2026-01-11 17:30:15.957001
USD	SAR	3.75000000	2026-01-10	2026-01-11 17:30:15.957001
USD	SBD	8.02210000	2026-01-10	2026-01-11 17:30:15.957001
USD	SCR	14.28000000	2026-01-10	2026-01-11 17:30:15.957001
USD	SDG	509.07250000	2026-01-10	2026-01-11 17:30:15.957001
USD	SEK	9.21550000	2026-01-10	2026-01-11 17:30:15.957001
USD	SGD	1.28660000	2026-01-10	2026-01-11 17:30:15.957001
USD	SHP	0.74550000	2026-01-10	2026-01-11 17:30:15.957001
USD	SLE	23.83660000	2026-01-10	2026-01-11 17:30:15.957001
USD	SLL	23836.61130000	2026-01-10	2026-01-11 17:30:15.957001
USD	SOS	570.19120000	2026-01-10	2026-01-11 17:30:15.957001
USD	SRD	38.18250000	2026-01-10	2026-01-11 17:30:15.957001
USD	SSP	4687.78820000	2026-01-10	2026-01-11 17:30:15.957001
USD	STN	21.04830000	2026-01-10	2026-01-11 17:30:15.957001
USD	SYP	113.97020000	2026-01-10	2026-01-11 17:30:15.957001
USD	SZL	16.50350000	2026-01-10	2026-01-11 17:30:15.957001
USD	THB	31.42850000	2026-01-10	2026-01-11 17:30:15.957001
USD	TJS	9.23360000	2026-01-10	2026-01-11 17:30:15.957001
USD	TMT	3.49990000	2026-01-10	2026-01-11 17:30:15.957001
USD	TND	2.88730000	2026-01-10	2026-01-11 17:30:15.957001
USD	TOP	2.39130000	2026-01-10	2026-01-11 17:30:15.957001
USD	TRY	43.11880000	2026-01-10	2026-01-11 17:30:15.957001
USD	TTD	6.76820000	2026-01-10	2026-01-11 17:30:15.957001
USD	TVD	1.49550000	2026-01-10	2026-01-11 17:30:15.957001
USD	TWD	31.63020000	2026-01-10	2026-01-11 17:30:15.957001
USD	TZS	2456.72140000	2026-01-10	2026-01-11 17:30:15.957001
USD	UAH	43.06310000	2026-01-10	2026-01-11 17:30:15.957001
USD	UGX	3572.55430000	2026-01-10	2026-01-11 17:30:15.957001
USD	UYU	38.96070000	2026-01-10	2026-01-11 17:30:15.957001
USD	UZS	12124.34100000	2026-01-10	2026-01-11 17:30:15.957001
USD	VES	330.37510000	2026-01-10	2026-01-11 17:30:15.957001
USD	VND	26184.67720000	2026-01-10	2026-01-11 17:30:15.957001
USD	VUV	120.27990000	2026-01-10	2026-01-11 17:30:15.957001
USD	WST	2.74450000	2026-01-10	2026-01-11 17:30:15.957001
USD	XAF	563.54200000	2026-01-10	2026-01-11 17:30:15.957001
USD	XCD	2.70000000	2026-01-10	2026-01-11 17:30:15.957001
USD	XCG	1.79000000	2026-01-10	2026-01-11 17:30:15.957001
USD	XDR	0.73100000	2026-01-10	2026-01-11 17:30:15.957001
USD	XOF	563.54200000	2026-01-10	2026-01-11 17:30:15.957001
USD	XPF	102.51980000	2026-01-10	2026-01-11 17:30:15.957001
USD	YER	238.40690000	2026-01-10	2026-01-11 17:30:15.957001
USD	ZAR	16.50350000	2026-01-10	2026-01-11 17:30:15.957001
USD	ZMW	19.71140000	2026-01-10	2026-01-11 17:30:15.957001
USD	ZWG	25.71830000	2026-01-10	2026-01-11 17:30:15.957001
USD	ZWL	25.71830000	2026-01-10	2026-01-11 17:30:15.957001
USD	EUR	0.86660000	2026-01-11	2026-01-11 17:30:15.957001
USD	USD	1.00000000	2026-01-11	2026-01-12 15:26:43.240457
USD	AED	3.67250000	2026-01-11	2026-01-12 15:26:43.240457
USD	AFN	66.04060000	2026-01-11	2026-01-12 15:26:43.240457
USD	ALL	82.94570000	2026-01-11	2026-01-12 15:26:43.240457
USD	AMD	381.28330000	2026-01-11	2026-01-12 15:26:43.240457
USD	ANG	1.79000000	2026-01-11	2026-01-12 15:26:43.240457
USD	AOA	918.74390000	2026-01-11	2026-01-12 15:26:43.240457
USD	ARS	1452.25000000	2026-01-11	2026-01-12 15:26:43.240457
USD	AUD	1.49620000	2026-01-11	2026-01-12 15:26:43.240457
USD	AWG	1.79000000	2026-01-11	2026-01-12 15:26:43.240457
USD	AZN	1.70060000	2026-01-11	2026-01-12 15:26:43.240457
USD	BAM	1.68130000	2026-01-11	2026-01-12 15:26:43.240457
USD	BBD	2.00000000	2026-01-11	2026-01-12 15:26:43.240457
USD	BDT	122.23560000	2026-01-11	2026-01-12 15:26:43.240457
USD	BGN	1.67440000	2026-01-11	2026-01-12 15:26:43.240457
USD	BHD	0.37600000	2026-01-11	2026-01-12 15:26:43.240457
USD	BIF	2968.50810000	2026-01-11	2026-01-12 15:26:43.240457
USD	BMD	1.00000000	2026-01-11	2026-01-12 15:26:43.240457
USD	BND	1.28670000	2026-01-11	2026-01-12 15:26:43.240457
USD	BOB	6.93750000	2026-01-11	2026-01-12 15:26:43.240457
USD	BRL	5.37560000	2026-01-11	2026-01-12 15:26:43.240457
USD	BSD	1.00000000	2026-01-11	2026-01-12 15:26:43.240457
USD	BTN	90.32050000	2026-01-11	2026-01-12 15:26:43.240457
USD	BWP	13.65520000	2026-01-11	2026-01-12 15:26:43.240457
USD	BYN	2.93330000	2026-01-11	2026-01-12 15:26:43.240457
USD	BZD	2.00000000	2026-01-11	2026-01-12 15:26:43.240457
USD	CAD	1.39050000	2026-01-11	2026-01-12 15:26:43.240457
USD	CDF	2175.99130000	2026-01-11	2026-01-12 15:26:43.240457
USD	CHF	0.80140000	2026-01-11	2026-01-12 15:26:43.240457
USD	CLF	0.02268000	2026-01-11	2026-01-12 15:26:43.240457
USD	CLP	896.50320000	2026-01-11	2026-01-12 15:26:43.240457
USD	CNH	6.97640000	2026-01-11	2026-01-12 15:26:43.240457
USD	CNY	6.98790000	2026-01-11	2026-01-12 15:26:43.240457
USD	COP	3721.75780000	2026-01-11	2026-01-12 15:26:43.240457
USD	CRC	497.55480000	2026-01-11	2026-01-12 15:26:43.240457
USD	CUP	24.00000000	2026-01-11	2026-01-12 15:26:43.240457
USD	CVE	94.79000000	2026-01-11	2026-01-12 15:26:43.240457
USD	CZK	20.87120000	2026-01-11	2026-01-12 15:26:43.240457
USD	DJF	177.72100000	2026-01-11	2026-01-12 15:26:43.240457
USD	DKK	6.41360000	2026-01-11	2026-01-12 15:26:43.240457
USD	DOP	63.51250000	2026-01-11	2026-01-12 15:26:43.240457
USD	DZD	130.12760000	2026-01-11	2026-01-12 15:26:43.240457
USD	EGP	47.21120000	2026-01-11	2026-01-12 15:26:43.240457
USD	ERN	15.00000000	2026-01-11	2026-01-12 15:26:43.240457
USD	ETB	154.91590000	2026-01-11	2026-01-12 15:26:43.240457
USD	FJD	2.27680000	2026-01-11	2026-01-12 15:26:43.240457
USD	FKP	0.74610000	2026-01-11	2026-01-12 15:26:43.240457
USD	FOK	6.41290000	2026-01-11	2026-01-12 15:26:43.240457
USD	GBP	0.74620000	2026-01-11	2026-01-12 15:26:43.240457
USD	GEL	2.69580000	2026-01-11	2026-01-12 15:26:43.240457
USD	GGP	0.74610000	2026-01-11	2026-01-12 15:26:43.240457
USD	GHS	10.72110000	2026-01-11	2026-01-12 15:26:43.240457
USD	GIP	0.74610000	2026-01-11	2026-01-12 15:26:43.240457
USD	GMD	73.87900000	2026-01-11	2026-01-12 15:26:43.240457
USD	GNF	8740.05960000	2026-01-11	2026-01-12 15:26:43.240457
USD	GTQ	7.67170000	2026-01-11	2026-01-12 15:26:43.240457
USD	GYD	209.16220000	2026-01-11	2026-01-12 15:26:43.240457
USD	HKD	7.79480000	2026-01-11	2026-01-12 15:26:43.240457
USD	HNL	26.38360000	2026-01-11	2026-01-12 15:26:43.240457
USD	HRK	6.47710000	2026-01-11	2026-01-12 15:26:43.240457
USD	HTG	130.89550000	2026-01-11	2026-01-12 15:26:43.240457
USD	HUF	331.55140000	2026-01-11	2026-01-12 15:26:43.240457
USD	IDR	16837.24520000	2026-01-11	2026-01-12 15:26:43.240457
USD	ILS	3.15220000	2026-01-11	2026-01-12 15:26:43.240457
USD	IMP	0.74610000	2026-01-11	2026-01-12 15:26:43.240457
USD	INR	90.32090000	2026-01-11	2026-01-12 15:26:43.240457
USD	IQD	1312.20150000	2026-01-11	2026-01-12 15:26:43.240457
USD	IRR	42127.35420000	2026-01-11	2026-01-12 15:26:43.240457
USD	ISK	126.57930000	2026-01-11	2026-01-12 15:26:43.240457
USD	JEP	0.74610000	2026-01-11	2026-01-12 15:26:43.240457
USD	JMD	158.66460000	2026-01-11	2026-01-12 15:26:43.240457
USD	JOD	0.70900000	2026-01-11	2026-01-12 15:26:43.240457
USD	JPY	158.02890000	2026-01-11	2026-01-12 15:26:43.240457
USD	KES	128.93960000	2026-01-11	2026-01-12 15:26:43.240457
USD	KGS	87.42790000	2026-01-11	2026-01-12 15:26:43.240457
USD	KHR	4023.04350000	2026-01-11	2026-01-12 15:26:43.240457
USD	KID	1.49620000	2026-01-11	2026-01-12 15:26:43.240457
USD	KMF	422.92330000	2026-01-11	2026-01-12 15:26:43.240457
USD	KRW	1458.85010000	2026-01-11	2026-01-12 15:26:43.240457
USD	KWD	0.30700000	2026-01-11	2026-01-12 15:26:43.240457
USD	KYD	0.83330000	2026-01-11	2026-01-12 15:26:43.240457
USD	KZT	510.48300000	2026-01-11	2026-01-12 15:26:43.240457
USD	LAK	21708.31410000	2026-01-11	2026-01-12 15:26:43.240457
USD	LBP	89500.00000000	2026-01-11	2026-01-12 15:26:43.240457
USD	LKR	309.09810000	2026-01-11	2026-01-12 15:26:43.240457
USD	LRD	179.45780000	2026-01-11	2026-01-12 15:26:43.240457
USD	LSL	16.49480000	2026-01-11	2026-01-12 15:26:43.240457
USD	LYD	5.42290000	2026-01-11	2026-01-12 15:26:43.240457
USD	MAD	9.24360000	2026-01-11	2026-01-12 15:26:43.240457
USD	MDL	16.81220000	2026-01-11	2026-01-12 15:26:43.240457
USD	MGA	4568.49940000	2026-01-11	2026-01-12 15:26:43.240457
USD	MKD	52.79930000	2026-01-11	2026-01-12 15:26:43.240457
USD	MMK	2098.87440000	2026-01-11	2026-01-12 15:26:43.240457
USD	MNT	3560.16100000	2026-01-11	2026-01-12 15:26:43.240457
USD	MOP	8.02860000	2026-01-11	2026-01-12 15:26:43.240457
USD	MRU	40.01450000	2026-01-11	2026-01-12 15:26:43.240457
USD	MUR	46.69300000	2026-01-11	2026-01-12 15:26:43.240457
USD	MVR	15.44150000	2026-01-11	2026-01-12 15:26:43.240457
USD	MWK	1739.17350000	2026-01-11	2026-01-12 15:26:43.240457
USD	MXN	17.97660000	2026-01-11	2026-01-12 15:26:43.240457
USD	MYR	4.07320000	2026-01-11	2026-01-12 15:26:43.240457
USD	MZN	63.59750000	2026-01-11	2026-01-12 15:26:43.240457
USD	NAD	16.49480000	2026-01-11	2026-01-12 15:26:43.240457
USD	NGN	1422.62640000	2026-01-11	2026-01-12 15:26:43.240457
USD	NIO	36.81960000	2026-01-11	2026-01-12 15:26:43.240457
USD	NOK	10.09450000	2026-01-11	2026-01-12 15:26:43.240457
USD	NPR	144.51280000	2026-01-11	2026-01-12 15:26:43.240457
USD	NZD	1.74560000	2026-01-11	2026-01-12 15:26:43.240457
USD	OMR	0.38450000	2026-01-11	2026-01-12 15:26:43.240457
USD	PAB	1.00000000	2026-01-11	2026-01-12 15:26:43.240457
USD	PEN	3.36430000	2026-01-11	2026-01-12 15:26:43.240457
USD	PGK	4.27170000	2026-01-11	2026-01-12 15:26:43.240457
USD	PHP	59.28900000	2026-01-11	2026-01-12 15:26:43.240457
USD	PKR	280.47890000	2026-01-11	2026-01-12 15:26:43.240457
USD	PLN	3.61940000	2026-01-11	2026-01-12 15:26:43.240457
USD	PYG	6604.81170000	2026-01-11	2026-01-12 15:26:43.240457
USD	QAR	3.64000000	2026-01-11	2026-01-12 15:26:43.240457
USD	RON	4.37260000	2026-01-11	2026-01-12 15:26:43.240457
USD	RSD	100.80950000	2026-01-11	2026-01-12 15:26:43.240457
USD	RUB	79.02380000	2026-01-11	2026-01-12 15:26:43.240457
USD	RWF	1457.48830000	2026-01-11	2026-01-12 15:26:43.240457
USD	SAR	3.75000000	2026-01-11	2026-01-12 15:26:43.240457
USD	SBD	8.05330000	2026-01-11	2026-01-12 15:26:43.240457
USD	SCR	14.84400000	2026-01-11	2026-01-12 15:26:43.240457
USD	SDG	458.71140000	2026-01-11	2026-01-12 15:26:43.240457
USD	SEK	9.21810000	2026-01-11	2026-01-12 15:26:43.240457
USD	SGD	1.28670000	2026-01-11	2026-01-12 15:26:43.240457
USD	SHP	0.74610000	2026-01-11	2026-01-12 15:26:43.240457
USD	SLE	23.83660000	2026-01-11	2026-01-12 15:26:43.240457
USD	SLL	23836.61130000	2026-01-11	2026-01-12 15:26:43.240457
USD	SOS	570.50180000	2026-01-11	2026-01-12 15:26:43.240457
USD	SRD	38.09130000	2026-01-11	2026-01-12 15:26:43.240457
USD	SSP	4670.10060000	2026-01-11	2026-01-12 15:26:43.240457
USD	STN	21.06160000	2026-01-11	2026-01-12 15:26:43.240457
USD	SYP	112.46460000	2026-01-11	2026-01-12 15:26:43.240457
USD	SZL	16.49480000	2026-01-11	2026-01-12 15:26:43.240457
USD	THB	31.40230000	2026-01-11	2026-01-12 15:26:43.240457
USD	TJS	9.23540000	2026-01-11	2026-01-12 15:26:43.240457
USD	TMT	3.49980000	2026-01-11	2026-01-12 15:26:43.240457
USD	TND	2.88850000	2026-01-11	2026-01-12 15:26:43.240457
USD	TOP	2.39480000	2026-01-11	2026-01-12 15:26:43.240457
USD	TRY	43.12550000	2026-01-11	2026-01-12 15:26:43.240457
USD	TTD	6.78960000	2026-01-11	2026-01-12 15:26:43.240457
USD	TVD	1.49620000	2026-01-11	2026-01-12 15:26:43.240457
USD	TWD	31.66720000	2026-01-11	2026-01-12 15:26:43.240457
USD	TZS	2486.50980000	2026-01-11	2026-01-12 15:26:43.240457
USD	UAH	43.12770000	2026-01-11	2026-01-12 15:26:43.240457
USD	UGX	3588.43530000	2026-01-11	2026-01-12 15:26:43.240457
USD	UYU	39.02190000	2026-01-11	2026-01-12 15:26:43.240457
USD	UZS	12190.19270000	2026-01-11	2026-01-12 15:26:43.240457
USD	VES	330.37510000	2026-01-11	2026-01-12 15:26:43.240457
USD	VND	26164.27920000	2026-01-11	2026-01-12 15:26:43.240457
USD	VUV	120.72410000	2026-01-11	2026-01-12 15:26:43.240457
USD	WST	2.74850000	2026-01-11	2026-01-12 15:26:43.240457
USD	XAF	563.89770000	2026-01-11	2026-01-12 15:26:43.240457
USD	XCD	2.70000000	2026-01-11	2026-01-12 15:26:43.240457
USD	XCG	1.79000000	2026-01-11	2026-01-12 15:26:43.240457
USD	XDR	0.73100000	2026-01-11	2026-01-12 15:26:43.240457
USD	XOF	563.89770000	2026-01-11	2026-01-12 15:26:43.240457
USD	XPF	102.58450000	2026-01-11	2026-01-12 15:26:43.240457
USD	YER	238.47220000	2026-01-11	2026-01-12 15:26:43.240457
USD	ZAR	16.49480000	2026-01-11	2026-01-12 15:26:43.240457
USD	ZMW	19.48980000	2026-01-11	2026-01-12 15:26:43.240457
USD	ZWG	25.71830000	2026-01-11	2026-01-12 15:26:43.240457
USD	ZWL	25.71830000	2026-01-11	2026-01-12 15:26:43.240457
USD	USD	1.00000000	2026-01-13	2026-01-14 10:00:18.165917
USD	AED	3.67250000	2026-01-13	2026-01-14 10:00:18.165917
USD	AFN	66.15910000	2026-01-13	2026-01-14 10:00:18.165917
USD	ALL	82.81710000	2026-01-13	2026-01-14 10:00:18.165917
USD	AMD	380.96730000	2026-01-13	2026-01-14 10:00:18.165917
USD	ANG	1.79000000	2026-01-13	2026-01-14 10:00:18.165917
USD	AOA	921.82790000	2026-01-13	2026-01-14 10:00:18.165917
USD	ARS	1452.25000000	2026-01-13	2026-01-14 10:00:18.165917
USD	AUD	1.49530000	2026-01-13	2026-01-14 10:00:18.165917
USD	AWG	1.79000000	2026-01-13	2026-01-14 10:00:18.165917
USD	AZN	1.70110000	2026-01-13	2026-01-14 10:00:18.165917
USD	BAM	1.67870000	2026-01-13	2026-01-14 10:00:18.165917
USD	BBD	2.00000000	2026-01-13	2026-01-14 10:00:18.165917
USD	BDT	122.25960000	2026-01-13	2026-01-14 10:00:18.165917
USD	BGN	1.62280000	2026-01-13	2026-01-14 10:00:18.165917
USD	BHD	0.37600000	2026-01-13	2026-01-14 10:00:18.165917
USD	BIF	2969.63420000	2026-01-13	2026-01-14 10:00:18.165917
USD	BMD	1.00000000	2026-01-13	2026-01-14 10:00:18.165917
USD	BND	1.28820000	2026-01-13	2026-01-14 10:00:18.165917
USD	BOB	6.94410000	2026-01-13	2026-01-14 10:00:18.165917
USD	BRL	5.37670000	2026-01-13	2026-01-14 10:00:18.165917
USD	BSD	1.00000000	2026-01-13	2026-01-14 10:00:18.165917
USD	BTN	90.30250000	2026-01-13	2026-01-14 10:00:18.165917
USD	BWP	13.86980000	2026-01-13	2026-01-14 10:00:18.165917
USD	BYN	2.92380000	2026-01-13	2026-01-14 10:00:18.165917
USD	BZD	2.00000000	2026-01-13	2026-01-14 10:00:18.165917
USD	CAD	1.38850000	2026-01-13	2026-01-14 10:00:18.165917
USD	CDF	2230.23600000	2026-01-13	2026-01-14 10:00:18.165917
USD	CHF	0.80020000	2026-01-13	2026-01-14 10:00:18.165917
USD	CLF	0.02240000	2026-01-13	2026-01-14 10:00:18.165917
USD	CLP	885.44530000	2026-01-13	2026-01-14 10:00:18.165917
USD	CNH	6.97420000	2026-01-13	2026-01-14 10:00:18.165917
USD	CNY	6.98820000	2026-01-13	2026-01-14 10:00:18.165917
USD	COP	3725.23430000	2026-01-13	2026-01-14 10:00:18.165917
USD	CRC	497.88720000	2026-01-13	2026-01-14 10:00:18.165917
USD	CUP	24.00000000	2026-01-13	2026-01-14 10:00:18.165917
USD	CVE	94.64110000	2026-01-13	2026-01-14 10:00:18.165917
USD	CZK	20.81010000	2026-01-13	2026-01-14 10:00:18.165917
USD	DJF	177.72100000	2026-01-13	2026-01-14 10:00:18.165917
USD	DKK	6.40560000	2026-01-13	2026-01-14 10:00:18.165917
USD	DOP	63.73530000	2026-01-13	2026-01-14 10:00:18.165917
USD	DZD	130.04090000	2026-01-13	2026-01-14 10:00:18.165917
USD	EGP	47.12590000	2026-01-13	2026-01-14 10:00:18.165917
USD	ERN	15.00000000	2026-01-13	2026-01-14 10:00:18.165917
USD	ETB	154.62220000	2026-01-13	2026-01-14 10:00:18.165917
USD	EUR	0.85830000	2026-01-13	2026-01-14 10:00:18.165917
USD	FJD	2.27580000	2026-01-13	2026-01-14 10:00:18.165917
USD	FKP	0.74400000	2026-01-13	2026-01-14 10:00:18.165917
USD	FOK	6.40540000	2026-01-13	2026-01-14 10:00:18.165917
USD	GBP	0.74400000	2026-01-13	2026-01-14 10:00:18.165917
USD	GEL	2.69640000	2026-01-13	2026-01-14 10:00:18.165917
USD	GGP	0.74400000	2026-01-13	2026-01-14 10:00:18.165917
USD	GHS	10.74110000	2026-01-13	2026-01-14 10:00:18.165917
USD	GIP	0.74400000	2026-01-13	2026-01-14 10:00:18.165917
USD	GMD	73.92940000	2026-01-13	2026-01-14 10:00:18.165917
USD	GNF	8747.02540000	2026-01-13	2026-01-14 10:00:18.165917
USD	GTQ	7.67580000	2026-01-13	2026-01-14 10:00:18.165917
USD	GYD	209.16480000	2026-01-13	2026-01-14 10:00:18.165917
USD	HKD	7.80090000	2026-01-13	2026-01-14 10:00:18.165917
USD	HNL	26.43240000	2026-01-13	2026-01-14 10:00:18.165917
USD	HRK	6.46690000	2026-01-13	2026-01-14 10:00:18.165917
USD	HTG	130.90540000	2026-01-13	2026-01-14 10:00:18.165917
USD	HUF	331.58610000	2026-01-13	2026-01-14 10:00:18.165917
USD	IDR	16879.48200000	2026-01-13	2026-01-14 10:00:18.165917
USD	ILS	3.14990000	2026-01-13	2026-01-14 10:00:18.165917
USD	IMP	0.74400000	2026-01-13	2026-01-14 10:00:18.165917
USD	INR	90.30280000	2026-01-13	2026-01-14 10:00:18.165917
USD	IQD	1312.39580000	2026-01-13	2026-01-14 10:00:18.165917
USD	IRR	42002.51970000	2026-01-13	2026-01-14 10:00:18.165917
USD	ISK	125.77600000	2026-01-13	2026-01-14 10:00:18.165917
USD	JEP	0.74400000	2026-01-13	2026-01-14 10:00:18.165917
USD	JMD	158.18960000	2026-01-13	2026-01-14 10:00:18.165917
USD	JOD	0.70900000	2026-01-13	2026-01-14 10:00:18.165917
USD	JPY	158.99370000	2026-01-13	2026-01-14 10:00:18.165917
USD	KES	128.96410000	2026-01-13	2026-01-14 10:00:18.165917
USD	KGS	87.40730000	2026-01-13	2026-01-14 10:00:18.165917
USD	KHR	4023.55200000	2026-01-13	2026-01-14 10:00:18.165917
USD	KID	1.49500000	2026-01-13	2026-01-14 10:00:18.165917
USD	KMF	422.25890000	2026-01-13	2026-01-14 10:00:18.165917
USD	KRW	1473.96550000	2026-01-13	2026-01-14 10:00:18.165917
USD	KWD	0.30760000	2026-01-13	2026-01-14 10:00:18.165917
USD	KYD	0.83330000	2026-01-13	2026-01-14 10:00:18.165917
USD	KZT	509.65600000	2026-01-13	2026-01-14 10:00:18.165917
USD	LAK	21735.66980000	2026-01-13	2026-01-14 10:00:18.165917
USD	LBP	89500.00000000	2026-01-13	2026-01-14 10:00:18.165917
USD	LKR	309.14990000	2026-01-13	2026-01-14 10:00:18.165917
USD	LRD	179.81570000	2026-01-13	2026-01-14 10:00:18.165917
USD	LSL	16.41420000	2026-01-13	2026-01-14 10:00:18.165917
USD	LYD	5.42790000	2026-01-13	2026-01-14 10:00:18.165917
USD	MAD	9.21330000	2026-01-13	2026-01-14 10:00:18.165917
USD	MDL	16.96180000	2026-01-13	2026-01-14 10:00:18.165917
USD	MGA	4598.85850000	2026-01-13	2026-01-14 10:00:18.165917
USD	MKD	52.59790000	2026-01-13	2026-01-14 10:00:18.165917
USD	MMK	2100.00550000	2026-01-13	2026-01-14 10:00:18.165917
USD	MNT	3598.20930000	2026-01-13	2026-01-14 10:00:18.165917
USD	MOP	8.03560000	2026-01-13	2026-01-14 10:00:18.165917
USD	MRU	40.01130000	2026-01-13	2026-01-14 10:00:18.165917
USD	MUR	46.67530000	2026-01-13	2026-01-14 10:00:18.165917
USD	MVR	15.45610000	2026-01-13	2026-01-14 10:00:18.165917
USD	MWK	1744.98500000	2026-01-13	2026-01-14 10:00:18.165917
USD	MXN	17.85320000	2026-01-13	2026-01-14 10:00:18.165917
USD	MYR	4.05780000	2026-01-13	2026-01-14 10:00:18.165917
USD	MZN	63.61440000	2026-01-13	2026-01-14 10:00:18.165917
USD	NAD	16.41420000	2026-01-13	2026-01-14 10:00:18.165917
USD	NGN	1421.50210000	2026-01-13	2026-01-14 10:00:18.165917
USD	NIO	36.84640000	2026-01-13	2026-01-14 10:00:18.165917
USD	NOK	10.08690000	2026-01-13	2026-01-14 10:00:18.165917
USD	NPR	144.48400000	2026-01-13	2026-01-14 10:00:18.165917
USD	NZD	1.74040000	2026-01-13	2026-01-14 10:00:18.165917
USD	OMR	0.38450000	2026-01-13	2026-01-14 10:00:18.165917
USD	PAB	1.00000000	2026-01-13	2026-01-14 10:00:18.165917
USD	PEN	3.36120000	2026-01-13	2026-01-14 10:00:18.165917
USD	PGK	4.27310000	2026-01-13	2026-01-14 10:00:18.165917
USD	PHP	59.40600000	2026-01-13	2026-01-14 10:00:18.165917
USD	PKR	280.20160000	2026-01-13	2026-01-14 10:00:18.165917
USD	PLN	3.61500000	2026-01-13	2026-01-14 10:00:18.165917
USD	PYG	6643.43290000	2026-01-13	2026-01-14 10:00:18.165917
USD	QAR	3.64000000	2026-01-13	2026-01-14 10:00:18.165917
USD	RON	4.36550000	2026-01-13	2026-01-14 10:00:18.165917
USD	RSD	100.67730000	2026-01-13	2026-01-14 10:00:18.165917
USD	RUB	78.82900000	2026-01-13	2026-01-14 10:00:18.165917
USD	RWF	1459.75650000	2026-01-13	2026-01-14 10:00:18.165917
USD	SAR	3.75000000	2026-01-13	2026-01-14 10:00:18.165917
USD	SBD	8.02770000	2026-01-13	2026-01-14 10:00:18.165917
USD	SCR	14.15540000	2026-01-13	2026-01-14 10:00:18.165917
USD	SDG	449.47610000	2026-01-13	2026-01-14 10:00:18.165917
USD	SEK	9.21250000	2026-01-13	2026-01-14 10:00:18.165917
USD	SGD	1.28810000	2026-01-13	2026-01-14 10:00:18.165917
USD	SHP	0.74400000	2026-01-13	2026-01-14 10:00:18.165917
USD	SLE	23.83660000	2026-01-13	2026-01-14 10:00:18.165917
USD	SLL	23836.61130000	2026-01-13	2026-01-14 10:00:18.165917
USD	SOS	570.51810000	2026-01-13	2026-01-14 10:00:18.165917
USD	SRD	38.08120000	2026-01-13	2026-01-14 10:00:18.165917
USD	SSP	4720.63090000	2026-01-13	2026-01-14 10:00:18.165917
USD	STN	21.02850000	2026-01-13	2026-01-14 10:00:18.165917
USD	SYP	112.46350000	2026-01-13	2026-01-14 10:00:18.165917
USD	SZL	16.41420000	2026-01-13	2026-01-14 10:00:18.165917
USD	THB	31.47000000	2026-01-13	2026-01-14 10:00:18.165917
USD	TJS	9.29030000	2026-01-13	2026-01-14 10:00:18.165917
USD	TMT	3.50000000	2026-01-13	2026-01-14 10:00:18.165917
USD	TND	2.89740000	2026-01-13	2026-01-14 10:00:18.165917
USD	TOP	2.39420000	2026-01-13	2026-01-14 10:00:18.165917
USD	TRY	43.15430000	2026-01-13	2026-01-14 10:00:18.165917
USD	TTD	6.76950000	2026-01-13	2026-01-14 10:00:18.165917
USD	TVD	1.49500000	2026-01-13	2026-01-14 10:00:18.165917
USD	TWD	31.66000000	2026-01-13	2026-01-14 10:00:18.165917
USD	TZS	2474.55790000	2026-01-13	2026-01-14 10:00:18.165917
USD	UAH	43.25140000	2026-01-13	2026-01-14 10:00:18.165917
USD	UGX	3568.27610000	2026-01-13	2026-01-14 10:00:18.165917
USD	UYU	39.00140000	2026-01-13	2026-01-14 10:00:18.165917
USD	UZS	12103.66490000	2026-01-13	2026-01-14 10:00:18.165917
USD	VES	336.45960000	2026-01-13	2026-01-14 10:00:18.165917
USD	VND	26225.80420000	2026-01-13	2026-01-14 10:00:18.165917
USD	VUV	120.82540000	2026-01-13	2026-01-14 10:00:18.165917
USD	WST	2.75020000	2026-01-13	2026-01-14 10:00:18.165917
USD	XAF	563.01190000	2026-01-13	2026-01-14 10:00:18.165917
USD	XCD	2.70000000	2026-01-13	2026-01-14 10:00:18.165917
USD	XCG	1.79000000	2026-01-13	2026-01-14 10:00:18.165917
USD	XDR	0.72990000	2026-01-13	2026-01-14 10:00:18.165917
USD	XOF	563.01190000	2026-01-13	2026-01-14 10:00:18.165917
USD	XPF	102.42340000	2026-01-13	2026-01-14 10:00:18.165917
USD	YER	238.62250000	2026-01-13	2026-01-14 10:00:18.165917
USD	ZAR	16.41430000	2026-01-13	2026-01-14 10:00:18.165917
USD	ZMW	19.49870000	2026-01-13	2026-01-14 10:00:18.165917
USD	ZWG	25.71690000	2026-01-13	2026-01-14 10:00:18.165917
USD	ZWL	25.71690000	2026-01-13	2026-01-14 10:00:18.165917
USD	USD	1.00000000	2026-01-14	2026-01-15 15:00:00.647134
USD	AED	3.67250000	2026-01-14	2026-01-15 15:00:00.647134
USD	AFN	65.94940000	2026-01-14	2026-01-15 15:00:00.647134
USD	ALL	82.87630000	2026-01-14	2026-01-15 15:00:00.647134
USD	AMD	380.19610000	2026-01-14	2026-01-15 15:00:00.647134
USD	ANG	1.79000000	2026-01-14	2026-01-15 15:00:00.647134
USD	AOA	923.57100000	2026-01-14	2026-01-15 15:00:00.647134
USD	ARS	1452.25000000	2026-01-14	2026-01-15 15:00:00.647134
USD	AUD	1.49700000	2026-01-14	2026-01-15 15:00:00.647134
USD	AWG	1.79000000	2026-01-14	2026-01-15 15:00:00.647134
USD	AZN	1.70000000	2026-01-14	2026-01-15 15:00:00.647134
USD	BAM	1.67920000	2026-01-14	2026-01-15 15:00:00.647134
USD	BBD	2.00000000	2026-01-14	2026-01-15 15:00:00.647134
USD	BDT	122.23070000	2026-01-14	2026-01-15 15:00:00.647134
USD	BGN	1.62320000	2026-01-14	2026-01-15 15:00:00.647134
USD	BHD	0.37600000	2026-01-14	2026-01-15 15:00:00.647134
USD	BIF	2965.98340000	2026-01-14	2026-01-15 15:00:00.647134
USD	BMD	1.00000000	2026-01-14	2026-01-15 15:00:00.647134
USD	BND	1.28770000	2026-01-14	2026-01-15 15:00:00.647134
USD	BOB	6.92660000	2026-01-14	2026-01-15 15:00:00.647134
USD	BRL	5.37520000	2026-01-14	2026-01-15 15:00:00.647134
USD	BSD	1.00000000	2026-01-14	2026-01-15 15:00:00.647134
USD	BTN	90.34110000	2026-01-14	2026-01-15 15:00:00.647134
USD	BWP	13.62830000	2026-01-14	2026-01-15 15:00:00.647134
USD	BYN	2.91170000	2026-01-14	2026-01-15 15:00:00.647134
USD	BZD	2.00000000	2026-01-14	2026-01-15 15:00:00.647134
USD	CAD	1.38800000	2026-01-14	2026-01-15 15:00:00.647134
USD	CDF	2219.78860000	2026-01-14	2026-01-15 15:00:00.647134
USD	CHF	0.80030000	2026-01-14	2026-01-15 15:00:00.647134
USD	CLF	0.02241000	2026-01-14	2026-01-15 15:00:00.647134
USD	CLP	885.98080000	2026-01-14	2026-01-15 15:00:00.647134
USD	CNH	6.97140000	2026-01-14	2026-01-15 15:00:00.647134
USD	CNY	6.98570000	2026-01-14	2026-01-15 15:00:00.647134
USD	COP	3650.12290000	2026-01-14	2026-01-15 15:00:00.647134
USD	CRC	496.74060000	2026-01-14	2026-01-15 15:00:00.647134
USD	CUP	24.00000000	2026-01-14	2026-01-15 15:00:00.647134
USD	CVE	94.66690000	2026-01-14	2026-01-15 15:00:00.647134
USD	CZK	20.81350000	2026-01-14	2026-01-15 15:00:00.647134
USD	DJF	177.72100000	2026-01-14	2026-01-15 15:00:00.647134
USD	DKK	6.40730000	2026-01-14	2026-01-15 15:00:00.647134
USD	DOP	63.70180000	2026-01-14	2026-01-15 15:00:00.647134
USD	DZD	130.10530000	2026-01-14	2026-01-15 15:00:00.647134
USD	EGP	47.28730000	2026-01-14	2026-01-15 15:00:00.647134
USD	ERN	15.00000000	2026-01-14	2026-01-15 15:00:00.647134
USD	ETB	154.63920000	2026-01-14	2026-01-15 15:00:00.647134
USD	EUR	0.85850000	2026-01-14	2026-01-15 15:00:00.647134
USD	FJD	2.28160000	2026-01-14	2026-01-15 15:00:00.647134
USD	FKP	0.74400000	2026-01-14	2026-01-15 15:00:00.647134
USD	FOK	6.40730000	2026-01-14	2026-01-15 15:00:00.647134
USD	GBP	0.74390000	2026-01-14	2026-01-15 15:00:00.647134
USD	GEL	2.69560000	2026-01-14	2026-01-15 15:00:00.647134
USD	GGP	0.74400000	2026-01-14	2026-01-15 15:00:00.647134
USD	GHS	10.76140000	2026-01-14	2026-01-15 15:00:00.647134
USD	GIP	0.74400000	2026-01-14	2026-01-15 15:00:00.647134
USD	GMD	73.96200000	2026-01-14	2026-01-15 15:00:00.647134
USD	GNF	8750.07850000	2026-01-14	2026-01-15 15:00:00.647134
USD	GTQ	7.67010000	2026-01-14	2026-01-15 15:00:00.647134
USD	GYD	209.17940000	2026-01-14	2026-01-15 15:00:00.647134
USD	HKD	7.79760000	2026-01-14	2026-01-15 15:00:00.647134
USD	HNL	26.38750000	2026-01-14	2026-01-15 15:00:00.647134
USD	HRK	6.46870000	2026-01-14	2026-01-15 15:00:00.647134
USD	HTG	130.91950000	2026-01-14	2026-01-15 15:00:00.647134
USD	HUF	331.62120000	2026-01-14	2026-01-15 15:00:00.647134
USD	IDR	16878.59360000	2026-01-14	2026-01-15 15:00:00.647134
USD	ILS	3.15750000	2026-01-14	2026-01-15 15:00:00.647134
USD	IMP	0.74400000	2026-01-14	2026-01-15 15:00:00.647134
USD	INR	90.33960000	2026-01-14	2026-01-15 15:00:00.647134
USD	IQD	1310.74800000	2026-01-14	2026-01-15 15:00:00.647134
USD	IRR	440678.33840000	2026-01-14	2026-01-15 15:00:00.647134
USD	ISK	125.74040000	2026-01-14	2026-01-15 15:00:00.647134
USD	JEP	0.74400000	2026-01-14	2026-01-15 15:00:00.647134
USD	JMD	157.97970000	2026-01-14	2026-01-15 15:00:00.647134
USD	JOD	0.70900000	2026-01-14	2026-01-15 15:00:00.647134
USD	JPY	158.50320000	2026-01-14	2026-01-15 15:00:00.647134
USD	KES	128.95090000	2026-01-14	2026-01-15 15:00:00.647134
USD	KGS	87.44820000	2026-01-14	2026-01-15 15:00:00.647134
USD	KHR	4024.88510000	2026-01-14	2026-01-15 15:00:00.647134
USD	KID	1.49700000	2026-01-14	2026-01-15 15:00:00.647134
USD	KMF	422.37380000	2026-01-14	2026-01-15 15:00:00.647134
USD	KRW	1469.83910000	2026-01-14	2026-01-15 15:00:00.647134
USD	KWD	0.30720000	2026-01-14	2026-01-15 15:00:00.647134
USD	KYD	0.83330000	2026-01-14	2026-01-15 15:00:00.647134
USD	KZT	510.22030000	2026-01-14	2026-01-15 15:00:00.647134
USD	LAK	21690.86580000	2026-01-14	2026-01-15 15:00:00.647134
USD	LBP	89500.00000000	2026-01-14	2026-01-15 15:00:00.647134
USD	LKR	309.13270000	2026-01-14	2026-01-15 15:00:00.647134
USD	LRD	179.90830000	2026-01-14	2026-01-15 15:00:00.647134
USD	LSL	16.40110000	2026-01-14	2026-01-15 15:00:00.647134
USD	LYD	5.43120000	2026-01-14	2026-01-15 15:00:00.647134
USD	MAD	9.21400000	2026-01-14	2026-01-15 15:00:00.647134
USD	MDL	17.05200000	2026-01-14	2026-01-15 15:00:00.647134
USD	MGA	4625.77740000	2026-01-14	2026-01-15 15:00:00.647134
USD	MKD	52.82610000	2026-01-14	2026-01-15 15:00:00.647134
USD	MMK	2098.50810000	2026-01-14	2026-01-15 15:00:00.647134
USD	MNT	3571.05050000	2026-01-14	2026-01-15 15:00:00.647134
USD	MOP	8.03140000	2026-01-14	2026-01-15 15:00:00.647134
USD	MRU	39.90810000	2026-01-14	2026-01-15 15:00:00.647134
USD	MUR	46.42620000	2026-01-14	2026-01-15 15:00:00.647134
USD	MVR	15.45070000	2026-01-14	2026-01-15 15:00:00.647134
USD	MWK	1740.13380000	2026-01-14	2026-01-15 15:00:00.647134
USD	MXN	17.80620000	2026-01-14	2026-01-15 15:00:00.647134
USD	MYR	4.04860000	2026-01-14	2026-01-15 15:00:00.647134
USD	MZN	63.72190000	2026-01-14	2026-01-15 15:00:00.647134
USD	NAD	16.40110000	2026-01-14	2026-01-15 15:00:00.647134
USD	NGN	1421.07080000	2026-01-14	2026-01-15 15:00:00.647134
USD	NIO	36.81740000	2026-01-14	2026-01-15 15:00:00.647134
USD	NOK	10.06470000	2026-01-14	2026-01-15 15:00:00.647134
USD	NPR	144.54580000	2026-01-14	2026-01-15 15:00:00.647134
USD	NZD	1.74130000	2026-01-14	2026-01-15 15:00:00.647134
USD	OMR	0.38450000	2026-01-14	2026-01-15 15:00:00.647134
USD	PAB	1.00000000	2026-01-14	2026-01-15 15:00:00.647134
USD	PEN	3.35970000	2026-01-14	2026-01-15 15:00:00.647134
USD	PGK	4.26890000	2026-01-14	2026-01-15 15:00:00.647134
USD	PHP	59.50710000	2026-01-14	2026-01-15 15:00:00.647134
USD	PKR	280.01910000	2026-01-14	2026-01-15 15:00:00.647134
USD	PLN	3.61570000	2026-01-14	2026-01-15 15:00:00.647134
USD	PYG	6724.91790000	2026-01-14	2026-01-15 15:00:00.647134
USD	QAR	3.64000000	2026-01-14	2026-01-15 15:00:00.647134
USD	RON	4.36840000	2026-01-14	2026-01-15 15:00:00.647134
USD	RSD	100.69860000	2026-01-14	2026-01-15 15:00:00.647134
USD	RUB	78.46420000	2026-01-14	2026-01-15 15:00:00.647134
USD	RWF	1459.13170000	2026-01-14	2026-01-15 15:00:00.647134
USD	SAR	3.75000000	2026-01-14	2026-01-15 15:00:00.647134
USD	SBD	8.03110000	2026-01-14	2026-01-15 15:00:00.647134
USD	SCR	13.77870000	2026-01-14	2026-01-15 15:00:00.647134
USD	SDG	544.14410000	2026-01-14	2026-01-15 15:00:00.647134
USD	SEK	9.19870000	2026-01-14	2026-01-15 15:00:00.647134
USD	SGD	1.28780000	2026-01-14	2026-01-15 15:00:00.647134
USD	SHP	0.74400000	2026-01-14	2026-01-15 15:00:00.647134
USD	SLE	24.14810000	2026-01-14	2026-01-15 15:00:00.647134
USD	SLL	24148.07780000	2026-01-14	2026-01-15 15:00:00.647134
USD	SOS	570.47900000	2026-01-14	2026-01-15 15:00:00.647134
USD	SRD	38.08870000	2026-01-14	2026-01-15 15:00:00.647134
USD	SSP	4562.96390000	2026-01-14	2026-01-15 15:00:00.647134
USD	STN	21.03420000	2026-01-14	2026-01-15 15:00:00.647134
USD	SYP	113.55240000	2026-01-14	2026-01-15 15:00:00.647134
USD	SZL	16.40110000	2026-01-14	2026-01-15 15:00:00.647134
USD	THB	31.46740000	2026-01-14	2026-01-15 15:00:00.647134
USD	TJS	9.30290000	2026-01-14	2026-01-15 15:00:00.647134
USD	TMT	3.49920000	2026-01-14	2026-01-15 15:00:00.647134
USD	TND	2.89050000	2026-01-14	2026-01-15 15:00:00.647134
USD	TOP	2.38980000	2026-01-14	2026-01-15 15:00:00.647134
USD	TRY	43.20050000	2026-01-14	2026-01-15 15:00:00.647134
USD	TTD	6.77510000	2026-01-14	2026-01-15 15:00:00.647134
USD	TVD	1.49700000	2026-01-14	2026-01-15 15:00:00.647134
USD	TWD	31.57270000	2026-01-14	2026-01-15 15:00:00.647134
USD	TZS	2487.00620000	2026-01-14	2026-01-15 15:00:00.647134
USD	UAH	43.07560000	2026-01-14	2026-01-15 15:00:00.647134
USD	UGX	3548.34610000	2026-01-14	2026-01-15 15:00:00.647134
USD	UYU	38.82090000	2026-01-14	2026-01-15 15:00:00.647134
USD	UZS	12059.23870000	2026-01-14	2026-01-15 15:00:00.647134
USD	VES	339.14950000	2026-01-14	2026-01-15 15:00:00.647134
USD	VND	26201.57210000	2026-01-14	2026-01-15 15:00:00.647134
USD	VUV	120.42930000	2026-01-14	2026-01-15 15:00:00.647134
USD	WST	2.75320000	2026-01-14	2026-01-15 15:00:00.647134
USD	XAF	563.16500000	2026-01-14	2026-01-15 15:00:00.647134
USD	XCD	2.70000000	2026-01-14	2026-01-15 15:00:00.647134
USD	XCG	1.79000000	2026-01-14	2026-01-15 15:00:00.647134
USD	XDR	0.73090000	2026-01-14	2026-01-15 15:00:00.647134
USD	XOF	563.16500000	2026-01-14	2026-01-15 15:00:00.647134
USD	XPF	102.45120000	2026-01-14	2026-01-15 15:00:00.647134
USD	YER	238.34090000	2026-01-14	2026-01-15 15:00:00.647134
USD	ZAR	16.39890000	2026-01-14	2026-01-15 15:00:00.647134
USD	ZMW	19.64870000	2026-01-14	2026-01-15 15:00:00.647134
USD	ZWG	25.67180000	2026-01-14	2026-01-15 15:00:00.647134
USD	ZWL	25.67180000	2026-01-14	2026-01-15 15:00:00.647134
USD	USD	1.00000000	2026-01-16	2026-01-17 09:53:19.388447
USD	AED	3.67250000	2026-01-16	2026-01-17 09:53:19.388447
USD	AFN	66.01360000	2026-01-16	2026-01-17 09:53:19.388447
USD	ALL	83.00160000	2026-01-16	2026-01-17 09:53:19.388447
USD	AMD	379.93000000	2026-01-16	2026-01-17 09:53:19.388447
USD	ANG	1.79000000	2026-01-16	2026-01-17 09:53:19.388447
USD	AOA	921.10640000	2026-01-16	2026-01-17 09:53:19.388447
USD	ARS	1452.25000000	2026-01-16	2026-01-17 09:53:19.388447
USD	AUD	1.49550000	2026-01-16	2026-01-17 09:53:19.388447
USD	AWG	1.79000000	2026-01-16	2026-01-17 09:53:19.388447
USD	AZN	1.70030000	2026-01-16	2026-01-17 09:53:19.388447
USD	BAM	1.68510000	2026-01-16	2026-01-17 09:53:19.388447
USD	BBD	2.00000000	2026-01-16	2026-01-17 09:53:19.388447
USD	BDT	122.27210000	2026-01-16	2026-01-17 09:53:19.388447
USD	BGN	1.62810000	2026-01-16	2026-01-17 09:53:19.388447
USD	BHD	0.37600000	2026-01-16	2026-01-17 09:53:19.388447
USD	BIF	2969.64330000	2026-01-16	2026-01-17 09:53:19.388447
USD	BMD	1.00000000	2026-01-16	2026-01-17 09:53:19.388447
USD	BND	1.28860000	2026-01-16	2026-01-17 09:53:19.388447
USD	BOB	6.93030000	2026-01-16	2026-01-17 09:53:19.388447
USD	BRL	5.37230000	2026-01-16	2026-01-17 09:53:19.388447
USD	BSD	1.00000000	2026-01-16	2026-01-17 09:53:19.388447
USD	BTN	90.73520000	2026-01-16	2026-01-17 09:53:19.388447
USD	BWP	14.00930000	2026-01-16	2026-01-17 09:53:19.388447
USD	BYN	2.90750000	2026-01-16	2026-01-17 09:53:19.388447
USD	BZD	2.00000000	2026-01-16	2026-01-17 09:53:19.388447
USD	CAD	1.39090000	2026-01-16	2026-01-17 09:53:19.388447
USD	CDF	2232.05470000	2026-01-16	2026-01-17 09:53:19.388447
USD	CHF	0.80280000	2026-01-16	2026-01-17 09:53:19.388447
USD	CLF	0.02233000	2026-01-16	2026-01-17 09:53:19.388447
USD	CLP	882.72980000	2026-01-16	2026-01-17 09:53:19.388447
USD	CNH	6.96830000	2026-01-16	2026-01-17 09:53:19.388447
USD	CNY	6.98440000	2026-01-16	2026-01-17 09:53:19.388447
USD	COP	3671.77230000	2026-01-16	2026-01-17 09:53:19.388447
USD	CRC	495.79170000	2026-01-16	2026-01-17 09:53:19.388447
USD	CUP	24.00000000	2026-01-16	2026-01-17 09:53:19.388447
USD	CVE	95.00060000	2026-01-16	2026-01-17 09:53:19.388447
USD	CZK	20.91690000	2026-01-16	2026-01-17 09:53:19.388447
USD	DJF	177.72100000	2026-01-16	2026-01-17 09:53:19.388447
USD	DKK	6.42860000	2026-01-16	2026-01-17 09:53:19.388447
USD	DOP	63.73710000	2026-01-16	2026-01-17 09:53:19.388447
USD	DZD	130.10090000	2026-01-16	2026-01-17 09:53:19.388447
USD	EGP	47.27670000	2026-01-16	2026-01-17 09:53:19.388447
USD	ERN	15.00000000	2026-01-16	2026-01-17 09:53:19.388447
USD	ETB	154.50060000	2026-01-16	2026-01-17 09:53:19.388447
USD	EUR	0.86160000	2026-01-16	2026-01-17 09:53:19.388447
USD	FJD	2.27980000	2026-01-16	2026-01-17 09:53:19.388447
USD	FKP	0.74700000	2026-01-16	2026-01-17 09:53:19.388447
USD	FOK	6.42860000	2026-01-16	2026-01-17 09:53:19.388447
USD	GBP	0.74700000	2026-01-16	2026-01-17 09:53:19.388447
USD	GEL	2.69530000	2026-01-16	2026-01-17 09:53:19.388447
USD	GGP	0.74700000	2026-01-16	2026-01-17 09:53:19.388447
USD	GHS	10.84690000	2026-01-16	2026-01-17 09:53:19.388447
USD	GIP	0.74700000	2026-01-16	2026-01-17 09:53:19.388447
USD	GMD	74.00070000	2026-01-16	2026-01-17 09:53:19.388447
USD	GNF	8751.73070000	2026-01-16	2026-01-17 09:53:19.388447
USD	GTQ	7.66950000	2026-01-16	2026-01-17 09:53:19.388447
USD	GYD	209.17460000	2026-01-16	2026-01-17 09:53:19.388447
USD	HKD	7.79830000	2026-01-16	2026-01-17 09:53:19.388447
USD	HNL	26.39240000	2026-01-16	2026-01-17 09:53:19.388447
USD	HRK	6.49150000	2026-01-16	2026-01-17 09:53:19.388447
USD	HTG	130.95290000	2026-01-16	2026-01-17 09:53:19.388447
USD	HUF	331.93750000	2026-01-16	2026-01-17 09:53:19.388447
USD	IDR	16922.77880000	2026-01-16	2026-01-17 09:53:19.388447
USD	ILS	3.14470000	2026-01-16	2026-01-17 09:53:19.388447
USD	IMP	0.74700000	2026-01-16	2026-01-17 09:53:19.388447
USD	INR	90.75450000	2026-01-16	2026-01-17 09:53:19.388447
USD	IQD	1311.32990000	2026-01-16	2026-01-17 09:53:19.388447
USD	IRR	144967.11890000	2026-01-16	2026-01-17 09:53:19.388447
USD	ISK	125.96720000	2026-01-16	2026-01-17 09:53:19.388447
USD	JEP	0.74700000	2026-01-16	2026-01-17 09:53:19.388447
USD	JMD	157.56430000	2026-01-16	2026-01-17 09:53:19.388447
USD	JOD	0.70900000	2026-01-16	2026-01-17 09:53:19.388447
USD	JPY	158.15310000	2026-01-16	2026-01-17 09:53:19.388447
USD	KES	128.99580000	2026-01-16	2026-01-17 09:53:19.388447
USD	KGS	87.43010000	2026-01-16	2026-01-17 09:53:19.388447
USD	KHR	4024.47360000	2026-01-16	2026-01-17 09:53:19.388447
USD	KID	1.49540000	2026-01-16	2026-01-17 09:53:19.388447
USD	KMF	423.86260000	2026-01-16	2026-01-17 09:53:19.388447
USD	KRW	1472.79830000	2026-01-16	2026-01-17 09:53:19.388447
USD	KWD	0.30770000	2026-01-16	2026-01-17 09:53:19.388447
USD	KYD	0.83330000	2026-01-16	2026-01-17 09:53:19.388447
USD	KZT	510.65320000	2026-01-16	2026-01-17 09:53:19.388447
USD	LAK	21725.33620000	2026-01-16	2026-01-17 09:53:19.388447
USD	LBP	89500.00000000	2026-01-16	2026-01-17 09:53:19.388447
USD	LKR	309.52000000	2026-01-16	2026-01-17 09:53:19.388447
USD	LRD	180.07680000	2026-01-16	2026-01-17 09:53:19.388447
USD	LSL	16.40000000	2026-01-16	2026-01-17 09:53:19.388447
USD	LYD	5.43300000	2026-01-16	2026-01-17 09:53:19.388447
USD	MAD	9.22580000	2026-01-16	2026-01-17 09:53:19.388447
USD	MDL	17.11950000	2026-01-16	2026-01-17 09:53:19.388447
USD	MGA	4624.89180000	2026-01-16	2026-01-17 09:53:19.388447
USD	MKD	52.91670000	2026-01-16	2026-01-17 09:53:19.388447
USD	MMK	2098.38110000	2026-01-16	2026-01-17 09:53:19.388447
USD	MNT	3590.65920000	2026-01-16	2026-01-17 09:53:19.388447
USD	MOP	8.03230000	2026-01-16	2026-01-17 09:53:19.388447
USD	MRU	39.87030000	2026-01-16	2026-01-17 09:53:19.388447
USD	MUR	46.19350000	2026-01-16	2026-01-17 09:53:19.388447
USD	MVR	15.45010000	2026-01-16	2026-01-17 09:53:19.388447
USD	MWK	1745.67890000	2026-01-16	2026-01-17 09:53:19.388447
USD	MXN	17.65300000	2026-01-16	2026-01-17 09:53:19.388447
USD	MYR	4.05680000	2026-01-16	2026-01-17 09:53:19.388447
USD	MZN	63.66950000	2026-01-16	2026-01-17 09:53:19.388447
USD	NAD	16.40000000	2026-01-16	2026-01-17 09:53:19.388447
USD	NGN	1418.88330000	2026-01-16	2026-01-17 09:53:19.388447
USD	NIO	36.81730000	2026-01-16	2026-01-17 09:53:19.388447
USD	NOK	10.09170000	2026-01-16	2026-01-17 09:53:19.388447
USD	NPR	145.17630000	2026-01-16	2026-01-17 09:53:19.388447
USD	NZD	1.73840000	2026-01-16	2026-01-17 09:53:19.388447
USD	OMR	0.38450000	2026-01-16	2026-01-17 09:53:19.388447
USD	PAB	1.00000000	2026-01-16	2026-01-17 09:53:19.388447
USD	PEN	3.36000000	2026-01-16	2026-01-17 09:53:19.388447
USD	PGK	4.26890000	2026-01-16	2026-01-17 09:53:19.388447
USD	PHP	59.42720000	2026-01-16	2026-01-17 09:53:19.388447
USD	PKR	281.99110000	2026-01-16	2026-01-17 09:53:19.388447
USD	PLN	3.63400000	2026-01-16	2026-01-17 09:53:19.388447
USD	PYG	6770.04150000	2026-01-16	2026-01-17 09:53:19.388447
USD	QAR	3.64000000	2026-01-16	2026-01-17 09:53:19.388447
USD	RON	4.38460000	2026-01-16	2026-01-17 09:53:19.388447
USD	RSD	100.98220000	2026-01-16	2026-01-17 09:53:19.388447
USD	RUB	78.01060000	2026-01-16	2026-01-17 09:53:19.388447
USD	RWF	1459.67340000	2026-01-16	2026-01-17 09:53:19.388447
USD	SAR	3.75000000	2026-01-16	2026-01-17 09:53:19.388447
USD	SBD	8.03480000	2026-01-16	2026-01-17 09:53:19.388447
USD	SCR	13.84490000	2026-01-16	2026-01-17 09:53:19.388447
USD	SDG	510.88200000	2026-01-16	2026-01-17 09:53:19.388447
USD	SEK	9.22920000	2026-01-16	2026-01-17 09:53:19.388447
USD	SGD	1.28860000	2026-01-16	2026-01-17 09:53:19.388447
USD	SHP	0.74700000	2026-01-16	2026-01-17 09:53:19.388447
USD	SLE	24.14810000	2026-01-16	2026-01-17 09:53:19.388447
USD	SLL	24148.07780000	2026-01-16	2026-01-17 09:53:19.388447
USD	SOS	570.49390000	2026-01-16	2026-01-17 09:53:19.388447
USD	SRD	38.23950000	2026-01-16	2026-01-17 09:53:19.388447
USD	SSP	4689.18080000	2026-01-16	2026-01-17 09:53:19.388447
USD	STN	21.10840000	2026-01-16	2026-01-17 09:53:19.388447
USD	SYP	114.04960000	2026-01-16	2026-01-17 09:53:19.388447
USD	SZL	16.40000000	2026-01-16	2026-01-17 09:53:19.388447
USD	THB	31.43700000	2026-01-16	2026-01-17 09:53:19.388447
USD	TJS	9.30940000	2026-01-16	2026-01-17 09:53:19.388447
USD	TMT	3.49980000	2026-01-16	2026-01-17 09:53:19.388447
USD	TND	2.89540000	2026-01-16	2026-01-17 09:53:19.388447
USD	TOP	2.38800000	2026-01-16	2026-01-17 09:53:19.388447
USD	TRY	43.26490000	2026-01-16	2026-01-17 09:53:19.388447
USD	TTD	6.75780000	2026-01-16	2026-01-17 09:53:19.388447
USD	TVD	1.49540000	2026-01-16	2026-01-17 09:53:19.388447
USD	TWD	31.57810000	2026-01-16	2026-01-17 09:53:19.388447
USD	TZS	2472.45710000	2026-01-16	2026-01-17 09:53:19.388447
USD	UAH	43.43690000	2026-01-16	2026-01-17 09:53:19.388447
USD	UGX	3508.80890000	2026-01-16	2026-01-17 09:53:19.388447
USD	UYU	38.71150000	2026-01-16	2026-01-17 09:53:19.388447
USD	UZS	12010.75100000	2026-01-16	2026-01-17 09:53:19.388447
USD	VES	344.50710000	2026-01-16	2026-01-17 09:53:19.388447
USD	VND	26225.11460000	2026-01-16	2026-01-17 09:53:19.388447
USD	VUV	120.50720000	2026-01-16	2026-01-17 09:53:19.388447
USD	WST	2.75490000	2026-01-16	2026-01-17 09:53:19.388447
USD	XAF	565.15010000	2026-01-16	2026-01-17 09:53:19.388447
USD	XCD	2.70000000	2026-01-16	2026-01-17 09:53:19.388447
USD	XCG	1.79000000	2026-01-16	2026-01-17 09:53:19.388447
USD	XDR	0.73290000	2026-01-16	2026-01-17 09:53:19.388447
USD	XOF	565.15010000	2026-01-16	2026-01-17 09:53:19.388447
USD	XPF	102.81240000	2026-01-16	2026-01-17 09:53:19.388447
USD	YER	238.44750000	2026-01-16	2026-01-17 09:53:19.388447
USD	ZAR	16.40000000	2026-01-16	2026-01-17 09:53:19.388447
USD	ZMW	19.98290000	2026-01-16	2026-01-17 09:53:19.388447
USD	ZWG	25.60570000	2026-01-16	2026-01-17 09:53:19.388447
USD	ZWL	25.60570000	2026-01-16	2026-01-17 09:53:19.388447
USD	USD	1.00000000	2026-01-17	2026-01-18 15:00:00.806153
USD	AED	3.67250000	2026-01-17	2026-01-18 15:00:00.806153
USD	AFN	66.00470000	2026-01-17	2026-01-18 15:00:00.806153
USD	ALL	83.00390000	2026-01-17	2026-01-18 15:00:00.806153
USD	AMD	379.94010000	2026-01-17	2026-01-18 15:00:00.806153
USD	ANG	1.79000000	2026-01-17	2026-01-18 15:00:00.806153
USD	AOA	915.93000000	2026-01-17	2026-01-18 15:00:00.806153
USD	ARS	1452.25000000	2026-01-17	2026-01-18 15:00:00.806153
USD	AUD	1.49520000	2026-01-17	2026-01-18 15:00:00.806153
USD	AWG	1.79000000	2026-01-17	2026-01-18 15:00:00.806153
USD	AZN	1.70040000	2026-01-17	2026-01-18 15:00:00.806153
USD	BAM	1.68500000	2026-01-17	2026-01-18 15:00:00.806153
USD	BBD	2.00000000	2026-01-17	2026-01-18 15:00:00.806153
USD	BDT	122.27770000	2026-01-17	2026-01-18 15:00:00.806153
USD	BGN	1.66820000	2026-01-17	2026-01-18 15:00:00.806153
USD	BHD	0.37600000	2026-01-17	2026-01-18 15:00:00.806153
USD	BIF	2969.77220000	2026-01-17	2026-01-18 15:00:00.806153
USD	BMD	1.00000000	2026-01-17	2026-01-18 15:00:00.806153
USD	BND	1.28870000	2026-01-17	2026-01-18 15:00:00.806153
USD	BOB	6.93030000	2026-01-17	2026-01-18 15:00:00.806153
USD	BRL	5.37190000	2026-01-17	2026-01-18 15:00:00.806153
USD	BSD	1.00000000	2026-01-17	2026-01-18 15:00:00.806153
USD	BTN	90.74820000	2026-01-17	2026-01-18 15:00:00.806153
USD	BWP	13.81760000	2026-01-17	2026-01-18 15:00:00.806153
USD	BYN	2.90750000	2026-01-17	2026-01-18 15:00:00.806153
USD	BZD	2.00000000	2026-01-17	2026-01-18 15:00:00.806153
USD	CAD	1.39080000	2026-01-17	2026-01-18 15:00:00.806153
USD	CDF	2211.27200000	2026-01-17	2026-01-18 15:00:00.806153
USD	CHF	0.80280000	2026-01-17	2026-01-18 15:00:00.806153
USD	CLF	0.02233000	2026-01-17	2026-01-18 15:00:00.806153
USD	CLP	882.73980000	2026-01-17	2026-01-18 15:00:00.806153
USD	CNH	6.96760000	2026-01-17	2026-01-18 15:00:00.806153
USD	CNY	6.98770000	2026-01-17	2026-01-18 15:00:00.806153
USD	COP	3672.09700000	2026-01-17	2026-01-18 15:00:00.806153
USD	CRC	495.78670000	2026-01-17	2026-01-18 15:00:00.806153
USD	CUP	24.00000000	2026-01-17	2026-01-18 15:00:00.806153
USD	CVE	94.99510000	2026-01-17	2026-01-18 15:00:00.806153
USD	CZK	20.91740000	2026-01-17	2026-01-18 15:00:00.806153
USD	DJF	177.72100000	2026-01-17	2026-01-18 15:00:00.806153
USD	DKK	6.42760000	2026-01-17	2026-01-18 15:00:00.806153
USD	DOP	63.73850000	2026-01-17	2026-01-18 15:00:00.806153
USD	DZD	130.10270000	2026-01-17	2026-01-18 15:00:00.806153
USD	EGP	47.27790000	2026-01-17	2026-01-18 15:00:00.806153
USD	ERN	15.00000000	2026-01-17	2026-01-18 15:00:00.806153
USD	ETB	154.41700000	2026-01-17	2026-01-18 15:00:00.806153
USD	EUR	0.86150000	2026-01-17	2026-01-18 15:00:00.806153
USD	FJD	2.27970000	2026-01-17	2026-01-18 15:00:00.806153
USD	FKP	0.74690000	2026-01-17	2026-01-18 15:00:00.806153
USD	FOK	6.42760000	2026-01-17	2026-01-18 15:00:00.806153
USD	GBP	0.74690000	2026-01-17	2026-01-18 15:00:00.806153
USD	GEL	2.69530000	2026-01-17	2026-01-18 15:00:00.806153
USD	GGP	0.74690000	2026-01-17	2026-01-18 15:00:00.806153
USD	GHS	10.84370000	2026-01-17	2026-01-18 15:00:00.806153
USD	GIP	0.74690000	2026-01-17	2026-01-18 15:00:00.806153
USD	GMD	73.99950000	2026-01-17	2026-01-18 15:00:00.806153
USD	GNF	8751.21640000	2026-01-17	2026-01-18 15:00:00.806153
USD	GTQ	7.66960000	2026-01-17	2026-01-18 15:00:00.806153
USD	GYD	209.17440000	2026-01-17	2026-01-18 15:00:00.806153
USD	HKD	7.79860000	2026-01-17	2026-01-18 15:00:00.806153
USD	HNL	26.39320000	2026-01-17	2026-01-18 15:00:00.806153
USD	HRK	6.49110000	2026-01-17	2026-01-18 15:00:00.806153
USD	HTG	130.94390000	2026-01-17	2026-01-18 15:00:00.806153
USD	HUF	331.95720000	2026-01-17	2026-01-18 15:00:00.806153
USD	IDR	16918.65960000	2026-01-17	2026-01-18 15:00:00.806153
USD	ILS	3.14460000	2026-01-17	2026-01-18 15:00:00.806153
USD	IMP	0.74690000	2026-01-17	2026-01-18 15:00:00.806153
USD	INR	90.77420000	2026-01-17	2026-01-18 15:00:00.806153
USD	IQD	1311.35570000	2026-01-17	2026-01-18 15:00:00.806153
USD	IRR	158323.10010000	2026-01-17	2026-01-18 15:00:00.806153
USD	ISK	125.95950000	2026-01-17	2026-01-18 15:00:00.806153
USD	JEP	0.74690000	2026-01-17	2026-01-18 15:00:00.806153
USD	JMD	157.65340000	2026-01-17	2026-01-18 15:00:00.806153
USD	JOD	0.70900000	2026-01-17	2026-01-18 15:00:00.806153
USD	JPY	158.16740000	2026-01-17	2026-01-18 15:00:00.806153
USD	KES	128.94830000	2026-01-17	2026-01-18 15:00:00.806153
USD	KGS	87.43240000	2026-01-17	2026-01-18 15:00:00.806153
USD	KHR	4024.45540000	2026-01-17	2026-01-18 15:00:00.806153
USD	KID	1.49520000	2026-01-17	2026-01-18 15:00:00.806153
USD	KMF	423.83840000	2026-01-17	2026-01-18 15:00:00.806153
USD	KRW	1472.59650000	2026-01-17	2026-01-18 15:00:00.806153
USD	KWD	0.30770000	2026-01-17	2026-01-18 15:00:00.806153
USD	KYD	0.83330000	2026-01-17	2026-01-18 15:00:00.806153
USD	KZT	510.71790000	2026-01-17	2026-01-18 15:00:00.806153
USD	LAK	21725.50050000	2026-01-17	2026-01-18 15:00:00.806153
USD	LBP	89500.00000000	2026-01-17	2026-01-18 15:00:00.806153
USD	LKR	309.49290000	2026-01-17	2026-01-18 15:00:00.806153
USD	LRD	180.08240000	2026-01-17	2026-01-18 15:00:00.806153
USD	LSL	16.39930000	2026-01-17	2026-01-18 15:00:00.806153
USD	LYD	5.43310000	2026-01-17	2026-01-18 15:00:00.806153
USD	MAD	9.21950000	2026-01-17	2026-01-18 15:00:00.806153
USD	MDL	17.11380000	2026-01-17	2026-01-18 15:00:00.806153
USD	MGA	4620.58800000	2026-01-17	2026-01-18 15:00:00.806153
USD	MKD	52.99250000	2026-01-17	2026-01-18 15:00:00.806153
USD	MMK	2098.40900000	2026-01-17	2026-01-18 15:00:00.806153
USD	MNT	3587.23240000	2026-01-17	2026-01-18 15:00:00.806153
USD	MOP	8.03250000	2026-01-17	2026-01-18 15:00:00.806153
USD	MRU	39.86980000	2026-01-17	2026-01-18 15:00:00.806153
USD	MUR	46.16420000	2026-01-17	2026-01-18 15:00:00.806153
USD	MVR	15.44990000	2026-01-17	2026-01-18 15:00:00.806153
USD	MWK	1745.13880000	2026-01-17	2026-01-18 15:00:00.806153
USD	MXN	17.65470000	2026-01-17	2026-01-18 15:00:00.806153
USD	MYR	4.05660000	2026-01-17	2026-01-18 15:00:00.806153
USD	MZN	63.42370000	2026-01-17	2026-01-18 15:00:00.806153
USD	NAD	16.39930000	2026-01-17	2026-01-18 15:00:00.806153
USD	NGN	1417.98160000	2026-01-17	2026-01-18 15:00:00.806153
USD	NIO	36.81760000	2026-01-17	2026-01-18 15:00:00.806153
USD	NOK	10.09290000	2026-01-17	2026-01-18 15:00:00.806153
USD	NPR	145.19710000	2026-01-17	2026-01-18 15:00:00.806153
USD	NZD	1.73840000	2026-01-17	2026-01-18 15:00:00.806153
USD	OMR	0.38450000	2026-01-17	2026-01-18 15:00:00.806153
USD	PAB	1.00000000	2026-01-17	2026-01-18 15:00:00.806153
USD	PEN	3.36010000	2026-01-17	2026-01-18 15:00:00.806153
USD	PGK	4.26900000	2026-01-17	2026-01-18 15:00:00.806153
USD	PHP	59.43250000	2026-01-17	2026-01-18 15:00:00.806153
USD	PKR	281.72190000	2026-01-17	2026-01-18 15:00:00.806153
USD	PLN	3.63480000	2026-01-17	2026-01-18 15:00:00.806153
USD	PYG	6769.49700000	2026-01-17	2026-01-18 15:00:00.806153
USD	QAR	3.64000000	2026-01-17	2026-01-18 15:00:00.806153
USD	RON	4.38460000	2026-01-17	2026-01-18 15:00:00.806153
USD	RSD	100.97400000	2026-01-17	2026-01-18 15:00:00.806153
USD	RUB	78.00300000	2026-01-17	2026-01-18 15:00:00.806153
USD	RWF	1459.80050000	2026-01-17	2026-01-18 15:00:00.806153
USD	SAR	3.75000000	2026-01-17	2026-01-18 15:00:00.806153
USD	SBD	8.03470000	2026-01-17	2026-01-18 15:00:00.806153
USD	SCR	13.85470000	2026-01-17	2026-01-18 15:00:00.806153
USD	SDG	509.41260000	2026-01-17	2026-01-18 15:00:00.806153
USD	SEK	9.22710000	2026-01-17	2026-01-18 15:00:00.806153
USD	SGD	1.28870000	2026-01-17	2026-01-18 15:00:00.806153
USD	SHP	0.74690000	2026-01-17	2026-01-18 15:00:00.806153
USD	SLE	24.14810000	2026-01-17	2026-01-18 15:00:00.806153
USD	SLL	24148.07780000	2026-01-17	2026-01-18 15:00:00.806153
USD	SOS	570.49450000	2026-01-17	2026-01-18 15:00:00.806153
USD	SRD	38.24190000	2026-01-17	2026-01-18 15:00:00.806153
USD	SSP	4685.33530000	2026-01-17	2026-01-18 15:00:00.806153
USD	STN	21.10720000	2026-01-17	2026-01-18 15:00:00.806153
USD	SYP	114.00270000	2026-01-17	2026-01-18 15:00:00.806153
USD	SZL	16.39930000	2026-01-17	2026-01-18 15:00:00.806153
USD	THB	31.43410000	2026-01-17	2026-01-18 15:00:00.806153
USD	TJS	9.30960000	2026-01-17	2026-01-18 15:00:00.806153
USD	TMT	3.49980000	2026-01-17	2026-01-18 15:00:00.806153
USD	TND	2.89550000	2026-01-17	2026-01-18 15:00:00.806153
USD	TOP	2.38790000	2026-01-17	2026-01-18 15:00:00.806153
USD	TRY	43.26880000	2026-01-17	2026-01-18 15:00:00.806153
USD	TTD	6.76340000	2026-01-17	2026-01-18 15:00:00.806153
USD	TVD	1.49520000	2026-01-17	2026-01-18 15:00:00.806153
USD	TWD	31.61500000	2026-01-17	2026-01-18 15:00:00.806153
USD	TZS	2473.51410000	2026-01-17	2026-01-18 15:00:00.806153
USD	UAH	43.43600000	2026-01-17	2026-01-18 15:00:00.806153
USD	UGX	3511.95120000	2026-01-17	2026-01-18 15:00:00.806153
USD	UYU	38.71190000	2026-01-17	2026-01-18 15:00:00.806153
USD	UZS	12016.41350000	2026-01-17	2026-01-18 15:00:00.806153
USD	VES	344.50710000	2026-01-17	2026-01-18 15:00:00.806153
USD	VND	26197.74530000	2026-01-17	2026-01-18 15:00:00.806153
USD	VUV	120.52370000	2026-01-17	2026-01-18 15:00:00.806153
USD	WST	2.75470000	2026-01-17	2026-01-18 15:00:00.806153
USD	XAF	565.11790000	2026-01-17	2026-01-18 15:00:00.806153
USD	XCD	2.70000000	2026-01-17	2026-01-18 15:00:00.806153
USD	XCG	1.79000000	2026-01-17	2026-01-18 15:00:00.806153
USD	XDR	0.73280000	2026-01-17	2026-01-18 15:00:00.806153
USD	XOF	565.11790000	2026-01-17	2026-01-18 15:00:00.806153
USD	XPF	102.80650000	2026-01-17	2026-01-18 15:00:00.806153
USD	YER	238.45170000	2026-01-17	2026-01-18 15:00:00.806153
USD	ZAR	16.39940000	2026-01-17	2026-01-18 15:00:00.806153
USD	ZMW	19.96860000	2026-01-17	2026-01-18 15:00:00.806153
USD	ZWG	25.60570000	2026-01-17	2026-01-18 15:00:00.806153
USD	ZWL	25.60570000	2026-01-17	2026-01-18 15:00:00.806153
USD	USD	1.00000000	2026-01-18	2026-01-19 15:00:00.487456
USD	AED	3.67250000	2026-01-18	2026-01-19 15:00:00.487456
USD	AFN	65.03740000	2026-01-18	2026-01-19 15:00:00.487456
USD	ALL	83.11110000	2026-01-18	2026-01-19 15:00:00.487456
USD	AMD	379.93780000	2026-01-18	2026-01-19 15:00:00.487456
USD	ANG	1.79000000	2026-01-18	2026-01-19 15:00:00.487456
USD	AOA	916.40500000	2026-01-18	2026-01-19 15:00:00.487456
USD	ARS	1452.25000000	2026-01-18	2026-01-19 15:00:00.487456
USD	AUD	1.49530000	2026-01-18	2026-01-19 15:00:00.487456
USD	AWG	1.79000000	2026-01-18	2026-01-19 15:00:00.487456
USD	AZN	1.69910000	2026-01-18	2026-01-19 15:00:00.487456
USD	BAM	1.68510000	2026-01-18	2026-01-19 15:00:00.487456
USD	BBD	2.00000000	2026-01-18	2026-01-19 15:00:00.487456
USD	BDT	122.35110000	2026-01-18	2026-01-19 15:00:00.487456
USD	BGN	1.67800000	2026-01-18	2026-01-19 15:00:00.487456
USD	BHD	0.37600000	2026-01-18	2026-01-19 15:00:00.487456
USD	BIF	2968.76540000	2026-01-18	2026-01-19 15:00:00.487456
USD	BMD	1.00000000	2026-01-18	2026-01-19 15:00:00.487456
USD	BND	1.28850000	2026-01-18	2026-01-19 15:00:00.487456
USD	BOB	6.92100000	2026-01-18	2026-01-19 15:00:00.487456
USD	BRL	5.37040000	2026-01-18	2026-01-19 15:00:00.487456
USD	BSD	1.00000000	2026-01-18	2026-01-19 15:00:00.487456
USD	BTN	90.79710000	2026-01-18	2026-01-19 15:00:00.487456
USD	BWP	13.49580000	2026-01-18	2026-01-19 15:00:00.487456
USD	BYN	2.88680000	2026-01-18	2026-01-19 15:00:00.487456
USD	BZD	2.00000000	2026-01-18	2026-01-19 15:00:00.487456
USD	CAD	1.39030000	2026-01-18	2026-01-19 15:00:00.487456
USD	CDF	2215.24420000	2026-01-18	2026-01-19 15:00:00.487456
USD	CHF	0.80090000	2026-01-18	2026-01-19 15:00:00.487456
USD	CLF	0.02233000	2026-01-18	2026-01-19 15:00:00.487456
USD	CLP	882.64280000	2026-01-18	2026-01-19 15:00:00.487456
USD	CNH	6.96850000	2026-01-18	2026-01-19 15:00:00.487456
USD	CNY	6.97980000	2026-01-18	2026-01-19 15:00:00.487456
USD	COP	3683.03470000	2026-01-18	2026-01-19 15:00:00.487456
USD	CRC	493.97830000	2026-01-18	2026-01-19 15:00:00.487456
USD	CUP	24.00000000	2026-01-18	2026-01-19 15:00:00.487456
USD	CVE	95.00180000	2026-01-18	2026-01-19 15:00:00.487456
USD	CZK	20.92900000	2026-01-18	2026-01-19 15:00:00.487456
USD	DJF	177.72100000	2026-01-18	2026-01-19 15:00:00.487456
USD	DKK	6.42780000	2026-01-18	2026-01-19 15:00:00.487456
USD	DOP	63.80760000	2026-01-18	2026-01-19 15:00:00.487456
USD	DZD	130.08560000	2026-01-18	2026-01-19 15:00:00.487456
USD	EGP	47.34440000	2026-01-18	2026-01-19 15:00:00.487456
USD	ERN	15.00000000	2026-01-18	2026-01-19 15:00:00.487456
USD	ETB	154.53110000	2026-01-18	2026-01-19 15:00:00.487456
USD	EUR	0.86150000	2026-01-18	2026-01-19 15:00:00.487456
USD	FJD	2.27800000	2026-01-18	2026-01-19 15:00:00.487456
USD	FKP	0.74690000	2026-01-18	2026-01-19 15:00:00.487456
USD	FOK	6.43020000	2026-01-18	2026-01-19 15:00:00.487456
USD	GBP	0.74680000	2026-01-18	2026-01-19 15:00:00.487456
USD	GEL	2.69530000	2026-01-18	2026-01-19 15:00:00.487456
USD	GGP	0.74690000	2026-01-18	2026-01-19 15:00:00.487456
USD	GHS	10.83600000	2026-01-18	2026-01-19 15:00:00.487456
USD	GIP	0.74690000	2026-01-18	2026-01-19 15:00:00.487456
USD	GMD	73.99150000	2026-01-18	2026-01-19 15:00:00.487456
USD	GNF	8751.60950000	2026-01-18	2026-01-19 15:00:00.487456
USD	GTQ	7.66320000	2026-01-18	2026-01-19 15:00:00.487456
USD	GYD	209.17780000	2026-01-18	2026-01-19 15:00:00.487456
USD	HKD	7.79830000	2026-01-18	2026-01-19 15:00:00.487456
USD	HNL	26.38410000	2026-01-18	2026-01-19 15:00:00.487456
USD	HRK	6.49160000	2026-01-18	2026-01-19 15:00:00.487456
USD	HTG	130.94690000	2026-01-18	2026-01-19 15:00:00.487456
USD	HUF	332.03570000	2026-01-18	2026-01-19 15:00:00.487456
USD	IDR	16911.92330000	2026-01-18	2026-01-19 15:00:00.487456
USD	ILS	3.15080000	2026-01-18	2026-01-19 15:00:00.487456
USD	IMP	0.74690000	2026-01-18	2026-01-19 15:00:00.487456
USD	INR	90.79750000	2026-01-18	2026-01-19 15:00:00.487456
USD	IQD	1310.94120000	2026-01-18	2026-01-19 15:00:00.487456
USD	IRR	228424.53330000	2026-01-18	2026-01-19 15:00:00.487456
USD	ISK	125.90470000	2026-01-18	2026-01-19 15:00:00.487456
USD	JEP	0.74690000	2026-01-18	2026-01-19 15:00:00.487456
USD	JMD	157.95540000	2026-01-18	2026-01-19 15:00:00.487456
USD	JOD	0.70900000	2026-01-18	2026-01-19 15:00:00.487456
USD	JPY	157.79420000	2026-01-18	2026-01-19 15:00:00.487456
USD	KES	128.92160000	2026-01-18	2026-01-19 15:00:00.487456
USD	KGS	87.43870000	2026-01-18	2026-01-19 15:00:00.487456
USD	KHR	4024.74850000	2026-01-18	2026-01-19 15:00:00.487456
USD	KID	1.49520000	2026-01-18	2026-01-19 15:00:00.487456
USD	KMF	423.86820000	2026-01-18	2026-01-19 15:00:00.487456
USD	KRW	1473.17400000	2026-01-18	2026-01-19 15:00:00.487456
USD	KWD	0.30750000	2026-01-18	2026-01-19 15:00:00.487456
USD	KYD	0.83330000	2026-01-18	2026-01-19 15:00:00.487456
USD	KZT	512.08890000	2026-01-18	2026-01-19 15:00:00.487456
USD	LAK	21638.59410000	2026-01-18	2026-01-19 15:00:00.487456
USD	LBP	89500.00000000	2026-01-18	2026-01-19 15:00:00.487456
USD	LKR	309.43540000	2026-01-18	2026-01-19 15:00:00.487456
USD	LRD	180.28010000	2026-01-18	2026-01-19 15:00:00.487456
USD	LSL	16.42220000	2026-01-18	2026-01-19 15:00:00.487456
USD	LYD	5.43260000	2026-01-18	2026-01-19 15:00:00.487456
USD	MAD	9.22040000	2026-01-18	2026-01-19 15:00:00.487456
USD	MDL	17.09520000	2026-01-18	2026-01-19 15:00:00.487456
USD	MGA	4623.32940000	2026-01-18	2026-01-19 15:00:00.487456
USD	MKD	52.98360000	2026-01-18	2026-01-19 15:00:00.487456
USD	MMK	2098.52810000	2026-01-18	2026-01-19 15:00:00.487456
USD	MNT	3595.36360000	2026-01-18	2026-01-19 15:00:00.487456
USD	MOP	8.03230000	2026-01-18	2026-01-19 15:00:00.487456
USD	MRU	39.87780000	2026-01-18	2026-01-19 15:00:00.487456
USD	MUR	46.26090000	2026-01-18	2026-01-19 15:00:00.487456
USD	MVR	15.43230000	2026-01-18	2026-01-19 15:00:00.487456
USD	MWK	1744.05050000	2026-01-18	2026-01-19 15:00:00.487456
USD	MXN	17.66090000	2026-01-18	2026-01-19 15:00:00.487456
USD	MYR	4.05720000	2026-01-18	2026-01-19 15:00:00.487456
USD	MZN	63.45660000	2026-01-18	2026-01-19 15:00:00.487456
USD	NAD	16.42220000	2026-01-18	2026-01-19 15:00:00.487456
USD	NGN	1420.12500000	2026-01-18	2026-01-19 15:00:00.487456
USD	NIO	36.79290000	2026-01-18	2026-01-19 15:00:00.487456
USD	NOK	10.08920000	2026-01-18	2026-01-19 15:00:00.487456
USD	NPR	145.27540000	2026-01-18	2026-01-19 15:00:00.487456
USD	NZD	1.73740000	2026-01-18	2026-01-19 15:00:00.487456
USD	OMR	0.38450000	2026-01-18	2026-01-19 15:00:00.487456
USD	PAB	1.00000000	2026-01-18	2026-01-19 15:00:00.487456
USD	PEN	3.36010000	2026-01-18	2026-01-19 15:00:00.487456
USD	PGK	4.27130000	2026-01-18	2026-01-19 15:00:00.487456
USD	PHP	59.43850000	2026-01-18	2026-01-19 15:00:00.487456
USD	PKR	279.77870000	2026-01-18	2026-01-19 15:00:00.487456
USD	PLN	3.64050000	2026-01-18	2026-01-19 15:00:00.487456
USD	PYG	6767.56740000	2026-01-18	2026-01-19 15:00:00.487456
USD	QAR	3.64000000	2026-01-18	2026-01-19 15:00:00.487456
USD	RON	4.38340000	2026-01-18	2026-01-19 15:00:00.487456
USD	RSD	101.05300000	2026-01-18	2026-01-19 15:00:00.487456
USD	RUB	77.93140000	2026-01-18	2026-01-19 15:00:00.487456
USD	RWF	1459.70790000	2026-01-18	2026-01-19 15:00:00.487456
USD	SAR	3.75000000	2026-01-18	2026-01-19 15:00:00.487456
USD	SBD	8.02920000	2026-01-18	2026-01-19 15:00:00.487456
USD	SCR	14.06650000	2026-01-18	2026-01-19 15:00:00.487456
USD	SDG	533.10210000	2026-01-18	2026-01-19 15:00:00.487456
USD	SEK	9.22430000	2026-01-18	2026-01-19 15:00:00.487456
USD	SGD	1.28880000	2026-01-18	2026-01-19 15:00:00.487456
USD	SHP	0.74690000	2026-01-18	2026-01-19 15:00:00.487456
USD	SLE	24.14810000	2026-01-18	2026-01-19 15:00:00.487456
USD	SLL	24148.07780000	2026-01-18	2026-01-19 15:00:00.487456
USD	SOS	570.48390000	2026-01-18	2026-01-19 15:00:00.487456
USD	SRD	38.20280000	2026-01-18	2026-01-19 15:00:00.487456
USD	SSP	4666.39930000	2026-01-18	2026-01-19 15:00:00.487456
USD	STN	21.10860000	2026-01-18	2026-01-19 15:00:00.487456
USD	SYP	110.88680000	2026-01-18	2026-01-19 15:00:00.487456
USD	SZL	16.42220000	2026-01-18	2026-01-19 15:00:00.487456
USD	THB	31.44360000	2026-01-18	2026-01-19 15:00:00.487456
USD	TJS	9.31060000	2026-01-18	2026-01-19 15:00:00.487456
USD	TMT	3.49970000	2026-01-18	2026-01-19 15:00:00.487456
USD	TND	2.89520000	2026-01-18	2026-01-19 15:00:00.487456
USD	TOP	2.38800000	2026-01-18	2026-01-19 15:00:00.487456
USD	TRY	43.28940000	2026-01-18	2026-01-19 15:00:00.487456
USD	TTD	6.78500000	2026-01-18	2026-01-19 15:00:00.487456
USD	TVD	1.49520000	2026-01-18	2026-01-19 15:00:00.487456
USD	TWD	31.62450000	2026-01-18	2026-01-19 15:00:00.487456
USD	TZS	2474.81730000	2026-01-18	2026-01-19 15:00:00.487456
USD	UAH	43.41020000	2026-01-18	2026-01-19 15:00:00.487456
USD	UGX	3514.29360000	2026-01-18	2026-01-19 15:00:00.487456
USD	UYU	38.67120000	2026-01-18	2026-01-19 15:00:00.487456
USD	UZS	12016.71590000	2026-01-18	2026-01-19 15:00:00.487456
USD	VES	344.50710000	2026-01-18	2026-01-19 15:00:00.487456
USD	VND	26252.08340000	2026-01-18	2026-01-19 15:00:00.487456
USD	VUV	120.76120000	2026-01-18	2026-01-19 15:00:00.487456
USD	WST	2.74820000	2026-01-18	2026-01-19 15:00:00.487456
USD	XAF	565.15760000	2026-01-18	2026-01-19 15:00:00.487456
USD	XCD	2.70000000	2026-01-18	2026-01-19 15:00:00.487456
USD	XCG	1.79000000	2026-01-18	2026-01-19 15:00:00.487456
USD	XDR	0.73280000	2026-01-18	2026-01-19 15:00:00.487456
USD	XOF	565.15760000	2026-01-18	2026-01-19 15:00:00.487456
USD	XPF	102.81370000	2026-01-18	2026-01-19 15:00:00.487456
USD	YER	238.26950000	2026-01-18	2026-01-19 15:00:00.487456
USD	ZAR	16.41800000	2026-01-18	2026-01-19 15:00:00.487456
USD	ZMW	19.93490000	2026-01-18	2026-01-19 15:00:00.487456
USD	ZWG	25.60570000	2026-01-18	2026-01-19 15:00:00.487456
USD	ZWL	25.60570000	2026-01-18	2026-01-19 15:00:00.487456
USD	USD	1.00000000	2026-01-19	2026-01-20 15:00:00.907794
USD	AED	3.67250000	2026-01-19	2026-01-20 15:00:00.907794
USD	AFN	65.79150000	2026-01-19	2026-01-20 15:00:00.907794
USD	ALL	83.07590000	2026-01-19	2026-01-20 15:00:00.907794
USD	AMD	379.34230000	2026-01-19	2026-01-20 15:00:00.907794
USD	ANG	1.79000000	2026-01-19	2026-01-20 15:00:00.907794
USD	AOA	920.36630000	2026-01-19	2026-01-20 15:00:00.907794
USD	ARS	1452.25000000	2026-01-19	2026-01-20 15:00:00.907794
USD	AUD	1.49070000	2026-01-19	2026-01-20 15:00:00.907794
USD	AWG	1.79000000	2026-01-19	2026-01-20 15:00:00.907794
USD	AZN	1.69930000	2026-01-19	2026-01-20 15:00:00.907794
USD	BAM	1.68060000	2026-01-19	2026-01-20 15:00:00.907794
USD	BBD	2.00000000	2026-01-19	2026-01-20 15:00:00.907794
USD	BDT	122.32740000	2026-01-19	2026-01-20 15:00:00.907794
USD	BGN	1.62430000	2026-01-19	2026-01-20 15:00:00.907794
USD	BHD	0.37600000	2026-01-19	2026-01-20 15:00:00.907794
USD	BIF	2970.63330000	2026-01-19	2026-01-20 15:00:00.907794
USD	BMD	1.00000000	2026-01-19	2026-01-20 15:00:00.907794
USD	BND	1.28520000	2026-01-19	2026-01-20 15:00:00.907794
USD	BOB	6.91650000	2026-01-19	2026-01-20 15:00:00.907794
USD	BRL	5.36880000	2026-01-19	2026-01-20 15:00:00.907794
USD	BSD	1.00000000	2026-01-19	2026-01-20 15:00:00.907794
USD	BTN	90.95880000	2026-01-19	2026-01-20 15:00:00.907794
USD	BWP	13.77810000	2026-01-19	2026-01-20 15:00:00.907794
USD	BYN	2.89450000	2026-01-19	2026-01-20 15:00:00.907794
USD	BZD	2.00000000	2026-01-19	2026-01-20 15:00:00.907794
USD	CAD	1.38760000	2026-01-19	2026-01-20 15:00:00.907794
USD	CDF	2221.10380000	2026-01-19	2026-01-20 15:00:00.907794
USD	CHF	0.79790000	2026-01-19	2026-01-20 15:00:00.907794
USD	CLF	0.02243000	2026-01-19	2026-01-20 15:00:00.907794
USD	CLP	886.50720000	2026-01-19	2026-01-20 15:00:00.907794
USD	CNH	6.96000000	2026-01-19	2026-01-20 15:00:00.907794
USD	CNY	6.97670000	2026-01-19	2026-01-20 15:00:00.907794
USD	COP	3686.45700000	2026-01-19	2026-01-20 15:00:00.907794
USD	CRC	488.07860000	2026-01-19	2026-01-20 15:00:00.907794
USD	CUP	24.00000000	2026-01-19	2026-01-20 15:00:00.907794
USD	CVE	94.74700000	2026-01-19	2026-01-20 15:00:00.907794
USD	CZK	20.87760000	2026-01-19	2026-01-20 15:00:00.907794
USD	DJF	177.72100000	2026-01-19	2026-01-20 15:00:00.907794
USD	DKK	6.41410000	2026-01-19	2026-01-20 15:00:00.907794
USD	DOP	63.62640000	2026-01-19	2026-01-20 15:00:00.907794
USD	DZD	130.21470000	2026-01-19	2026-01-20 15:00:00.907794
USD	EGP	47.40960000	2026-01-19	2026-01-20 15:00:00.907794
USD	ERN	15.00000000	2026-01-19	2026-01-20 15:00:00.907794
USD	ETB	152.87270000	2026-01-19	2026-01-20 15:00:00.907794
USD	EUR	0.85940000	2026-01-19	2026-01-20 15:00:00.907794
USD	FJD	2.28190000	2026-01-19	2026-01-20 15:00:00.907794
USD	FKP	0.74530000	2026-01-19	2026-01-20 15:00:00.907794
USD	FOK	6.41400000	2026-01-19	2026-01-20 15:00:00.907794
USD	GBP	0.74540000	2026-01-19	2026-01-20 15:00:00.907794
USD	GEL	2.69450000	2026-01-19	2026-01-20 15:00:00.907794
USD	GGP	0.74530000	2026-01-19	2026-01-20 15:00:00.907794
USD	GHS	10.85400000	2026-01-19	2026-01-20 15:00:00.907794
USD	GIP	0.74530000	2026-01-19	2026-01-20 15:00:00.907794
USD	GMD	74.02450000	2026-01-19	2026-01-20 15:00:00.907794
USD	GNF	8748.03670000	2026-01-19	2026-01-20 15:00:00.907794
USD	GTQ	7.66450000	2026-01-19	2026-01-20 15:00:00.907794
USD	GYD	209.16660000	2026-01-19	2026-01-20 15:00:00.907794
USD	HKD	7.79710000	2026-01-19	2026-01-20 15:00:00.907794
USD	HNL	26.36320000	2026-01-19	2026-01-20 15:00:00.907794
USD	HRK	6.47410000	2026-01-19	2026-01-20 15:00:00.907794
USD	HTG	130.87110000	2026-01-19	2026-01-20 15:00:00.907794
USD	HUF	331.35900000	2026-01-19	2026-01-20 15:00:00.907794
USD	IDR	16970.61930000	2026-01-19	2026-01-20 15:00:00.907794
USD	ILS	3.15870000	2026-01-19	2026-01-20 15:00:00.907794
USD	IMP	0.74530000	2026-01-19	2026-01-20 15:00:00.907794
USD	INR	90.95890000	2026-01-19	2026-01-20 15:00:00.907794
USD	IQD	1312.31990000	2026-01-19	2026-01-20 15:00:00.907794
USD	IRR	76809.43470000	2026-01-19	2026-01-20 15:00:00.907794
USD	ISK	125.71320000	2026-01-19	2026-01-20 15:00:00.907794
USD	JEP	0.74530000	2026-01-19	2026-01-20 15:00:00.907794
USD	JMD	157.49330000	2026-01-19	2026-01-20 15:00:00.907794
USD	JOD	0.70900000	2026-01-19	2026-01-20 15:00:00.907794
USD	JPY	158.05140000	2026-01-19	2026-01-20 15:00:00.907794
USD	KES	128.94760000	2026-01-19	2026-01-20 15:00:00.907794
USD	KGS	87.43480000	2026-01-19	2026-01-20 15:00:00.907794
USD	KHR	4023.77360000	2026-01-19	2026-01-20 15:00:00.907794
USD	KID	1.49060000	2026-01-19	2026-01-20 15:00:00.907794
USD	KMF	422.73120000	2026-01-19	2026-01-20 15:00:00.907794
USD	KRW	1473.08420000	2026-01-19	2026-01-20 15:00:00.907794
USD	KWD	0.30750000	2026-01-19	2026-01-20 15:00:00.907794
USD	KYD	0.83330000	2026-01-19	2026-01-20 15:00:00.907794
USD	KZT	509.57480000	2026-01-19	2026-01-20 15:00:00.907794
USD	LAK	21687.30210000	2026-01-19	2026-01-20 15:00:00.907794
USD	LBP	89500.00000000	2026-01-19	2026-01-20 15:00:00.907794
USD	LKR	309.53160000	2026-01-19	2026-01-20 15:00:00.907794
USD	LRD	180.58590000	2026-01-19	2026-01-20 15:00:00.907794
USD	LSL	16.39690000	2026-01-19	2026-01-20 15:00:00.907794
USD	LYD	5.43380000	2026-01-19	2026-01-20 15:00:00.907794
USD	MAD	9.21880000	2026-01-19	2026-01-20 15:00:00.907794
USD	MDL	17.09080000	2026-01-19	2026-01-20 15:00:00.907794
USD	MGA	4543.14830000	2026-01-19	2026-01-20 15:00:00.907794
USD	MKD	52.97480000	2026-01-19	2026-01-20 15:00:00.907794
USD	MMK	2097.21290000	2026-01-19	2026-01-20 15:00:00.907794
USD	MNT	3589.88470000	2026-01-19	2026-01-20 15:00:00.907794
USD	MOP	8.03110000	2026-01-19	2026-01-20 15:00:00.907794
USD	MRU	40.04520000	2026-01-19	2026-01-20 15:00:00.907794
USD	MUR	46.31440000	2026-01-19	2026-01-20 15:00:00.907794
USD	MVR	15.43970000	2026-01-19	2026-01-20 15:00:00.907794
USD	MWK	1744.93410000	2026-01-19	2026-01-20 15:00:00.907794
USD	MXN	17.60170000	2026-01-19	2026-01-20 15:00:00.907794
USD	MYR	4.05500000	2026-01-19	2026-01-20 15:00:00.907794
USD	MZN	63.61740000	2026-01-19	2026-01-20 15:00:00.907794
USD	NAD	16.39690000	2026-01-19	2026-01-20 15:00:00.907794
USD	NGN	1420.09220000	2026-01-19	2026-01-20 15:00:00.907794
USD	NIO	36.78610000	2026-01-19	2026-01-20 15:00:00.907794
USD	NOK	10.06800000	2026-01-19	2026-01-20 15:00:00.907794
USD	NPR	145.53410000	2026-01-19	2026-01-20 15:00:00.907794
USD	NZD	1.72640000	2026-01-19	2026-01-20 15:00:00.907794
USD	OMR	0.38450000	2026-01-19	2026-01-20 15:00:00.907794
USD	PAB	1.00000000	2026-01-19	2026-01-20 15:00:00.907794
USD	PEN	3.35760000	2026-01-19	2026-01-20 15:00:00.907794
USD	PGK	4.26800000	2026-01-19	2026-01-20 15:00:00.907794
USD	PHP	59.46680000	2026-01-19	2026-01-20 15:00:00.907794
USD	PKR	279.85220000	2026-01-19	2026-01-20 15:00:00.907794
USD	PLN	3.63010000	2026-01-19	2026-01-20 15:00:00.907794
USD	PYG	6760.15970000	2026-01-19	2026-01-20 15:00:00.907794
USD	QAR	3.64000000	2026-01-19	2026-01-20 15:00:00.907794
USD	RON	4.37720000	2026-01-19	2026-01-20 15:00:00.907794
USD	RSD	100.86760000	2026-01-19	2026-01-20 15:00:00.907794
USD	RUB	77.73900000	2026-01-19	2026-01-20 15:00:00.907794
USD	RWF	1459.95230000	2026-01-19	2026-01-20 15:00:00.907794
USD	SAR	3.75000000	2026-01-19	2026-01-20 15:00:00.907794
USD	SBD	8.03130000	2026-01-19	2026-01-20 15:00:00.907794
USD	SCR	14.14500000	2026-01-19	2026-01-20 15:00:00.907794
USD	SDG	454.30520000	2026-01-19	2026-01-20 15:00:00.907794
USD	SEK	9.21020000	2026-01-19	2026-01-20 15:00:00.907794
USD	SGD	1.28530000	2026-01-19	2026-01-20 15:00:00.907794
USD	SHP	0.74530000	2026-01-19	2026-01-20 15:00:00.907794
USD	SLE	24.14810000	2026-01-19	2026-01-20 15:00:00.907794
USD	SLL	24148.07780000	2026-01-19	2026-01-20 15:00:00.907794
USD	SOS	570.51920000	2026-01-19	2026-01-20 15:00:00.907794
USD	SRD	38.37880000	2026-01-19	2026-01-20 15:00:00.907794
USD	SSP	4716.11820000	2026-01-19	2026-01-20 15:00:00.907794
USD	STN	21.05200000	2026-01-19	2026-01-20 15:00:00.907794
USD	SYP	112.34500000	2026-01-19	2026-01-20 15:00:00.907794
USD	SZL	16.39690000	2026-01-19	2026-01-20 15:00:00.907794
USD	THB	31.25300000	2026-01-19	2026-01-20 15:00:00.907794
USD	TJS	9.30840000	2026-01-19	2026-01-20 15:00:00.907794
USD	TMT	3.49990000	2026-01-19	2026-01-20 15:00:00.907794
USD	TND	2.89140000	2026-01-19	2026-01-20 15:00:00.907794
USD	TOP	2.38750000	2026-01-19	2026-01-20 15:00:00.907794
USD	TRY	43.29060000	2026-01-19	2026-01-20 15:00:00.907794
USD	TTD	6.75300000	2026-01-19	2026-01-20 15:00:00.907794
USD	TVD	1.49060000	2026-01-19	2026-01-20 15:00:00.907794
USD	TWD	31.56930000	2026-01-19	2026-01-20 15:00:00.907794
USD	TZS	2492.91260000	2026-01-19	2026-01-20 15:00:00.907794
USD	UAH	43.27540000	2026-01-19	2026-01-20 15:00:00.907794
USD	UGX	3505.94450000	2026-01-19	2026-01-20 15:00:00.907794
USD	UYU	38.65230000	2026-01-19	2026-01-20 15:00:00.907794
USD	UZS	11928.95400000	2026-01-19	2026-01-20 15:00:00.907794
USD	VES	344.50710000	2026-01-19	2026-01-20 15:00:00.907794
USD	VND	26165.57250000	2026-01-19	2026-01-20 15:00:00.907794
USD	VUV	120.85740000	2026-01-19	2026-01-20 15:00:00.907794
USD	WST	2.75370000	2026-01-19	2026-01-20 15:00:00.907794
USD	XAF	563.64160000	2026-01-19	2026-01-20 15:00:00.907794
USD	XCD	2.70000000	2026-01-19	2026-01-20 15:00:00.907794
USD	XCG	1.79000000	2026-01-19	2026-01-20 15:00:00.907794
USD	XDR	0.73230000	2026-01-19	2026-01-20 15:00:00.907794
USD	XOF	563.64160000	2026-01-19	2026-01-20 15:00:00.907794
USD	XPF	102.53790000	2026-01-19	2026-01-20 15:00:00.907794
USD	YER	238.33060000	2026-01-19	2026-01-20 15:00:00.907794
USD	ZAR	16.39380000	2026-01-19	2026-01-20 15:00:00.907794
USD	ZMW	20.05890000	2026-01-19	2026-01-20 15:00:00.907794
USD	ZWG	25.61280000	2026-01-19	2026-01-20 15:00:00.907794
USD	ZWL	25.61280000	2026-01-19	2026-01-20 15:00:00.907794
USD	USD	1.00000000	2026-01-20	2026-01-21 15:00:02.090693
USD	AED	3.67250000	2026-01-20	2026-01-21 15:00:02.090693
USD	AFN	65.91600000	2026-01-20	2026-01-21 15:00:02.090693
USD	ALL	82.46770000	2026-01-20	2026-01-21 15:00:02.090693
USD	AMD	379.00840000	2026-01-20	2026-01-21 15:00:02.090693
USD	ANG	1.79000000	2026-01-20	2026-01-21 15:00:02.090693
USD	AOA	919.45340000	2026-01-20	2026-01-21 15:00:02.090693
USD	ARS	1452.25000000	2026-01-20	2026-01-21 15:00:02.090693
USD	AUD	1.48530000	2026-01-20	2026-01-21 15:00:02.090693
USD	AWG	1.79000000	2026-01-20	2026-01-21 15:00:02.090693
USD	AZN	1.69970000	2026-01-20	2026-01-21 15:00:02.090693
USD	BAM	1.66850000	2026-01-20	2026-01-21 15:00:02.090693
USD	BBD	2.00000000	2026-01-20	2026-01-21 15:00:02.090693
USD	BDT	122.29270000	2026-01-20	2026-01-21 15:00:02.090693
USD	BGN	1.61460000	2026-01-20	2026-01-21 15:00:02.090693
USD	BHD	0.37600000	2026-01-20	2026-01-21 15:00:02.090693
USD	BIF	2970.44170000	2026-01-20	2026-01-21 15:00:02.090693
USD	BMD	1.00000000	2026-01-20	2026-01-21 15:00:02.090693
USD	BND	1.28370000	2026-01-20	2026-01-21 15:00:02.090693
USD	BOB	6.92210000	2026-01-20	2026-01-21 15:00:02.090693
USD	BRL	5.37810000	2026-01-20	2026-01-21 15:00:02.090693
USD	BSD	1.00000000	2026-01-20	2026-01-21 15:00:02.090693
USD	BTN	91.09410000	2026-01-20	2026-01-21 15:00:02.090693
USD	BWP	13.78820000	2026-01-20	2026-01-21 15:00:02.090693
USD	BYN	2.89320000	2026-01-20	2026-01-21 15:00:02.090693
USD	BZD	2.00000000	2026-01-20	2026-01-21 15:00:02.090693
USD	CAD	1.38310000	2026-01-20	2026-01-21 15:00:02.090693
USD	CDF	2216.93220000	2026-01-20	2026-01-21 15:00:02.090693
USD	CHF	0.79040000	2026-01-20	2026-01-21 15:00:02.090693
USD	CLF	0.02248000	2026-01-20	2026-01-21 15:00:02.090693
USD	CLP	888.46410000	2026-01-20	2026-01-21 15:00:02.090693
USD	CNH	6.95790000	2026-01-20	2026-01-21 15:00:02.090693
USD	CNY	6.97320000	2026-01-20	2026-01-21 15:00:02.090693
USD	COP	3661.41010000	2026-01-20	2026-01-21 15:00:02.090693
USD	CRC	487.31170000	2026-01-20	2026-01-21 15:00:02.090693
USD	CUP	24.00000000	2026-01-20	2026-01-21 15:00:02.090693
USD	CVE	94.06780000	2026-01-20	2026-01-21 15:00:02.090693
USD	CZK	20.73550000	2026-01-20	2026-01-21 15:00:02.090693
USD	DJF	177.72100000	2026-01-20	2026-01-21 15:00:02.090693
USD	DKK	6.36600000	2026-01-20	2026-01-21 15:00:02.090693
USD	DOP	63.48970000	2026-01-20	2026-01-21 15:00:02.090693
USD	DZD	129.82010000	2026-01-20	2026-01-21 15:00:02.090693
USD	EGP	47.46810000	2026-01-20	2026-01-21 15:00:02.090693
USD	ERN	15.00000000	2026-01-20	2026-01-21 15:00:02.090693
USD	ETB	154.50820000	2026-01-20	2026-01-21 15:00:02.090693
USD	EUR	0.85310000	2026-01-20	2026-01-21 15:00:02.090693
USD	FJD	2.27300000	2026-01-20	2026-01-21 15:00:02.090693
USD	FKP	0.74370000	2026-01-20	2026-01-21 15:00:02.090693
USD	FOK	6.36600000	2026-01-20	2026-01-21 15:00:02.090693
USD	GBP	0.74380000	2026-01-20	2026-01-21 15:00:02.090693
USD	GEL	2.69350000	2026-01-20	2026-01-21 15:00:02.090693
USD	GGP	0.74370000	2026-01-20	2026-01-21 15:00:02.090693
USD	GHS	10.85520000	2026-01-20	2026-01-21 15:00:02.090693
USD	GIP	0.74370000	2026-01-20	2026-01-21 15:00:02.090693
USD	GMD	74.03050000	2026-01-20	2026-01-21 15:00:02.090693
USD	GNF	8752.66790000	2026-01-20	2026-01-21 15:00:02.090693
USD	GTQ	7.66070000	2026-01-20	2026-01-21 15:00:02.090693
USD	GYD	209.23940000	2026-01-20	2026-01-21 15:00:02.090693
USD	HKD	7.79900000	2026-01-20	2026-01-21 15:00:02.090693
USD	HNL	26.35360000	2026-01-20	2026-01-21 15:00:02.090693
USD	HRK	6.42770000	2026-01-20	2026-01-21 15:00:02.090693
USD	HTG	130.94010000	2026-01-20	2026-01-21 15:00:02.090693
USD	HUF	328.40840000	2026-01-20	2026-01-21 15:00:02.090693
USD	IDR	16963.70210000	2026-01-20	2026-01-21 15:00:02.090693
USD	ILS	3.17080000	2026-01-20	2026-01-21 15:00:02.090693
USD	IMP	0.74370000	2026-01-20	2026-01-21 15:00:02.090693
USD	INR	91.09690000	2026-01-20	2026-01-21 15:00:02.090693
USD	IQD	1311.98180000	2026-01-20	2026-01-21 15:00:02.090693
USD	IRR	48110.58810000	2026-01-20	2026-01-21 15:00:02.090693
USD	ISK	124.55350000	2026-01-20	2026-01-21 15:00:02.090693
USD	JEP	0.74370000	2026-01-20	2026-01-21 15:00:02.090693
USD	JMD	157.38860000	2026-01-20	2026-01-21 15:00:02.090693
USD	JOD	0.70900000	2026-01-20	2026-01-21 15:00:02.090693
USD	JPY	158.01420000	2026-01-20	2026-01-21 15:00:02.090693
USD	KES	128.97250000	2026-01-20	2026-01-21 15:00:02.090693
USD	KGS	87.42190000	2026-01-20	2026-01-21 15:00:02.090693
USD	KHR	4022.41890000	2026-01-20	2026-01-21 15:00:02.090693
USD	KID	1.48520000	2026-01-20	2026-01-21 15:00:02.090693
USD	KMF	419.70110000	2026-01-20	2026-01-21 15:00:02.090693
USD	KRW	1478.13450000	2026-01-20	2026-01-21 15:00:02.090693
USD	KWD	0.30720000	2026-01-20	2026-01-21 15:00:02.090693
USD	KYD	0.83330000	2026-01-20	2026-01-21 15:00:02.090693
USD	KZT	508.15570000	2026-01-20	2026-01-21 15:00:02.090693
USD	LAK	21679.64780000	2026-01-20	2026-01-21 15:00:02.090693
USD	LBP	89500.00000000	2026-01-20	2026-01-21 15:00:02.090693
USD	LKR	309.50150000	2026-01-20	2026-01-21 15:00:02.090693
USD	LRD	181.97860000	2026-01-20	2026-01-21 15:00:02.090693
USD	LSL	16.42250000	2026-01-20	2026-01-21 15:00:02.090693
USD	LYD	5.43480000	2026-01-20	2026-01-21 15:00:02.090693
USD	MAD	9.18330000	2026-01-20	2026-01-21 15:00:02.090693
USD	MDL	17.03690000	2026-01-20	2026-01-21 15:00:02.090693
USD	MGA	4551.10450000	2026-01-20	2026-01-21 15:00:02.090693
USD	MKD	52.97900000	2026-01-20	2026-01-21 15:00:02.090693
USD	MMK	2097.22160000	2026-01-20	2026-01-21 15:00:02.090693
USD	MNT	3528.66580000	2026-01-20	2026-01-21 15:00:02.090693
USD	MOP	8.03300000	2026-01-20	2026-01-21 15:00:02.090693
USD	MRU	40.04740000	2026-01-20	2026-01-21 15:00:02.090693
USD	MUR	46.09860000	2026-01-20	2026-01-21 15:00:02.090693
USD	MVR	15.44440000	2026-01-20	2026-01-21 15:00:02.090693
USD	MWK	1744.82890000	2026-01-20	2026-01-21 15:00:02.090693
USD	MXN	17.60940000	2026-01-20	2026-01-21 15:00:02.090693
USD	MYR	4.05450000	2026-01-20	2026-01-21 15:00:02.090693
USD	MZN	63.61210000	2026-01-20	2026-01-21 15:00:02.090693
USD	NAD	16.42250000	2026-01-20	2026-01-21 15:00:02.090693
USD	NGN	1418.92320000	2026-01-20	2026-01-21 15:00:02.090693
USD	NIO	36.77760000	2026-01-20	2026-01-21 15:00:02.090693
USD	NOK	9.99620000	2026-01-20	2026-01-21 15:00:02.090693
USD	NPR	145.75050000	2026-01-20	2026-01-21 15:00:02.090693
USD	NZD	1.71460000	2026-01-20	2026-01-21 15:00:02.090693
USD	OMR	0.38450000	2026-01-20	2026-01-21 15:00:02.090693
USD	PAB	1.00000000	2026-01-20	2026-01-21 15:00:02.090693
USD	PEN	3.35700000	2026-01-20	2026-01-21 15:00:02.090693
USD	PGK	4.26690000	2026-01-20	2026-01-21 15:00:02.090693
USD	PHP	59.40820000	2026-01-20	2026-01-21 15:00:02.090693
USD	PKR	279.84530000	2026-01-20	2026-01-21 15:00:02.090693
USD	PLN	3.60350000	2026-01-20	2026-01-21 15:00:02.090693
USD	PYG	6662.72660000	2026-01-20	2026-01-21 15:00:02.090693
USD	QAR	3.64000000	2026-01-20	2026-01-21 15:00:02.090693
USD	RON	4.34060000	2026-01-20	2026-01-21 15:00:02.090693
USD	RSD	100.13880000	2026-01-20	2026-01-21 15:00:02.090693
USD	RUB	77.91540000	2026-01-20	2026-01-21 15:00:02.090693
USD	RWF	1460.28410000	2026-01-20	2026-01-21 15:00:02.090693
USD	SAR	3.75000000	2026-01-20	2026-01-21 15:00:02.090693
USD	SBD	8.02440000	2026-01-20	2026-01-21 15:00:02.090693
USD	SCR	14.19240000	2026-01-20	2026-01-21 15:00:02.090693
USD	SDG	449.33880000	2026-01-20	2026-01-21 15:00:02.090693
USD	SEK	9.12690000	2026-01-20	2026-01-21 15:00:02.090693
USD	SGD	1.28370000	2026-01-20	2026-01-21 15:00:02.090693
USD	SHP	0.74370000	2026-01-20	2026-01-21 15:00:02.090693
USD	SLE	24.14810000	2026-01-20	2026-01-21 15:00:02.090693
USD	SLL	24148.07780000	2026-01-20	2026-01-21 15:00:02.090693
USD	SOS	570.33770000	2026-01-20	2026-01-21 15:00:02.090693
USD	SRD	38.39010000	2026-01-20	2026-01-21 15:00:02.090693
USD	SSP	4720.48430000	2026-01-20	2026-01-21 15:00:02.090693
USD	STN	20.90110000	2026-01-20	2026-01-21 15:00:02.090693
USD	SYP	112.33260000	2026-01-20	2026-01-21 15:00:02.090693
USD	SZL	16.42250000	2026-01-20	2026-01-21 15:00:02.090693
USD	THB	31.06150000	2026-01-20	2026-01-21 15:00:02.090693
USD	TJS	9.29810000	2026-01-20	2026-01-21 15:00:02.090693
USD	TMT	3.50000000	2026-01-20	2026-01-21 15:00:02.090693
USD	TND	2.88330000	2026-01-20	2026-01-21 15:00:02.090693
USD	TOP	2.38510000	2026-01-20	2026-01-21 15:00:02.090693
USD	TRY	43.27880000	2026-01-20	2026-01-21 15:00:02.090693
USD	TTD	6.76420000	2026-01-20	2026-01-21 15:00:02.090693
USD	TVD	1.48520000	2026-01-20	2026-01-21 15:00:02.090693
USD	TWD	31.69090000	2026-01-20	2026-01-21 15:00:02.090693
USD	TZS	2490.37200000	2026-01-20	2026-01-21 15:00:02.090693
USD	UAH	43.24670000	2026-01-20	2026-01-21 15:00:02.090693
USD	UGX	3474.79790000	2026-01-20	2026-01-21 15:00:02.090693
USD	UYU	38.50070000	2026-01-20	2026-01-21 15:00:02.090693
USD	UZS	12112.80440000	2026-01-20	2026-01-21 15:00:02.090693
USD	VES	347.26310000	2026-01-20	2026-01-21 15:00:02.090693
USD	VND	26164.50690000	2026-01-20	2026-01-21 15:00:02.090693
USD	VUV	120.68020000	2026-01-20	2026-01-21 15:00:02.090693
USD	WST	2.74840000	2026-01-20	2026-01-21 15:00:02.090693
USD	XAF	559.60140000	2026-01-20	2026-01-21 15:00:02.090693
USD	XCD	2.70000000	2026-01-20	2026-01-21 15:00:02.090693
USD	XCG	1.79000000	2026-01-20	2026-01-21 15:00:02.090693
USD	XDR	0.72840000	2026-01-20	2026-01-21 15:00:02.090693
USD	XOF	559.60140000	2026-01-20	2026-01-21 15:00:02.090693
USD	XPF	101.80300000	2026-01-20	2026-01-21 15:00:02.090693
USD	YER	238.40570000	2026-01-20	2026-01-21 15:00:02.090693
USD	ZAR	16.42220000	2026-01-20	2026-01-21 15:00:02.090693
USD	ZMW	20.19510000	2026-01-20	2026-01-21 15:00:02.090693
USD	ZWG	25.62430000	2026-01-20	2026-01-21 15:00:02.090693
USD	ZWL	25.62430000	2026-01-20	2026-01-21 15:00:02.090693
USD	USD	1.00000000	2026-01-21	2026-01-22 15:00:00.93151
USD	AED	3.67250000	2026-01-21	2026-01-22 15:00:00.93151
USD	AFN	66.16260000	2026-01-21	2026-01-22 15:00:00.93151
USD	ALL	82.28500000	2026-01-21	2026-01-22 15:00:00.93151
USD	AMD	378.49560000	2026-01-21	2026-01-22 15:00:00.93151
USD	ANG	1.79000000	2026-01-21	2026-01-22 15:00:00.93151
USD	AOA	919.74550000	2026-01-21	2026-01-22 15:00:00.93151
USD	ARS	1452.25000000	2026-01-21	2026-01-22 15:00:00.93151
USD	AUD	1.48030000	2026-01-21	2026-01-22 15:00:00.93151
USD	AWG	1.79000000	2026-01-21	2026-01-22 15:00:00.93151
USD	AZN	1.69810000	2026-01-21	2026-01-22 15:00:00.93151
USD	BAM	1.67130000	2026-01-21	2026-01-22 15:00:00.93151
USD	BBD	2.00000000	2026-01-21	2026-01-22 15:00:00.93151
USD	BDT	122.23520000	2026-01-21	2026-01-22 15:00:00.93151
USD	BGN	1.61720000	2026-01-21	2026-01-22 15:00:00.93151
USD	BHD	0.37600000	2026-01-21	2026-01-22 15:00:00.93151
USD	BIF	2965.27560000	2026-01-21	2026-01-22 15:00:00.93151
USD	BMD	1.00000000	2026-01-21	2026-01-22 15:00:00.93151
USD	BND	1.28380000	2026-01-21	2026-01-22 15:00:00.93151
USD	BOB	6.91850000	2026-01-21	2026-01-22 15:00:00.93151
USD	BRL	5.34930000	2026-01-21	2026-01-22 15:00:00.93151
USD	BSD	1.00000000	2026-01-21	2026-01-22 15:00:00.93151
USD	BTN	91.65120000	2026-01-21	2026-01-22 15:00:00.93151
USD	BWP	13.50430000	2026-01-21	2026-01-22 15:00:00.93151
USD	BYN	2.87800000	2026-01-21	2026-01-22 15:00:00.93151
USD	BZD	2.00000000	2026-01-21	2026-01-22 15:00:00.93151
USD	CAD	1.38210000	2026-01-21	2026-01-22 15:00:00.93151
USD	CDF	2163.12720000	2026-01-21	2026-01-22 15:00:00.93151
USD	CHF	0.79390000	2026-01-21	2026-01-22 15:00:00.93151
USD	CLF	0.02241000	2026-01-21	2026-01-22 15:00:00.93151
USD	CLP	885.61580000	2026-01-21	2026-01-22 15:00:00.93151
USD	CNH	6.95960000	2026-01-21	2026-01-22 15:00:00.93151
USD	CNY	6.97620000	2026-01-21	2026-01-22 15:00:00.93151
USD	COP	3669.36970000	2026-01-21	2026-01-22 15:00:00.93151
USD	CRC	488.48270000	2026-01-21	2026-01-22 15:00:00.93151
USD	CUP	24.00000000	2026-01-21	2026-01-22 15:00:00.93151
USD	CVE	94.22590000	2026-01-21	2026-01-22 15:00:00.93151
USD	CZK	20.78480000	2026-01-21	2026-01-22 15:00:00.93151
USD	DJF	177.72100000	2026-01-21	2026-01-22 15:00:00.93151
USD	DKK	6.37210000	2026-01-21	2026-01-22 15:00:00.93151
USD	DOP	63.01480000	2026-01-21	2026-01-22 15:00:00.93151
USD	DZD	129.66760000	2026-01-21	2026-01-22 15:00:00.93151
USD	EGP	47.38170000	2026-01-21	2026-01-22 15:00:00.93151
USD	ERN	15.00000000	2026-01-21	2026-01-22 15:00:00.93151
USD	ETB	154.92740000	2026-01-21	2026-01-22 15:00:00.93151
USD	EUR	0.85460000	2026-01-21	2026-01-22 15:00:00.93151
USD	FJD	2.26570000	2026-01-21	2026-01-22 15:00:00.93151
USD	FKP	0.74470000	2026-01-21	2026-01-22 15:00:00.93151
USD	FOK	6.37180000	2026-01-21	2026-01-22 15:00:00.93151
USD	GBP	0.74470000	2026-01-21	2026-01-22 15:00:00.93151
USD	GEL	2.69380000	2026-01-21	2026-01-22 15:00:00.93151
USD	GGP	0.74470000	2026-01-21	2026-01-22 15:00:00.93151
USD	GHS	10.88690000	2026-01-21	2026-01-22 15:00:00.93151
USD	GIP	0.74470000	2026-01-21	2026-01-22 15:00:00.93151
USD	GMD	73.99130000	2026-01-21	2026-01-22 15:00:00.93151
USD	GNF	8751.95980000	2026-01-21	2026-01-22 15:00:00.93151
USD	GTQ	7.66300000	2026-01-21	2026-01-22 15:00:00.93151
USD	GYD	209.18660000	2026-01-21	2026-01-22 15:00:00.93151
USD	HKD	7.79730000	2026-01-21	2026-01-22 15:00:00.93151
USD	HNL	26.33810000	2026-01-21	2026-01-22 15:00:00.93151
USD	HRK	6.43850000	2026-01-21	2026-01-22 15:00:00.93151
USD	HTG	130.76000000	2026-01-21	2026-01-22 15:00:00.93151
USD	HUF	328.63610000	2026-01-21	2026-01-22 15:00:00.93151
USD	IDR	16920.91130000	2026-01-21	2026-01-22 15:00:00.93151
USD	ILS	3.16070000	2026-01-21	2026-01-22 15:00:00.93151
USD	IMP	0.74470000	2026-01-21	2026-01-22 15:00:00.93151
USD	INR	91.65150000	2026-01-21	2026-01-22 15:00:00.93151
USD	IQD	1310.29690000	2026-01-21	2026-01-22 15:00:00.93151
USD	IRR	450492.82110000	2026-01-21	2026-01-22 15:00:00.93151
USD	ISK	124.61470000	2026-01-21	2026-01-22 15:00:00.93151
USD	JEP	0.74470000	2026-01-21	2026-01-22 15:00:00.93151
USD	JMD	157.05340000	2026-01-21	2026-01-22 15:00:00.93151
USD	JOD	0.70900000	2026-01-21	2026-01-22 15:00:00.93151
USD	JPY	158.15720000	2026-01-21	2026-01-22 15:00:00.93151
USD	KES	128.97300000	2026-01-21	2026-01-22 15:00:00.93151
USD	KGS	87.40600000	2026-01-21	2026-01-22 15:00:00.93151
USD	KHR	4021.71620000	2026-01-21	2026-01-22 15:00:00.93151
USD	KID	1.48000000	2026-01-21	2026-01-22 15:00:00.93151
USD	KMF	420.40620000	2026-01-21	2026-01-22 15:00:00.93151
USD	KRW	1466.66470000	2026-01-21	2026-01-22 15:00:00.93151
USD	KWD	0.30660000	2026-01-21	2026-01-22 15:00:00.93151
USD	KYD	0.83330000	2026-01-21	2026-01-22 15:00:00.93151
USD	KZT	506.20750000	2026-01-21	2026-01-22 15:00:00.93151
USD	LAK	21635.99580000	2026-01-21	2026-01-22 15:00:00.93151
USD	LBP	89500.00000000	2026-01-21	2026-01-22 15:00:00.93151
USD	LKR	309.50910000	2026-01-21	2026-01-22 15:00:00.93151
USD	LRD	183.99500000	2026-01-21	2026-01-22 15:00:00.93151
USD	LSL	16.27610000	2026-01-21	2026-01-22 15:00:00.93151
USD	LYD	6.36360000	2026-01-21	2026-01-22 15:00:00.93151
USD	MAD	9.18020000	2026-01-21	2026-01-22 15:00:00.93151
USD	MDL	16.97240000	2026-01-21	2026-01-22 15:00:00.93151
USD	MGA	4562.63890000	2026-01-21	2026-01-22 15:00:00.93151
USD	MKD	52.55200000	2026-01-21	2026-01-22 15:00:00.93151
USD	MMK	2098.55350000	2026-01-21	2026-01-22 15:00:00.93151
USD	MNT	3573.13040000	2026-01-21	2026-01-22 15:00:00.93151
USD	MOP	8.03160000	2026-01-21	2026-01-22 15:00:00.93151
USD	MRU	39.97710000	2026-01-21	2026-01-22 15:00:00.93151
USD	MUR	46.03910000	2026-01-21	2026-01-22 15:00:00.93151
USD	MVR	15.43420000	2026-01-21	2026-01-22 15:00:00.93151
USD	MWK	1739.62990000	2026-01-21	2026-01-22 15:00:00.93151
USD	MXN	17.48350000	2026-01-21	2026-01-22 15:00:00.93151
USD	MYR	4.04770000	2026-01-21	2026-01-22 15:00:00.93151
USD	MZN	63.68920000	2026-01-21	2026-01-22 15:00:00.93151
USD	NAD	16.27610000	2026-01-21	2026-01-22 15:00:00.93151
USD	NGN	1418.73170000	2026-01-21	2026-01-22 15:00:00.93151
USD	NIO	36.73000000	2026-01-21	2026-01-22 15:00:00.93151
USD	NOK	9.96300000	2026-01-21	2026-01-22 15:00:00.93151
USD	NPR	146.64190000	2026-01-21	2026-01-22 15:00:00.93151
USD	NZD	1.71200000	2026-01-21	2026-01-22 15:00:00.93151
USD	OMR	0.38450000	2026-01-21	2026-01-22 15:00:00.93151
USD	PAB	1.00000000	2026-01-21	2026-01-22 15:00:00.93151
USD	PEN	3.35420000	2026-01-21	2026-01-22 15:00:00.93151
USD	PGK	4.25470000	2026-01-21	2026-01-22 15:00:00.93151
USD	PHP	59.25520000	2026-01-21	2026-01-22 15:00:00.93151
USD	PKR	279.51680000	2026-01-21	2026-01-22 15:00:00.93151
USD	PLN	3.60320000	2026-01-21	2026-01-22 15:00:00.93151
USD	PYG	6664.75140000	2026-01-21	2026-01-22 15:00:00.93151
USD	QAR	3.64000000	2026-01-21	2026-01-22 15:00:00.93151
USD	RON	4.34540000	2026-01-21	2026-01-22 15:00:00.93151
USD	RSD	100.24350000	2026-01-21	2026-01-22 15:00:00.93151
USD	RUB	77.59760000	2026-01-21	2026-01-22 15:00:00.93151
USD	RWF	1459.10760000	2026-01-21	2026-01-22 15:00:00.93151
USD	SAR	3.75000000	2026-01-21	2026-01-22 15:00:00.93151
USD	SBD	8.01520000	2026-01-21	2026-01-22 15:00:00.93151
USD	SCR	14.05690000	2026-01-21	2026-01-22 15:00:00.93151
USD	SDG	544.16430000	2026-01-21	2026-01-22 15:00:00.93151
USD	SEK	9.11190000	2026-01-21	2026-01-22 15:00:00.93151
USD	SGD	1.28390000	2026-01-21	2026-01-22 15:00:00.93151
USD	SHP	0.74470000	2026-01-21	2026-01-22 15:00:00.93151
USD	SLE	23.64460000	2026-01-21	2026-01-22 15:00:00.93151
USD	SLL	23644.57010000	2026-01-21	2026-01-22 15:00:00.93151
USD	SOS	570.19820000	2026-01-21	2026-01-22 15:00:00.93151
USD	SRD	38.38510000	2026-01-21	2026-01-22 15:00:00.93151
USD	SSP	4624.73420000	2026-01-21	2026-01-22 15:00:00.93151
USD	STN	20.93620000	2026-01-21	2026-01-22 15:00:00.93151
USD	SYP	113.41010000	2026-01-21	2026-01-22 15:00:00.93151
USD	SZL	16.27610000	2026-01-21	2026-01-22 15:00:00.93151
USD	THB	31.12760000	2026-01-21	2026-01-22 15:00:00.93151
USD	TJS	9.31000000	2026-01-21	2026-01-22 15:00:00.93151
USD	TMT	3.49790000	2026-01-21	2026-01-22 15:00:00.93151
USD	TND	2.87770000	2026-01-21	2026-01-22 15:00:00.93151
USD	TOP	2.38100000	2026-01-21	2026-01-22 15:00:00.93151
USD	TRY	43.30620000	2026-01-21	2026-01-22 15:00:00.93151
USD	TTD	6.75860000	2026-01-21	2026-01-22 15:00:00.93151
USD	TVD	1.48000000	2026-01-21	2026-01-22 15:00:00.93151
USD	TWD	31.65150000	2026-01-21	2026-01-22 15:00:00.93151
USD	TZS	2508.43230000	2026-01-21	2026-01-22 15:00:00.93151
USD	UAH	43.17680000	2026-01-21	2026-01-22 15:00:00.93151
USD	UGX	3460.14060000	2026-01-21	2026-01-22 15:00:00.93151
USD	UYU	38.31360000	2026-01-21	2026-01-22 15:00:00.93151
USD	UZS	12097.04500000	2026-01-21	2026-01-22 15:00:00.93151
USD	VES	349.92720000	2026-01-21	2026-01-22 15:00:00.93151
USD	VND	26155.80600000	2026-01-21	2026-01-22 15:00:00.93151
USD	VUV	119.97040000	2026-01-21	2026-01-22 15:00:00.93151
USD	WST	2.73880000	2026-01-21	2026-01-22 15:00:00.93151
USD	XAF	560.54150000	2026-01-21	2026-01-22 15:00:00.93151
USD	XCD	2.70000000	2026-01-21	2026-01-22 15:00:00.93151
USD	XCG	1.79000000	2026-01-21	2026-01-22 15:00:00.93151
USD	XDR	0.72820000	2026-01-21	2026-01-22 15:00:00.93151
USD	XOF	560.54150000	2026-01-21	2026-01-22 15:00:00.93151
USD	XPF	101.97400000	2026-01-21	2026-01-22 15:00:00.93151
USD	YER	238.05350000	2026-01-21	2026-01-22 15:00:00.93151
USD	ZAR	16.27570000	2026-01-21	2026-01-22 15:00:00.93151
USD	ZMW	20.32290000	2026-01-21	2026-01-22 15:00:00.93151
USD	ZWG	25.59810000	2026-01-21	2026-01-22 15:00:00.93151
USD	ZWL	25.59810000	2026-01-21	2026-01-22 15:00:00.93151
USD	USD	1.00000000	2026-01-22	2026-01-23 15:19:09.999099
USD	AED	3.67250000	2026-01-22	2026-01-23 15:19:09.999099
USD	AFN	65.91680000	2026-01-22	2026-01-23 15:19:09.999099
USD	ALL	82.38850000	2026-01-22	2026-01-23 15:19:09.999099
USD	AMD	378.81910000	2026-01-22	2026-01-23 15:19:09.999099
USD	ANG	1.79000000	2026-01-22	2026-01-23 15:19:09.999099
USD	AOA	922.19300000	2026-01-22	2026-01-23 15:19:09.999099
USD	ARS	1452.25000000	2026-01-22	2026-01-23 15:19:09.999099
USD	AUD	1.46530000	2026-01-22	2026-01-23 15:19:09.999099
USD	AWG	1.79000000	2026-01-22	2026-01-23 15:19:09.999099
USD	AZN	1.69890000	2026-01-22	2026-01-23 15:19:09.999099
USD	BAM	1.66690000	2026-01-22	2026-01-23 15:19:09.999099
USD	BBD	2.00000000	2026-01-22	2026-01-23 15:19:09.999099
USD	BDT	122.28580000	2026-01-22	2026-01-23 15:19:09.999099
USD	BGN	1.61290000	2026-01-22	2026-01-23 15:19:09.999099
USD	BHD	0.37600000	2026-01-22	2026-01-23 15:19:09.999099
USD	BIF	2967.65120000	2026-01-22	2026-01-23 15:19:09.999099
USD	BMD	1.00000000	2026-01-22	2026-01-23 15:19:09.999099
USD	BND	1.28250000	2026-01-22	2026-01-23 15:19:09.999099
USD	BOB	6.91680000	2026-01-22	2026-01-23 15:19:09.999099
USD	BRL	5.31140000	2026-01-22	2026-01-23 15:19:09.999099
USD	BSD	1.00000000	2026-01-22	2026-01-23 15:19:09.999099
USD	BTN	91.62900000	2026-01-22	2026-01-23 15:19:09.999099
USD	BWP	13.59870000	2026-01-22	2026-01-23 15:19:09.999099
USD	BYN	2.85430000	2026-01-22	2026-01-23 15:19:09.999099
USD	BZD	2.00000000	2026-01-22	2026-01-23 15:19:09.999099
USD	CAD	1.37960000	2026-01-22	2026-01-23 15:19:09.999099
USD	CDF	2172.74270000	2026-01-22	2026-01-23 15:19:09.999099
USD	CHF	0.79100000	2026-01-22	2026-01-23 15:19:09.999099
USD	CLF	0.02212000	2026-01-22	2026-01-23 15:19:09.999099
USD	CLP	874.32810000	2026-01-22	2026-01-23 15:19:09.999099
USD	CNH	6.96850000	2026-01-22	2026-01-23 15:19:09.999099
USD	CNY	6.98070000	2026-01-22	2026-01-23 15:19:09.999099
USD	COP	3672.14170000	2026-01-22	2026-01-23 15:19:09.999099
USD	CRC	491.80610000	2026-01-22	2026-01-23 15:19:09.999099
USD	CUP	24.00000000	2026-01-22	2026-01-23 15:19:09.999099
USD	CVE	93.97650000	2026-01-22	2026-01-23 15:19:09.999099
USD	CZK	20.71860000	2026-01-22	2026-01-23 15:19:09.999099
USD	DJF	177.72100000	2026-01-22	2026-01-23 15:19:09.999099
USD	DKK	6.36420000	2026-01-22	2026-01-23 15:19:09.999099
USD	DOP	62.99830000	2026-01-22	2026-01-23 15:19:09.999099
USD	DZD	129.75340000	2026-01-22	2026-01-23 15:19:09.999099
USD	EGP	47.12690000	2026-01-22	2026-01-23 15:19:09.999099
USD	ERN	15.00000000	2026-01-22	2026-01-23 15:19:09.999099
USD	ETB	154.49890000	2026-01-22	2026-01-23 15:19:09.999099
USD	EUR	0.85230000	2026-01-22	2026-01-23 15:19:09.999099
USD	FJD	2.26310000	2026-01-22	2026-01-23 15:19:09.999099
USD	FKP	0.74240000	2026-01-22	2026-01-23 15:19:09.999099
USD	FOK	6.36390000	2026-01-22	2026-01-23 15:19:09.999099
USD	GBP	0.74260000	2026-01-22	2026-01-23 15:19:09.999099
USD	GEL	2.69340000	2026-01-22	2026-01-23 15:19:09.999099
USD	GGP	0.74240000	2026-01-22	2026-01-23 15:19:09.999099
USD	GHS	10.89440000	2026-01-22	2026-01-23 15:19:09.999099
USD	GIP	0.74240000	2026-01-22	2026-01-23 15:19:09.999099
USD	GMD	74.01100000	2026-01-22	2026-01-23 15:19:09.999099
USD	GNF	8750.99000000	2026-01-22	2026-01-23 15:19:09.999099
USD	GTQ	7.66710000	2026-01-22	2026-01-23 15:19:09.999099
USD	GYD	209.17500000	2026-01-22	2026-01-23 15:19:09.999099
USD	HKD	7.79750000	2026-01-22	2026-01-23 15:19:09.999099
USD	HNL	26.35960000	2026-01-22	2026-01-23 15:19:09.999099
USD	HRK	6.42150000	2026-01-22	2026-01-23 15:19:09.999099
USD	HTG	130.89080000	2026-01-22	2026-01-23 15:19:09.999099
USD	HUF	326.09650000	2026-01-22	2026-01-23 15:19:09.999099
USD	IDR	16853.14110000	2026-01-22	2026-01-23 15:19:09.999099
USD	ILS	3.14040000	2026-01-22	2026-01-23 15:19:09.999099
USD	IMP	0.74240000	2026-01-22	2026-01-23 15:19:09.999099
USD	INR	91.62910000	2026-01-22	2026-01-23 15:19:09.999099
USD	IQD	1310.90580000	2026-01-22	2026-01-23 15:19:09.999099
USD	IRR	266292.45700000	2026-01-22	2026-01-23 15:19:09.999099
USD	ISK	124.79720000	2026-01-22	2026-01-23 15:19:09.999099
USD	JEP	0.74240000	2026-01-22	2026-01-23 15:19:09.999099
USD	JMD	157.24000000	2026-01-22	2026-01-23 15:19:09.999099
USD	JOD	0.70900000	2026-01-22	2026-01-23 15:19:09.999099
USD	JPY	158.48010000	2026-01-22	2026-01-23 15:19:09.999099
USD	KES	129.00040000	2026-01-22	2026-01-23 15:19:09.999099
USD	KGS	87.41690000	2026-01-22	2026-01-23 15:19:09.999099
USD	KHR	4022.03370000	2026-01-22	2026-01-23 15:19:09.999099
USD	KID	1.46530000	2026-01-22	2026-01-23 15:19:09.999099
USD	KMF	419.29340000	2026-01-22	2026-01-23 15:19:09.999099
USD	KRW	1465.84800000	2026-01-22	2026-01-23 15:19:09.999099
USD	KWD	0.30690000	2026-01-22	2026-01-23 15:19:09.999099
USD	KYD	0.83330000	2026-01-22	2026-01-23 15:19:09.999099
USD	KZT	505.63110000	2026-01-22	2026-01-23 15:19:09.999099
USD	LAK	21677.85530000	2026-01-22	2026-01-23 15:19:09.999099
USD	LBP	89500.00000000	2026-01-22	2026-01-23 15:19:09.999099
USD	LKR	309.44030000	2026-01-22	2026-01-23 15:19:09.999099
USD	LRD	184.38760000	2026-01-22	2026-01-23 15:19:09.999099
USD	LSL	16.16270000	2026-01-22	2026-01-23 15:19:09.999099
USD	LYD	6.35860000	2026-01-22	2026-01-23 15:19:09.999099
USD	MAD	9.17070000	2026-01-22	2026-01-23 15:19:09.999099
USD	MDL	16.99020000	2026-01-22	2026-01-23 15:19:09.999099
USD	MGA	4593.40780000	2026-01-22	2026-01-23 15:19:09.999099
USD	MKD	52.54450000	2026-01-22	2026-01-23 15:19:09.999099
USD	MMK	2100.43660000	2026-01-22	2026-01-23 15:19:09.999099
USD	MNT	3569.72000000	2026-01-22	2026-01-23 15:19:09.999099
USD	MOP	8.03140000	2026-01-22	2026-01-23 15:19:09.999099
USD	MRU	39.97020000	2026-01-22	2026-01-23 15:19:09.999099
USD	MUR	46.04290000	2026-01-22	2026-01-23 15:19:09.999099
USD	MVR	15.43440000	2026-01-22	2026-01-23 15:19:09.999099
USD	MWK	1741.97010000	2026-01-22	2026-01-23 15:19:09.999099
USD	MXN	17.47310000	2026-01-22	2026-01-23 15:19:09.999099
USD	MYR	4.04030000	2026-01-22	2026-01-23 15:19:09.999099
USD	MZN	63.78040000	2026-01-22	2026-01-23 15:19:09.999099
USD	NAD	16.16270000	2026-01-22	2026-01-23 15:19:09.999099
USD	NGN	1420.35370000	2026-01-22	2026-01-23 15:19:09.999099
USD	NIO	36.76380000	2026-01-22	2026-01-23 15:19:09.999099
USD	NOK	9.86770000	2026-01-22	2026-01-23 15:19:09.999099
USD	NPR	146.60650000	2026-01-22	2026-01-23 15:19:09.999099
USD	NZD	1.69440000	2026-01-22	2026-01-23 15:19:09.999099
USD	OMR	0.38450000	2026-01-22	2026-01-23 15:19:09.999099
USD	PAB	1.00000000	2026-01-22	2026-01-23 15:19:09.999099
USD	PEN	3.35450000	2026-01-22	2026-01-23 15:19:09.999099
USD	PGK	4.27060000	2026-01-22	2026-01-23 15:19:09.999099
USD	PHP	59.11650000	2026-01-22	2026-01-23 15:19:09.999099
USD	PKR	279.98800000	2026-01-22	2026-01-23 15:19:09.999099
USD	PLN	3.58390000	2026-01-22	2026-01-23 15:19:09.999099
USD	PYG	6712.38190000	2026-01-22	2026-01-23 15:19:09.999099
USD	QAR	3.64000000	2026-01-22	2026-01-23 15:19:09.999099
USD	RON	4.35310000	2026-01-22	2026-01-23 15:19:09.999099
USD	RSD	100.19580000	2026-01-22	2026-01-23 15:19:09.999099
USD	RUB	75.96820000	2026-01-22	2026-01-23 15:19:09.999099
USD	RWF	1459.87120000	2026-01-22	2026-01-23 15:19:09.999099
USD	SAR	3.75000000	2026-01-22	2026-01-23 15:19:09.999099
USD	SBD	8.01200000	2026-01-22	2026-01-23 15:19:09.999099
USD	SCR	14.03980000	2026-01-22	2026-01-23 15:19:09.999099
USD	SDG	511.41910000	2026-01-22	2026-01-23 15:19:09.999099
USD	SEK	9.03090000	2026-01-22	2026-01-23 15:19:09.999099
USD	SGD	1.28210000	2026-01-22	2026-01-23 15:19:09.999099
USD	SHP	0.74240000	2026-01-22	2026-01-23 15:19:09.999099
USD	SLE	23.64460000	2026-01-22	2026-01-23 15:19:09.999099
USD	SLL	23644.57010000	2026-01-22	2026-01-23 15:19:09.999099
USD	SOS	570.25830000	2026-01-22	2026-01-23 15:19:09.999099
USD	SRD	38.28980000	2026-01-22	2026-01-23 15:19:09.999099
USD	SSP	4661.12160000	2026-01-22	2026-01-23 15:19:09.999099
USD	STN	20.88080000	2026-01-22	2026-01-23 15:19:09.999099
USD	SYP	112.91050000	2026-01-22	2026-01-23 15:19:09.999099
USD	SZL	16.16270000	2026-01-22	2026-01-23 15:19:09.999099
USD	THB	31.30370000	2026-01-22	2026-01-23 15:19:09.999099
USD	TJS	9.30400000	2026-01-22	2026-01-23 15:19:09.999099
USD	TMT	3.49880000	2026-01-22	2026-01-23 15:19:09.999099
USD	TND	2.87700000	2026-01-22	2026-01-23 15:19:09.999099
USD	TOP	2.38290000	2026-01-22	2026-01-23 15:19:09.999099
USD	TRY	43.34060000	2026-01-22	2026-01-23 15:19:09.999099
USD	TTD	6.77150000	2026-01-22	2026-01-23 15:19:09.999099
USD	TVD	1.46530000	2026-01-22	2026-01-23 15:19:09.999099
USD	TWD	31.61840000	2026-01-22	2026-01-23 15:19:09.999099
USD	TZS	2521.71320000	2026-01-22	2026-01-23 15:19:09.999099
USD	UAH	43.15180000	2026-01-22	2026-01-23 15:19:09.999099
USD	UGX	3487.64020000	2026-01-22	2026-01-23 15:19:09.999099
USD	UYU	38.33550000	2026-01-22	2026-01-23 15:19:09.999099
USD	UZS	12143.76470000	2026-01-22	2026-01-23 15:19:09.999099
USD	VES	352.70630000	2026-01-22	2026-01-23 15:19:09.999099
USD	VND	26142.56170000	2026-01-22	2026-01-23 15:19:09.999099
USD	VUV	120.10160000	2026-01-22	2026-01-23 15:19:09.999099
USD	WST	2.73220000	2026-01-22	2026-01-23 15:19:09.999099
USD	XAF	559.05790000	2026-01-22	2026-01-23 15:19:09.999099
USD	XCD	2.70000000	2026-01-22	2026-01-23 15:19:09.999099
USD	XCG	1.79000000	2026-01-22	2026-01-23 15:19:09.999099
USD	XDR	0.72890000	2026-01-22	2026-01-23 15:19:09.999099
USD	XOF	559.05790000	2026-01-22	2026-01-23 15:19:09.999099
USD	XPF	101.70410000	2026-01-22	2026-01-23 15:19:09.999099
USD	YER	238.14560000	2026-01-22	2026-01-23 15:19:09.999099
USD	ZAR	16.15630000	2026-01-22	2026-01-23 15:19:09.999099
USD	ZMW	20.23870000	2026-01-22	2026-01-23 15:19:09.999099
USD	ZWG	25.59020000	2026-01-22	2026-01-23 15:19:09.999099
USD	ZWL	25.59020000	2026-01-22	2026-01-23 15:19:09.999099
USD	USD	1.00000000	2026-01-23	2026-01-24 15:00:00.516515
USD	AED	3.67250000	2026-01-23	2026-01-24 15:00:00.516515
USD	AFN	74.10600000	2026-01-23	2026-01-24 15:00:00.516515
USD	ALL	85.57750000	2026-01-23	2026-01-24 15:00:00.516515
USD	AMD	355.63270000	2026-01-23	2026-01-24 15:00:00.516515
USD	ANG	1.79000000	2026-01-23	2026-01-24 15:00:00.516515
USD	AOA	929.67910000	2026-01-23	2026-01-24 15:00:00.516515
USD	ARS	1452.25000000	2026-01-23	2026-01-24 15:00:00.516515
USD	AUD	1.45460000	2026-01-23	2026-01-24 15:00:00.516515
USD	AWG	1.79000000	2026-01-23	2026-01-24 15:00:00.516515
USD	AZN	1.55760000	2026-01-23	2026-01-24 15:00:00.516515
USD	BAM	1.65980000	2026-01-23	2026-01-24 15:00:00.516515
USD	BBD	2.00000000	2026-01-23	2026-01-24 15:00:00.516515
USD	BDT	122.01800000	2026-01-23	2026-01-24 15:00:00.516515
USD	BGN	1.60700000	2026-01-23	2026-01-24 15:00:00.516515
USD	BHD	0.37600000	2026-01-23	2026-01-24 15:00:00.516515
USD	BIF	2599.52120000	2026-01-23	2026-01-24 15:00:00.516515
USD	BMD	1.00000000	2026-01-23	2026-01-24 15:00:00.516515
USD	BND	1.27580000	2026-01-23	2026-01-24 15:00:00.516515
USD	BOB	6.20730000	2026-01-23	2026-01-24 15:00:00.516515
USD	BRL	5.28850000	2026-01-23	2026-01-24 15:00:00.516515
USD	BSD	1.00000000	2026-01-23	2026-01-24 15:00:00.516515
USD	BTN	91.80600000	2026-01-23	2026-01-24 15:00:00.516515
USD	BWP	14.06080000	2026-01-23	2026-01-24 15:00:00.516515
USD	BYN	2.78120000	2026-01-23	2026-01-24 15:00:00.516515
USD	BZD	2.00000000	2026-01-23	2026-01-24 15:00:00.516515
USD	CAD	1.37290000	2026-01-23	2026-01-24 15:00:00.516515
USD	CDF	2115.74510000	2026-01-23	2026-01-24 15:00:00.516515
USD	CHF	0.78510000	2026-01-23	2026-01-24 15:00:00.516515
USD	CLF	0.02055000	2026-01-23	2026-01-24 15:00:00.516515
USD	CLP	812.87340000	2026-01-23	2026-01-24 15:00:00.516515
USD	CNH	6.95360000	2026-01-23	2026-01-24 15:00:00.516515
USD	CNY	6.97630000	2026-01-23	2026-01-24 15:00:00.516515
USD	COP	3651.70000000	2026-01-23	2026-01-24 15:00:00.516515
USD	CRC	477.21990000	2026-01-23	2026-01-24 15:00:00.516515
USD	CUP	24.00000000	2026-01-23	2026-01-24 15:00:00.516515
USD	CVE	93.57830000	2026-01-23	2026-01-24 15:00:00.516515
USD	CZK	20.60410000	2026-01-23	2026-01-24 15:00:00.516515
USD	DJF	177.72100000	2026-01-23	2026-01-24 15:00:00.516515
USD	DKK	6.33920000	2026-01-23	2026-01-24 15:00:00.516515
USD	DOP	50.36060000	2026-01-23	2026-01-24 15:00:00.516515
USD	DZD	120.79370000	2026-01-23	2026-01-24 15:00:00.516515
USD	EGP	47.10790000	2026-01-23	2026-01-24 15:00:00.516515
USD	ERN	15.00000000	2026-01-23	2026-01-24 15:00:00.516515
USD	ETB	154.69480000	2026-01-23	2026-01-24 15:00:00.516515
USD	EUR	0.84870000	2026-01-23	2026-01-24 15:00:00.516515
USD	FJD	2.25880000	2026-01-23	2026-01-24 15:00:00.516515
USD	FKP	0.73690000	2026-01-23	2026-01-24 15:00:00.516515
USD	FOK	6.33920000	2026-01-23	2026-01-24 15:00:00.516515
USD	GBP	0.73690000	2026-01-23	2026-01-24 15:00:00.516515
USD	GEL	2.45860000	2026-01-23	2026-01-24 15:00:00.516515
USD	GGP	0.73690000	2026-01-23	2026-01-24 15:00:00.516515
USD	GHS	10.23260000	2026-01-23	2026-01-24 15:00:00.516515
USD	GIP	0.73690000	2026-01-23	2026-01-24 15:00:00.516515
USD	GMD	60.28170000	2026-01-23	2026-01-24 15:00:00.516515
USD	GNF	7888.87070000	2026-01-23	2026-01-24 15:00:00.516515
USD	GTQ	6.99670000	2026-01-23	2026-01-24 15:00:00.516515
USD	GYD	187.78370000	2026-01-23	2026-01-24 15:00:00.516515
USD	HKD	7.79750000	2026-01-23	2026-01-24 15:00:00.516515
USD	HNL	22.28830000	2026-01-23	2026-01-24 15:00:00.516515
USD	HRK	6.39430000	2026-01-23	2026-01-24 15:00:00.516515
USD	HTG	124.17000000	2026-01-23	2026-01-24 15:00:00.516515
USD	HUF	324.33710000	2026-01-23	2026-01-24 15:00:00.516515
USD	IDR	16796.11210000	2026-01-23	2026-01-24 15:00:00.516515
USD	ILS	3.13920000	2026-01-23	2026-01-24 15:00:00.516515
USD	IMP	0.73690000	2026-01-23	2026-01-24 15:00:00.516515
USD	INR	91.80630000	2026-01-23	2026-01-24 15:00:00.516515
USD	IQD	1164.56400000	2026-01-23	2026-01-24 15:00:00.516515
USD	IRR	38734.48090000	2026-01-23	2026-01-24 15:00:00.516515
USD	ISK	124.24940000	2026-01-23	2026-01-24 15:00:00.516515
USD	JEP	0.73690000	2026-01-23	2026-01-24 15:00:00.516515
USD	JMD	144.67020000	2026-01-23	2026-01-24 15:00:00.516515
USD	JOD	0.70900000	2026-01-23	2026-01-24 15:00:00.516515
USD	JPY	156.81080000	2026-01-23	2026-01-24 15:00:00.516515
USD	KES	129.00530000	2026-01-23	2026-01-24 15:00:00.516515
USD	KGS	81.00280000	2026-01-23	2026-01-24 15:00:00.516515
USD	KHR	3655.76560000	2026-01-23	2026-01-24 15:00:00.516515
USD	KID	1.45460000	2026-01-23	2026-01-24 15:00:00.516515
USD	KMF	417.51670000	2026-01-23	2026-01-24 15:00:00.516515
USD	KRW	1457.34120000	2026-01-23	2026-01-24 15:00:00.516515
USD	KWD	0.30620000	2026-01-23	2026-01-24 15:00:00.516515
USD	KYD	0.83330000	2026-01-23	2026-01-24 15:00:00.516515
USD	KZT	504.47390000	2026-01-23	2026-01-24 15:00:00.516515
USD	LAK	16953.01850000	2026-01-23	2026-01-24 15:00:00.516515
USD	LBP	89500.00000000	2026-01-23	2026-01-24 15:00:00.516515
USD	LKR	309.70020000	2026-01-23	2026-01-24 15:00:00.516515
USD	LRD	158.90340000	2026-01-23	2026-01-24 15:00:00.516515
USD	LSL	16.12700000	2026-01-23	2026-01-24 15:00:00.516515
USD	LYD	4.39500000	2026-01-23	2026-01-24 15:00:00.516515
USD	MAD	9.15590000	2026-01-23	2026-01-24 15:00:00.516515
USD	MDL	16.20820000	2026-01-23	2026-01-24 15:00:00.516515
USD	MGA	4205.52360000	2026-01-23	2026-01-24 15:00:00.516515
USD	MKD	50.15160000	2026-01-23	2026-01-24 15:00:00.516515
USD	MMK	1880.70760000	2026-01-23	2026-01-24 15:00:00.516515
USD	MNT	3296.46660000	2026-01-23	2026-01-24 15:00:00.516515
USD	MOP	8.03140000	2026-01-23	2026-01-24 15:00:00.516515
USD	MRU	31.18870000	2026-01-23	2026-01-24 15:00:00.516515
USD	MUR	45.96480000	2026-01-23	2026-01-24 15:00:00.516515
USD	MVR	13.97390000	2026-01-23	2026-01-24 15:00:00.516515
USD	MWK	1135.03190000	2026-01-23	2026-01-24 15:00:00.516515
USD	MXN	17.41300000	2026-01-23	2026-01-24 15:00:00.516515
USD	MYR	4.01240000	2026-01-23	2026-01-24 15:00:00.516515
USD	MZN	59.35280000	2026-01-23	2026-01-24 15:00:00.516515
USD	NAD	16.12700000	2026-01-23	2026-01-24 15:00:00.516515
USD	NGN	1421.32280000	2026-01-23	2026-01-24 15:00:00.516515
USD	NIO	32.76870000	2026-01-23	2026-01-24 15:00:00.516515
USD	NOK	9.80720000	2026-01-23	2026-01-24 15:00:00.516515
USD	NPR	146.88970000	2026-01-23	2026-01-24 15:00:00.516515
USD	NZD	1.68540000	2026-01-23	2026-01-24 15:00:00.516515
USD	OMR	0.38450000	2026-01-23	2026-01-24 15:00:00.516515
USD	PAB	1.00000000	2026-01-23	2026-01-24 15:00:00.516515
USD	PEN	3.28540000	2026-01-23	2026-01-24 15:00:00.516515
USD	PGK	3.28880000	2026-01-23	2026-01-24 15:00:00.516515
USD	PHP	59.08090000	2026-01-23	2026-01-24 15:00:00.516515
USD	PKR	266.55130000	2026-01-23	2026-01-24 15:00:00.516515
USD	PLN	3.56990000	2026-01-23	2026-01-24 15:00:00.516515
USD	PYG	6423.88180000	2026-01-23	2026-01-24 15:00:00.516515
USD	QAR	3.64000000	2026-01-23	2026-01-24 15:00:00.516515
USD	RON	4.33740000	2026-01-23	2026-01-24 15:00:00.516515
USD	RSD	99.93550000	2026-01-23	2026-01-24 15:00:00.516515
USD	RUB	75.77230000	2026-01-23	2026-01-24 15:00:00.516515
USD	RWF	1234.34170000	2026-01-23	2026-01-24 15:00:00.516515
USD	SAR	3.75000000	2026-01-23	2026-01-24 15:00:00.516515
USD	SBD	7.57910000	2026-01-23	2026-01-24 15:00:00.516515
USD	SCR	12.43730000	2026-01-23	2026-01-24 15:00:00.516515
USD	SDG	519.03110000	2026-01-23	2026-01-24 15:00:00.516515
USD	SEK	8.98450000	2026-01-23	2026-01-24 15:00:00.516515
USD	SGD	1.27550000	2026-01-23	2026-01-24 15:00:00.516515
USD	SHP	0.73690000	2026-01-23	2026-01-24 15:00:00.516515
USD	SLE	15.54950000	2026-01-23	2026-01-24 15:00:00.516515
USD	SLL	15549.46290000	2026-01-23	2026-01-24 15:00:00.516515
USD	SOS	505.41450000	2026-01-23	2026-01-24 15:00:00.516515
USD	SRD	33.61820000	2026-01-23	2026-01-24 15:00:00.516515
USD	SSP	1725.35640000	2026-01-23	2026-01-24 15:00:00.516515
USD	STN	20.79230000	2026-01-23	2026-01-24 15:00:00.516515
USD	SYP	1938.04950000	2026-01-23	2026-01-24 15:00:00.516515
USD	SZL	16.12700000	2026-01-23	2026-01-24 15:00:00.516515
USD	THB	31.15730000	2026-01-23	2026-01-24 15:00:00.516515
USD	TJS	9.48580000	2026-01-23	2026-01-24 15:00:00.516515
USD	TMT	3.21300000	2026-01-23	2026-01-24 15:00:00.516515
USD	TND	2.85700000	2026-01-23	2026-01-24 15:00:00.516515
USD	TOP	2.09080000	2026-01-23	2026-01-24 15:00:00.516515
USD	TRY	43.33300000	2026-01-23	2026-01-24 15:00:00.516515
USD	TTD	6.24700000	2026-01-23	2026-01-24 15:00:00.516515
USD	TVD	1.45460000	2026-01-23	2026-01-24 15:00:00.516515
USD	TWD	31.49370000	2026-01-23	2026-01-24 15:00:00.516515
USD	TZS	2530.47480000	2026-01-23	2026-01-24 15:00:00.516515
USD	UAH	38.63280000	2026-01-23	2026-01-24 15:00:00.516515
USD	UGX	3370.18930000	2026-01-23	2026-01-24 15:00:00.516515
USD	UYU	34.09260000	2026-01-23	2026-01-24 15:00:00.516515
USD	UZS	10901.63990000	2026-01-23	2026-01-24 15:00:00.516515
USD	VES	355.55280000	2026-01-23	2026-01-24 15:00:00.516515
USD	VND	26000.81150000	2026-01-23	2026-01-24 15:00:00.516515
USD	VUV	106.78570000	2026-01-23	2026-01-24 15:00:00.516515
USD	WST	2.44900000	2026-01-23	2026-01-24 15:00:00.516515
USD	XAF	556.68900000	2026-01-23	2026-01-24 15:00:00.516515
USD	XCD	2.70000000	2026-01-23	2026-01-24 15:00:00.516515
USD	XCG	1.79000000	2026-01-23	2026-01-24 15:00:00.516515
USD	XDR	0.75060000	2026-01-23	2026-01-24 15:00:00.516515
USD	XOF	556.68900000	2026-01-23	2026-01-24 15:00:00.516515
USD	XPF	101.27310000	2026-01-23	2026-01-24 15:00:00.516515
USD	YER	222.38190000	2026-01-23	2026-01-24 15:00:00.516515
USD	ZAR	16.12710000	2026-01-23	2026-01-24 15:00:00.516515
USD	ZMW	16.54410000	2026-01-23	2026-01-24 15:00:00.516515
USD	ZWG	25.60130000	2026-01-23	2026-01-24 15:00:00.516515
USD	ZWL	25.60130000	2026-01-23	2026-01-24 15:00:00.516515
USD	USD	1.00000000	2026-01-24	2026-01-25 15:00:00.514358
USD	AED	3.67250000	2026-01-24	2026-01-25 15:00:00.514358
USD	AFN	65.86530000	2026-01-24	2026-01-25 15:00:00.514358
USD	ALL	81.58030000	2026-01-24	2026-01-25 15:00:00.514358
USD	AMD	375.60090000	2026-01-24	2026-01-25 15:00:00.514358
USD	ANG	1.79000000	2026-01-24	2026-01-25 15:00:00.514358
USD	AOA	913.57980000	2026-01-24	2026-01-25 15:00:00.514358
USD	ARS	1452.25000000	2026-01-24	2026-01-25 15:00:00.514358
USD	AUD	1.45660000	2026-01-24	2026-01-25 15:00:00.514358
USD	AWG	1.79000000	2026-01-24	2026-01-25 15:00:00.514358
USD	AZN	1.68720000	2026-01-24	2026-01-25 15:00:00.514358
USD	BAM	1.66130000	2026-01-24	2026-01-25 15:00:00.514358
USD	BBD	2.00000000	2026-01-24	2026-01-25 15:00:00.514358
USD	BDT	122.10170000	2026-01-24	2026-01-25 15:00:00.514358
USD	BGN	1.64560000	2026-01-24	2026-01-25 15:00:00.514358
USD	BHD	0.37600000	2026-01-24	2026-01-25 15:00:00.514358
USD	BIF	2940.51450000	2026-01-24	2026-01-25 15:00:00.514358
USD	BMD	1.00000000	2026-01-24	2026-01-25 15:00:00.514358
USD	BND	1.27710000	2026-01-24	2026-01-25 15:00:00.514358
USD	BOB	6.86850000	2026-01-24	2026-01-25 15:00:00.514358
USD	BRL	5.28700000	2026-01-24	2026-01-25 15:00:00.514358
USD	BSD	1.00000000	2026-01-24	2026-01-25 15:00:00.514358
USD	BTN	91.84830000	2026-01-24	2026-01-25 15:00:00.514358
USD	BWP	13.38640000	2026-01-24	2026-01-25 15:00:00.514358
USD	BYN	2.84440000	2026-01-24	2026-01-25 15:00:00.514358
USD	BZD	2.00000000	2026-01-24	2026-01-25 15:00:00.514358
USD	CAD	1.37380000	2026-01-24	2026-01-25 15:00:00.514358
USD	CDF	2157.07630000	2026-01-24	2026-01-25 15:00:00.514358
USD	CHF	0.78660000	2026-01-24	2026-01-25 15:00:00.514358
USD	CLF	0.02201000	2026-01-24	2026-01-25 15:00:00.514358
USD	CLP	869.82110000	2026-01-24	2026-01-25 15:00:00.514358
USD	CNH	6.95850000	2026-01-24	2026-01-25 15:00:00.514358
USD	CNY	6.97970000	2026-01-24	2026-01-25 15:00:00.514358
USD	COP	3639.00720000	2026-01-24	2026-01-25 15:00:00.514358
USD	CRC	485.71860000	2026-01-24	2026-01-25 15:00:00.514358
USD	CUP	24.00000000	2026-01-24	2026-01-25 15:00:00.514358
USD	CVE	93.65790000	2026-01-24	2026-01-25 15:00:00.514358
USD	CZK	20.61480000	2026-01-24	2026-01-25 15:00:00.514358
USD	DJF	177.72100000	2026-01-24	2026-01-25 15:00:00.514358
USD	DKK	6.33890000	2026-01-24	2026-01-25 15:00:00.514358
USD	DOP	62.41940000	2026-01-24	2026-01-25 15:00:00.514358
USD	DZD	128.62690000	2026-01-24	2026-01-25 15:00:00.514358
USD	EGP	47.12140000	2026-01-24	2026-01-25 15:00:00.514358
USD	ERN	15.00000000	2026-01-24	2026-01-25 15:00:00.514358
USD	ETB	154.07450000	2026-01-24	2026-01-25 15:00:00.514358
USD	EUR	0.84940000	2026-01-24	2026-01-25 15:00:00.514358
USD	FJD	2.25920000	2026-01-24	2026-01-25 15:00:00.514358
USD	FKP	0.73740000	2026-01-24	2026-01-25 15:00:00.514358
USD	FOK	6.33890000	2026-01-24	2026-01-25 15:00:00.514358
USD	GBP	0.73740000	2026-01-24	2026-01-25 15:00:00.514358
USD	GEL	2.67600000	2026-01-24	2026-01-25 15:00:00.514358
USD	GGP	0.73740000	2026-01-24	2026-01-25 15:00:00.514358
USD	GHS	10.79580000	2026-01-24	2026-01-25 15:00:00.514358
USD	GIP	0.73740000	2026-01-24	2026-01-25 15:00:00.514358
USD	GMD	73.42030000	2026-01-24	2026-01-25 15:00:00.514358
USD	GNF	8690.16060000	2026-01-24	2026-01-25 15:00:00.514358
USD	GTQ	7.60490000	2026-01-24	2026-01-25 15:00:00.514358
USD	GYD	207.15770000	2026-01-24	2026-01-25 15:00:00.514358
USD	HKD	7.79780000	2026-01-24	2026-01-25 15:00:00.514358
USD	HNL	26.12530000	2026-01-24	2026-01-25 15:00:00.514358
USD	HRK	6.39970000	2026-01-24	2026-01-25 15:00:00.514358
USD	HTG	130.06740000	2026-01-24	2026-01-25 15:00:00.514358
USD	HUF	324.65350000	2026-01-24	2026-01-25 15:00:00.514358
USD	IDR	16801.14060000	2026-01-24	2026-01-25 15:00:00.514358
USD	ILS	3.13880000	2026-01-24	2026-01-25 15:00:00.514358
USD	IMP	0.73740000	2026-01-24	2026-01-25 15:00:00.514358
USD	INR	91.84850000	2026-01-24	2026-01-25 15:00:00.514358
USD	IQD	1297.47030000	2026-01-24	2026-01-25 15:00:00.514358
USD	IRR	695298.71320000	2026-01-24	2026-01-25 15:00:00.514358
USD	ISK	124.41580000	2026-01-24	2026-01-25 15:00:00.514358
USD	JEP	0.73740000	2026-01-24	2026-01-25 15:00:00.514358
USD	JMD	155.81930000	2026-01-24	2026-01-25 15:00:00.514358
USD	JOD	0.70900000	2026-01-24	2026-01-25 15:00:00.514358
USD	JPY	157.16720000	2026-01-24	2026-01-25 15:00:00.514358
USD	KES	129.00220000	2026-01-24	2026-01-25 15:00:00.514358
USD	KGS	86.83430000	2026-01-24	2026-01-25 15:00:00.514358
USD	KHR	3984.28500000	2026-01-24	2026-01-25 15:00:00.514358
USD	KID	1.45660000	2026-01-24	2026-01-25 15:00:00.514358
USD	KMF	417.87220000	2026-01-24	2026-01-25 15:00:00.514358
USD	KRW	1459.54390000	2026-01-24	2026-01-25 15:00:00.514358
USD	KWD	0.30470000	2026-01-24	2026-01-25 15:00:00.514358
USD	KYD	0.83330000	2026-01-24	2026-01-25 15:00:00.514358
USD	KZT	502.25110000	2026-01-24	2026-01-25 15:00:00.514358
USD	LAK	21436.46980000	2026-01-24	2026-01-25 15:00:00.514358
USD	LBP	89500.00000000	2026-01-24	2026-01-25 15:00:00.514358
USD	LKR	309.68590000	2026-01-24	2026-01-25 15:00:00.514358
USD	LRD	182.52520000	2026-01-24	2026-01-25 15:00:00.514358
USD	LSL	16.14850000	2026-01-24	2026-01-25 15:00:00.514358
USD	LYD	6.30150000	2026-01-24	2026-01-25 15:00:00.514358
USD	MAD	9.15800000	2026-01-24	2026-01-25 15:00:00.514358
USD	MDL	16.83520000	2026-01-24	2026-01-25 15:00:00.514358
USD	MGA	4547.78840000	2026-01-24	2026-01-25 15:00:00.514358
USD	MKD	52.21050000	2026-01-24	2026-01-25 15:00:00.514358
USD	MMK	2081.12530000	2026-01-24	2026-01-25 15:00:00.514358
USD	MNT	3535.12540000	2026-01-24	2026-01-25 15:00:00.514358
USD	MOP	8.03170000	2026-01-24	2026-01-25 15:00:00.514358
USD	MRU	39.54450000	2026-01-24	2026-01-25 15:00:00.514358
USD	MUR	45.89730000	2026-01-24	2026-01-25 15:00:00.514358
USD	MVR	15.32550000	2026-01-24	2026-01-25 15:00:00.514358
USD	MWK	1723.79510000	2026-01-24	2026-01-25 15:00:00.514358
USD	MXN	17.41740000	2026-01-24	2026-01-25 15:00:00.514358
USD	MYR	4.01020000	2026-01-24	2026-01-25 15:00:00.514358
USD	MZN	63.35730000	2026-01-24	2026-01-25 15:00:00.514358
USD	NAD	16.14850000	2026-01-24	2026-01-25 15:00:00.514358
USD	NGN	1421.24110000	2026-01-24	2026-01-25 15:00:00.514358
USD	NIO	36.45470000	2026-01-24	2026-01-25 15:00:00.514358
USD	NOK	9.81870000	2026-01-24	2026-01-25 15:00:00.514358
USD	NPR	146.95720000	2026-01-24	2026-01-25 15:00:00.514358
USD	NZD	1.68730000	2026-01-24	2026-01-25 15:00:00.514358
USD	OMR	0.38450000	2026-01-24	2026-01-25 15:00:00.514358
USD	PAB	1.00000000	2026-01-24	2026-01-25 15:00:00.514358
USD	PEN	3.33480000	2026-01-24	2026-01-25 15:00:00.514358
USD	PGK	4.23530000	2026-01-24	2026-01-25 15:00:00.514358
USD	PHP	59.08530000	2026-01-24	2026-01-25 15:00:00.514358
USD	PKR	278.16410000	2026-01-24	2026-01-25 15:00:00.514358
USD	PLN	3.57420000	2026-01-24	2026-01-25 15:00:00.514358
USD	PYG	6642.58890000	2026-01-24	2026-01-25 15:00:00.514358
USD	QAR	3.64000000	2026-01-24	2026-01-25 15:00:00.514358
USD	RON	4.33860000	2026-01-24	2026-01-25 15:00:00.514358
USD	RSD	99.96500000	2026-01-24	2026-01-25 15:00:00.514358
USD	RUB	75.80650000	2026-01-24	2026-01-25 15:00:00.514358
USD	RWF	1450.36840000	2026-01-24	2026-01-25 15:00:00.514358
USD	SAR	3.75000000	2026-01-24	2026-01-25 15:00:00.514358
USD	SBD	7.96440000	2026-01-24	2026-01-25 15:00:00.514358
USD	SCR	13.81150000	2026-01-24	2026-01-25 15:00:00.514358
USD	SDG	579.51080000	2026-01-24	2026-01-25 15:00:00.514358
USD	SEK	8.99750000	2026-01-24	2026-01-25 15:00:00.514358
USD	SGD	1.27690000	2026-01-24	2026-01-25 15:00:00.514358
USD	SHP	0.73740000	2026-01-24	2026-01-25 15:00:00.514358
USD	SLE	23.39680000	2026-01-24	2026-01-25 15:00:00.514358
USD	SLL	23396.75490000	2026-01-24	2026-01-25 15:00:00.514358
USD	SOS	564.87230000	2026-01-24	2026-01-25 15:00:00.514358
USD	SRD	38.00520000	2026-01-24	2026-01-25 15:00:00.514358
USD	SSP	4550.34140000	2026-01-24	2026-01-25 15:00:00.514358
USD	STN	20.81000000	2026-01-24	2026-01-25 15:00:00.514358
USD	SYP	114.13510000	2026-01-24	2026-01-25 15:00:00.514358
USD	SZL	16.14850000	2026-01-24	2026-01-25 15:00:00.514358
USD	THB	31.16790000	2026-01-24	2026-01-25 15:00:00.514358
USD	TJS	9.25910000	2026-01-24	2026-01-25 15:00:00.514358
USD	TMT	3.47570000	2026-01-24	2026-01-25 15:00:00.514358
USD	TND	2.86060000	2026-01-24	2026-01-25 15:00:00.514358
USD	TOP	2.35730000	2026-01-24	2026-01-25 15:00:00.514358
USD	TRY	43.37800000	2026-01-24	2026-01-25 15:00:00.514358
USD	TTD	6.72230000	2026-01-24	2026-01-25 15:00:00.514358
USD	TVD	1.45660000	2026-01-24	2026-01-25 15:00:00.514358
USD	TWD	31.48440000	2026-01-24	2026-01-25 15:00:00.514358
USD	TZS	2506.67630000	2026-01-24	2026-01-25 15:00:00.514358
USD	UAH	43.15600000	2026-01-24	2026-01-25 15:00:00.514358
USD	UGX	3442.84110000	2026-01-24	2026-01-25 15:00:00.514358
USD	UYU	37.99900000	2026-01-24	2026-01-25 15:00:00.514358
USD	UZS	12006.51950000	2026-01-24	2026-01-25 15:00:00.514358
USD	VES	355.55280000	2026-01-24	2026-01-25 15:00:00.514358
USD	VND	26060.86890000	2026-01-24	2026-01-25 15:00:00.514358
USD	VUV	118.22020000	2026-01-24	2026-01-25 15:00:00.514358
USD	WST	2.71890000	2026-01-24	2026-01-25 15:00:00.514358
USD	XAF	557.16290000	2026-01-24	2026-01-25 15:00:00.514358
USD	XCD	2.70000000	2026-01-24	2026-01-25 15:00:00.514358
USD	XCG	1.79000000	2026-01-24	2026-01-25 15:00:00.514358
USD	XDR	0.72610000	2026-01-24	2026-01-25 15:00:00.514358
USD	XOF	557.16290000	2026-01-24	2026-01-25 15:00:00.514358
USD	XPF	101.35930000	2026-01-24	2026-01-25 15:00:00.514358
USD	YER	236.19890000	2026-01-24	2026-01-25 15:00:00.514358
USD	ZAR	16.14850000	2026-01-24	2026-01-25 15:00:00.514358
USD	ZMW	20.05740000	2026-01-24	2026-01-25 15:00:00.514358
USD	ZWG	25.60130000	2026-01-24	2026-01-25 15:00:00.514358
USD	ZWL	25.60130000	2026-01-24	2026-01-25 15:00:00.514358
USD	USD	1.00000000	2026-01-25	2026-01-26 15:00:00.942269
USD	AED	3.67250000	2026-01-25	2026-01-26 15:00:00.942269
USD	AFN	65.50620000	2026-01-25	2026-01-26 15:00:00.942269
USD	ALL	81.84780000	2026-01-25	2026-01-26 15:00:00.942269
USD	AMD	377.22520000	2026-01-25	2026-01-26 15:00:00.942269
USD	ANG	1.79000000	2026-01-25	2026-01-26 15:00:00.942269
USD	AOA	916.13760000	2026-01-25	2026-01-26 15:00:00.942269
USD	ARS	1452.25000000	2026-01-25	2026-01-26 15:00:00.942269
USD	AUD	1.44910000	2026-01-25	2026-01-26 15:00:00.942269
USD	AWG	1.79000000	2026-01-25	2026-01-26 15:00:00.942269
USD	AZN	1.69620000	2026-01-25	2026-01-26 15:00:00.942269
USD	BAM	1.65300000	2026-01-25	2026-01-26 15:00:00.942269
USD	BBD	2.00000000	2026-01-25	2026-01-26 15:00:00.942269
USD	BDT	122.11950000	2026-01-25	2026-01-26 15:00:00.942269
USD	BGN	1.64650000	2026-01-25	2026-01-26 15:00:00.942269
USD	BHD	0.37600000	2026-01-25	2026-01-26 15:00:00.942269
USD	BIF	2951.88440000	2026-01-25	2026-01-26 15:00:00.942269
USD	BMD	1.00000000	2026-01-25	2026-01-26 15:00:00.942269
USD	BND	1.27450000	2026-01-25	2026-01-26 15:00:00.942269
USD	BOB	6.90750000	2026-01-25	2026-01-26 15:00:00.942269
USD	BRL	5.28730000	2026-01-25	2026-01-26 15:00:00.942269
USD	BSD	1.00000000	2026-01-25	2026-01-26 15:00:00.942269
USD	BTN	91.82100000	2026-01-25	2026-01-26 15:00:00.942269
USD	BWP	13.34470000	2026-01-25	2026-01-26 15:00:00.942269
USD	BYN	2.83270000	2026-01-25	2026-01-26 15:00:00.942269
USD	BZD	2.00000000	2026-01-25	2026-01-26 15:00:00.942269
USD	CAD	1.37070000	2026-01-25	2026-01-26 15:00:00.942269
USD	CDF	2217.86980000	2026-01-25	2026-01-26 15:00:00.942269
USD	CHF	0.78020000	2026-01-25	2026-01-26 15:00:00.942269
USD	CLF	0.02199000	2026-01-25	2026-01-26 15:00:00.942269
USD	CLP	869.17510000	2026-01-25	2026-01-26 15:00:00.942269
USD	CNH	6.95310000	2026-01-25	2026-01-26 15:00:00.942269
USD	CNY	6.97140000	2026-01-25	2026-01-26 15:00:00.942269
USD	COP	3615.07400000	2026-01-25	2026-01-26 15:00:00.942269
USD	CRC	492.13760000	2026-01-25	2026-01-26 15:00:00.942269
USD	CUP	24.00000000	2026-01-25	2026-01-26 15:00:00.942269
USD	CVE	93.19090000	2026-01-25	2026-01-26 15:00:00.942269
USD	CZK	20.51620000	2026-01-25	2026-01-26 15:00:00.942269
USD	DJF	177.72100000	2026-01-25	2026-01-26 15:00:00.942269
USD	DKK	6.30730000	2026-01-25	2026-01-26 15:00:00.942269
USD	DOP	62.77130000	2026-01-25	2026-01-26 15:00:00.942269
USD	DZD	129.40170000	2026-01-25	2026-01-26 15:00:00.942269
USD	EGP	47.10370000	2026-01-25	2026-01-26 15:00:00.942269
USD	ERN	15.00000000	2026-01-25	2026-01-26 15:00:00.942269
USD	ETB	154.07560000	2026-01-25	2026-01-26 15:00:00.942269
USD	EUR	0.84530000	2026-01-25	2026-01-26 15:00:00.942269
USD	FJD	2.25100000	2026-01-25	2026-01-26 15:00:00.942269
USD	FKP	0.73380000	2026-01-25	2026-01-26 15:00:00.942269
USD	FOK	6.30710000	2026-01-25	2026-01-26 15:00:00.942269
USD	GBP	0.73390000	2026-01-25	2026-01-26 15:00:00.942269
USD	GEL	2.68420000	2026-01-25	2026-01-26 15:00:00.942269
USD	GGP	0.73380000	2026-01-25	2026-01-26 15:00:00.942269
USD	GHS	10.84620000	2026-01-25	2026-01-26 15:00:00.942269
USD	GIP	0.73380000	2026-01-25	2026-01-26 15:00:00.942269
USD	GMD	73.76600000	2026-01-25	2026-01-26 15:00:00.942269
USD	GNF	8705.23800000	2026-01-25	2026-01-26 15:00:00.942269
USD	GTQ	7.65600000	2026-01-25	2026-01-26 15:00:00.942269
USD	GYD	208.30190000	2026-01-25	2026-01-26 15:00:00.942269
USD	HKD	7.79630000	2026-01-25	2026-01-26 15:00:00.942269
USD	HNL	26.30270000	2026-01-25	2026-01-26 15:00:00.942269
USD	HRK	6.36780000	2026-01-25	2026-01-26 15:00:00.942269
USD	HTG	130.54310000	2026-01-25	2026-01-26 15:00:00.942269
USD	HUF	323.12760000	2026-01-25	2026-01-26 15:00:00.942269
USD	IDR	16806.51040000	2026-01-25	2026-01-26 15:00:00.942269
USD	ILS	3.13910000	2026-01-25	2026-01-26 15:00:00.942269
USD	IMP	0.73380000	2026-01-25	2026-01-26 15:00:00.942269
USD	INR	91.81610000	2026-01-25	2026-01-26 15:00:00.942269
USD	IQD	1304.39760000	2026-01-25	2026-01-26 15:00:00.942269
USD	IRR	699293.99570000	2026-01-25	2026-01-26 15:00:00.942269
USD	ISK	124.37180000	2026-01-25	2026-01-26 15:00:00.942269
USD	JEP	0.73380000	2026-01-25	2026-01-26 15:00:00.942269
USD	JMD	156.80080000	2026-01-25	2026-01-26 15:00:00.942269
USD	JOD	0.70900000	2026-01-25	2026-01-26 15:00:00.942269
USD	JPY	155.59540000	2026-01-25	2026-01-26 15:00:00.942269
USD	KES	128.97190000	2026-01-25	2026-01-26 15:00:00.942269
USD	KGS	87.11890000	2026-01-25	2026-01-26 15:00:00.942269
USD	KHR	4001.90780000	2026-01-25	2026-01-26 15:00:00.942269
USD	KID	1.44920000	2026-01-25	2026-01-26 15:00:00.942269
USD	KMF	415.78830000	2026-01-25	2026-01-26 15:00:00.942269
USD	KRW	1452.48000000	2026-01-25	2026-01-26 15:00:00.942269
USD	KWD	0.30580000	2026-01-25	2026-01-26 15:00:00.942269
USD	KYD	0.83330000	2026-01-25	2026-01-26 15:00:00.942269
USD	KZT	502.90770000	2026-01-25	2026-01-26 15:00:00.942269
USD	LAK	21597.84470000	2026-01-25	2026-01-26 15:00:00.942269
USD	LBP	89500.00000000	2026-01-25	2026-01-26 15:00:00.942269
USD	LKR	309.48670000	2026-01-25	2026-01-26 15:00:00.942269
USD	LRD	184.49550000	2026-01-25	2026-01-26 15:00:00.942269
USD	LSL	16.08970000	2026-01-25	2026-01-26 15:00:00.942269
USD	LYD	6.33580000	2026-01-25	2026-01-26 15:00:00.942269
USD	MAD	9.14600000	2026-01-25	2026-01-26 15:00:00.942269
USD	MDL	16.94540000	2026-01-25	2026-01-26 15:00:00.942269
USD	MGA	4515.23990000	2026-01-25	2026-01-26 15:00:00.942269
USD	MKD	52.21170000	2026-01-25	2026-01-26 15:00:00.942269
USD	MMK	2096.56360000	2026-01-25	2026-01-26 15:00:00.942269
USD	MNT	3546.91800000	2026-01-25	2026-01-26 15:00:00.942269
USD	MOP	8.03050000	2026-01-25	2026-01-26 15:00:00.942269
USD	MRU	39.77880000	2026-01-25	2026-01-26 15:00:00.942269
USD	MUR	45.97950000	2026-01-25	2026-01-26 15:00:00.942269
USD	MVR	15.42090000	2026-01-25	2026-01-26 15:00:00.942269
USD	MWK	1728.95300000	2026-01-25	2026-01-26 15:00:00.942269
USD	MXN	17.39470000	2026-01-25	2026-01-26 15:00:00.942269
USD	MYR	4.00530000	2026-01-25	2026-01-26 15:00:00.942269
USD	MZN	63.44840000	2026-01-25	2026-01-26 15:00:00.942269
USD	NAD	16.08970000	2026-01-25	2026-01-26 15:00:00.942269
USD	NGN	1419.17600000	2026-01-25	2026-01-26 15:00:00.942269
USD	NIO	36.68920000	2026-01-25	2026-01-26 15:00:00.942269
USD	NOK	9.76560000	2026-01-25	2026-01-26 15:00:00.942269
USD	NPR	146.91370000	2026-01-25	2026-01-26 15:00:00.942269
USD	NZD	1.68050000	2026-01-25	2026-01-26 15:00:00.942269
USD	OMR	0.38450000	2026-01-25	2026-01-26 15:00:00.942269
USD	PAB	1.00000000	2026-01-25	2026-01-26 15:00:00.942269
USD	PEN	3.34830000	2026-01-25	2026-01-26 15:00:00.942269
USD	PGK	4.25580000	2026-01-25	2026-01-26 15:00:00.942269
USD	PHP	59.04480000	2026-01-25	2026-01-26 15:00:00.942269
USD	PKR	279.51290000	2026-01-25	2026-01-26 15:00:00.942269
USD	PLN	3.56410000	2026-01-25	2026-01-26 15:00:00.942269
USD	PYG	6708.12550000	2026-01-25	2026-01-26 15:00:00.942269
USD	QAR	3.64000000	2026-01-25	2026-01-26 15:00:00.942269
USD	RON	4.33840000	2026-01-25	2026-01-26 15:00:00.942269
USD	RSD	99.64910000	2026-01-25	2026-01-26 15:00:00.942269
USD	RUB	75.58410000	2026-01-25	2026-01-26 15:00:00.942269
USD	RWF	1451.64190000	2026-01-25	2026-01-26 15:00:00.942269
USD	SAR	3.75000000	2026-01-25	2026-01-26 15:00:00.942269
USD	SBD	7.99320000	2026-01-25	2026-01-26 15:00:00.942269
USD	SCR	14.22890000	2026-01-25	2026-01-26 15:00:00.942269
USD	SDG	505.94040000	2026-01-25	2026-01-26 15:00:00.942269
USD	SEK	8.92850000	2026-01-25	2026-01-26 15:00:00.942269
USD	SGD	1.27390000	2026-01-25	2026-01-26 15:00:00.942269
USD	SHP	0.73380000	2026-01-25	2026-01-26 15:00:00.942269
USD	SLE	23.39680000	2026-01-25	2026-01-26 15:00:00.942269
USD	SLL	23396.75490000	2026-01-25	2026-01-26 15:00:00.942269
USD	SOS	568.04240000	2026-01-25	2026-01-26 15:00:00.942269
USD	SRD	38.05210000	2026-01-25	2026-01-26 15:00:00.942269
USD	SSP	4549.76400000	2026-01-25	2026-01-26 15:00:00.942269
USD	STN	20.70630000	2026-01-25	2026-01-26 15:00:00.942269
USD	SYP	112.68420000	2026-01-25	2026-01-26 15:00:00.942269
USD	SZL	16.08970000	2026-01-25	2026-01-26 15:00:00.942269
USD	THB	31.10080000	2026-01-25	2026-01-26 15:00:00.942269
USD	TJS	9.25880000	2026-01-25	2026-01-26 15:00:00.942269
USD	TMT	3.47570000	2026-01-25	2026-01-26 15:00:00.942269
USD	TND	2.87180000	2026-01-25	2026-01-26 15:00:00.942269
USD	TOP	2.37830000	2026-01-25	2026-01-26 15:00:00.942269
USD	TRY	43.35420000	2026-01-25	2026-01-26 15:00:00.942269
USD	TTD	6.75990000	2026-01-25	2026-01-26 15:00:00.942269
USD	TVD	1.44920000	2026-01-25	2026-01-26 15:00:00.942269
USD	TWD	31.39810000	2026-01-25	2026-01-26 15:00:00.942269
USD	TZS	2531.13060000	2026-01-25	2026-01-26 15:00:00.942269
USD	UAH	43.14160000	2026-01-25	2026-01-26 15:00:00.942269
USD	UGX	3490.75260000	2026-01-25	2026-01-26 15:00:00.942269
USD	UYU	37.77420000	2026-01-25	2026-01-26 15:00:00.942269
USD	UZS	12098.38000000	2026-01-25	2026-01-26 15:00:00.942269
USD	VES	355.55280000	2026-01-25	2026-01-26 15:00:00.942269
USD	VND	26146.66200000	2026-01-25	2026-01-26 15:00:00.942269
USD	VUV	119.47220000	2026-01-25	2026-01-26 15:00:00.942269
USD	WST	2.72830000	2026-01-25	2026-01-26 15:00:00.942269
USD	XAF	554.38440000	2026-01-25	2026-01-26 15:00:00.942269
USD	XCD	2.70000000	2026-01-25	2026-01-26 15:00:00.942269
USD	XCG	1.79000000	2026-01-25	2026-01-26 15:00:00.942269
USD	XDR	0.72610000	2026-01-25	2026-01-26 15:00:00.942269
USD	XOF	554.38440000	2026-01-25	2026-01-26 15:00:00.942269
USD	XPF	100.85390000	2026-01-25	2026-01-26 15:00:00.942269
USD	YER	237.77200000	2026-01-25	2026-01-26 15:00:00.942269
USD	ZAR	16.09410000	2026-01-25	2026-01-26 15:00:00.942269
USD	ZMW	19.73820000	2026-01-25	2026-01-26 15:00:00.942269
USD	ZWG	25.60130000	2026-01-25	2026-01-26 15:00:00.942269
USD	ZWL	25.60130000	2026-01-25	2026-01-26 15:00:00.942269
USD	USD	1.00000000	2026-01-26	2026-01-27 15:00:00.822557
USD	AED	3.67250000	2026-01-26	2026-01-27 15:00:00.822557
USD	AFN	65.56110000	2026-01-26	2026-01-27 15:00:00.822557
USD	ALL	81.58470000	2026-01-26	2026-01-27 15:00:00.822557
USD	AMD	378.43100000	2026-01-26	2026-01-27 15:00:00.822557
USD	ANG	1.79000000	2026-01-26	2026-01-27 15:00:00.822557
USD	AOA	919.54190000	2026-01-26	2026-01-27 15:00:00.822557
USD	ARS	1452.25000000	2026-01-26	2026-01-27 15:00:00.822557
USD	AUD	1.44590000	2026-01-26	2026-01-27 15:00:00.822557
USD	AWG	1.79000000	2026-01-26	2026-01-27 15:00:00.822557
USD	AZN	1.70060000	2026-01-26	2026-01-27 15:00:00.822557
USD	BAM	1.64810000	2026-01-26	2026-01-27 15:00:00.822557
USD	BBD	2.00000000	2026-01-26	2026-01-27 15:00:00.822557
USD	BDT	122.09100000	2026-01-26	2026-01-27 15:00:00.822557
USD	BGN	1.59760000	2026-01-26	2026-01-27 15:00:00.822557
USD	BHD	0.37600000	2026-01-26	2026-01-27 15:00:00.822557
USD	BIF	2963.19930000	2026-01-26	2026-01-27 15:00:00.822557
USD	BMD	1.00000000	2026-01-26	2026-01-27 15:00:00.822557
USD	BND	1.27000000	2026-01-26	2026-01-27 15:00:00.822557
USD	BOB	6.87750000	2026-01-26	2026-01-27 15:00:00.822557
USD	BRL	5.28490000	2026-01-26	2026-01-27 15:00:00.822557
USD	BSD	1.00000000	2026-01-26	2026-01-27 15:00:00.822557
USD	BTN	91.80030000	2026-01-26	2026-01-27 15:00:00.822557
USD	BWP	13.52030000	2026-01-26	2026-01-27 15:00:00.822557
USD	BYN	2.84850000	2026-01-26	2026-01-27 15:00:00.822557
USD	BZD	2.00000000	2026-01-26	2026-01-27 15:00:00.822557
USD	CAD	1.37040000	2026-01-26	2026-01-27 15:00:00.822557
USD	CDF	2229.78490000	2026-01-26	2026-01-27 15:00:00.822557
USD	CHF	0.77710000	2026-01-26	2026-01-27 15:00:00.822557
USD	CLF	0.02191000	2026-01-26	2026-01-27 15:00:00.822557
USD	CLP	866.06150000	2026-01-26	2026-01-27 15:00:00.822557
USD	CNH	6.95150000	2026-01-26	2026-01-27 15:00:00.822557
USD	CNY	6.96520000	2026-01-26	2026-01-27 15:00:00.822557
USD	COP	3620.50280000	2026-01-26	2026-01-27 15:00:00.822557
USD	CRC	494.31470000	2026-01-26	2026-01-27 15:00:00.822557
USD	CUP	24.00000000	2026-01-26	2026-01-27 15:00:00.822557
USD	CVE	92.91730000	2026-01-26	2026-01-27 15:00:00.822557
USD	CZK	20.43050000	2026-01-26	2026-01-27 15:00:00.822557
USD	DJF	177.72100000	2026-01-26	2026-01-27 15:00:00.822557
USD	DKK	6.29270000	2026-01-26	2026-01-27 15:00:00.822557
USD	DOP	62.62230000	2026-01-26	2026-01-27 15:00:00.822557
USD	DZD	129.53990000	2026-01-26	2026-01-27 15:00:00.822557
USD	EGP	47.06090000	2026-01-26	2026-01-27 15:00:00.822557
USD	ERN	15.00000000	2026-01-26	2026-01-27 15:00:00.822557
USD	ETB	154.61750000	2026-01-26	2026-01-27 15:00:00.822557
USD	EUR	0.84270000	2026-01-26	2026-01-27 15:00:00.822557
USD	FJD	2.20800000	2026-01-26	2026-01-27 15:00:00.822557
USD	FKP	0.73160000	2026-01-26	2026-01-27 15:00:00.822557
USD	FOK	6.29270000	2026-01-26	2026-01-27 15:00:00.822557
USD	GBP	0.73160000	2026-01-26	2026-01-27 15:00:00.822557
USD	GEL	2.69230000	2026-01-26	2026-01-27 15:00:00.822557
USD	GGP	0.73160000	2026-01-26	2026-01-27 15:00:00.822557
USD	GHS	10.89780000	2026-01-26	2026-01-27 15:00:00.822557
USD	GIP	0.73160000	2026-01-26	2026-01-27 15:00:00.822557
USD	GMD	74.00850000	2026-01-26	2026-01-27 15:00:00.822557
USD	GNF	8733.70940000	2026-01-26	2026-01-27 15:00:00.822557
USD	GTQ	7.67110000	2026-01-26	2026-01-27 15:00:00.822557
USD	GYD	208.73980000	2026-01-26	2026-01-27 15:00:00.822557
USD	HKD	7.79810000	2026-01-26	2026-01-27 15:00:00.822557
USD	HNL	26.35590000	2026-01-26	2026-01-27 15:00:00.822557
USD	HRK	6.34910000	2026-01-26	2026-01-27 15:00:00.822557
USD	HTG	130.80280000	2026-01-26	2026-01-27 15:00:00.822557
USD	HUF	321.46030000	2026-01-26	2026-01-27 15:00:00.822557
USD	IDR	16752.21450000	2026-01-26	2026-01-27 15:00:00.822557
USD	ILS	3.12720000	2026-01-26	2026-01-27 15:00:00.822557
USD	IMP	0.73160000	2026-01-26	2026-01-27 15:00:00.822557
USD	INR	91.79480000	2026-01-26	2026-01-27 15:00:00.822557
USD	IQD	1306.40770000	2026-01-26	2026-01-27 15:00:00.822557
USD	IRR	1074729.43610000	2026-01-26	2026-01-27 15:00:00.822557
USD	ISK	122.78450000	2026-01-26	2026-01-27 15:00:00.822557
USD	JEP	0.73160000	2026-01-26	2026-01-27 15:00:00.822557
USD	JMD	156.60130000	2026-01-26	2026-01-27 15:00:00.822557
USD	JOD	0.70900000	2026-01-26	2026-01-27 15:00:00.822557
USD	JPY	154.15370000	2026-01-26	2026-01-27 15:00:00.822557
USD	KES	128.85930000	2026-01-26	2026-01-27 15:00:00.822557
USD	KGS	87.36010000	2026-01-26	2026-01-27 15:00:00.822557
USD	KHR	4006.70110000	2026-01-26	2026-01-27 15:00:00.822557
USD	KID	1.44600000	2026-01-26	2026-01-27 15:00:00.822557
USD	KMF	414.56770000	2026-01-26	2026-01-27 15:00:00.822557
USD	KRW	1444.55220000	2026-01-26	2026-01-27 15:00:00.822557
USD	KWD	0.30660000	2026-01-26	2026-01-27 15:00:00.822557
USD	KYD	0.83330000	2026-01-26	2026-01-27 15:00:00.822557
USD	KZT	503.00580000	2026-01-26	2026-01-27 15:00:00.822557
USD	LAK	21540.12440000	2026-01-26	2026-01-27 15:00:00.822557
USD	LBP	89500.00000000	2026-01-26	2026-01-27 15:00:00.822557
USD	LKR	309.32700000	2026-01-26	2026-01-27 15:00:00.822557
USD	LRD	183.89720000	2026-01-26	2026-01-27 15:00:00.822557
USD	LSL	16.02730000	2026-01-26	2026-01-27 15:00:00.822557
USD	LYD	6.34850000	2026-01-26	2026-01-27 15:00:00.822557
USD	MAD	9.09450000	2026-01-26	2026-01-27 15:00:00.822557
USD	MDL	16.90440000	2026-01-26	2026-01-27 15:00:00.822557
USD	MGA	4501.82800000	2026-01-26	2026-01-27 15:00:00.822557
USD	MKD	52.21350000	2026-01-26	2026-01-27 15:00:00.822557
USD	MMK	2102.05850000	2026-01-26	2026-01-27 15:00:00.822557
USD	MNT	3538.78740000	2026-01-26	2026-01-27 15:00:00.822557
USD	MOP	8.03210000	2026-01-26	2026-01-27 15:00:00.822557
USD	MRU	39.86900000	2026-01-26	2026-01-27 15:00:00.822557
USD	MUR	45.59720000	2026-01-26	2026-01-27 15:00:00.822557
USD	MVR	15.44770000	2026-01-26	2026-01-27 15:00:00.822557
USD	MWK	1740.38940000	2026-01-26	2026-01-27 15:00:00.822557
USD	MXN	17.35850000	2026-01-26	2026-01-27 15:00:00.822557
USD	MYR	3.96590000	2026-01-26	2026-01-27 15:00:00.822557
USD	MZN	63.54630000	2026-01-26	2026-01-27 15:00:00.822557
USD	NAD	16.02730000	2026-01-26	2026-01-27 15:00:00.822557
USD	NGN	1416.76180000	2026-01-26	2026-01-27 15:00:00.822557
USD	NIO	36.77630000	2026-01-26	2026-01-27 15:00:00.822557
USD	NOK	9.77860000	2026-01-26	2026-01-27 15:00:00.822557
USD	NPR	146.88040000	2026-01-26	2026-01-27 15:00:00.822557
USD	NZD	1.67470000	2026-01-26	2026-01-27 15:00:00.822557
USD	OMR	0.38450000	2026-01-26	2026-01-27 15:00:00.822557
USD	PAB	1.00000000	2026-01-26	2026-01-27 15:00:00.822557
USD	PEN	3.34580000	2026-01-26	2026-01-27 15:00:00.822557
USD	PGK	4.27010000	2026-01-26	2026-01-27 15:00:00.822557
USD	PHP	59.10310000	2026-01-26	2026-01-27 15:00:00.822557
USD	PKR	279.99200000	2026-01-26	2026-01-27 15:00:00.822557
USD	PLN	3.54500000	2026-01-26	2026-01-27 15:00:00.822557
USD	PYG	6683.62230000	2026-01-26	2026-01-27 15:00:00.822557
USD	QAR	3.64000000	2026-01-26	2026-01-27 15:00:00.822557
USD	RON	4.29920000	2026-01-26	2026-01-27 15:00:00.822557
USD	RSD	99.18080000	2026-01-26	2026-01-27 15:00:00.822557
USD	RUB	76.50500000	2026-01-26	2026-01-27 15:00:00.822557
USD	RWF	1457.76370000	2026-01-26	2026-01-27 15:00:00.822557
USD	SAR	3.75000000	2026-01-26	2026-01-27 15:00:00.822557
USD	SBD	7.99320000	2026-01-26	2026-01-27 15:00:00.822557
USD	SCR	14.54600000	2026-01-26	2026-01-27 15:00:00.822557
USD	SDG	478.35700000	2026-01-26	2026-01-27 15:00:00.822557
USD	SEK	8.94570000	2026-01-26	2026-01-27 15:00:00.822557
USD	SGD	1.27010000	2026-01-26	2026-01-27 15:00:00.822557
USD	SHP	0.73160000	2026-01-26	2026-01-27 15:00:00.822557
USD	SLE	23.39680000	2026-01-26	2026-01-27 15:00:00.822557
USD	SLL	23396.75490000	2026-01-26	2026-01-27 15:00:00.822557
USD	SOS	568.93720000	2026-01-26	2026-01-27 15:00:00.822557
USD	SRD	38.07710000	2026-01-26	2026-01-27 15:00:00.822557
USD	SSP	4685.48140000	2026-01-26	2026-01-27 15:00:00.822557
USD	STN	20.64550000	2026-01-26	2026-01-27 15:00:00.822557
USD	SYP	112.66560000	2026-01-26	2026-01-27 15:00:00.822557
USD	SZL	16.02730000	2026-01-26	2026-01-27 15:00:00.822557
USD	THB	31.12250000	2026-01-26	2026-01-27 15:00:00.822557
USD	TJS	9.29970000	2026-01-26	2026-01-27 15:00:00.822557
USD	TMT	3.49550000	2026-01-26	2026-01-27 15:00:00.822557
USD	TND	2.85540000	2026-01-26	2026-01-27 15:00:00.822557
USD	TOP	2.38280000	2026-01-26	2026-01-27 15:00:00.822557
USD	TRY	43.39320000	2026-01-26	2026-01-27 15:00:00.822557
USD	TTD	6.77960000	2026-01-26	2026-01-27 15:00:00.822557
USD	TVD	1.44600000	2026-01-26	2026-01-27 15:00:00.822557
USD	TWD	31.45490000	2026-01-26	2026-01-27 15:00:00.822557
USD	TZS	2549.16500000	2026-01-26	2026-01-27 15:00:00.822557
USD	UAH	43.17740000	2026-01-26	2026-01-27 15:00:00.822557
USD	UGX	3533.52170000	2026-01-26	2026-01-27 15:00:00.822557
USD	UYU	37.59410000	2026-01-26	2026-01-27 15:00:00.822557
USD	UZS	12111.98400000	2026-01-26	2026-01-27 15:00:00.822557
USD	VES	358.92470000	2026-01-26	2026-01-27 15:00:00.822557
USD	VND	26101.79500000	2026-01-26	2026-01-27 15:00:00.822557
USD	VUV	119.65090000	2026-01-26	2026-01-27 15:00:00.822557
USD	WST	2.71000000	2026-01-26	2026-01-27 15:00:00.822557
USD	XAF	552.75700000	2026-01-26	2026-01-27 15:00:00.822557
USD	XCD	2.70000000	2026-01-26	2026-01-27 15:00:00.822557
USD	XCG	1.79000000	2026-01-26	2026-01-27 15:00:00.822557
USD	XDR	0.72210000	2026-01-26	2026-01-27 15:00:00.822557
USD	XOF	552.75700000	2026-01-26	2026-01-27 15:00:00.822557
USD	XPF	100.55780000	2026-01-26	2026-01-27 15:00:00.822557
USD	YER	238.43870000	2026-01-26	2026-01-27 15:00:00.822557
USD	ZAR	16.02110000	2026-01-26	2026-01-27 15:00:00.822557
USD	ZMW	19.68650000	2026-01-26	2026-01-27 15:00:00.822557
USD	ZWG	25.60470000	2026-01-26	2026-01-27 15:00:00.822557
USD	ZWL	25.60470000	2026-01-26	2026-01-27 15:00:00.822557
USD	USD	1.00000000	2026-01-27	2026-01-28 15:00:00.758016
USD	AED	3.67250000	2026-01-27	2026-01-28 15:00:00.758016
USD	AFN	65.31960000	2026-01-27	2026-01-28 15:00:00.758016
USD	ALL	81.07490000	2026-01-27	2026-01-28 15:00:00.758016
USD	AMD	378.60730000	2026-01-27	2026-01-28 15:00:00.758016
USD	ANG	1.79000000	2026-01-27	2026-01-28 15:00:00.758016
USD	AOA	919.35520000	2026-01-27	2026-01-28 15:00:00.758016
USD	ARS	1452.25000000	2026-01-27	2026-01-28 15:00:00.758016
USD	AUD	1.43530000	2026-01-27	2026-01-28 15:00:00.758016
USD	AWG	1.79000000	2026-01-27	2026-01-28 15:00:00.758016
USD	AZN	1.69720000	2026-01-27	2026-01-28 15:00:00.758016
USD	BAM	1.63440000	2026-01-27	2026-01-28 15:00:00.758016
USD	BBD	2.00000000	2026-01-27	2026-01-28 15:00:00.758016
USD	BDT	122.11280000	2026-01-27	2026-01-28 15:00:00.758016
USD	BGN	1.58640000	2026-01-27	2026-01-28 15:00:00.758016
USD	BHD	0.37600000	2026-01-27	2026-01-28 15:00:00.758016
USD	BIF	2966.05000000	2026-01-27	2026-01-28 15:00:00.758016
USD	BMD	1.00000000	2026-01-27	2026-01-28 15:00:00.758016
USD	BND	1.26420000	2026-01-27	2026-01-28 15:00:00.758016
USD	BOB	6.87610000	2026-01-27	2026-01-28 15:00:00.758016
USD	BRL	5.25110000	2026-01-27	2026-01-28 15:00:00.758016
USD	BSD	1.00000000	2026-01-27	2026-01-28 15:00:00.758016
USD	BTN	91.65280000	2026-01-27	2026-01-28 15:00:00.758016
USD	BWP	13.47520000	2026-01-27	2026-01-28 15:00:00.758016
USD	BYN	2.84280000	2026-01-27	2026-01-28 15:00:00.758016
USD	BZD	2.00000000	2026-01-27	2026-01-28 15:00:00.758016
USD	CAD	1.36180000	2026-01-27	2026-01-28 15:00:00.758016
USD	CDF	2248.23700000	2026-01-27	2026-01-28 15:00:00.758016
USD	CHF	0.76710000	2026-01-27	2026-01-28 15:00:00.758016
USD	CLF	0.02185000	2026-01-27	2026-01-28 15:00:00.758016
USD	CLP	863.48770000	2026-01-27	2026-01-28 15:00:00.758016
USD	CNH	6.94460000	2026-01-27	2026-01-28 15:00:00.758016
USD	CNY	6.96630000	2026-01-27	2026-01-28 15:00:00.758016
USD	COP	3672.84830000	2026-01-27	2026-01-28 15:00:00.758016
USD	CRC	494.82950000	2026-01-27	2026-01-28 15:00:00.758016
USD	CUP	24.00000000	2026-01-27	2026-01-28 15:00:00.758016
USD	CVE	92.14580000	2026-01-27	2026-01-28 15:00:00.758016
USD	CZK	20.26840000	2026-01-27	2026-01-28 15:00:00.758016
USD	DJF	177.72100000	2026-01-27	2026-01-28 15:00:00.758016
USD	DKK	6.24130000	2026-01-27	2026-01-28 15:00:00.758016
USD	DOP	62.48820000	2026-01-27	2026-01-28 15:00:00.758016
USD	DZD	128.94500000	2026-01-27	2026-01-28 15:00:00.758016
USD	EGP	47.03140000	2026-01-27	2026-01-28 15:00:00.758016
USD	ERN	15.00000000	2026-01-27	2026-01-28 15:00:00.758016
USD	ETB	154.48870000	2026-01-27	2026-01-28 15:00:00.758016
USD	EUR	0.83580000	2026-01-27	2026-01-28 15:00:00.758016
USD	FJD	2.20040000	2026-01-27	2026-01-28 15:00:00.758016
USD	FKP	0.72580000	2026-01-27	2026-01-28 15:00:00.758016
USD	FOK	6.24130000	2026-01-27	2026-01-28 15:00:00.758016
USD	GBP	0.72600000	2026-01-27	2026-01-28 15:00:00.758016
USD	GEL	2.69210000	2026-01-27	2026-01-28 15:00:00.758016
USD	GGP	0.72580000	2026-01-27	2026-01-28 15:00:00.758016
USD	GHS	10.92960000	2026-01-27	2026-01-28 15:00:00.758016
USD	GIP	0.72580000	2026-01-27	2026-01-28 15:00:00.758016
USD	GMD	74.08070000	2026-01-27	2026-01-28 15:00:00.758016
USD	GNF	8744.36070000	2026-01-27	2026-01-28 15:00:00.758016
USD	GTQ	7.64190000	2026-01-27	2026-01-28 15:00:00.758016
USD	GYD	209.01480000	2026-01-27	2026-01-28 15:00:00.758016
USD	HKD	7.80050000	2026-01-27	2026-01-28 15:00:00.758016
USD	HNL	26.26020000	2026-01-27	2026-01-28 15:00:00.758016
USD	HRK	6.29640000	2026-01-27	2026-01-28 15:00:00.758016
USD	HTG	130.92710000	2026-01-27	2026-01-28 15:00:00.758016
USD	HUF	317.69730000	2026-01-27	2026-01-28 15:00:00.758016
USD	IDR	16749.61710000	2026-01-27	2026-01-28 15:00:00.758016
USD	ILS	3.10000000	2026-01-27	2026-01-28 15:00:00.758016
USD	IMP	0.72580000	2026-01-27	2026-01-28 15:00:00.758016
USD	INR	91.65640000	2026-01-27	2026-01-28 15:00:00.758016
USD	IQD	1308.00620000	2026-01-27	2026-01-28 15:00:00.758016
USD	IRR	1075776.07210000	2026-01-27	2026-01-28 15:00:00.758016
USD	ISK	121.97010000	2026-01-27	2026-01-28 15:00:00.758016
USD	JEP	0.72580000	2026-01-27	2026-01-28 15:00:00.758016
USD	JMD	156.49720000	2026-01-27	2026-01-28 15:00:00.758016
USD	JOD	0.70900000	2026-01-27	2026-01-28 15:00:00.758016
USD	JPY	152.86960000	2026-01-27	2026-01-28 15:00:00.758016
USD	KES	128.87880000	2026-01-27	2026-01-28 15:00:00.758016
USD	KGS	87.40100000	2026-01-27	2026-01-28 15:00:00.758016
USD	KHR	4010.73440000	2026-01-27	2026-01-28 15:00:00.758016
USD	KID	1.43520000	2026-01-27	2026-01-28 15:00:00.758016
USD	KMF	411.12560000	2026-01-27	2026-01-28 15:00:00.758016
USD	KRW	1440.40820000	2026-01-27	2026-01-28 15:00:00.758016
USD	KWD	0.30610000	2026-01-27	2026-01-28 15:00:00.758016
USD	KYD	0.83330000	2026-01-27	2026-01-28 15:00:00.758016
USD	KZT	502.84730000	2026-01-27	2026-01-28 15:00:00.758016
USD	LAK	21575.18500000	2026-01-27	2026-01-28 15:00:00.758016
USD	LBP	89500.00000000	2026-01-27	2026-01-28 15:00:00.758016
USD	LKR	309.17890000	2026-01-27	2026-01-28 15:00:00.758016
USD	LRD	183.82960000	2026-01-27	2026-01-28 15:00:00.758016
USD	LSL	15.94470000	2026-01-27	2026-01-28 15:00:00.758016
USD	LYD	6.31130000	2026-01-27	2026-01-28 15:00:00.758016
USD	MAD	9.05350000	2026-01-27	2026-01-28 15:00:00.758016
USD	MDL	16.79950000	2026-01-27	2026-01-28 15:00:00.758016
USD	MGA	4486.65040000	2026-01-27	2026-01-28 15:00:00.758016
USD	MKD	52.11360000	2026-01-27	2026-01-28 15:00:00.758016
USD	MMK	2096.09340000	2026-01-27	2026-01-28 15:00:00.758016
USD	MNT	3579.42040000	2026-01-27	2026-01-28 15:00:00.758016
USD	MOP	8.03420000	2026-01-27	2026-01-28 15:00:00.758016
USD	MRU	39.92620000	2026-01-27	2026-01-28 15:00:00.758016
USD	MUR	45.44940000	2026-01-27	2026-01-28 15:00:00.758016
USD	MVR	15.42020000	2026-01-27	2026-01-28 15:00:00.758016
USD	MWK	1742.16120000	2026-01-27	2026-01-28 15:00:00.758016
USD	MXN	17.22870000	2026-01-27	2026-01-28 15:00:00.758016
USD	MYR	3.95280000	2026-01-27	2026-01-28 15:00:00.758016
USD	MZN	63.54010000	2026-01-27	2026-01-28 15:00:00.758016
USD	NAD	15.94470000	2026-01-27	2026-01-28 15:00:00.758016
USD	NGN	1408.00060000	2026-01-27	2026-01-28 15:00:00.758016
USD	NIO	36.64730000	2026-01-27	2026-01-28 15:00:00.758016
USD	NOK	9.65030000	2026-01-27	2026-01-28 15:00:00.758016
USD	NPR	146.64450000	2026-01-27	2026-01-28 15:00:00.758016
USD	NZD	1.66310000	2026-01-27	2026-01-28 15:00:00.758016
USD	OMR	0.38450000	2026-01-27	2026-01-28 15:00:00.758016
USD	PAB	1.00000000	2026-01-27	2026-01-28 15:00:00.758016
USD	PEN	3.34590000	2026-01-27	2026-01-28 15:00:00.758016
USD	PGK	4.27540000	2026-01-27	2026-01-28 15:00:00.758016
USD	PHP	59.00100000	2026-01-27	2026-01-28 15:00:00.758016
USD	PKR	279.51510000	2026-01-27	2026-01-28 15:00:00.758016
USD	PLN	3.51050000	2026-01-27	2026-01-28 15:00:00.758016
USD	PYG	6681.57140000	2026-01-27	2026-01-28 15:00:00.758016
USD	QAR	3.64000000	2026-01-27	2026-01-28 15:00:00.758016
USD	RON	4.28000000	2026-01-27	2026-01-28 15:00:00.758016
USD	RSD	98.70430000	2026-01-27	2026-01-28 15:00:00.758016
USD	RUB	76.37370000	2026-01-27	2026-01-28 15:00:00.758016
USD	RWF	1458.89660000	2026-01-27	2026-01-28 15:00:00.758016
USD	SAR	3.75000000	2026-01-27	2026-01-28 15:00:00.758016
USD	SBD	7.95410000	2026-01-27	2026-01-28 15:00:00.758016
USD	SCR	14.09490000	2026-01-27	2026-01-28 15:00:00.758016
USD	SDG	460.74390000	2026-01-27	2026-01-28 15:00:00.758016
USD	SEK	8.83610000	2026-01-27	2026-01-28 15:00:00.758016
USD	SGD	1.26340000	2026-01-27	2026-01-28 15:00:00.758016
USD	SHP	0.72580000	2026-01-27	2026-01-28 15:00:00.758016
USD	SLE	23.39680000	2026-01-27	2026-01-28 15:00:00.758016
USD	SLL	23396.75490000	2026-01-27	2026-01-28 15:00:00.758016
USD	SOS	569.64570000	2026-01-27	2026-01-28 15:00:00.758016
USD	SRD	38.00110000	2026-01-27	2026-01-28 15:00:00.758016
USD	SSP	4707.09840000	2026-01-27	2026-01-28 15:00:00.758016
USD	STN	20.47410000	2026-01-27	2026-01-28 15:00:00.758016
USD	SYP	112.16860000	2026-01-27	2026-01-28 15:00:00.758016
USD	SZL	15.94470000	2026-01-27	2026-01-28 15:00:00.758016
USD	THB	31.01820000	2026-01-27	2026-01-28 15:00:00.758016
USD	TJS	9.30550000	2026-01-27	2026-01-28 15:00:00.758016
USD	TMT	3.49820000	2026-01-27	2026-01-28 15:00:00.758016
USD	TND	2.83210000	2026-01-27	2026-01-28 15:00:00.758016
USD	TOP	2.33500000	2026-01-27	2026-01-28 15:00:00.758016
USD	TRY	43.40410000	2026-01-27	2026-01-28 15:00:00.758016
USD	TTD	6.75680000	2026-01-27	2026-01-28 15:00:00.758016
USD	TVD	1.43520000	2026-01-27	2026-01-28 15:00:00.758016
USD	TWD	31.36290000	2026-01-27	2026-01-28 15:00:00.758016
USD	TZS	2511.87850000	2026-01-27	2026-01-28 15:00:00.758016
USD	UAH	42.97110000	2026-01-27	2026-01-28 15:00:00.758016
USD	UGX	3533.20450000	2026-01-27	2026-01-28 15:00:00.758016
USD	UYU	37.39780000	2026-01-27	2026-01-28 15:00:00.758016
USD	UZS	12126.19060000	2026-01-27	2026-01-28 15:00:00.758016
USD	VES	361.49060000	2026-01-27	2026-01-28 15:00:00.758016
USD	VND	26033.56900000	2026-01-27	2026-01-28 15:00:00.758016
USD	VUV	119.38790000	2026-01-27	2026-01-28 15:00:00.758016
USD	WST	2.69240000	2026-01-27	2026-01-28 15:00:00.758016
USD	XAF	548.16740000	2026-01-27	2026-01-28 15:00:00.758016
USD	XCD	2.70000000	2026-01-27	2026-01-28 15:00:00.758016
USD	XCG	1.79000000	2026-01-27	2026-01-28 15:00:00.758016
USD	XDR	0.71800000	2026-01-27	2026-01-28 15:00:00.758016
USD	XOF	548.16740000	2026-01-27	2026-01-28 15:00:00.758016
USD	XPF	99.72290000	2026-01-27	2026-01-28 15:00:00.758016
USD	YER	237.32050000	2026-01-27	2026-01-28 15:00:00.758016
USD	ZAR	15.94460000	2026-01-27	2026-01-28 15:00:00.758016
USD	ZMW	19.70830000	2026-01-27	2026-01-28 15:00:00.758016
USD	ZWG	25.61380000	2026-01-27	2026-01-28 15:00:00.758016
USD	ZWL	25.61380000	2026-01-27	2026-01-28 15:00:00.758016
USD	USD	1.00000000	2026-01-28	2026-01-29 15:00:00.874534
USD	AED	3.67250000	2026-01-28	2026-01-29 15:00:00.874534
USD	AFN	65.78680000	2026-01-28	2026-01-29 15:00:00.874534
USD	ALL	80.75790000	2026-01-28	2026-01-29 15:00:00.874534
USD	AMD	379.02280000	2026-01-28	2026-01-29 15:00:00.874534
USD	ANG	1.79000000	2026-01-28	2026-01-29 15:00:00.874534
USD	AOA	919.97000000	2026-01-28	2026-01-29 15:00:00.874534
USD	ARS	1452.25000000	2026-01-28	2026-01-29 15:00:00.874534
USD	AUD	1.42620000	2026-01-28	2026-01-29 15:00:00.874534
USD	AWG	1.79000000	2026-01-28	2026-01-29 15:00:00.874534
USD	AZN	1.70100000	2026-01-28	2026-01-29 15:00:00.874534
USD	BAM	1.63470000	2026-01-28	2026-01-29 15:00:00.874534
USD	BBD	2.00000000	2026-01-28	2026-01-29 15:00:00.874534
USD	BDT	122.17260000	2026-01-28	2026-01-29 15:00:00.874534
USD	BGN	1.58710000	2026-01-28	2026-01-29 15:00:00.874534
USD	BHD	0.37600000	2026-01-28	2026-01-29 15:00:00.874534
USD	BIF	2965.41070000	2026-01-28	2026-01-29 15:00:00.874534
USD	BMD	1.00000000	2026-01-28	2026-01-29 15:00:00.874534
USD	BND	1.26280000	2026-01-28	2026-01-29 15:00:00.874534
USD	BOB	6.92140000	2026-01-28	2026-01-29 15:00:00.874534
USD	BRL	5.18540000	2026-01-28	2026-01-29 15:00:00.874534
USD	BSD	1.00000000	2026-01-28	2026-01-29 15:00:00.874534
USD	BTN	91.98400000	2026-01-28	2026-01-29 15:00:00.874534
USD	BWP	13.34170000	2026-01-28	2026-01-29 15:00:00.874534
USD	BYN	2.84280000	2026-01-28	2026-01-29 15:00:00.874534
USD	BZD	2.00000000	2026-01-28	2026-01-29 15:00:00.874534
USD	CAD	1.35590000	2026-01-28	2026-01-29 15:00:00.874534
USD	CDF	2273.75440000	2026-01-28	2026-01-29 15:00:00.874534
USD	CHF	0.76750000	2026-01-28	2026-01-29 15:00:00.874534
USD	CLF	0.02175000	2026-01-28	2026-01-29 15:00:00.874534
USD	CLP	859.72020000	2026-01-28	2026-01-29 15:00:00.874534
USD	CNH	6.94570000	2026-01-28	2026-01-29 15:00:00.874534
USD	CNY	6.95610000	2026-01-28	2026-01-29 15:00:00.874534
USD	COP	3658.80660000	2026-01-28	2026-01-29 15:00:00.874534
USD	CRC	496.27280000	2026-01-28	2026-01-29 15:00:00.874534
USD	CUP	24.00000000	2026-01-28	2026-01-29 15:00:00.874534
USD	CVE	92.15850000	2026-01-28	2026-01-29 15:00:00.874534
USD	CZK	20.31680000	2026-01-28	2026-01-29 15:00:00.874534
USD	DJF	177.72100000	2026-01-28	2026-01-29 15:00:00.874534
USD	DKK	6.23540000	2026-01-28	2026-01-29 15:00:00.874534
USD	DOP	62.76870000	2026-01-28	2026-01-29 15:00:00.874534
USD	DZD	129.19470000	2026-01-28	2026-01-29 15:00:00.874534
USD	EGP	46.94860000	2026-01-28	2026-01-29 15:00:00.874534
USD	ERN	15.00000000	2026-01-28	2026-01-29 15:00:00.874534
USD	ETB	154.57400000	2026-01-28	2026-01-29 15:00:00.874534
USD	EUR	0.83550000	2026-01-28	2026-01-29 15:00:00.874534
USD	FJD	2.20080000	2026-01-28	2026-01-29 15:00:00.874534
USD	FKP	0.72490000	2026-01-28	2026-01-29 15:00:00.874534
USD	FOK	6.23550000	2026-01-28	2026-01-29 15:00:00.874534
USD	GBP	0.72470000	2026-01-28	2026-01-29 15:00:00.874534
USD	GEL	2.69330000	2026-01-28	2026-01-29 15:00:00.874534
USD	GGP	0.72490000	2026-01-28	2026-01-29 15:00:00.874534
USD	GHS	10.94590000	2026-01-28	2026-01-29 15:00:00.874534
USD	GIP	0.72490000	2026-01-28	2026-01-29 15:00:00.874534
USD	GMD	74.16200000	2026-01-28	2026-01-29 15:00:00.874534
USD	GNF	8758.16160000	2026-01-28	2026-01-29 15:00:00.874534
USD	GTQ	7.67600000	2026-01-28	2026-01-29 15:00:00.874534
USD	GYD	209.30390000	2026-01-28	2026-01-29 15:00:00.874534
USD	HKD	7.80130000	2026-01-28	2026-01-29 15:00:00.874534
USD	HNL	26.37800000	2026-01-28	2026-01-29 15:00:00.874534
USD	HRK	6.29730000	2026-01-28	2026-01-29 15:00:00.874534
USD	HTG	130.92730000	2026-01-28	2026-01-29 15:00:00.874534
USD	HUF	318.11060000	2026-01-28	2026-01-29 15:00:00.874534
USD	IDR	16739.35960000	2026-01-28	2026-01-29 15:00:00.874534
USD	ILS	3.09350000	2026-01-28	2026-01-29 15:00:00.874534
USD	IMP	0.72490000	2026-01-28	2026-01-29 15:00:00.874534
USD	INR	92.00770000	2026-01-28	2026-01-29 15:00:00.874534
USD	IQD	1309.86950000	2026-01-28	2026-01-29 15:00:00.874534
USD	IRR	1076714.55600000	2026-01-28	2026-01-29 15:00:00.874534
USD	ISK	121.11580000	2026-01-28	2026-01-29 15:00:00.874534
USD	JEP	0.72490000	2026-01-28	2026-01-29 15:00:00.874534
USD	JMD	156.82940000	2026-01-28	2026-01-29 15:00:00.874534
USD	JOD	0.70900000	2026-01-28	2026-01-29 15:00:00.874534
USD	JPY	153.13600000	2026-01-28	2026-01-29 15:00:00.874534
USD	KES	129.03650000	2026-01-28	2026-01-29 15:00:00.874534
USD	KGS	87.46950000	2026-01-28	2026-01-29 15:00:00.874534
USD	KHR	4019.24130000	2026-01-28	2026-01-29 15:00:00.874534
USD	KID	1.42540000	2026-01-28	2026-01-29 15:00:00.874534
USD	KMF	411.18240000	2026-01-28	2026-01-29 15:00:00.874534
USD	KRW	1431.35020000	2026-01-28	2026-01-29 15:00:00.874534
USD	KWD	0.30600000	2026-01-28	2026-01-29 15:00:00.874534
USD	KYD	0.83330000	2026-01-28	2026-01-29 15:00:00.874534
USD	KZT	504.11720000	2026-01-28	2026-01-29 15:00:00.874534
USD	LAK	21523.43070000	2026-01-28	2026-01-29 15:00:00.874534
USD	LBP	89500.00000000	2026-01-28	2026-01-29 15:00:00.874534
USD	LKR	309.75390000	2026-01-28	2026-01-29 15:00:00.874534
USD	LRD	184.38800000	2026-01-28	2026-01-29 15:00:00.874534
USD	LSL	15.83380000	2026-01-28	2026-01-29 15:00:00.874534
USD	LYD	6.31340000	2026-01-28	2026-01-29 15:00:00.874534
USD	MAD	9.04120000	2026-01-28	2026-01-29 15:00:00.874534
USD	MDL	16.81640000	2026-01-28	2026-01-29 15:00:00.874534
USD	MGA	4471.14280000	2026-01-28	2026-01-29 15:00:00.874534
USD	MKD	51.66700000	2026-01-28	2026-01-29 15:00:00.874534
USD	MMK	2101.81640000	2026-01-28	2026-01-29 15:00:00.874534
USD	MNT	3580.24830000	2026-01-28	2026-01-29 15:00:00.874534
USD	MOP	8.03540000	2026-01-28	2026-01-29 15:00:00.874534
USD	MRU	40.00860000	2026-01-28	2026-01-29 15:00:00.874534
USD	MUR	45.15850000	2026-01-28	2026-01-29 15:00:00.874534
USD	MVR	15.46280000	2026-01-28	2026-01-29 15:00:00.874534
USD	MWK	1739.63130000	2026-01-28	2026-01-29 15:00:00.874534
USD	MXN	17.19310000	2026-01-28	2026-01-29 15:00:00.874534
USD	MYR	3.91860000	2026-01-28	2026-01-29 15:00:00.874534
USD	MZN	63.72540000	2026-01-28	2026-01-29 15:00:00.874534
USD	NAD	15.83380000	2026-01-28	2026-01-29 15:00:00.874534
USD	NGN	1396.93530000	2026-01-28	2026-01-29 15:00:00.874534
USD	NIO	36.78530000	2026-01-28	2026-01-29 15:00:00.874534
USD	NOK	9.61110000	2026-01-28	2026-01-29 15:00:00.874534
USD	NPR	147.17440000	2026-01-28	2026-01-29 15:00:00.874534
USD	NZD	1.65420000	2026-01-28	2026-01-29 15:00:00.874534
USD	OMR	0.38450000	2026-01-28	2026-01-29 15:00:00.874534
USD	PAB	1.00000000	2026-01-28	2026-01-29 15:00:00.874534
USD	PEN	3.34310000	2026-01-28	2026-01-29 15:00:00.874534
USD	PGK	4.27740000	2026-01-28	2026-01-29 15:00:00.874534
USD	PHP	58.76840000	2026-01-28	2026-01-29 15:00:00.874534
USD	PKR	279.92340000	2026-01-28	2026-01-29 15:00:00.874534
USD	PLN	3.51330000	2026-01-28	2026-01-29 15:00:00.874534
USD	PYG	6725.72570000	2026-01-28	2026-01-29 15:00:00.874534
USD	QAR	3.64000000	2026-01-28	2026-01-29 15:00:00.874534
USD	RON	4.25380000	2026-01-28	2026-01-29 15:00:00.874534
USD	RSD	97.99910000	2026-01-28	2026-01-29 15:00:00.874534
USD	RUB	76.34400000	2026-01-28	2026-01-29 15:00:00.874534
USD	RWF	1459.16350000	2026-01-28	2026-01-29 15:00:00.874534
USD	SAR	3.75000000	2026-01-28	2026-01-29 15:00:00.874534
USD	SBD	7.96780000	2026-01-28	2026-01-29 15:00:00.874534
USD	SCR	14.15340000	2026-01-28	2026-01-29 15:00:00.874534
USD	SDG	544.16380000	2026-01-28	2026-01-29 15:00:00.874534
USD	SEK	8.84050000	2026-01-28	2026-01-29 15:00:00.874534
USD	SGD	1.26220000	2026-01-28	2026-01-29 15:00:00.874534
USD	SHP	0.72490000	2026-01-28	2026-01-29 15:00:00.874534
USD	SLE	24.32090000	2026-01-28	2026-01-29 15:00:00.874534
USD	SLL	24320.94650000	2026-01-28	2026-01-29 15:00:00.874534
USD	SOS	570.84360000	2026-01-28	2026-01-29 15:00:00.874534
USD	SRD	38.10120000	2026-01-28	2026-01-29 15:00:00.874534
USD	SSP	4619.15610000	2026-01-28	2026-01-29 15:00:00.874534
USD	STN	20.47690000	2026-01-28	2026-01-29 15:00:00.874534
USD	SYP	113.65870000	2026-01-28	2026-01-29 15:00:00.874534
USD	SZL	15.83380000	2026-01-28	2026-01-29 15:00:00.874534
USD	THB	31.09350000	2026-01-28	2026-01-29 15:00:00.874534
USD	TJS	9.33350000	2026-01-28	2026-01-29 15:00:00.874534
USD	TMT	3.50200000	2026-01-28	2026-01-29 15:00:00.874534
USD	TND	2.83320000	2026-01-28	2026-01-29 15:00:00.874534
USD	TOP	2.36080000	2026-01-28	2026-01-29 15:00:00.874534
USD	TRY	43.44040000	2026-01-28	2026-01-29 15:00:00.874534
USD	TTD	6.78050000	2026-01-28	2026-01-29 15:00:00.874534
USD	TVD	1.42540000	2026-01-28	2026-01-29 15:00:00.874534
USD	TWD	31.31970000	2026-01-28	2026-01-29 15:00:00.874534
USD	TZS	2548.37230000	2026-01-28	2026-01-29 15:00:00.874534
USD	UAH	42.80330000	2026-01-28	2026-01-29 15:00:00.874534
USD	UGX	3571.73260000	2026-01-28	2026-01-29 15:00:00.874534
USD	UYU	37.59360000	2026-01-28	2026-01-29 15:00:00.874534
USD	UZS	12142.85410000	2026-01-28	2026-01-29 15:00:00.874534
USD	VES	363.66230000	2026-01-28	2026-01-29 15:00:00.874534
USD	VND	26017.57140000	2026-01-28	2026-01-29 15:00:00.874534
USD	VUV	119.11740000	2026-01-28	2026-01-29 15:00:00.874534
USD	WST	2.69290000	2026-01-28	2026-01-29 15:00:00.874534
USD	XAF	548.24320000	2026-01-28	2026-01-29 15:00:00.874534
USD	XCD	2.70000000	2026-01-28	2026-01-29 15:00:00.874534
USD	XCG	1.79000000	2026-01-28	2026-01-29 15:00:00.874534
USD	XDR	0.71120000	2026-01-28	2026-01-29 15:00:00.874534
USD	XOF	548.24320000	2026-01-28	2026-01-29 15:00:00.874534
USD	XPF	99.73670000	2026-01-28	2026-01-29 15:00:00.874534
USD	YER	238.07380000	2026-01-28	2026-01-29 15:00:00.874534
USD	ZAR	15.83020000	2026-01-28	2026-01-29 15:00:00.874534
USD	ZMW	19.85580000	2026-01-28	2026-01-29 15:00:00.874534
USD	ZWG	25.62590000	2026-01-28	2026-01-29 15:00:00.874534
USD	ZWL	25.62590000	2026-01-28	2026-01-29 15:00:00.874534
USD	USD	1.00000000	2026-01-29	2026-01-30 15:00:01.156247
USD	AED	3.67250000	2026-01-29	2026-01-30 15:00:01.156247
USD	AFN	65.37990000	2026-01-29	2026-01-30 15:00:01.156247
USD	ALL	80.79610000	2026-01-29	2026-01-30 15:00:01.156247
USD	AMD	379.04310000	2026-01-29	2026-01-30 15:00:01.156247
USD	ANG	1.79000000	2026-01-29	2026-01-30 15:00:01.156247
USD	AOA	919.40310000	2026-01-29	2026-01-30 15:00:01.156247
USD	ARS	1452.25000000	2026-01-29	2026-01-30 15:00:01.156247
USD	AUD	1.41860000	2026-01-29	2026-01-30 15:00:01.156247
USD	AWG	1.79000000	2026-01-29	2026-01-30 15:00:01.156247
USD	AZN	1.69960000	2026-01-29	2026-01-30 15:00:01.156247
USD	BAM	1.63490000	2026-01-29	2026-01-30 15:00:01.156247
USD	BBD	2.00000000	2026-01-29	2026-01-30 15:00:01.156247
USD	BDT	122.20530000	2026-01-29	2026-01-30 15:00:01.156247
USD	BGN	1.58720000	2026-01-29	2026-01-30 15:00:01.156247
USD	BHD	0.37600000	2026-01-29	2026-01-30 15:00:01.156247
USD	BIF	2965.99420000	2026-01-29	2026-01-30 15:00:01.156247
USD	BMD	1.00000000	2026-01-29	2026-01-30 15:00:01.156247
USD	BND	1.26460000	2026-01-29	2026-01-30 15:00:01.156247
USD	BOB	6.91680000	2026-01-29	2026-01-30 15:00:01.156247
USD	BRL	5.19240000	2026-01-29	2026-01-30 15:00:01.156247
USD	BSD	1.00000000	2026-01-29	2026-01-30 15:00:01.156247
USD	BTN	91.93760000	2026-01-29	2026-01-30 15:00:01.156247
USD	BWP	13.27610000	2026-01-29	2026-01-30 15:00:01.156247
USD	BYN	2.83240000	2026-01-29	2026-01-30 15:00:01.156247
USD	BZD	2.00000000	2026-01-29	2026-01-30 15:00:01.156247
USD	CAD	1.35100000	2026-01-29	2026-01-30 15:00:01.156247
USD	CDF	2251.72070000	2026-01-29	2026-01-30 15:00:01.156247
USD	CHF	0.76600000	2026-01-29	2026-01-30 15:00:01.156247
USD	CLF	0.02187000	2026-01-29	2026-01-30 15:00:01.156247
USD	CLP	864.26300000	2026-01-29	2026-01-30 15:00:01.156247
USD	CNH	6.94790000	2026-01-29	2026-01-30 15:00:01.156247
USD	CNY	6.95240000	2026-01-29	2026-01-30 15:00:01.156247
USD	COP	3668.17410000	2026-01-29	2026-01-30 15:00:01.156247
USD	CRC	495.18330000	2026-01-29	2026-01-30 15:00:01.156247
USD	CUP	24.00000000	2026-01-29	2026-01-30 15:00:01.156247
USD	CVE	92.17080000	2026-01-29	2026-01-30 15:00:01.156247
USD	CZK	20.34190000	2026-01-29	2026-01-30 15:00:01.156247
USD	DJF	177.72100000	2026-01-29	2026-01-30 15:00:01.156247
USD	DKK	6.23690000	2026-01-29	2026-01-30 15:00:01.156247
USD	DOP	62.88020000	2026-01-29	2026-01-30 15:00:01.156247
USD	DZD	129.13090000	2026-01-29	2026-01-30 15:00:01.156247
USD	EGP	46.84320000	2026-01-29	2026-01-30 15:00:01.156247
USD	ERN	15.00000000	2026-01-29	2026-01-30 15:00:01.156247
USD	ETB	154.53190000	2026-01-29	2026-01-30 15:00:01.156247
USD	EUR	0.83590000	2026-01-29	2026-01-30 15:00:01.156247
USD	FJD	2.18550000	2026-01-29	2026-01-30 15:00:01.156247
USD	FKP	0.72440000	2026-01-29	2026-01-30 15:00:01.156247
USD	FOK	6.23690000	2026-01-29	2026-01-30 15:00:01.156247
USD	GBP	0.72430000	2026-01-29	2026-01-30 15:00:01.156247
USD	GEL	2.69200000	2026-01-29	2026-01-30 15:00:01.156247
USD	GGP	0.72440000	2026-01-29	2026-01-30 15:00:01.156247
USD	GHS	10.95050000	2026-01-29	2026-01-30 15:00:01.156247
USD	GIP	0.72440000	2026-01-29	2026-01-30 15:00:01.156247
USD	GMD	74.15080000	2026-01-29	2026-01-30 15:00:01.156247
USD	GNF	8753.17000000	2026-01-29	2026-01-30 15:00:01.156247
USD	GTQ	7.66910000	2026-01-29	2026-01-30 15:00:01.156247
USD	GYD	209.25710000	2026-01-29	2026-01-30 15:00:01.156247
USD	HKD	7.80540000	2026-01-29	2026-01-30 15:00:01.156247
USD	HNL	26.37330000	2026-01-29	2026-01-30 15:00:01.156247
USD	HRK	6.29810000	2026-01-29	2026-01-30 15:00:01.156247
USD	HTG	131.00210000	2026-01-29	2026-01-30 15:00:01.156247
USD	HUF	318.31000000	2026-01-29	2026-01-30 15:00:01.156247
USD	IDR	16755.87080000	2026-01-29	2026-01-30 15:00:01.156247
USD	ILS	3.07530000	2026-01-29	2026-01-30 15:00:01.156247
USD	IMP	0.72440000	2026-01-29	2026-01-30 15:00:01.156247
USD	INR	91.93930000	2026-01-29	2026-01-30 15:00:01.156247
USD	IQD	1309.23070000	2026-01-29	2026-01-30 15:00:01.156247
USD	IRR	1083323.09410000	2026-01-29	2026-01-30 15:00:01.156247
USD	ISK	121.07010000	2026-01-29	2026-01-30 15:00:01.156247
USD	JEP	0.72440000	2026-01-29	2026-01-30 15:00:01.156247
USD	JMD	156.78650000	2026-01-29	2026-01-30 15:00:01.156247
USD	JOD	0.70900000	2026-01-29	2026-01-30 15:00:01.156247
USD	JPY	153.12620000	2026-01-29	2026-01-30 15:00:01.156247
USD	KES	128.95290000	2026-01-29	2026-01-30 15:00:01.156247
USD	KGS	87.44320000	2026-01-29	2026-01-30 15:00:01.156247
USD	KHR	4016.13850000	2026-01-29	2026-01-30 15:00:01.156247
USD	KID	1.41870000	2026-01-29	2026-01-30 15:00:01.156247
USD	KMF	411.23730000	2026-01-29	2026-01-30 15:00:01.156247
USD	KRW	1432.53030000	2026-01-29	2026-01-30 15:00:01.156247
USD	KWD	0.30610000	2026-01-29	2026-01-30 15:00:01.156247
USD	KYD	0.83330000	2026-01-29	2026-01-30 15:00:01.156247
USD	KZT	502.77080000	2026-01-29	2026-01-30 15:00:01.156247
USD	LAK	21598.68620000	2026-01-29	2026-01-30 15:00:01.156247
USD	LBP	89500.00000000	2026-01-29	2026-01-30 15:00:01.156247
USD	LKR	309.26480000	2026-01-29	2026-01-30 15:00:01.156247
USD	LRD	184.90420000	2026-01-29	2026-01-30 15:00:01.156247
USD	LSL	15.73230000	2026-01-29	2026-01-30 15:00:01.156247
USD	LYD	6.29400000	2026-01-29	2026-01-30 15:00:01.156247
USD	MAD	9.04520000	2026-01-29	2026-01-30 15:00:01.156247
USD	MDL	16.77390000	2026-01-29	2026-01-30 15:00:01.156247
USD	MGA	4469.93360000	2026-01-29	2026-01-30 15:00:01.156247
USD	MKD	51.57150000	2026-01-29	2026-01-30 15:00:01.156247
USD	MMK	2100.09770000	2026-01-29	2026-01-30 15:00:01.156247
USD	MNT	3584.48710000	2026-01-29	2026-01-30 15:00:01.156247
USD	MOP	8.03920000	2026-01-29	2026-01-30 15:00:01.156247
USD	MRU	40.03880000	2026-01-29	2026-01-30 15:00:01.156247
USD	MUR	45.11230000	2026-01-29	2026-01-30 15:00:01.156247
USD	MVR	15.44040000	2026-01-29	2026-01-30 15:00:01.156247
USD	MWK	1740.95370000	2026-01-29	2026-01-30 15:00:01.156247
USD	MXN	17.21690000	2026-01-29	2026-01-30 15:00:01.156247
USD	MYR	3.92780000	2026-01-29	2026-01-30 15:00:01.156247
USD	MZN	63.61620000	2026-01-29	2026-01-30 15:00:01.156247
USD	NAD	15.73230000	2026-01-29	2026-01-30 15:00:01.156247
USD	NGN	1381.41080000	2026-01-29	2026-01-30 15:00:01.156247
USD	NIO	36.79450000	2026-01-29	2026-01-30 15:00:01.156247
USD	NOK	9.54390000	2026-01-29	2026-01-30 15:00:01.156247
USD	NPR	147.10020000	2026-01-29	2026-01-30 15:00:01.156247
USD	NZD	1.64630000	2026-01-29	2026-01-30 15:00:01.156247
USD	OMR	0.38450000	2026-01-29	2026-01-30 15:00:01.156247
USD	PAB	1.00000000	2026-01-29	2026-01-30 15:00:01.156247
USD	PEN	3.34330000	2026-01-29	2026-01-30 15:00:01.156247
USD	PGK	4.28660000	2026-01-29	2026-01-30 15:00:01.156247
USD	PHP	59.00010000	2026-01-29	2026-01-30 15:00:01.156247
USD	PKR	279.81740000	2026-01-29	2026-01-30 15:00:01.156247
USD	PLN	3.51670000	2026-01-29	2026-01-30 15:00:01.156247
USD	PYG	6724.05120000	2026-01-29	2026-01-30 15:00:01.156247
USD	QAR	3.64000000	2026-01-29	2026-01-30 15:00:01.156247
USD	RON	4.25960000	2026-01-29	2026-01-30 15:00:01.156247
USD	RSD	98.03760000	2026-01-29	2026-01-30 15:00:01.156247
USD	RUB	75.94500000	2026-01-29	2026-01-30 15:00:01.156247
USD	RWF	1459.87720000	2026-01-29	2026-01-30 15:00:01.156247
USD	SAR	3.75000000	2026-01-29	2026-01-30 15:00:01.156247
USD	SBD	8.32340000	2026-01-29	2026-01-30 15:00:01.156247
USD	SCR	14.15170000	2026-01-29	2026-01-30 15:00:01.156247
USD	SDG	511.94800000	2026-01-29	2026-01-30 15:00:01.156247
USD	SEK	8.82170000	2026-01-29	2026-01-30 15:00:01.156247
USD	SGD	1.26440000	2026-01-29	2026-01-30 15:00:01.156247
USD	SHP	0.72440000	2026-01-29	2026-01-30 15:00:01.156247
USD	SLE	24.32090000	2026-01-29	2026-01-30 15:00:01.156247
USD	SLL	24320.94650000	2026-01-29	2026-01-30 15:00:01.156247
USD	SOS	570.79370000	2026-01-29	2026-01-30 15:00:01.156247
USD	SRD	38.11240000	2026-01-29	2026-01-30 15:00:01.156247
USD	SSP	4657.65900000	2026-01-29	2026-01-30 15:00:01.156247
USD	STN	20.47960000	2026-01-29	2026-01-30 15:00:01.156247
USD	SYP	112.97540000	2026-01-29	2026-01-30 15:00:01.156247
USD	SZL	15.73230000	2026-01-29	2026-01-30 15:00:01.156247
USD	THB	31.21950000	2026-01-29	2026-01-30 15:00:01.156247
USD	TJS	9.32070000	2026-01-29	2026-01-30 15:00:01.156247
USD	TMT	3.50120000	2026-01-29	2026-01-30 15:00:01.156247
USD	TND	2.83820000	2026-01-29	2026-01-30 15:00:01.156247
USD	TOP	2.36090000	2026-01-29	2026-01-30 15:00:01.156247
USD	TRY	43.46470000	2026-01-29	2026-01-30 15:00:01.156247
USD	TTD	6.76690000	2026-01-29	2026-01-30 15:00:01.156247
USD	TVD	1.41870000	2026-01-29	2026-01-30 15:00:01.156247
USD	TWD	31.38140000	2026-01-29	2026-01-30 15:00:01.156247
USD	TZS	2533.40600000	2026-01-29	2026-01-30 15:00:01.156247
USD	UAH	42.88070000	2026-01-29	2026-01-30 15:00:01.156247
USD	UGX	3557.88890000	2026-01-29	2026-01-30 15:00:01.156247
USD	UYU	37.84260000	2026-01-29	2026-01-30 15:00:01.156247
USD	UZS	12177.45750000	2026-01-29	2026-01-30 15:00:01.156247
USD	VES	367.30690000	2026-01-29	2026-01-30 15:00:01.156247
USD	VND	25944.78610000	2026-01-29	2026-01-30 15:00:01.156247
USD	VUV	119.27220000	2026-01-29	2026-01-30 15:00:01.156247
USD	WST	2.68870000	2026-01-29	2026-01-30 15:00:01.156247
USD	XAF	548.31640000	2026-01-29	2026-01-30 15:00:01.156247
USD	XCD	2.70000000	2026-01-29	2026-01-30 15:00:01.156247
USD	XCG	1.79000000	2026-01-29	2026-01-30 15:00:01.156247
USD	XDR	0.71580000	2026-01-29	2026-01-30 15:00:01.156247
USD	XOF	548.31640000	2026-01-29	2026-01-30 15:00:01.156247
USD	XPF	99.75000000	2026-01-29	2026-01-30 15:00:01.156247
USD	YER	238.13620000	2026-01-29	2026-01-30 15:00:01.156247
USD	ZAR	15.73110000	2026-01-29	2026-01-30 15:00:01.156247
USD	ZMW	19.87170000	2026-01-29	2026-01-30 15:00:01.156247
USD	ZWG	25.58750000	2026-01-29	2026-01-30 15:00:01.156247
USD	ZWL	25.58750000	2026-01-29	2026-01-30 15:00:01.156247
USD	USD	1.00000000	2026-01-30	2026-01-31 15:00:00.547019
USD	AED	3.67250000	2026-01-30	2026-01-31 15:00:00.547019
USD	AFN	65.56330000	2026-01-30	2026-01-31 15:00:00.547019
USD	ALL	80.80500000	2026-01-30	2026-01-31 15:00:00.547019
USD	AMD	378.71810000	2026-01-30	2026-01-31 15:00:00.547019
USD	ANG	1.79000000	2026-01-30	2026-01-31 15:00:00.547019
USD	AOA	920.47430000	2026-01-30	2026-01-31 15:00:00.547019
USD	ARS	1452.25000000	2026-01-30	2026-01-31 15:00:00.547019
USD	AUD	1.43250000	2026-01-30	2026-01-31 15:00:00.547019
USD	AWG	1.79000000	2026-01-30	2026-01-31 15:00:00.547019
USD	AZN	1.70000000	2026-01-30	2026-01-31 15:00:00.547019
USD	BAM	1.64490000	2026-01-30	2026-01-31 15:00:00.547019
USD	BBD	2.00000000	2026-01-30	2026-01-31 15:00:00.547019
USD	BDT	122.23220000	2026-01-30	2026-01-31 15:00:00.547019
USD	BGN	1.59560000	2026-01-30	2026-01-31 15:00:00.547019
USD	BHD	0.37600000	2026-01-30	2026-01-31 15:00:00.547019
USD	BIF	2969.00690000	2026-01-30	2026-01-31 15:00:00.547019
USD	BMD	1.00000000	2026-01-30	2026-01-31 15:00:00.547019
USD	BND	1.26890000	2026-01-30	2026-01-31 15:00:00.547019
USD	BOB	6.92330000	2026-01-30	2026-01-31 15:00:00.547019
USD	BRL	5.20360000	2026-01-30	2026-01-31 15:00:00.547019
USD	BSD	1.00000000	2026-01-30	2026-01-31 15:00:00.547019
USD	BTN	91.91400000	2026-01-30	2026-01-31 15:00:00.547019
USD	BWP	13.57930000	2026-01-30	2026-01-31 15:00:00.547019
USD	BYN	2.83450000	2026-01-30	2026-01-31 15:00:00.547019
USD	BZD	2.00000000	2026-01-30	2026-01-31 15:00:00.547019
USD	CAD	1.35740000	2026-01-30	2026-01-31 15:00:00.547019
USD	CDF	2248.00820000	2026-01-30	2026-01-31 15:00:00.547019
USD	CHF	0.77110000	2026-01-30	2026-01-31 15:00:00.547019
USD	CLF	0.02177000	2026-01-30	2026-01-31 15:00:00.547019
USD	CLP	860.37820000	2026-01-30	2026-01-31 15:00:00.547019
USD	CNH	6.95480000	2026-01-30	2026-01-31 15:00:00.547019
USD	CNY	6.96460000	2026-01-30	2026-01-31 15:00:00.547019
USD	COP	3667.57650000	2026-01-30	2026-01-31 15:00:00.547019
USD	CRC	495.33340000	2026-01-30	2026-01-31 15:00:00.547019
USD	CUP	24.00000000	2026-01-30	2026-01-31 15:00:00.547019
USD	CVE	92.73400000	2026-01-30	2026-01-31 15:00:00.547019
USD	CZK	20.45490000	2026-01-30	2026-01-31 15:00:00.547019
USD	DJF	177.72100000	2026-01-30	2026-01-31 15:00:00.547019
USD	DKK	6.27180000	2026-01-30	2026-01-31 15:00:00.547019
USD	DOP	62.89060000	2026-01-30	2026-01-31 15:00:00.547019
USD	DZD	129.16510000	2026-01-30	2026-01-31 15:00:00.547019
USD	EGP	46.88850000	2026-01-30	2026-01-31 15:00:00.547019
USD	ERN	15.00000000	2026-01-30	2026-01-31 15:00:00.547019
USD	ETB	154.38810000	2026-01-30	2026-01-31 15:00:00.547019
USD	EUR	0.84100000	2026-01-30	2026-01-31 15:00:00.547019
USD	FJD	2.18720000	2026-01-30	2026-01-31 15:00:00.547019
USD	FKP	0.72880000	2026-01-30	2026-01-31 15:00:00.547019
USD	FOK	6.27180000	2026-01-30	2026-01-31 15:00:00.547019
USD	GBP	0.72880000	2026-01-30	2026-01-31 15:00:00.547019
USD	GEL	2.69090000	2026-01-30	2026-01-31 15:00:00.547019
USD	GGP	0.72880000	2026-01-30	2026-01-31 15:00:00.547019
USD	GHS	10.96780000	2026-01-30	2026-01-31 15:00:00.547019
USD	GIP	0.72880000	2026-01-30	2026-01-31 15:00:00.547019
USD	GMD	74.14630000	2026-01-30	2026-01-31 15:00:00.547019
USD	GNF	8761.82900000	2026-01-30	2026-01-31 15:00:00.547019
USD	GTQ	7.67180000	2026-01-30	2026-01-31 15:00:00.547019
USD	GYD	209.25570000	2026-01-30	2026-01-31 15:00:00.547019
USD	HKD	7.80980000	2026-01-30	2026-01-31 15:00:00.547019
USD	HNL	26.38280000	2026-01-30	2026-01-31 15:00:00.547019
USD	HRK	6.33660000	2026-01-30	2026-01-31 15:00:00.547019
USD	HTG	130.95990000	2026-01-30	2026-01-31 15:00:00.547019
USD	HUF	320.15500000	2026-01-30	2026-01-31 15:00:00.547019
USD	IDR	16773.41540000	2026-01-30	2026-01-31 15:00:00.547019
USD	ILS	3.10150000	2026-01-30	2026-01-31 15:00:00.547019
USD	IMP	0.72880000	2026-01-30	2026-01-31 15:00:00.547019
USD	INR	91.91400000	2026-01-30	2026-01-31 15:00:00.547019
USD	IQD	1309.21140000	2026-01-30	2026-01-31 15:00:00.547019
USD	IRR	1085004.51180000	2026-01-30	2026-01-31 15:00:00.547019
USD	ISK	121.84570000	2026-01-30	2026-01-31 15:00:00.547019
USD	JEP	0.72880000	2026-01-30	2026-01-31 15:00:00.547019
USD	JMD	156.70140000	2026-01-30	2026-01-31 15:00:00.547019
USD	JOD	0.70900000	2026-01-30	2026-01-31 15:00:00.547019
USD	JPY	154.38230000	2026-01-30	2026-01-31 15:00:00.547019
USD	KES	128.97960000	2026-01-30	2026-01-31 15:00:00.547019
USD	KGS	87.42880000	2026-01-30	2026-01-31 15:00:00.547019
USD	KHR	4016.04460000	2026-01-30	2026-01-31 15:00:00.547019
USD	KID	1.43250000	2026-01-30	2026-01-31 15:00:00.547019
USD	KMF	413.74980000	2026-01-30	2026-01-31 15:00:00.547019
USD	KRW	1444.32650000	2026-01-30	2026-01-31 15:00:00.547019
USD	KWD	0.30650000	2026-01-30	2026-01-31 15:00:00.547019
USD	KYD	0.83330000	2026-01-30	2026-01-31 15:00:00.547019
USD	KZT	502.75470000	2026-01-30	2026-01-31 15:00:00.547019
USD	LAK	21627.23250000	2026-01-30	2026-01-31 15:00:00.547019
USD	LBP	89500.00000000	2026-01-30	2026-01-31 15:00:00.547019
USD	LKR	309.31210000	2026-01-30	2026-01-31 15:00:00.547019
USD	LRD	184.90270000	2026-01-30	2026-01-31 15:00:00.547019
USD	LSL	16.02910000	2026-01-30	2026-01-31 15:00:00.547019
USD	LYD	6.29380000	2026-01-30	2026-01-31 15:00:00.547019
USD	MAD	9.05980000	2026-01-30	2026-01-31 15:00:00.547019
USD	MDL	16.79880000	2026-01-30	2026-01-31 15:00:00.547019
USD	MGA	4470.20850000	2026-01-30	2026-01-31 15:00:00.547019
USD	MKD	51.56980000	2026-01-30	2026-01-31 15:00:00.547019
USD	MMK	2100.71230000	2026-01-30	2026-01-31 15:00:00.547019
USD	MNT	3539.33050000	2026-01-30	2026-01-31 15:00:00.547019
USD	MOP	8.04410000	2026-01-30	2026-01-31 15:00:00.547019
USD	MRU	40.03950000	2026-01-30	2026-01-31 15:00:00.547019
USD	MUR	45.32010000	2026-01-30	2026-01-31 15:00:00.547019
USD	MVR	15.44740000	2026-01-30	2026-01-31 15:00:00.547019
USD	MWK	1744.74340000	2026-01-30	2026-01-31 15:00:00.547019
USD	MXN	17.38440000	2026-01-30	2026-01-31 15:00:00.547019
USD	MYR	3.94250000	2026-01-30	2026-01-31 15:00:00.547019
USD	MZN	63.60780000	2026-01-30	2026-01-31 15:00:00.547019
USD	NAD	16.02910000	2026-01-30	2026-01-31 15:00:00.547019
USD	NGN	1388.39230000	2026-01-30	2026-01-31 15:00:00.547019
USD	NIO	36.80130000	2026-01-30	2026-01-31 15:00:00.547019
USD	NOK	9.60570000	2026-01-30	2026-01-31 15:00:00.547019
USD	NPR	147.06230000	2026-01-30	2026-01-31 15:00:00.547019
USD	NZD	1.65760000	2026-01-30	2026-01-31 15:00:00.547019
USD	OMR	0.38450000	2026-01-30	2026-01-31 15:00:00.547019
USD	PAB	1.00000000	2026-01-30	2026-01-31 15:00:00.547019
USD	PEN	3.35780000	2026-01-30	2026-01-31 15:00:00.547019
USD	PGK	4.28360000	2026-01-30	2026-01-31 15:00:00.547019
USD	PHP	58.93300000	2026-01-30	2026-01-31 15:00:00.547019
USD	PKR	279.75440000	2026-01-30	2026-01-31 15:00:00.547019
USD	PLN	3.53950000	2026-01-30	2026-01-31 15:00:00.547019
USD	PYG	6735.23380000	2026-01-30	2026-01-31 15:00:00.547019
USD	QAR	3.64000000	2026-01-30	2026-01-31 15:00:00.547019
USD	RON	4.27740000	2026-01-30	2026-01-31 15:00:00.547019
USD	RSD	98.28590000	2026-01-30	2026-01-31 15:00:00.547019
USD	RUB	75.95100000	2026-01-30	2026-01-31 15:00:00.547019
USD	RWF	1460.63770000	2026-01-30	2026-01-31 15:00:00.547019
USD	SAR	3.75000000	2026-01-30	2026-01-31 15:00:00.547019
USD	SBD	8.31220000	2026-01-30	2026-01-31 15:00:00.547019
USD	SCR	14.70490000	2026-01-30	2026-01-31 15:00:00.547019
USD	SDG	510.97340000	2026-01-30	2026-01-31 15:00:00.547019
USD	SEK	8.87690000	2026-01-30	2026-01-31 15:00:00.547019
USD	SGD	1.26890000	2026-01-30	2026-01-31 15:00:00.547019
USD	SHP	0.72880000	2026-01-30	2026-01-31 15:00:00.547019
USD	SLE	24.32090000	2026-01-30	2026-01-31 15:00:00.547019
USD	SLL	24320.94650000	2026-01-30	2026-01-31 15:00:00.547019
USD	SOS	570.79220000	2026-01-30	2026-01-31 15:00:00.547019
USD	SRD	38.11250000	2026-01-30	2026-01-31 15:00:00.547019
USD	SSP	4689.02510000	2026-01-30	2026-01-31 15:00:00.547019
USD	STN	20.60470000	2026-01-30	2026-01-31 15:00:00.547019
USD	SYP	114.02550000	2026-01-30	2026-01-31 15:00:00.547019
USD	SZL	16.02910000	2026-01-30	2026-01-31 15:00:00.547019
USD	THB	31.50510000	2026-01-30	2026-01-31 15:00:00.547019
USD	TJS	9.31360000	2026-01-30	2026-01-31 15:00:00.547019
USD	TMT	3.50060000	2026-01-30	2026-01-31 15:00:00.547019
USD	TND	2.83930000	2026-01-30	2026-01-31 15:00:00.547019
USD	TOP	2.35650000	2026-01-30	2026-01-31 15:00:00.547019
USD	TRY	43.49780000	2026-01-30	2026-01-31 15:00:00.547019
USD	TTD	6.73270000	2026-01-30	2026-01-31 15:00:00.547019
USD	TVD	1.43250000	2026-01-30	2026-01-31 15:00:00.547019
USD	TWD	31.54820000	2026-01-30	2026-01-31 15:00:00.547019
USD	TZS	2535.23330000	2026-01-30	2026-01-31 15:00:00.547019
USD	UAH	42.82180000	2026-01-30	2026-01-31 15:00:00.547019
USD	UGX	3537.51430000	2026-01-30	2026-01-31 15:00:00.547019
USD	UYU	37.84540000	2026-01-30	2026-01-31 15:00:00.547019
USD	UZS	12189.00660000	2026-01-30	2026-01-31 15:00:00.547019
USD	VES	370.25440000	2026-01-30	2026-01-31 15:00:00.547019
USD	VND	25925.56840000	2026-01-30	2026-01-31 15:00:00.547019
USD	VUV	119.07900000	2026-01-30	2026-01-31 15:00:00.547019
USD	WST	2.69160000	2026-01-30	2026-01-31 15:00:00.547019
USD	XAF	551.66640000	2026-01-30	2026-01-31 15:00:00.547019
USD	XCD	2.70000000	2026-01-30	2026-01-31 15:00:00.547019
USD	XCG	1.79000000	2026-01-30	2026-01-31 15:00:00.547019
USD	XDR	0.71780000	2026-01-30	2026-01-31 15:00:00.547019
USD	XOF	551.66640000	2026-01-30	2026-01-31 15:00:00.547019
USD	XPF	100.35940000	2026-01-30	2026-01-31 15:00:00.547019
USD	YER	238.10800000	2026-01-30	2026-01-31 15:00:00.547019
USD	ZAR	16.03010000	2026-01-30	2026-01-31 15:00:00.547019
USD	ZMW	19.81530000	2026-01-30	2026-01-31 15:00:00.547019
USD	ZWG	25.58060000	2026-01-30	2026-01-31 15:00:00.547019
USD	ZWL	25.58060000	2026-01-30	2026-01-31 15:00:00.547019
USD	USD	1.00000000	2026-01-31	2026-02-01 15:31:52.800061
USD	AED	3.67250000	2026-01-31	2026-02-01 15:31:52.800061
USD	AFN	65.54950000	2026-01-31	2026-02-01 15:31:52.800061
USD	ALL	80.80480000	2026-01-31	2026-02-01 15:31:52.800061
USD	AMD	378.73130000	2026-01-31	2026-02-01 15:31:52.800061
USD	ANG	1.79000000	2026-01-31	2026-02-01 15:31:52.800061
USD	AOA	919.21780000	2026-01-31	2026-02-01 15:31:52.800061
USD	ARS	1452.25000000	2026-01-31	2026-02-01 15:31:52.800061
USD	AUD	1.43170000	2026-01-31	2026-02-01 15:31:52.800061
USD	AWG	1.79000000	2026-01-31	2026-02-01 15:31:52.800061
USD	AZN	1.70000000	2026-01-31	2026-02-01 15:31:52.800061
USD	BAM	1.64430000	2026-01-31	2026-02-01 15:31:52.800061
USD	BBD	2.00000000	2026-01-31	2026-02-01 15:31:52.800061
USD	BDT	122.23430000	2026-01-31	2026-02-01 15:31:52.800061
USD	BGN	1.62980000	2026-01-31	2026-02-01 15:31:52.800061
USD	BHD	0.37600000	2026-01-31	2026-02-01 15:31:52.800061
USD	BIF	2969.17660000	2026-01-31	2026-02-01 15:31:52.800061
USD	BMD	1.00000000	2026-01-31	2026-02-01 15:31:52.800061
USD	BND	1.26910000	2026-01-31	2026-02-01 15:31:52.800061
USD	BOB	6.92300000	2026-01-31	2026-02-01 15:31:52.800061
USD	BRL	5.20380000	2026-01-31	2026-02-01 15:31:52.800061
USD	BSD	1.00000000	2026-01-31	2026-02-01 15:31:52.800061
USD	BTN	91.92620000	2026-01-31	2026-02-01 15:31:52.800061
USD	BWP	13.55550000	2026-01-31	2026-02-01 15:31:52.800061
USD	BYN	2.83460000	2026-01-31	2026-02-01 15:31:52.800061
USD	BZD	2.00000000	2026-01-31	2026-02-01 15:31:52.800061
USD	CAD	1.35680000	2026-01-31	2026-02-01 15:31:52.800061
USD	CDF	2244.99960000	2026-01-31	2026-02-01 15:31:52.800061
USD	CHF	0.77090000	2026-01-31	2026-02-01 15:31:52.800061
USD	CLF	0.02177000	2026-01-31	2026-02-01 15:31:52.800061
USD	CLP	860.33790000	2026-01-31	2026-02-01 15:31:52.800061
USD	CNH	6.95470000	2026-01-31	2026-02-01 15:31:52.800061
USD	CNY	6.96570000	2026-01-31	2026-02-01 15:31:52.800061
USD	COP	3667.68620000	2026-01-31	2026-02-01 15:31:52.800061
USD	CRC	495.31280000	2026-01-31	2026-02-01 15:31:52.800061
USD	CUP	24.00000000	2026-01-31	2026-02-01 15:31:52.800061
USD	CVE	92.70230000	2026-01-31	2026-02-01 15:31:52.800061
USD	CZK	20.46060000	2026-01-31	2026-02-01 15:31:52.800061
USD	DJF	177.72100000	2026-01-31	2026-02-01 15:31:52.800061
USD	DKK	6.27150000	2026-01-31	2026-02-01 15:31:52.800061
USD	DOP	62.88890000	2026-01-31	2026-02-01 15:31:52.800061
USD	DZD	129.16300000	2026-01-31	2026-02-01 15:31:52.800061
USD	EGP	46.89560000	2026-01-31	2026-02-01 15:31:52.800061
USD	ERN	15.00000000	2026-01-31	2026-02-01 15:31:52.800061
USD	ETB	154.23640000	2026-01-31	2026-02-01 15:31:52.800061
USD	EUR	0.84070000	2026-01-31	2026-02-01 15:31:52.800061
USD	FJD	2.18700000	2026-01-31	2026-02-01 15:31:52.800061
USD	FKP	0.72860000	2026-01-31	2026-02-01 15:31:52.800061
USD	FOK	6.27150000	2026-01-31	2026-02-01 15:31:52.800061
USD	GBP	0.72860000	2026-01-31	2026-02-01 15:31:52.800061
USD	GEL	2.69090000	2026-01-31	2026-02-01 15:31:52.800061
USD	GGP	0.72860000	2026-01-31	2026-02-01 15:31:52.800061
USD	GHS	10.96550000	2026-01-31	2026-02-01 15:31:52.800061
USD	GIP	0.72860000	2026-01-31	2026-02-01 15:31:52.800061
USD	GMD	74.14670000	2026-01-31	2026-02-01 15:31:52.800061
USD	GNF	8760.04900000	2026-01-31	2026-02-01 15:31:52.800061
USD	GTQ	7.67160000	2026-01-31	2026-02-01 15:31:52.800061
USD	GYD	209.25360000	2026-01-31	2026-02-01 15:31:52.800061
USD	HKD	7.80930000	2026-01-31	2026-02-01 15:31:52.800061
USD	HNL	26.38220000	2026-01-31	2026-02-01 15:31:52.800061
USD	HRK	6.33440000	2026-01-31	2026-02-01 15:31:52.800061
USD	HTG	131.04120000	2026-01-31	2026-02-01 15:31:52.800061
USD	HUF	320.38740000	2026-01-31	2026-02-01 15:31:52.800061
USD	IDR	16775.91640000	2026-01-31	2026-02-01 15:31:52.800061
USD	ILS	3.10000000	2026-01-31	2026-02-01 15:31:52.800061
USD	IMP	0.72860000	2026-01-31	2026-02-01 15:31:52.800061
USD	INR	91.92620000	2026-01-31	2026-02-01 15:31:52.800061
USD	IQD	1309.18210000	2026-01-31	2026-02-01 15:31:52.800061
USD	IRR	1084878.36020000	2026-01-31	2026-02-01 15:31:52.800061
USD	ISK	121.83530000	2026-01-31	2026-02-01 15:31:52.800061
USD	JEP	0.72860000	2026-01-31	2026-02-01 15:31:52.800061
USD	JMD	156.71840000	2026-01-31	2026-02-01 15:31:52.800061
USD	JOD	0.70900000	2026-01-31	2026-02-01 15:31:52.800061
USD	JPY	154.31360000	2026-01-31	2026-02-01 15:31:52.800061
USD	KES	128.97070000	2026-01-31	2026-02-01 15:31:52.800061
USD	KGS	87.43090000	2026-01-31	2026-02-01 15:31:52.800061
USD	KHR	4015.90240000	2026-01-31	2026-02-01 15:31:52.800061
USD	KID	1.43170000	2026-01-31	2026-02-01 15:31:52.800061
USD	KMF	413.60830000	2026-01-31	2026-02-01 15:31:52.800061
USD	KRW	1443.89320000	2026-01-31	2026-02-01 15:31:52.800061
USD	KWD	0.30640000	2026-01-31	2026-02-01 15:31:52.800061
USD	KYD	0.83330000	2026-01-31	2026-02-01 15:31:52.800061
USD	KZT	502.68850000	2026-01-31	2026-02-01 15:31:52.800061
USD	LAK	21627.47160000	2026-01-31	2026-02-01 15:31:52.800061
USD	LBP	89500.00000000	2026-01-31	2026-02-01 15:31:52.800061
USD	LKR	309.31090000	2026-01-31	2026-02-01 15:31:52.800061
USD	LRD	184.90500000	2026-01-31	2026-02-01 15:31:52.800061
USD	LSL	16.02490000	2026-01-31	2026-02-01 15:31:52.800061
USD	LYD	6.29340000	2026-01-31	2026-02-01 15:31:52.800061
USD	MAD	9.06110000	2026-01-31	2026-02-01 15:31:52.800061
USD	MDL	16.79460000	2026-01-31	2026-02-01 15:31:52.800061
USD	MGA	4470.28260000	2026-01-31	2026-02-01 15:31:52.800061
USD	MKD	51.74910000	2026-01-31	2026-02-01 15:31:52.800061
USD	MMK	2100.68460000	2026-01-31	2026-02-01 15:31:52.800061
USD	MNT	3543.53740000	2026-01-31	2026-02-01 15:31:52.800061
USD	MOP	8.04360000	2026-01-31	2026-02-01 15:31:52.800061
USD	MRU	40.04070000	2026-01-31	2026-02-01 15:31:52.800061
USD	MUR	45.30020000	2026-01-31	2026-02-01 15:31:52.800061
USD	MVR	15.44690000	2026-01-31	2026-02-01 15:31:52.800061
USD	MWK	1744.07370000	2026-01-31	2026-02-01 15:31:52.800061
USD	MXN	17.38340000	2026-01-31	2026-02-01 15:31:52.800061
USD	MYR	3.94200000	2026-01-31	2026-02-01 15:31:52.800061
USD	MZN	63.55690000	2026-01-31	2026-02-01 15:31:52.800061
USD	NAD	16.02490000	2026-01-31	2026-02-01 15:31:52.800061
USD	NGN	1388.64950000	2026-01-31	2026-02-01 15:31:52.800061
USD	NIO	36.80080000	2026-01-31	2026-02-01 15:31:52.800061
USD	NOK	9.60680000	2026-01-31	2026-02-01 15:31:52.800061
USD	NPR	147.08190000	2026-01-31	2026-02-01 15:31:52.800061
USD	NZD	1.65640000	2026-01-31	2026-02-01 15:31:52.800061
USD	OMR	0.38450000	2026-01-31	2026-02-01 15:31:52.800061
USD	PAB	1.00000000	2026-01-31	2026-02-01 15:31:52.800061
USD	PEN	3.35560000	2026-01-31	2026-02-01 15:31:52.800061
USD	PGK	4.28370000	2026-01-31	2026-02-01 15:31:52.800061
USD	PHP	58.93030000	2026-01-31	2026-02-01 15:31:52.800061
USD	PKR	279.83280000	2026-01-31	2026-02-01 15:31:52.800061
USD	PLN	3.54090000	2026-01-31	2026-02-01 15:31:52.800061
USD	PYG	6735.03310000	2026-01-31	2026-02-01 15:31:52.800061
USD	QAR	3.64000000	2026-01-31	2026-02-01 15:31:52.800061
USD	RON	4.27800000	2026-01-31	2026-02-01 15:31:52.800061
USD	RSD	98.26690000	2026-01-31	2026-02-01 15:31:52.800061
USD	RUB	75.95570000	2026-01-31	2026-02-01 15:31:52.800061
USD	RWF	1460.38300000	2026-01-31	2026-02-01 15:31:52.800061
USD	SAR	3.75000000	2026-01-31	2026-02-01 15:31:52.800061
USD	SBD	8.31540000	2026-01-31	2026-02-01 15:31:52.800061
USD	SCR	14.67850000	2026-01-31	2026-02-01 15:31:52.800061
USD	SDG	509.49670000	2026-01-31	2026-02-01 15:31:52.800061
USD	SEK	8.87730000	2026-01-31	2026-02-01 15:31:52.800061
USD	SGD	1.26910000	2026-01-31	2026-02-01 15:31:52.800061
USD	SHP	0.72860000	2026-01-31	2026-02-01 15:31:52.800061
USD	SLE	24.32090000	2026-01-31	2026-02-01 15:31:52.800061
USD	SLL	24320.94650000	2026-01-31	2026-02-01 15:31:52.800061
USD	SOS	570.78990000	2026-01-31	2026-02-01 15:31:52.800061
USD	SRD	38.11260000	2026-01-31	2026-02-01 15:31:52.800061
USD	SSP	4685.15000000	2026-01-31	2026-02-01 15:31:52.800061
USD	STN	20.59770000	2026-01-31	2026-02-01 15:31:52.800061
USD	SYP	113.97520000	2026-01-31	2026-02-01 15:31:52.800061
USD	SZL	16.02490000	2026-01-31	2026-02-01 15:31:52.800061
USD	THB	31.49190000	2026-01-31	2026-02-01 15:31:52.800061
USD	TJS	9.31420000	2026-01-31	2026-02-01 15:31:52.800061
USD	TMT	3.50040000	2026-01-31	2026-02-01 15:31:52.800061
USD	TND	2.83870000	2026-01-31	2026-02-01 15:31:52.800061
USD	TOP	2.35670000	2026-01-31	2026-02-01 15:31:52.800061
USD	TRY	43.50400000	2026-01-31	2026-02-01 15:31:52.800061
USD	TTD	6.74190000	2026-01-31	2026-02-01 15:31:52.800061
USD	TVD	1.43170000	2026-01-31	2026-02-01 15:31:52.800061
USD	TWD	31.53320000	2026-01-31	2026-02-01 15:31:52.800061
USD	TZS	2535.11220000	2026-01-31	2026-02-01 15:31:52.800061
USD	UAH	42.82360000	2026-01-31	2026-02-01 15:31:52.800061
USD	UGX	3535.00070000	2026-01-31	2026-02-01 15:31:52.800061
USD	UYU	37.84510000	2026-01-31	2026-02-01 15:31:52.800061
USD	UZS	12187.92120000	2026-01-31	2026-02-01 15:31:52.800061
USD	VES	370.25440000	2026-01-31	2026-02-01 15:31:52.800061
USD	VND	25910.17070000	2026-01-31	2026-02-01 15:31:52.800061
USD	VUV	119.10010000	2026-01-31	2026-02-01 15:31:52.800061
USD	WST	2.69140000	2026-01-31	2026-02-01 15:31:52.800061
USD	XAF	551.47770000	2026-01-31	2026-02-01 15:31:52.800061
USD	XCD	2.70000000	2026-01-31	2026-02-01 15:31:52.800061
USD	XCG	1.79000000	2026-01-31	2026-02-01 15:31:52.800061
USD	XDR	0.71730000	2026-01-31	2026-02-01 15:31:52.800061
USD	XOF	551.47770000	2026-01-31	2026-02-01 15:31:52.800061
USD	XPF	100.32510000	2026-01-31	2026-02-01 15:31:52.800061
USD	YER	238.11270000	2026-01-31	2026-02-01 15:31:52.800061
USD	ZAR	16.02580000	2026-01-31	2026-02-01 15:31:52.800061
USD	ZMW	19.81980000	2026-01-31	2026-02-01 15:31:52.800061
USD	ZWG	25.58060000	2026-01-31	2026-02-01 15:31:52.800061
USD	ZWL	25.58060000	2026-01-31	2026-02-01 15:31:52.800061
USD	USD	1.00000000	2026-02-01	2026-02-02 15:00:00.791047
USD	AED	3.67250000	2026-02-01	2026-02-02 15:00:00.791047
USD	AFN	65.65050000	2026-02-01	2026-02-02 15:00:00.791047
USD	ALL	81.26930000	2026-02-01	2026-02-02 15:00:00.791047
USD	AMD	378.76340000	2026-02-01	2026-02-02 15:00:00.791047
USD	ANG	1.79000000	2026-02-01	2026-02-02 15:00:00.791047
USD	AOA	917.70770000	2026-02-01	2026-02-02 15:00:00.791047
USD	ARS	1452.25000000	2026-02-01	2026-02-02 15:00:00.791047
USD	AUD	1.43760000	2026-02-01	2026-02-02 15:00:00.791047
USD	AWG	1.79000000	2026-02-01	2026-02-02 15:00:00.791047
USD	AZN	1.69890000	2026-02-01	2026-02-02 15:00:00.791047
USD	BAM	1.64820000	2026-02-01	2026-02-02 15:00:00.791047
USD	BBD	2.00000000	2026-02-01	2026-02-02 15:00:00.791047
USD	BDT	122.28460000	2026-02-01	2026-02-02 15:00:00.791047
USD	BGN	1.64200000	2026-02-01	2026-02-02 15:00:00.791047
USD	BHD	0.37600000	2026-02-01	2026-02-02 15:00:00.791047
USD	BIF	2965.54280000	2026-02-01	2026-02-02 15:00:00.791047
USD	BMD	1.00000000	2026-02-01	2026-02-02 15:00:00.791047
USD	BND	1.27100000	2026-02-01	2026-02-02 15:00:00.791047
USD	BOB	6.91680000	2026-02-01	2026-02-02 15:00:00.791047
USD	BRL	5.24610000	2026-02-01	2026-02-02 15:00:00.791047
USD	BSD	1.00000000	2026-02-01	2026-02-02 15:00:00.791047
USD	BTN	91.85380000	2026-02-01	2026-02-02 15:00:00.791047
USD	BWP	13.15600000	2026-02-01	2026-02-02 15:00:00.791047
USD	BYN	2.82770000	2026-02-01	2026-02-02 15:00:00.791047
USD	BZD	2.00000000	2026-02-01	2026-02-02 15:00:00.791047
USD	CAD	1.36100000	2026-02-01	2026-02-02 15:00:00.791047
USD	CDF	2174.65040000	2026-02-01	2026-02-02 15:00:00.791047
USD	CHF	0.77270000	2026-02-01	2026-02-02 15:00:00.791047
USD	CLF	0.02185000	2026-02-01	2026-02-02 15:00:00.791047
USD	CLP	863.61690000	2026-02-01	2026-02-02 15:00:00.791047
USD	CNH	6.95610000	2026-02-01	2026-02-02 15:00:00.791047
USD	CNY	6.96400000	2026-02-01	2026-02-02 15:00:00.791047
USD	COP	3657.34410000	2026-02-01	2026-02-02 15:00:00.791047
USD	CRC	495.41990000	2026-02-01	2026-02-02 15:00:00.791047
USD	CUP	24.00000000	2026-02-01	2026-02-02 15:00:00.791047
USD	CVE	92.92080000	2026-02-01	2026-02-02 15:00:00.791047
USD	CZK	20.49370000	2026-02-01	2026-02-02 15:00:00.791047
USD	DJF	177.72100000	2026-02-01	2026-02-02 15:00:00.791047
USD	DKK	6.28600000	2026-02-01	2026-02-02 15:00:00.791047
USD	DOP	62.91100000	2026-02-01	2026-02-02 15:00:00.791047
USD	DZD	129.44520000	2026-02-01	2026-02-02 15:00:00.791047
USD	EGP	47.11430000	2026-02-01	2026-02-02 15:00:00.791047
USD	ERN	15.00000000	2026-02-01	2026-02-02 15:00:00.791047
USD	ETB	154.28550000	2026-02-01	2026-02-02 15:00:00.791047
USD	EUR	0.84300000	2026-02-01	2026-02-02 15:00:00.791047
USD	FJD	2.20070000	2026-02-01	2026-02-02 15:00:00.791047
USD	FKP	0.73020000	2026-02-01	2026-02-02 15:00:00.791047
USD	FOK	6.28600000	2026-02-01	2026-02-02 15:00:00.791047
USD	GBP	0.73010000	2026-02-01	2026-02-02 15:00:00.791047
USD	GEL	2.69030000	2026-02-01	2026-02-02 15:00:00.791047
USD	GGP	0.73020000	2026-02-01	2026-02-02 15:00:00.791047
USD	GHS	10.93490000	2026-02-01	2026-02-02 15:00:00.791047
USD	GIP	0.73020000	2026-02-01	2026-02-02 15:00:00.791047
USD	GMD	74.12780000	2026-02-01	2026-02-02 15:00:00.791047
USD	GNF	8733.94270000	2026-02-01	2026-02-02 15:00:00.791047
USD	GTQ	7.66680000	2026-02-01	2026-02-02 15:00:00.791047
USD	GYD	209.26300000	2026-02-01	2026-02-02 15:00:00.791047
USD	HKD	7.81010000	2026-02-01	2026-02-02 15:00:00.791047
USD	HNL	26.38610000	2026-02-01	2026-02-02 15:00:00.791047
USD	HRK	6.34940000	2026-02-01	2026-02-02 15:00:00.791047
USD	HTG	130.92310000	2026-02-01	2026-02-02 15:00:00.791047
USD	HUF	320.95200000	2026-02-01	2026-02-02 15:00:00.791047
USD	IDR	16781.70110000	2026-02-01	2026-02-02 15:00:00.791047
USD	ILS	3.10100000	2026-02-01	2026-02-02 15:00:00.791047
USD	IMP	0.73020000	2026-02-01	2026-02-02 15:00:00.791047
USD	INR	91.84860000	2026-02-01	2026-02-02 15:00:00.791047
USD	IQD	1310.35280000	2026-02-01	2026-02-02 15:00:00.791047
USD	IRR	1084218.07370000	2026-02-01	2026-02-02 15:00:00.791047
USD	ISK	121.73500000	2026-02-01	2026-02-02 15:00:00.791047
USD	JEP	0.73020000	2026-02-01	2026-02-02 15:00:00.791047
USD	JMD	156.76070000	2026-02-01	2026-02-02 15:00:00.791047
USD	JOD	0.70900000	2026-02-01	2026-02-02 15:00:00.791047
USD	JPY	154.98660000	2026-02-01	2026-02-02 15:00:00.791047
USD	KES	128.94520000	2026-02-01	2026-02-02 15:00:00.791047
USD	KGS	87.46410000	2026-02-01	2026-02-02 15:00:00.791047
USD	KHR	4017.68250000	2026-02-01	2026-02-02 15:00:00.791047
USD	KID	1.43720000	2026-02-01	2026-02-02 15:00:00.791047
USD	KMF	414.58340000	2026-02-01	2026-02-02 15:00:00.791047
USD	KRW	1448.22280000	2026-02-01	2026-02-02 15:00:00.791047
USD	KWD	0.30610000	2026-02-01	2026-02-02 15:00:00.791047
USD	KYD	0.83330000	2026-02-01	2026-02-02 15:00:00.791047
USD	KZT	501.22290000	2026-02-01	2026-02-02 15:00:00.791047
USD	LAK	21616.29470000	2026-02-01	2026-02-02 15:00:00.791047
USD	LBP	89500.00000000	2026-02-01	2026-02-02 15:00:00.791047
USD	LKR	309.06140000	2026-02-01	2026-02-02 15:00:00.791047
USD	LRD	185.27360000	2026-02-01	2026-02-02 15:00:00.791047
USD	LSL	16.11110000	2026-02-01	2026-02-02 15:00:00.791047
USD	LYD	6.28250000	2026-02-01	2026-02-02 15:00:00.791047
USD	MAD	9.08390000	2026-02-01	2026-02-02 15:00:00.791047
USD	MDL	16.78310000	2026-02-01	2026-02-02 15:00:00.791047
USD	MGA	4431.26000000	2026-02-01	2026-02-02 15:00:00.791047
USD	MKD	51.74160000	2026-02-01	2026-02-02 15:00:00.791047
USD	MMK	2100.54800000	2026-02-01	2026-02-02 15:00:00.791047
USD	MNT	3543.13150000	2026-02-01	2026-02-02 15:00:00.791047
USD	MOP	8.04480000	2026-02-01	2026-02-02 15:00:00.791047
USD	MRU	39.94230000	2026-02-01	2026-02-02 15:00:00.791047
USD	MUR	45.36660000	2026-02-01	2026-02-02 15:00:00.791047
USD	MVR	15.43490000	2026-02-01	2026-02-02 15:00:00.791047
USD	MWK	1737.09000000	2026-02-01	2026-02-02 15:00:00.791047
USD	MXN	17.45510000	2026-02-01	2026-02-02 15:00:00.791047
USD	MYR	3.94300000	2026-02-01	2026-02-02 15:00:00.791047
USD	MZN	63.77400000	2026-02-01	2026-02-02 15:00:00.791047
USD	NAD	16.11110000	2026-02-01	2026-02-02 15:00:00.791047
USD	NGN	1387.77570000	2026-02-01	2026-02-02 15:00:00.791047
USD	NIO	36.78740000	2026-02-01	2026-02-02 15:00:00.791047
USD	NOK	9.63990000	2026-02-01	2026-02-02 15:00:00.791047
USD	NPR	146.96600000	2026-02-01	2026-02-02 15:00:00.791047
USD	NZD	1.66190000	2026-02-01	2026-02-02 15:00:00.791047
USD	OMR	0.38450000	2026-02-01	2026-02-02 15:00:00.791047
USD	PAB	1.00000000	2026-02-01	2026-02-02 15:00:00.791047
USD	PEN	3.35160000	2026-02-01	2026-02-02 15:00:00.791047
USD	PGK	4.29170000	2026-02-01	2026-02-02 15:00:00.791047
USD	PHP	58.93530000	2026-02-01	2026-02-02 15:00:00.791047
USD	PKR	279.75600000	2026-02-01	2026-02-02 15:00:00.791047
USD	PLN	3.55160000	2026-02-01	2026-02-02 15:00:00.791047
USD	PYG	6680.36040000	2026-02-01	2026-02-02 15:00:00.791047
USD	QAR	3.64000000	2026-02-01	2026-02-02 15:00:00.791047
USD	RON	4.27570000	2026-02-01	2026-02-02 15:00:00.791047
USD	RSD	98.52480000	2026-02-01	2026-02-02 15:00:00.791047
USD	RUB	75.98170000	2026-02-01	2026-02-02 15:00:00.791047
USD	RWF	1456.15200000	2026-02-01	2026-02-02 15:00:00.791047
USD	SAR	3.75000000	2026-02-01	2026-02-02 15:00:00.791047
USD	SBD	7.93100000	2026-02-01	2026-02-02 15:00:00.791047
USD	SCR	14.19590000	2026-02-01	2026-02-02 15:00:00.791047
USD	SDG	458.71260000	2026-02-01	2026-02-02 15:00:00.791047
USD	SEK	8.89830000	2026-02-01	2026-02-02 15:00:00.791047
USD	SGD	1.27070000	2026-02-01	2026-02-02 15:00:00.791047
USD	SHP	0.73020000	2026-02-01	2026-02-02 15:00:00.791047
USD	SLE	24.32090000	2026-02-01	2026-02-02 15:00:00.791047
USD	SLL	24320.94650000	2026-02-01	2026-02-02 15:00:00.791047
USD	SOS	571.66240000	2026-02-01	2026-02-02 15:00:00.791047
USD	SRD	38.10970000	2026-02-01	2026-02-02 15:00:00.791047
USD	SSP	4666.06600000	2026-02-01	2026-02-02 15:00:00.791047
USD	STN	20.64630000	2026-02-01	2026-02-02 15:00:00.791047
USD	SYP	112.34900000	2026-02-01	2026-02-02 15:00:00.791047
USD	SZL	16.11110000	2026-02-01	2026-02-02 15:00:00.791047
USD	THB	31.49670000	2026-02-01	2026-02-02 15:00:00.791047
USD	TJS	9.31730000	2026-02-01	2026-02-02 15:00:00.791047
USD	TMT	3.50070000	2026-02-01	2026-02-02 15:00:00.791047
USD	TND	2.84300000	2026-02-01	2026-02-02 15:00:00.791047
USD	TOP	2.35980000	2026-02-01	2026-02-02 15:00:00.791047
USD	TRY	43.44760000	2026-02-01	2026-02-02 15:00:00.791047
USD	TTD	6.77870000	2026-02-01	2026-02-02 15:00:00.791047
USD	TVD	1.43720000	2026-02-01	2026-02-02 15:00:00.791047
USD	TWD	31.59130000	2026-02-01	2026-02-02 15:00:00.791047
USD	TZS	2552.92480000	2026-02-01	2026-02-02 15:00:00.791047
USD	UAH	42.82660000	2026-02-01	2026-02-02 15:00:00.791047
USD	UGX	3544.10460000	2026-02-01	2026-02-02 15:00:00.791047
USD	UYU	38.24110000	2026-02-01	2026-02-02 15:00:00.791047
USD	UZS	12202.39750000	2026-02-01	2026-02-02 15:00:00.791047
USD	VES	370.25440000	2026-02-01	2026-02-02 15:00:00.791047
USD	VND	25863.77360000	2026-02-01	2026-02-02 15:00:00.791047
USD	VUV	118.86120000	2026-02-01	2026-02-02 15:00:00.791047
USD	WST	2.67570000	2026-02-01	2026-02-02 15:00:00.791047
USD	XAF	552.77790000	2026-02-01	2026-02-02 15:00:00.791047
USD	XCD	2.70000000	2026-02-01	2026-02-02 15:00:00.791047
USD	XCG	1.79000000	2026-02-01	2026-02-02 15:00:00.791047
USD	XDR	0.71730000	2026-02-01	2026-02-02 15:00:00.791047
USD	XOF	552.77790000	2026-02-01	2026-02-02 15:00:00.791047
USD	XPF	100.56160000	2026-02-01	2026-02-02 15:00:00.791047
USD	YER	238.20250000	2026-02-01	2026-02-02 15:00:00.791047
USD	ZAR	16.11890000	2026-02-01	2026-02-02 15:00:00.791047
USD	ZMW	19.70040000	2026-02-01	2026-02-02 15:00:00.791047
USD	ZWG	25.58060000	2026-02-01	2026-02-02 15:00:00.791047
USD	ZWL	25.58060000	2026-02-01	2026-02-02 15:00:00.791047
USD	USD	1.00000000	2026-02-02	2026-02-03 15:14:06.74827
USD	AED	3.67250000	2026-02-02	2026-02-03 15:14:06.74827
USD	AFN	65.78150000	2026-02-02	2026-02-03 15:14:06.74827
USD	ALL	81.61000000	2026-02-02	2026-02-03 15:14:06.74827
USD	AMD	378.77550000	2026-02-02	2026-02-03 15:14:06.74827
USD	ANG	1.79000000	2026-02-02	2026-02-03 15:14:06.74827
USD	AOA	919.90930000	2026-02-02	2026-02-03 15:14:06.74827
USD	ARS	1452.25000000	2026-02-02	2026-02-03 15:14:06.74827
USD	AUD	1.43860000	2026-02-02	2026-02-03 15:14:06.74827
USD	AWG	1.79000000	2026-02-02	2026-02-03 15:14:06.74827
USD	AZN	1.70150000	2026-02-02	2026-02-03 15:14:06.74827
USD	BAM	1.65540000	2026-02-02	2026-02-03 15:14:06.74827
USD	BBD	2.00000000	2026-02-02	2026-02-03 15:14:06.74827
USD	BDT	122.45600000	2026-02-02	2026-02-03 15:14:06.74827
USD	BGN	1.60410000	2026-02-02	2026-02-03 15:14:06.74827
USD	BHD	0.37600000	2026-02-02	2026-02-03 15:14:06.74827
USD	BIF	2969.40300000	2026-02-02	2026-02-03 15:14:06.74827
USD	BMD	1.00000000	2026-02-02	2026-02-03 15:14:06.74827
USD	BND	1.27220000	2026-02-02	2026-02-03 15:14:06.74827
USD	BOB	6.95320000	2026-02-02	2026-02-03 15:14:06.74827
USD	BRL	5.25970000	2026-02-02	2026-02-03 15:14:06.74827
USD	BSD	1.00000000	2026-02-02	2026-02-03 15:14:06.74827
USD	BTN	91.52520000	2026-02-02	2026-02-03 15:14:06.74827
USD	BWP	13.47560000	2026-02-02	2026-02-03 15:14:06.74827
USD	BYN	2.86360000	2026-02-02	2026-02-03 15:14:06.74827
USD	BZD	2.00000000	2026-02-02	2026-02-03 15:14:06.74827
USD	CAD	1.36720000	2026-02-02	2026-02-03 15:14:06.74827
USD	CDF	2186.12330000	2026-02-02	2026-02-03 15:14:06.74827
USD	CHF	0.77860000	2026-02-02	2026-02-03 15:14:06.74827
USD	CLF	0.02206000	2026-02-02	2026-02-03 15:14:06.74827
USD	CLP	872.07120000	2026-02-02	2026-02-03 15:14:06.74827
USD	CNH	6.94310000	2026-02-02	2026-02-03 15:14:06.74827
USD	CNY	6.95190000	2026-02-02	2026-02-03 15:14:06.74827
USD	COP	3683.69820000	2026-02-02	2026-02-03 15:14:06.74827
USD	CRC	497.43370000	2026-02-02	2026-02-03 15:14:06.74827
USD	CUP	24.00000000	2026-02-02	2026-02-03 15:14:06.74827
USD	CVE	93.32610000	2026-02-02	2026-02-03 15:14:06.74827
USD	CZK	20.56060000	2026-02-02	2026-02-03 15:14:06.74827
USD	DJF	177.72100000	2026-02-02	2026-02-03 15:14:06.74827
USD	DKK	6.31270000	2026-02-02	2026-02-03 15:14:06.74827
USD	DOP	63.26420000	2026-02-02	2026-02-03 15:14:06.74827
USD	DZD	129.86250000	2026-02-02	2026-02-03 15:14:06.74827
USD	EGP	47.08520000	2026-02-02	2026-02-03 15:14:06.74827
USD	ERN	15.00000000	2026-02-02	2026-02-03 15:14:06.74827
USD	ETB	154.39050000	2026-02-02	2026-02-03 15:14:06.74827
USD	EUR	0.84630000	2026-02-02	2026-02-03 15:14:06.74827
USD	FJD	2.22760000	2026-02-02	2026-02-03 15:14:06.74827
USD	FKP	0.73170000	2026-02-02	2026-02-03 15:14:06.74827
USD	FOK	6.31280000	2026-02-02	2026-02-03 15:14:06.74827
USD	GBP	0.73160000	2026-02-02	2026-02-03 15:14:06.74827
USD	GEL	2.69120000	2026-02-02	2026-02-03 15:14:06.74827
USD	GGP	0.73170000	2026-02-02	2026-02-03 15:14:06.74827
USD	GHS	10.96120000	2026-02-02	2026-02-03 15:14:06.74827
USD	GIP	0.73170000	2026-02-02	2026-02-03 15:14:06.74827
USD	GMD	74.11910000	2026-02-02	2026-02-03 15:14:06.74827
USD	GNF	8753.81670000	2026-02-02	2026-02-03 15:14:06.74827
USD	GTQ	7.69290000	2026-02-02	2026-02-03 15:14:06.74827
USD	GYD	209.25920000	2026-02-02	2026-02-03 15:14:06.74827
USD	HKD	7.81080000	2026-02-02	2026-02-03 15:14:06.74827
USD	HNL	26.47900000	2026-02-02	2026-02-03 15:14:06.74827
USD	HRK	6.37700000	2026-02-02	2026-02-03 15:14:06.74827
USD	HTG	130.89360000	2026-02-02	2026-02-03 15:14:06.74827
USD	HUF	322.47130000	2026-02-02	2026-02-03 15:14:06.74827
USD	IDR	16806.05810000	2026-02-02	2026-02-03 15:14:06.74827
USD	ILS	3.10110000	2026-02-02	2026-02-03 15:14:06.74827
USD	IMP	0.73170000	2026-02-02	2026-02-03 15:14:06.74827
USD	INR	91.52400000	2026-02-02	2026-02-03 15:14:06.74827
USD	IQD	1310.33290000	2026-02-02	2026-02-03 15:14:06.74827
USD	IRR	1102228.97160000	2026-02-02	2026-02-03 15:14:06.74827
USD	ISK	122.36090000	2026-02-02	2026-02-03 15:14:06.74827
USD	JEP	0.73170000	2026-02-02	2026-02-03 15:14:06.74827
USD	JMD	157.15860000	2026-02-02	2026-02-03 15:14:06.74827
USD	JOD	0.70900000	2026-02-02	2026-02-03 15:14:06.74827
USD	JPY	155.34370000	2026-02-02	2026-02-03 15:14:06.74827
USD	KES	128.97580000	2026-02-02	2026-02-03 15:14:06.74827
USD	KGS	87.44130000	2026-02-02	2026-02-03 15:14:06.74827
USD	KHR	4017.46290000	2026-02-02	2026-02-03 15:14:06.74827
USD	KID	1.43870000	2026-02-02	2026-02-03 15:14:06.74827
USD	KMF	416.39160000	2026-02-02	2026-02-03 15:14:06.74827
USD	KRW	1451.96070000	2026-02-02	2026-02-03 15:14:06.74827
USD	KWD	0.30700000	2026-02-02	2026-02-03 15:14:06.74827
USD	KYD	0.83330000	2026-02-02	2026-02-03 15:14:06.74827
USD	KZT	504.87040000	2026-02-02	2026-02-03 15:14:06.74827
USD	LAK	21726.33800000	2026-02-02	2026-02-03 15:14:06.74827
USD	LBP	89500.00000000	2026-02-02	2026-02-03 15:14:06.74827
USD	LKR	309.35090000	2026-02-02	2026-02-03 15:14:06.74827
USD	LRD	183.50180000	2026-02-02	2026-02-03 15:14:06.74827
USD	LSL	16.06710000	2026-02-02	2026-02-03 15:14:06.74827
USD	LYD	6.28150000	2026-02-02	2026-02-03 15:14:06.74827
USD	MAD	9.13520000	2026-02-02	2026-02-03 15:14:06.74827
USD	MDL	16.88540000	2026-02-02	2026-02-03 15:14:06.74827
USD	MGA	4429.37750000	2026-02-02	2026-02-03 15:14:06.74827
USD	MKD	51.73420000	2026-02-02	2026-02-03 15:14:06.74827
USD	MMK	2104.44400000	2026-02-02	2026-02-03 15:14:06.74827
USD	MNT	3546.05740000	2026-02-02	2026-02-03 15:14:06.74827
USD	MOP	8.04540000	2026-02-02	2026-02-03 15:14:06.74827
USD	MRU	39.94130000	2026-02-02	2026-02-03 15:14:06.74827
USD	MUR	45.68800000	2026-02-02	2026-02-03 15:14:06.74827
USD	MVR	15.45700000	2026-02-02	2026-02-03 15:14:06.74827
USD	MWK	1743.78910000	2026-02-02	2026-02-03 15:14:06.74827
USD	MXN	17.39800000	2026-02-02	2026-02-03 15:14:06.74827
USD	MYR	3.94200000	2026-02-02	2026-02-03 15:14:06.74827
USD	MZN	63.54150000	2026-02-02	2026-02-03 15:14:06.74827
USD	NAD	16.06710000	2026-02-02	2026-02-03 15:14:06.74827
USD	NGN	1389.02700000	2026-02-02	2026-02-03 15:14:06.74827
USD	NIO	36.89900000	2026-02-02	2026-02-03 15:14:06.74827
USD	NOK	9.69480000	2026-02-02	2026-02-03 15:14:06.74827
USD	NPR	146.44030000	2026-02-02	2026-02-03 15:14:06.74827
USD	NZD	1.66460000	2026-02-02	2026-02-03 15:14:06.74827
USD	OMR	0.38450000	2026-02-02	2026-02-03 15:14:06.74827
USD	PAB	1.00000000	2026-02-02	2026-02-03 15:14:06.74827
USD	PEN	3.36780000	2026-02-02	2026-02-03 15:14:06.74827
USD	PGK	4.29900000	2026-02-02	2026-02-03 15:14:06.74827
USD	PHP	58.90570000	2026-02-02	2026-02-03 15:14:06.74827
USD	PKR	280.06730000	2026-02-02	2026-02-03 15:14:06.74827
USD	PLN	3.57090000	2026-02-02	2026-02-03 15:14:06.74827
USD	PYG	6711.53310000	2026-02-02	2026-02-03 15:14:06.74827
USD	QAR	3.64000000	2026-02-02	2026-02-03 15:14:06.74827
USD	RON	4.30560000	2026-02-02	2026-02-03 15:14:06.74827
USD	RSD	99.25810000	2026-02-02	2026-02-03 15:14:06.74827
USD	RUB	76.73180000	2026-02-02	2026-02-03 15:14:06.74827
USD	RWF	1459.93370000	2026-02-02	2026-02-03 15:14:06.74827
USD	SAR	3.75000000	2026-02-02	2026-02-03 15:14:06.74827
USD	SBD	7.94080000	2026-02-02	2026-02-03 15:14:06.74827
USD	SCR	14.75580000	2026-02-02	2026-02-03 15:14:06.74827
USD	SDG	454.25780000	2026-02-02	2026-02-03 15:14:06.74827
USD	SEK	8.96310000	2026-02-02	2026-02-03 15:14:06.74827
USD	SGD	1.27200000	2026-02-02	2026-02-03 15:14:06.74827
USD	SHP	0.73170000	2026-02-02	2026-02-03 15:14:06.74827
USD	SLE	24.32090000	2026-02-02	2026-02-03 15:14:06.74827
USD	SLL	24320.94650000	2026-02-02	2026-02-03 15:14:06.74827
USD	SOS	571.68540000	2026-02-02	2026-02-03 15:14:06.74827
USD	SRD	38.10990000	2026-02-02	2026-02-03 15:14:06.74827
USD	SSP	4716.16560000	2026-02-02	2026-02-03 15:14:06.74827
USD	STN	20.73630000	2026-02-02	2026-02-03 15:14:06.74827
USD	SYP	112.53570000	2026-02-02	2026-02-03 15:14:06.74827
USD	SZL	16.06710000	2026-02-02	2026-02-03 15:14:06.74827
USD	THB	31.58510000	2026-02-02	2026-02-03 15:14:06.74827
USD	TJS	9.31870000	2026-02-02	2026-02-03 15:14:06.74827
USD	TMT	3.50010000	2026-02-02	2026-02-03 15:14:06.74827
USD	TND	2.85460000	2026-02-02	2026-02-03 15:14:06.74827
USD	TOP	2.36470000	2026-02-02	2026-02-03 15:14:06.74827
USD	TRY	43.49740000	2026-02-02	2026-02-03 15:14:06.74827
USD	TTD	6.76560000	2026-02-02	2026-02-03 15:14:06.74827
USD	TVD	1.43870000	2026-02-02	2026-02-03 15:14:06.74827
USD	TWD	31.60800000	2026-02-02	2026-02-03 15:14:06.74827
USD	TZS	2550.46220000	2026-02-02	2026-02-03 15:14:06.74827
USD	UAH	42.99170000	2026-02-02	2026-02-03 15:14:06.74827
USD	UGX	3561.27960000	2026-02-02	2026-02-03 15:14:06.74827
USD	UYU	38.99790000	2026-02-02	2026-02-03 15:14:06.74827
USD	UZS	12234.02240000	2026-02-02	2026-02-03 15:14:06.74827
USD	VES	372.10570000	2026-02-02	2026-02-03 15:14:06.74827
USD	VND	25955.12330000	2026-02-02	2026-02-03 15:14:06.74827
USD	VUV	119.70170000	2026-02-02	2026-02-03 15:14:06.74827
USD	WST	2.68640000	2026-02-02	2026-02-03 15:14:06.74827
USD	XAF	555.18870000	2026-02-02	2026-02-03 15:14:06.74827
USD	XCD	2.70000000	2026-02-02	2026-02-03 15:14:06.74827
USD	XCG	1.79000000	2026-02-02	2026-02-03 15:14:06.74827
USD	XDR	0.72580000	2026-02-02	2026-02-03 15:14:06.74827
USD	XOF	555.18870000	2026-02-02	2026-02-03 15:14:06.74827
USD	XPF	101.00020000	2026-02-02	2026-02-03 15:14:06.74827
USD	YER	238.60390000	2026-02-02	2026-02-03 15:14:06.74827
USD	ZAR	16.06640000	2026-02-02	2026-02-03 15:14:06.74827
USD	ZMW	19.67850000	2026-02-02	2026-02-03 15:14:06.74827
USD	ZWG	25.61920000	2026-02-02	2026-02-03 15:14:06.74827
USD	ZWL	25.61920000	2026-02-02	2026-02-03 15:14:06.74827
\.


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

\unrestrict 6ONrdjpGaXC8m9l6TnieFgyqeohu1BUWIFz7O75Nx5C7AkqdDO0c3kP6a9Af0O9

