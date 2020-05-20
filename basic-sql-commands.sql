 -- TIPOS DE DADOS
 
 -- STRINGS
char(n) -- Tamanho fixo, completado com espaços em bracos	8,000 caracteres	Tamanho Definido
varchar(n)	-- Tamanho variável com limite	8,000 caracteres	2 bytes + número de caracteres
varchar(max) -- Tamanho variável com limite	1,073,741,824 caracteres	2 bytes + número de caracteres
text -- Tamanho variável	2GB de dados (texto)	4 bytes + número de caracteres
nchar -- Tamanho fixo com espaços em bracos	4,000 caracteres	Tamanho definido x 2
nvarchar -- Tamanho variável	4,000 caracteres	 
nvarchar(max) -- Tamanho variável	536,870,912 caracteres	 
ntext -- Tamanho variável	2GB de texto	 
binary(n) -- Tamanho fixo (binário)	8,000 bytes	 
varbinary -- Tamanho variável (binário)	8,000 bytes	 
varbinary(max) -- Tamanho variável (binário)	2GB	 
image -- Tamanho variável (binário)	2GB

-- NUMÉRICOS
bit -- Número Inteiro que pode ser 0, 1 ou NULL	 
tinyint -- Permite números inteiros de 0 a 255	1 byte
smallint -- Permite números inteiros entre -32,768 e 32,767	2 bytes
int -- Permite números inteiros entre -2,147,483,648 e 2,147,483,647	4 bytes
bigint -- Permite números inteiros entre -9,223,372,036,854,775,808 e 9,223,372,036,854,775,8078 bytes
decimal(p,s) -- Precisão de número flutuante e número de escala. Permite número de -10^38 +1 a 10^38 –1. 
numeric(p,s) -- Precisão de número flutuante e número de escala. Permite número de -10^38 +1 a 10^38 –1.
smallmoney -- Tipo de "Moeda" de -214,748.3648 a 214,748.3647	4 bytes
money -- Tipo de "Moeda" de -922,337,203,685,477.5808 a 922,337,203,685,477.5807	8 bytes
float(n) -- Precisão de número flutuante de -1.79E + 308 a 1.79E + 308.
real -- Precisão de número flutuante de -3,40E + 38 a 3,40E + 38	4 bytes

-- DATA
datetime -- De 1 de janeiro de 1753 a 31 de dezembro de 9999 com uma precisão de 3,33 milisegundos	8 bytes
datetime2 -- De 1º de janeiro de 0001 a 31 de dezembro de 9999 com precisão de 100 nanossegundos	6-8 bytes
smalldatetime -- De 1 de janeiro de 1900 a 6 de junho de 2079 com precisão de 1 minuto	4 bytes
date -- Armazena apenas uma data. De 1 de janeiro de 0001 a 31 de dezembro de 9999	3 bytes
time -- Armazena um tempo apenas para uma precisão de 100 nanosegundos	3-5 bytes
datetimeoffset -- O mesmo que datetime2 com a adição de um deslocamento de fuso horário	8-10 bytes
timestamp -- Armazena um número único que é atualizado sempre que uma linha é criada ou modificada. O valor do timestamp é baseado em um relógio interno e não corresponde ao tempo real. Cada tabela pode ter apenas uma variável timestamp	 


-- EXEMPLOS

-- SELECT
SELECT * FROM Person.Person;
SELECT Title FROM Person.Person;
SELECT * FROM Person.EmailAddress;
SELECT FirstName, LastName FROM Person.Person;

-- DISTINCT
SELECT DISTINCT FirstName FROM Person.Person p ;
SELECT DISTINCT LastName FROM Person.Person p ;

-- WHERE
SELECT * FROM Person.Person p 
WHERE p.LastName = 'miller' and p.FirstName ='anna';

SELECT * FROM Production.Product p 
WHERE p.Color = 'blue' or p.Color = 'black';

SELECT * FROM Production.Product p 
WHERE p.ListPrice > 1500 and p.ListPrice < 5000;

SELECT * FROM Production.Product p 
WHERE p.Color <> 'black';

SELECT * FROM Production.Product p 
WHERE p.Weight >= 500 and p.Weight <= 700;

