SHOW DATABASES;
USE AdventureWorksDW;
SHOW TABLES;

-- punto 2
SELECT * FROM dimproduct;

-- punto 3
SELECT ProductKey, ProductAlternateKey, EnglishProductName, Color, StandardCost, FinishedGoodsFlag FROM dimproduct;

-- punto 4 
SELECT ProductKey, ProductAlternateKey, EnglishProductName, Color, StandardCost, FinishedGoodsFlag 
FROM dimproduct
WHERE FinishedGoodsFlag = 1;

-- punto 5
SELECT ProductKey, ProductAlternateKey, EnglishProductName, StandardCost, ListPrice
FROM dimproduct
WHERE ProductAlternateKey LIKE 'FR%' OR ProductAlternateKey LIKE 'BK%';

-- punto 6
SELECT ProductKey, ProductAlternateKey, EnglishProductName, StandardCost, ListPrice, ListPrice - StandardCost AS Markup
FROM dimproduct
WHERE ProductAlternateKey LIKE 'FR%' OR ProductAlternateKey LIKE 'BK%';
-- oppure interpretando diversamente il testo farei cosi
SELECT ProductKey, ProductAlternateKey, EnglishProductName, StandardCost, ListPrice, ListPrice - StandardCost AS Markup
FROM dimproduct;

-- punto 7
SELECT ProductKey, ProductAlternateKey, EnglishProductName, Color, StandardCost, ListPrice, FinishedGoodsFlag 
FROM dimproduct
WHERE FinishedGoodsFlag = 1 AND ListPrice BETWEEN 1000 AND 2000; 

-- punto 8
SELECT * FROM dimemployee;

-- punto 9
SELECT EmployeeKey, FirstName, LastName, EmailAddress, Phone, SalesPersonFlag
FROM dimemployee
WHERE SalespersonFlag = 1;

-- punto 10
SELECT * FROM factresellersales;
SELECT * FROM factresellersales WHERE DueDate >= '2020-01-01' AND ProductKey IN (597, 598, 477, 214);
SELECT DueDate, ProductKey, SalesAmount - TotalProductCost AS Profitto 
FROM factresellersales 
WHERE DueDate >= '2020-01-01' AND ProductKey IN (597, 598, 477, 214)
ORDER BY Profitto DESC;