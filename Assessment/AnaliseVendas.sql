/*
Tabelas
	SalesOrderHeader 	- 	Tabela que contepla a orde de venda.
	Person					Qualquer ser humando envolvido no negócio da AdventureWorks (Clientes, funcionários, fornecedores).
	SalesOrderDetail	-	Tabela que contem o detalhamento dos itens da venda.
	productid 			-	Tabela com os produtos.


Através do relacionamento das tabelas mencionadas acima, podemos verificar as vendas de um determinado vendedor.
A query abaixo retorna as vendas, da funcionaria Linda Mitchell, realizadas no dia 31/05/2011.
*/
SELECT
	date(SalesOrderHeader.orderdate) AS DATA
	,SalesOrderHeader.salesorderid AS IdDaVenda
	,concat(Person.firstname, ' ', Person.lastname) AS NomeVendedor
	,sum(ROUND(SalesOrderDetail.unitprice, 2)) AS ValorTotal
FROM
	AdventureWorks2014.SalesOrderHeader
		INNER JOIN AdventureWorks2014.Person ON SalesOrderHeader.salespersonid = Person.businessentityid
		INNER JOIN AdventureWorks2014.SalesOrderDetail ON SalesOrderDetail.salesorderid = SalesOrderHeader.salesorderid
WHERE
	Person.businessentityid = 276
	AND SalesOrderHeader.orderdate BETWEEN '2011-05-31 00:00:00' AND '2011-05-31 23:59:59'
GROUP BY
	1,2,3
LIMIT 100;


/*
DATA      |IdDaVenda|NomeVendedor  |ValorTotal|
----------|---------|--------------|----------|
2011-05-31|    43663|Linda Mitchell|    419.46|
2011-05-31|    43666|Linda Mitchell|   4637.03|

Podemos notar que ela realizou duas vendas nesta data.

Está query podemos ver o detalhamento das vendas.
*/
 SELECT
	date(SalesOrderHeader.orderdate) AS DATA
	,SalesOrderHeader.salesorderid AS IdDaVenda
	,concat(Person.firstname, ' ', Person.lastname) AS NomeVendedor
	,Product.Name AS NomeProduto
	,ROUND(SalesOrderDetail.unitprice, 2) AS Valor
FROM
	AdventureWorks2014.SalesOrderHeader
		INNER JOIN AdventureWorks2014.Person ON SalesOrderHeader.salespersonid = Person.businessentityid
		INNER JOIN AdventureWorks2014.SalesOrderDetail ON SalesOrderDetail.salesorderid = SalesOrderHeader.salesorderid
		INNER JOIN AdventureWorks2014.Product ON SalesOrderDetail.productid = Product.productid 
WHERE
	Person.businessentityid = 276
	AND SalesOrderHeader.orderdate BETWEEN '2011-05-31 00:00:00' AND '2011-05-31 23:59:59'
LIMIT 100;


/*
DATA      |IdDaVenda|NomeVendedor  |NomeProduto            |Valor  |
----------|---------|--------------|-----------------------|-------|
2011-05-31|    43663|Linda Mitchell|Road-650 Red, 60       | 419.46|
2011-05-31|    43666|Linda Mitchell|Road-650 Red, 52       | 419.46|
2011-05-31|    43666|Linda Mitchell|Road-150 Red, 56       |2146.96|
2011-05-31|    43666|Linda Mitchell|ML Road Frame - Red, 48| 356.90|
2011-05-31|    43666|Linda Mitchell|Road-450 Red, 44       | 874.79|
2011-05-31|    43666|Linda Mitchell|Road-650 Black, 44     | 419.46|
2011-05-31|    43666|Linda Mitchell|Road-650 Black, 60     | 419.46|
*/