SELECT * FROM HumanResources.Employee e 
WHERE e.MaritalStatus = 'M' and e.SalariedFlag = 1;

SELECT BusinessEntityID FROM Person.Person p 
WHERE p.FirstName = 'Peter' and p.LastName = 'Krebs';

SELECT EmailAddress FROM Person.EmailAddress ea
WHERE ea.BusinessEntityID = 26;

-- COUNT 

SELECT COUNT(*)
FROM Person.Person p ;

SELECT COUNT(DISTINCT title)
FROM Person.Person p ;

SELECT COUNT(*) 
FROM Production.Product p ;

SELECT COUNT(size)
FROM Production.Product p ;

SELECT COUNT(DISTINCT size)
FROM  Production.Product p ;

-- TOP

SELECT TOP 10 *
FROM Production.Product p ;

-- ORDER BY

SELECT *
FROM Person.Person p
ORDER BY p.FirstName ASC ;

SELECT FirstName, LastName
FROM Person.Person p 
ORDER BY p.FirstName ASC , p.LastName DESC ;

SELECT FirstName, LastName
FROM Person.Person p 
ORDER BY p.MiddleName ASC ;

SELECT TOP 10 (ProductId)
FROM Production.Product p 
ORDER BY p.ListPrice DESC ;

SELECT TOP 4 Name, ProductNumber
FROM Production.Product p 
ORDER BY p.ProductID ASC ;

-- BETWEEN

SELECT * 
FROM Production.Product p 
WHERE p.ListPrice BETWEEN 1000 and 1500;

SELECT * 
FROM Production.Product p 
WHERE p.ListPrice NOT BETWEEN 1000 and 1500;

SELECT *
FROM HumanResources.Employee e 
WHERE e.HireDate BETWEEN '2009/01/01' and '2010/01/01'
ORDER BY HireDate ;

-- IN

SELECT *
FROM Person.Person p 
WHERE p.BusinessEntityID IN  (2, 7, 13);

SELECT *
FROM  Person.Person p 
WHERE p.BusinessEntityID NOT IN (2,7,13);

-- LIKE

SELECT * 
FROM Person.Person p 
WHERE p.FirstName LIKE 'ovi%';

SELECT *
FROM Person.Person p 
WHERE p.FirstName LIKE '%to';

SELECT *
FROM Person.Person p 
WHERE p.FirstName LIKE '%essa%';

SELECT *
FROM Person.Person p 
WHERE p.FirstName LIKE '%ro_';

-- ORTHER EXAMPLES

SELECT COUNT(ListPrice)
FROM Production.Product p 
WHERE p.ListPrice > 1500;

SELECT COUNT(LastName)
FROM Person.Person p 
WHERE P.LastName LIKE 'p%';

SELECT COUNT(DISTINCT(City))
FROM Person.Address a ;

SELECT DISTINCT (City)
FROM Person.Address a ;

SELECT COUNT(*)
FROM Production.Product p 
WHERE p.Color = 'RED' AND p.ListPrice BETWEEN 500 AND 1000;

SELECT COUNT(*)
FROM Production.Product p 
WHERE p.Name LIKE '%road%';

-- FUNCTIONS (MIN MAX SUM AVG)

SELECT TOP 10 SUM(linetotal) AS "Soma"
FROM Sales.SalesOrderDetail sod ;

SELECT TOP 10 MIN(linetotal) AS "Soma"
FROM Sales.SalesOrderDetail sod ;

SELECT TOP 10 MAX(linetotal) AS "Soma"
FROM Sales.SalesOrderDetail sod ;

SELECT TOP 10 AVG(linetotal) AS "Soma"
FROM Sales.SalesOrderDetail sod ;


-- GROUP BY

SELECT SpecialOfferID, SUM(UnitPrice) AS "SOMA"
FROM Sales.SalesOrderDetail sod 
GROUP BY SpecialOfferID ;

SELECT ProductId, COUNT(ProductId) AS "CONTAGEM"
FROM Sales.SalesOrderDetail sod 
GROUP BY ProductID ;

SELECT FirstName, COUNT(FirstName) AS "CONTAGEM_NOMES"
FROM Person.Person p 
GROUP BY FirstName ;

