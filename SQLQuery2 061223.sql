USE AdventureWorks2022
GO

SELECT *
FROM Person.Person
WHERE BusinessEntityID >= 100 AND BusinessEntityID <= 200

SELECT * 
FROM Person.Person
WHERE BusinessEntityID BETWEEN 100 AND 200

SELECT * 
FROM Person.Person
WHERE BusinessEntityID BETWEEN 10 AND 20

SELECT * 
FROM Person.Person
WHERE BusinessEntityID IN (100, 107, 200, 2210)

SELECT * 
FROM Person.Person
WHERE MiddleName IN ('W', 'M', 'T')

SELECT *
FROM Person.Person
WHERE LastName LIKE '%e'

SELECT*
FROM Person.Person
WHERE LastName LIKE '[RA]%e'

SELECT *
FROM Person.Person
WHERE LastName LIKE '[RA]__e'

SELECT DISTINCT Title 
FROM Person.Person


-- How does this line work? Count() as WHAT??, WHAT??
SELECT COUNT(BusinessEntityID) as TotalID, Title
FROM Person.Person
GROUP BY Title

SELECT Title, COUNT(*) [Title Number]
FROM Person.Person
GROUP BY Title

SELECT * FROM Sales.SalesPerson
SELECT * FROM Person.Person

SELECT * 
FROM Person.Person
WHERE BusinessEntityID IN (1, 4, 99)

SELECT *
FROM Person.Person
WHERE BusinessEntityID IN (SELECT BusinessEntityID FROM Sales.SalesPerson)

SELECT *
FROM Person.Person
INNER JOIN Sales.SalesPerson
ON Person.BusinessEntityID = SalesPerson.BusinessEntityID

SELECT *
FROM Person.Person
LEFT OUTER JOIN Sales.SalesPerson
ON Person.BusinessEntityID = SalesPerson.BusinessEntityID

SELECT *
FROM Person.Person
RIGHT OUTER JOIN Sales.SalesPerson
ON Person.BusinessEntityID = SalesPerson.BusinessEntityID

SELECT Title, COUNT(*)
FROM Person.Person
GROUP BY Title

SELECT COUNT(BusinessEntityID) AS CountBUS, Title
FROM Person.Person
WHERE EmailPromotion IN (1, 2)
GROUP BY Title
HAVING COUNT(BusinessEntityID) > 100

SELECT * FROM Person.Person

SELECT Title, COUNT(*) [Title Number]
FROM Person.Person
WHERE Title LIKE 'Mr%'
GROUP BY Title

SELECT * FROM Person.Person

SELECT Title, COUNT(*) [Title Number]
FROM Person.Person
GROUP BY ALL Title
HAVING Title LIKE 'Mr%'

SELECT Title, COUNT(*) [Title Number]
FROM Person.Person
-- WHERE COUNT(*) > 10
GROUP BY ALL Title
HAVING Title LIKE 'Mr%' OR COUNT(*) > 10

SELECT Title, COUNT(*) [Title Number]
FROM Person.Person
GROUP BY Title WITH CUBE

