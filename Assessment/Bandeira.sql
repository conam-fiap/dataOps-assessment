/*
Tabela utilizada:
	CreditCard

Query: 
	QUery que pega a porcentagem de utilização das bandeiras
	
*/
-- PORCENTAGEN DE UTILIZAÇÃO DAS BANDEIRAS
SELECT
CardType as Bandeira,
CONCAT(ROUND((COUNT(1)/(select COUNT(1) FROM AdventureWorks2014.CreditCard)*100),0),'%') as Porcentagem
FROM
AdventureWorks2014.CreditCard
group by CardType
UNION ALL
SELECT 'TOTAL' CardType , CONCAT(ROUND((COUNT(1)/(select COUNT(1) FROM AdventureWorks2014.CreditCard)*100),0),'%')
FROM AdventureWorks2014.CreditCard