SELECT Color, AVG(ListPrice) AS "MEDIA_PRECO"
FROM Production.Product p 
WHERE p.Color = 'Silver'
GROUP BY Color ;

SELECT MiddleName, COUNT(MiddleName) AS "QTD"
FROM Person.Person p 
GROUP BY p.MiddleName ;

SELECT ProductID, AVG(OrderQty) as "MEDIA"
FROM Sales.SalesOrderDetail sod 
GROUP BY sod.ProductID ;

SELECT TOP 10 ProductID, SUM(LineTotal) as "MAXIMO"
FROM Sales.SalesOrderDetail sod 
GROUP BY sod.ProductID
ORDER BY SUM(LineTotal) DESC ;

SELECT ProductID, COUNT(ProductID) AS "CONTAGEM", AVG(OrderQty) AS "MEDIA"
FROM Production.WorkOrder wo 
GROUP BY wo.ProductID ;

-- HAVING 

SELECT FirstName, COUNT(FirstName) AS "qtd"
FROM Person.Person p 
GROUP BY p.FirstName 
HAVING COUNT(p.FirstName) > 10 ;

SELECT ProductID, SUM(LineTotal) AS "TOTAL"
FROM Sales.SalesOrderDetail sod 
GROUP BY sod.ProductID 
HAVING SUM(sod.LineTotal) BETWEEN 162000 AND 500000
ORDER BY SUM(sod.LineTotal) DESC ; 

SELECT FirstName, COUNT(FirstName) AS "QUANTIDADE"
FROM Person.Person p 
WHERE p.Title = 'Mr.'
GROUP BY p.FirstName 
HAVING COUNT(FirstName) > 10; 

SELECT StateProvinceID, COUNT(StateProvinceID) AS "QTD"
FROM Person.Address a 
GROUP BY a.StateProvinceID
HAVING COUNT(StateProvinceID) > 1000;

SELECT ProductID, AVG(LineTotal) AS "MEDIA"
FROM Sales.SalesOrderDetail sod 
GROUP BY ProductID 
HAVING AVG(LineTotal) < 1000000; 

-- AS

SELECT TOP 10 ListPrice as Preco
FROM Production.Product p ;

SELECT AVG(ListPrice) as "Preço Media"
FROM Production.Product p ;

SELECT FirstName as "Primeiro Nome", LastName as Sobrenome
FROM Person.Person p ;

SELECT ProductNumber as "Número do produto"
FROM Production.Product p ;

SELECT UnitPrice as "Preço Unitário"
FROM Sales.SalesOrderDetail sod ;

-- INNER JOIN

SELECT p.BusinessEntityID, p.FirstName, p.LastName, e.EmailAddress
FROM Person.Person p 
INNER JOIN Person.EmailAddress e 
ON p.BusinessEntityID = e.BusinessEntityID ;

SELECT p.Name, p.ListPrice, ps.Name AS "SubName"
FROM Production.Product p
INNER JOIN Production.ProductSubcategory ps 
ON p.ProductSubcategoryID = ps.ProductSubcategoryID ;

SELECT TOP 10 *
FROM Person.BusinessEntityAddress bea 
INNER JOIN Person.Address pa 
ON pa.AddressID = bea.AddressID ;

SELECT pp.BusinessEntityId, pt.name, pt.phoneNumberTypeId, pp.phonenumber
FROM Person.PersonPhone pp
INNER JOIN Person.PhoneNumberType pt ON pt.PhoneNumberTypeID = pp.PhoneNumberTypeID ;

SELECT TOP 10 pa.AddressID, pa.city, ps.StateProvinceID, ps.name
FROM Person.Address pa
INNER JOIN Person.StateProvince ps ON ps.StateProvinceID  = pa.StateProvinceID ;

-- LEFT JOIN

SELECT * FROM Person.Person p 
LEFT JOIN Sales.PersonCreditCard sp 
ON p.BusinessEntityID = sp.BusinessEntityID 
WHERE SP.BusinessEntityID IS NULL ;

-- UNION

SELECT FirstName, Title, MiddleName
FROM Person.Person p 
WHERE p.Title = 'Mr.'
UNION 
SELECT FirstName, Title, MiddleName
FROM Person.Person p2 
WHERE p2.MiddleName = 'A';

