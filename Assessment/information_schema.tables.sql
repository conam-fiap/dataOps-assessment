-- Consultando dicionário de dados para obter informações adicionais sobre as tabelas.
SELECT
	table_name,
	table_comment
FROM 
	information_schema.TABLES t 
WHERE
	TABLE_SCHEMA = 'AdventureWorks2014'
AND
	TABLE_NAME IN 
	(
	'BusinessEntity',
	'BusinessEntityContact',
	'Customer',
	'ContactType',
	'Person',
	'Employee',
	'Password',
	'EmailAddress',
	'PersonPhone',
	'PhoneNumberType',
	'Address',
	'AddressType',
	'BusinessEntityAddress',
	'Vendor'
	);

