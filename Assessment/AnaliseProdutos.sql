/*
Tabela
	Product: Tabela que contem todos os produtos.
	ProductSubcategory: Tabela de subcategoria dos produtos
	ProductCategory: Tabela de categoria dos produtos

Na query abaixo analisamos as tabelas de produtos. A tabela de Product em si, possui a granularidade de um item por linha.
Cada produto, possui a sua sua subcategoria e sua categoria, ambas em suas respectivas tabelas.
A query abaixo fizemos a consulta do produto 'Hitch Rack - 4-Bike', e relacionamos as tabelas de categoria e subcategoria para trazer o nome de cada uma.
*/

SELECT
	ProductCategory.name as CategoriaDoProduto
	,ProductSubcategory.NAME as SubCategoriaDoProduto
	,Product.name as NomeDoProduto
FROM 
	AdventureWorks2014.Product
		inner join AdventureWorks2014.ProductSubcategory on Product.ProductSubcategoryID = ProductSubcategory.ProductSubcategoryID
		inner join AdventureWorks2014.ProductCategory on ProductSubcategory.PRODUCTCATEGORYID = ProductCategory.productcategoryid
WHERE
	Product.name = 'Hitch Rack - 4-Bike'
limit 100;

/*
CategoriaDoProduto|SubCategoriaDoProduto|NomeDoProduto      |
------------------|---------------------|-------------------|
Accessories       |Bike Racks           |Hitch Rack - 4-Bike|

Também listamos todos os produtos da categoria acessorios com o seu preço.
*/

SELECT
	ProductCategory.name as CategoriaDoProduto
	,ProductSubcategory.NAME as SubCategoriaDoProduto
	,Product.name as NomeDoProduto
	,Product.ListPrice
FROM 
	AdventureWorks2014.Product
		inner join AdventureWorks2014.ProductSubcategory on Product.ProductSubcategoryID = ProductSubcategory.ProductSubcategoryID
		inner join AdventureWorks2014.ProductCategory on ProductSubcategory.PRODUCTCATEGORYID = ProductCategory.productcategoryid
WHERE
	ProductCategory.Name = 'Accessories'
limit 100;

/*
CategoriaDoProduto|SubCategoriaDoProduto|NomeDoProduto               |ListPrice|
------------------|---------------------|----------------------------|---------|
Accessories       |Bike Racks           |Hitch Rack - 4-Bike         | 120.0000|
Accessories       |Bike Stands          |All-Purpose Bike Stand      | 159.0000|
Accessories       |Bottles and Cages    |Water Bottle - 30 oz.       |   4.9900|
Accessories       |Bottles and Cages    |Mountain Bottle Cage        |   9.9900|
Accessories       |Bottles and Cages    |Road Bottle Cage            |   8.9900|
Accessories       |Cleaners             |Bike Wash - Dissolver       |   7.9500|
Accessories       |Fenders              |Fender Set - Mountain       |  21.9800|
Accessories       |Helmets              |Sport-100 Helmet, Red       |  34.9900|
Accessories       |Helmets              |Sport-100 Helmet, Black     |  34.9900|
Accessories       |Helmets              |Sport-100 Helmet, Blue      |  34.9900|
Accessories       |Hydration Packs      |Hydration Pack - 70 oz.     |  54.9900|
Accessories       |Lights               |Taillights - Battery-Powered|  13.9900|
Accessories       |Lights               |Headlights - Dual-Beam      |  34.9900|
Accessories       |Lights               |Headlights - Weatherproof   |  44.9900|
Accessories       |Locks                |Cable Lock                  |  25.0000|
Accessories       |Panniers             |Touring-Panniers, Large     | 125.0000|
Accessories       |Pumps                |Minipump                    |  19.9900|
Accessories       |Pumps                |Mountain Pump               |  24.9900|
Accessories       |Tires and Tubes      |Patch Kit/8 Patches         |   2.2900|
Accessories       |Tires and Tubes      |Mountain Tire Tube          |   4.9900|
Accessories       |Tires and Tubes      |Road Tire Tube              |   3.9900|
Accessories       |Tires and Tubes      |Touring Tire Tube           |   4.9900|
Accessories       |Tires and Tubes      |LL Mountain Tire            |  24.9900|
Accessories       |Tires and Tubes      |ML Mountain Tire            |  29.9900|
Accessories       |Tires and Tubes      |HL Mountain Tire            |  35.0000|
Accessories       |Tires and Tubes      |LL Road Tire                |  21.4900|
Accessories       |Tires and Tubes      |ML Road Tire                |  24.9900|
Accessories       |Tires and Tubes      |HL Road Tire                |  32.6000|
Accessories       |Tires and Tubes      |Touring Tire                |  28.9900|

São 29 produtos de 12 subcategorias.
*/

SELECT distinct
	ProductSubcategory.name as SubCategoriaDoProduto
FROM 
	AdventureWorks2014.Product
		inner join AdventureWorks2014.ProductSubcategory on Product.ProductSubcategoryID = ProductSubcategory.ProductSubcategoryID
		inner join AdventureWorks2014.ProductCategory on ProductSubcategory.PRODUCTCATEGORYID = ProductCategory.productcategoryid
WHERE
	ProductCategory.Name = 'Accessories'
limit 100;

/*
SubCategoriaDoProduto|
---------------------|
Bike Racks           |
Bike Stands          |
Bottles and Cages    |
Cleaners             |
Fenders              |
Helmets              |
Hydration Packs      |
Lights               |
Locks                |
Panniers             |
Pumps                |
Tires and Tubes      |

*/