-- SELF JOIN

SELECT a.ContactName, a.Region, b.ContactName, b.Region 
FROM Customers a, Customers b
WHERE a.Region = b.Region ;

SELECT a.FirstName , a.HireDate , b.FirstName , b.HireDate 
FROM Employees a, Employees b 
WHERE DATEPART(YEAR, a.HireDate) = DATEPART(YEAR, b.HireDate);

SELECT od.ProductID, od.Discount, od2.ProductID, od2.Discount
FROM [Order Details] od, [Order Details] od2 
WHERE od.Discount = od2.Discount;

-- SUB SELECT/SUB QUERY

SELECT * FROM Production.Product p 
WHERE ListPrice > (SELECT AVG(ListPrice) FROM Production.Product);

SELECT p.FirstName FROM Person.Person p 
WHERE BusinessEntityID IN (SELECT BusinessEntityID FROM HumanResources.Employee WHERE JobTitle = 'Design Engineer');

SELECT p.FirstName FROM Person.Person p
INNER JOIN HumanResources.Employee e 
ON p.BusinessEntityID = e.BusinessEntityID 
AND e.JobTitle = 'Design Engineer';

SELECT * FROM Person.Address a 
WHERE StateProvinceID IN (SELECT StateProvinceID FROM Person.StateProvince WHERE Name = 'Alberta');

SELECT * FROM Person.Address a 
INNER JOIN Person.StateProvince ps
ON a.StateProvinceID = ps.StateProvinceID 
AND ps.Name = 'Alberta';

-- DATEPART

SELECT SalesOrderID, DATEPART(MONTH, OrderDate) AS MES
FROM Sales.SalesOrderHeader soh ;

SELECT AVG(TotalDue) AS MEDIA, DATEPART(MONTH, OrderDate) AS MES
FROM Sales.SalesOrderHeader soh 
GROUP BY DATEPART(MONTH, OrderDate)
ORDER BY MES ;

-- STRING OPERATIONS // OTHERS: https://docs.microsoft.com/pt-br/sql/t-sql/functions/string-functions-transact-sql?view=sql-server-ver15

SELECT CONCAT(P.FirstName, ' ', P.LastName) 
FROM Person.Person p ;

SELECT UPPER(FirstName), LOWER(LastName) 
FROM Person.Person p ;

SELECT FirstName, LEN(FirstName) AS CARACTERES
FROM Person.Person p ;

SELECT FirstName, SUBSTRING(FirstName, 1, 3)
FROM Person.Person p ;

SELECT p.ProductNumber, REPLACE(p.ProductNumber, '-', '#') 
FROM Production.Product p ;

-- MATHEMATICAL FUNCTIONS // OTHERS: https://docs.microsoft.com/pt-br/sql/t-sql/functions/mathematical-functions-transact-sql?view=sql-server-ver15

SELECT sod.UnitPrice + sod.LineTotal as 'OPERATIONS'
FROM Sales.SalesOrderDetail sod ;

SELECT sod.UnitPrice - sod.LineTotal as 'OPERATIONS'
FROM Sales.SalesOrderDetail sod ;

SELECT sod.UnitPrice * sod.LineTotal as 'OPERATIONS'
FROM Sales.SalesOrderDetail sod ;

SELECT sod.UnitPrice / sod.LineTotal as 'OPERATIONS'
FROM Sales.SalesOrderDetail sod ;

SELECT AVG(LineTotal) 
FROM Sales.SalesOrderDetail sod ;

SELECT SUM(LineTotal) 
FROM Sales.SalesOrderDetail sod ;

SELECT MIN(LineTotal) 
FROM Sales.SalesOrderDetail sod ;

SELECT MAX(LineTotal) 
FROM Sales.SalesOrderDetail sod ;

SELECT ROUND(LineTotal, 2) 
FROM Sales.SalesOrderDetail sod ;

SELECT LineTotal, ROUND(LineTotal, 2) 
FROM Sales.SalesOrderDetail sod ;

SELECT LineTotal, SQRT(LineTotal) AS 'RAIZ QUADRADA'
FROM Sales.SalesOrderDetail sod ;

