/*
Tabelas
	Currency: Tabela que contem os tipos de moeadas e suas siglas.
	CountryRegionCurrency: Tabela que contem os paises relacionados com as suas moedas.
	CountryRegion: Tabela que contem paises e suas siglas

Na query abaixo relacionamos as tabelas para podermos saber quais são os paises que usam a moeda de dolar americano.
*/

SELECT
	Currency.CurrencyCode
	,Currency.Name
	,CountryRegion.CountryRegionCode
	,CountryRegion.Name
FROM 
	AdventureWorks2014.Currency
		inner join AdventureWorks2014.CountryRegionCurrency on Currency.CurrencyCode = CountryRegionCurrency.CurrencyCode
		inner join AdventureWorks2014.CountryRegion on CountryRegionCurrency.CountryRegionCode = CountryRegion.CountryRegionCode 
WHERE
	Currency.CurrencyCode = 'USD'
limit 200;

/*
CurrencyCode|Name     |CountryRegionCode|Name         |
------------|---------|-----------------|-------------|
USD         |US Dollar|EC               |Ecuador      |
USD         |US Dollar|US               |United States|

Podemos ver que neste banco de dados apenas temos dois países que utilizam o dolar americano.
*/



--Nesta consulta, usamos as tabelas CountryRegionCurrency e CountryRegion para descobrir qual é o tipo da moeda da Agerntina.


SELECT
	CountryRegion.Name
	,CountryRegion.CountryRegionCode
	,CountryRegionCurrency.CurrencyCode
	,Currency.Name
FROM 
	AdventureWorks2014.CountryRegionCurrency
		inner join AdventureWorks2014.CountryRegion on CountryRegionCurrency.CountryRegionCode = CountryRegion.CountryRegionCode
		inner join AdventureWorks2014.Currency on CountryRegionCurrency.CurrencyCode = Currency.CurrencyCode
WHERE
	CountryRegion.Name = 'Argentina'
limit 100;

/*

Name     |CountryRegionCode|CurrencyCode|Name          |
---------|-----------------|------------|--------------|
Argentina|AR               |ARS         |Argentine Peso|

Atráves deste resultado, vamos verificar na tabela CurrencyRate, para descobrir a taxa e cambio entre o dolar americano e a moeda argentina.
A tabela de taxa de cambio CurrencyRate, possui a granularidade de data, ou seja, cada dia representa um dia com a sua taxa de cambio do dia.
A consulta abaixo apresenta os primeiros cinco dias de junho de 2011.
*/

SELECT *
FROM 
	AdventureWorks2014.CurrencyRate
where
	CurrencyRate.FromCurrencyCode = 'USD'
	and CurrencyRate.ToCurrencyCode = 'ARS'
	and CurrencyRate.CurrencyRateDate between '2011-06-01 00:00:00' and '2011-06-05 00:00:00'
limit 100;


/*
CurrencyRateID|CurrencyRateDate   |FromCurrencyCode|ToCurrencyCode|AverageRate|EndOfDayRate|ModifiedDate       |
--------------|-------------------|----------------|--------------|-----------|------------|-------------------|
            14|2011-06-01 00:00:00|USD             |ARS           |     1.0000|      0.9991|2011-06-01 00:00:00|
            27|2011-06-02 00:00:00|USD             |ARS           |     1.0000|      1.0004|2011-06-02 00:00:00|
            40|2011-06-03 00:00:00|USD             |ARS           |     1.0000|      1.0000|2011-06-03 00:00:00|
            53|2011-06-04 00:00:00|USD             |ARS           |     1.0000|      1.0004|2011-06-04 00:00:00|
            66|2011-06-05 00:00:00|USD             |ARS           |     1.0000|      0.9995|2011-06-05 00:00:00|

Vamos utilizar a coluna EndOfDayRate para fazer uma média do mês de junho.
*/

SELECT
	MONTHNAME(CurrencyRate.CurrencyRateDate) as Mes
	,AVG(CurrencyRate.EndOfDayRate) as Media
FROM 
	AdventureWorks2014.CurrencyRate
where
	CurrencyRate.FromCurrencyCode = 'USD'
	and CurrencyRate.ToCurrencyCode = 'ARS'
	and CurrencyRate.CurrencyRateDate between '2011-06-01 00:00:00' and '2011-06-30 00:00:00'
group BY
	1
limit 100;

/*
Mes |Media     |
----|----------|
June|0.99982667|
*/


