CREATE DATABASE Lab4;

USE Lab4;

--------------------------------

CREATE TABLE Maker (
	MakerID INT PRIMARY KEY,
	MakerName VARCHAR (20),
	Address VARCHAR (50),
	TelNumber INT
);

INSERT INTO Maker VALUES (123, 'Asus', 'USA', 983232);
INSERT INTO Maker VALUES (125, 'Lenovo', 'Vietnam', 794545);
INSERT INTO Maker VALUES (126, 'Apple', 'USA', 579898);
INSERT INTO Maker VALUES (128, 'Acer', 'Canada', 709980);
INSERT INTO Maker VALUES (130, 'Nokia', 'Sweden', 283089);
INSERT INTO Maker VALUES (151, 'Samsung', 'Korea', 374590);
INSERT INTO Maker VALUES (152, 'Oppo', 'China', 231312);


--------------------------------
DROP TABLE Product; 

CREATE TABLE Product (
	ProductID INT PRIMARY KEY,
	ProductName NVARCHAR (50),
	Description VARCHAR (50),
	Unit VARCHAR (10),
	Price INT,
	Quantity INT
);

INSERT INTO Product VALUES (1, 'Máy Tính Lenovo T450', 'Máy nhập mới', 'chiếc', 1000, 20);
INSERT INTO Product VALUES (2, 'Điện Thoại Nokia 5670', 'Điện thoại đang hot', 'chiếc', 200, 10);
INSERT INTO Product VALUES (3, 'Máy In Samsung 450', 'Máy in đang ế', 'chiếc', 100, 15);
INSERT INTO Product VALUES (4, 'Máy Tính Apple M1', 'Máy tính đang hot', 'chiếc', 3000, 23);
INSERT INTO Product VALUES (5, 'Máy Tính Lenovo Legion 5', 'Máy nhập mới', 'chiếc', 2400, 14);
INSERT INTO Product VALUES (6, 'Máy Tính Asus TUF Gaming F15', 'Máy nhập mới', 'chiếc', 1900, 11);

-------------------------------

CREATE TABLE ProductMaker (
	MakerID INT,
	ProductID INT,
	PRIMARY KEY (MakerID, ProductID),
	FOREIGN KEY (MakerID) REFERENCES Maker (MakerID),
	FOREIGN KEY (ProductID) REFERENCES Product (ProductID)
);

INSERT INTO ProductMaker VALUES (123, 6);
INSERT INTO ProductMaker VALUES (125, 1), (125, 5);
INSERT INTO ProductMaker VALUES (126, 4);
INSERT INTO ProductMaker VALUES (130, 2);
INSERT INTO ProductMaker VALUES (151, 3);

--------------------------------

SELECT * FROM Maker;
SELECT * FROM Product;
SELECT * FROM ProductMaker;

-------------------------------- 4a.

SELECT MakerName FROM Maker;

-------------------------------- 4b.

SELECT ProductName FROM Product;

-------------------------------- 5a.

SELECT MakerName FROM Maker
ORDER BY MakerName DESC;

-------------------------------- 5b.

SELECT * FROM Product
ORDER BY Price DESC;

-------------------------------- 5c.

SELECT * FROM Maker
WHERE MakerName = 'Asus';

-------------------------------- 5d.

SELECT * FROM Product
WHERE Quantity < 11;

-------------------------------- 5e.

SELECT * FROM Product
WHERE ProductID IN (
	SELECT ProductID
	FROM ProductMaker
	WHERE MakerID IN (
		SELECT MakerID
		FROM Maker
		WHERE MakerName = 'Asus'
	)
);

-------------------------------- 6a.

SELECT COUNT(DISTINCT MakerID) AS SoHangSanPham
FROM ProductMaker
WHERE ProductID IS NOT NULL;

-------------------------------- 6b.

SELECT COUNT(ProductID) AS SoMatHang
FROM Product;

-------------------------------- 6c.

ALTER TABLE Product
ADD ProductType NVARCHAR (20);

UPDATE Product
SET ProductType = 'Máy Tính'
WHERE ProductName LIKE 'Máy Tính%';

UPDATE Product
SET ProductType = 'Máy In'
WHERE ProductName LIKE 'Máy In%';

UPDATE Product
SET ProductType = 'Điện Thoại'
WHERE ProductName LIKE 'Điện Thoại%';

SELECT COUNT(DISTINCT ProductType) FROM Product;

-------------------------------- 6d.

SELECT SUM(Quantity) FROM Product;