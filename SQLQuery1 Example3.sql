USE AdventureWorks2022
GO

SELECT * 
FROM HumanResources.Employee

SELECT * 
FROM HumanResources.Department 
WHERE DepartmentID > 15

SELECT DepartmentID, Name, GroupName 
FROM HumanResources.Department 
WHERE DepartmentID > 15
Go

DECLARE @deptID INT
SELECT @deptID=12

SELECT DepartmentID, Name, GroupName
FROM HumanResources.Department
WHERE DepartmentID >= @deptID
Go

USE NorthWind
GO

SELECT * 
FROM Categories

SELECT CategoryID, CategoryName, [Description]
FROM Categories

SELECT EmployeeID, LastName, FirstName
FROM Employees

SELECT TOP 1 *
FROM Employees

SELECT @@LANGUAGE
SELECT @@VERSION

Go

SELECT SUM(StandardCost)
FROM  Production.ProductCostHistory
SELECT AVG(StandardCost)
FROM  Production.ProductCostHistory
SELECT MAX(StandardCost)
FROM  Production.ProductCostHistory
SELECT COUNT(*) AS TotalRecords
FROM  Production.ProductPhoto
SELECT GETDATE()
SELECT DATEPART(hh, GETDATE(), 103)
SELECT CONVERT (VarChar(50), GETDATE(), 103)

SELECT DB_ID('AdventureWorks')

CREATE DATABASE EXAMPLE3

USE EXAMPLE3

CREATE TABLE Contacts (
	MailID VARCHAR(20),
	Name NTEXT,
	TelephoneNumber INT
)

ALTER TABLE Contacts
ADD Address NVARCHAR(50)

INSERT INTO Contacts values ('xeko@gmail.com', N'Nguyễn Văn A', 98989898, N'Hà Nội')
INSERT INTO Contacts values ('lynka@gmail.com', N'Nguyễn Thị B', 23232321, N'Hà Nội')
INSERT INTO Contacts values ('tranvanC@gmail.com', N'Trần Văn C', 94565666, N'Hà Nội')
INSERT INTO Contacts values ('vand@gmail.com', N'Trịnh Văn D', 67989776, N'Hà Nội')

SELECT *
FROM Contacts

DELETE
FROM Contacts
WHERE MailID='tranvanC@gmail.com'

UPDATE Contacts
SET Name=N'Nguyễn Việt Anh'
WHERE MailID='vand@gmail.com'
