/*
Tabela utilizada:
	SalesOrderHeader
	SalesTerritory

Query: 
	QUery que pega a participação dos paises nas ordens de venda	
*/	


-- PARTICIPAÇÃO DOS TERRITORIOS NAS VENDAS
select
Name as Territorio,
CONCAT(round((COUNT(1)/(select count(1) from AdventureWorks2014.SalesOrderHeader)*100),2),'%') as Porcentagem
from
AdventureWorks2014.SalesTerritory
inner join AdventureWorks2014.SalesOrderHeader
on SalesTerritory.TerritoryID = SalesOrderHeader.TerritoryID
GROUP by name
UNION ALL
SELECT 'TOTAL' name, CONCAT(round((COUNT(1)/(select count(1) from AdventureWorks2014.SalesOrderHeader)*100),2),'%')
FROM AdventureWorks2014.SalesOrderHeader
