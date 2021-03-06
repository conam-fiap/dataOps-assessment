/*
Tabelas
	Address				-	Endereço das pessoas (fornecedores, empregados, clientes).
	AddressType			-	Tipos de endereços da tabela Address (Endereço de cobrança, entrega etc).
	BusinessEntityAddress		-	Tabela que cruza os endereços com seus "donos" (Fornecedores, clientes, empregados).
	CountryRegion			-	Tabela de domínio que contém os países.
	StateProvince			-	Tabela de domínio que armazena os estados.

AddressType:
*/

SELECT
	*
FROM 
	AddressType;
/*
|AddressTypeID|Name                                                                                                |rowguid                                                         |ModifiedDate       |
|-------------|----------------------------------------------------------------------------------------------------|----------------------------------------------------------------|-------------------|
|1            |Billing                                                                                             |B84F78B1-4EFE-4A0E-8CB7-70E9F112F886                            |2008-04-30 00:00:00|
|2            |Home                                                                                                |41BC2FF6-F0FC-475F-8EB9-CEC0805AA0F2                            |2008-04-30 00:00:00|
|3            |Main Office                                                                                         |8EEEC28C-07A2-4FB9-AD0A-42D4A0BBC575                            |2008-04-30 00:00:00|
|4            |Primary                                                                                             |24CB3088-4345-47C4-86C5-17B535133D1E                            |2008-04-30 00:00:00|
|5            |Shipping                                                                                            |B29DA3F8-19A3-47DA-9DAA-15C84F4A83A5                            |2008-04-30 00:00:00|
|6            |Archive                                                                                             |A67F238A-5BA2-444B-966C-0467ED9C427F                            |2008-04-30 00:00:00|

Visualizando a tabela de endereços:
*/
SELECT
	*
FROM 
	Address
LIMIT 5;

/*
|AddressID  |AddressLine1                                                |AddressLine2                                                |City                          |StateProvinceID|PostalCode     |SpatialLocation|rowguid                                                         |ModifiedDate       |
|-----------|------------------------------------------------------------|------------------------------------------------------------|------------------------------|---------------|---------------|---------------|----------------------------------------------------------------|-------------------|
|1          |1970 Napa Ct.                                               |                                                            |Bothell                       |79             |98011          |POINT (-122.164|9AADCB0D-36CF-483F-84D8-585C2D4EC6E9                            |2007-12-04 00:00:00|
|2          |9833 Mt. Dias Blv.                                          |                                                            |Bothell                       |79             |98011          |POINT (-122.250|32A54B9E-E034-4BFB-B573-A71CDE60D8C0                            |2008-11-30 00:00:00|
|3          |7484 Roundtree Drive                                        |                                                            |Bothell                       |79             |98011          |POINT (-122.274|4C506923-6D1B-452C-A07C-BAA6F5B142A4                            |2013-03-07 00:00:00|
|4          |9539 Glenside Dr                                            |                                                            |Bothell                       |79             |98011          |POINT (-122.335|E5946C78-4BCC-477F-9FA1-CC09DE16A880                            |2009-02-03 00:00:00|
|5          |1226 Shoe St.                                               |                                                            |Bothell                       |79             |98011          |POINT (-122.091|FBAFF937-4A97-4AF0-81FD-B849900E9BB0                            |2008-12-19 00:00:00|


Contagens de endereços por Tipo:
*/

SELECT 
	at.Name,
	COUNT(*) AddressQty
FROM 
	BusinessEntityAddress bea
INNER JOIN
	AddressType at
	ON bea.AddressTypeID = at.AddressTypeID 
INNER JOIN 
	Address a
	ON a.AddressID = bea.AddressID
GROUP BY 
	at.Name;

/*
|Name                                                                                                |AddressQty            |
|----------------------------------------------------------------------------------------------------|----------------------|
|Home                                                                                                |18774                 |
|Main Office                                                                                         |805                   |
|Shipping                                                                                            |35                    |

CountryRegion:
*/

SELECT 
	* 
FROM 
	CountryRegion cr;

/*
|CountryRegionCode|Name                                                                                                |ModifiedDate       |
|-----------------|----------------------------------------------------------------------------------------------------|-------------------|
|AD               |Andorra                                                                                             |2008-04-30 00:00:00|
|AE               |United Arab Emirates                                                                                |2008-04-30 00:00:00|
|AF               |Afghanistan                                                                                         |2008-04-30 00:00:00|
|AG               |Antigua and Barbuda                                                                                 |2008-04-30 00:00:00|
|AI               |Anguilla                                                                                            |2008-04-30 00:00:00|
|AL               |Albania                                                                                             |2008-04-30 00:00:00|
|AM               |Armenia                                                                                             |2008-04-30 00:00:00|



StateProvince:
	Recuperando quais países possuem estados cadastrados na tabela:
*/

SELECT 
	DISTINCT 
	CountryRegionCode 
FROM
	StateProvince sp;

/*
|CountryRegionCode|
|-----------------|
|AS               |
|AU               |
|CA               |
|DE               |
|FM               |
|FR               |
|GB               |
|MH               |
|MP               |
|PW               |
|US               |
|VI               |


	Recuperando os estados da Australia cadastrados:
*/
SELECT 
	sp.StateProvinceID,
	sp.StateProvinceCode,
	sp.Name StateName,
	cr.Name 
FROM 
	StateProvince sp
INNER JOIN
	CountryRegion cr
	ON sp.CountryRegionCode = cr.CountryRegionCode
WHERE 
	cr.Name = 'Australia';

/*
|StateProvinceID|StateProvinceCode|StateName                                                                                           |Name                                                                                                |
|---------------|-----------------|----------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------|
|50             |NSW              |New South Wales                                                                                     |Australia                                                                                           |
|64             |QLD              |Queensland                                                                                          |Australia                                                                                           |
|66             |SA               |South Australia                                                                                     |Australia                                                                                           |
|71             |TAS              |Tasmania                                                                                            |Australia                                                                                           |
|77             |VIC              |Victoria                                                                                            |Australia                                                                                           |

*/