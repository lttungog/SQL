USE Lab5;

CREATE TABLE Customers (
	CustomerID INT PRIMARY KEY,
	Name NVARCHAR (50),
	PersonalID INT,
	Address NVARCHAR (100)
);

INSERT INTO Customers VALUES (1, 'Nguyen Nguyet Nga', 123456789, 'Ha Noi');
INSERT INTO Customers VALUES (2, 'Dang Thi Thuy Linh', 987654321, 'Vinh Phuc');
INSERT INTO Customers VALUES (3, 'Luong Thanh Tung', 234567891, 'Thanh Hoa');
INSERT INTO Customers VALUES (4, 'Ngo Manh Hung', 876543921, 'Buon Ma Thuot');
INSERT INTO Customers VALUES (5, 'Vo Chi Cong', 345678912, 'Ha Noi');

----------------------------------------
DROP TABLE MobilePlans;

CREATE TABLE MobilePlans (
	PlanID INT NOT NULL IDENTITY (1, 1),
	PhoneNumber VARCHAR(10) PRIMARY KEY,
	PlanType NVARCHAR (50),
	StartDate DATE,
	CustomerID INT,
	FOREIGN KEY (CustomerID) REFERENCES Customers (CustomerID)
);

INSERT INTO MobilePlans VALUES ('123456789', 'Prepaid', '2021-02-17', 1);
INSERT INTO MobilePlans VALUES ('036467389', 'Postpaid', '2021-05-13', 1);
INSERT INTO MobilePlans VALUES ('037485967', 'Prepaid', '2022-04-03', 2);
INSERT INTO MobilePlans VALUES ('035475986', 'Prepaid', '2022-11-22', 3);
INSERT INTO MobilePlans VALUES ('091274653', 'Postpaid', '2022-12-09', 2);
INSERT INTO MobilePlans VALUES ('098437456', 'Prepaid', '2023-01-13', 4);
INSERT INTO MobilePlans VALUES ('097453678', 'Postpaid', '2023-02-28', 5);
INSERT INTO MobilePlans VALUES ('098735462', 'Prepaid', '2022-12-09', 3);

----------------------------------------

SELECT * FROM Customers;
SELECT * FROM MobilePlans;

---------------------------------------- 4a

SELECT * FROM Customers;

---------------------------------------- 4b

SELECT * FROM MobilePlans;

---------------------------------------- 5a

SELECT * FROM Customers
WHERE CustomerID IN (
	SELECT CustomerID
	FROM MobilePlans
	WHERE PhoneNumber = '123456789'
);

---------------------------------------- 5b

SELECT * FROM Customers
WHERE PersonalID = '123456789';

---------------------------------------- 5c
SELECT MobilePlans.PhoneNumber
FROM MobilePlans
WHERE CustomerID IN (
	SELECT CustomerID
	FROM Customers
	WHERE PersonalID = '123456789'
);

---------------------------------------- 5d

SELECT MobilePlans.PhoneNumber
FROM MobilePlans
WHERE MobilePlans.StartDate = '2022-12-09';

---------------------------------------- 5e

SELECT MobilePlans.PhoneNumber
FROM MobilePlans
WHERE CustomerID IN (
	SELECT Customers.CustomerID
	FROM Customers
	WHERE Customers.Address = 'Ha Noi'
);

---------------------------------------- 6a

SELECT COUNT(DISTINCT CustomerID) AS SoLuongKhach FROM Customers;

---------------------------------------- 6b

SELECT COUNT(PlanID) AS TongSoThueBao FROM MobilePlans;

---------------------------------------- 6c

SELECT COUNT(PlanID) AS TongSoThueBao 
FROM MobilePlans
WHERE MobilePlans.StartDate = '2022-12-09';

---------------------------------------- 6d

SELECT *
FROM Customers
LEFT JOIN MobilePlans
ON Customers.CustomerID = MobilePlans.CustomerID;