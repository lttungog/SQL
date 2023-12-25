USE Lab3;

SELECT * FROM Customer;
SELECT * FROM Product;
SELECT * FROM Orders;
SELECT * FROM OrderDetails;

CREATE TABLE Customer (
	CustomerID INT PRIMARY KEY,
	NAME NVARCHAR (30),
	Address NVARCHAR (100),
	Tel VARCHAR (15),
	Status VARCHAR (20)
);

INSERT INTO Customer VALUES (1, 'Lương Thanh Tùng', '280 Võ Chí Công', 0986098532, NULL);
INSERT INTO Customer VALUES (2, 'Đỗ Minh Hiếu', '182 Nguyễn Trãi, Thanh Xuân, Hà Nội', 0981879065, NULL);
INSERT INTO Customer VALUES (3, 'Nguyễn Văn An', '111 Nguyễn Trãi, Thanh Xuân, Hà Nội', 987654321, NULL);
INSERT INTO Customer VALUES (4, 'Đặng Thùy Dương', '18 Tây Sơn, Hà Nội', 1234567890, NULL);
INSERT INTO Customer VALUES (5, 'Phạm Chí Dũng', '29 Minh Khai, Hà Nội', 1111444422, NULL);

----------------------------------

CREATE TABLE Product (
	ProductID INT PRIMARY KEY,
	NAME NVARCHAR (30),
	Description NVARCHAR (30),
	Unit NVARCHAR (10),
	Price INT,
	Quantity INT,
	Status NVARCHAR (30)
);

INSERT INTO Product VALUES (1, 'Máy Tính T450', 'Máy nhập mới', 'chiếc', 1000, 20, 'In Stock');
INSERT INTO Product VALUES (2, 'Điện Thoại Nokia 5670', 'Điện thoại đang hot', 'chiếc', 200, 10, 'In Stock');
INSERT INTO Product VALUES (3, 'Máy In Samsung 450', 'Máy in đang ế', 'chiếc', 100, 15, 'In Stock');
INSERT INTO Product VALUES (4, 'Máy Tính Apple M1', 'Máy tính đang hot', 'chiếc', 3000, 23, 'In Stock');
INSERT INTO Product VALUES (5, 'Máy Tính Lenovo Legion 5', 'Máy nhập mới', 'chiếc', 2400, 14, 'In Stock');

----------------------------------
DROP TABLE Orders;

CREATE TABLE Orders (
	OrderID INT PRIMARY KEY,
	CustomerID INT,
	OrderDate DATE,
	Status NVARCHAR (30)
	FOREIGN KEY (CustomerID) REFERENCES Customer (CustomerID)
);

INSERT INTO Orders VALUES (1, 2, '11-18-09', 'In Process');
INSERT INTO Orders VALUES (123, 3, '11-18-09', 'In Process');
INSERT INTO Orders VALUES (14, 1, '12-12-25', 'In Process');
INSERT INTO Orders VALUES (57, 4, '07-09-26', 'In Process');

--------------------------------

CREATE TABLE OrderDetails (
	OrderID INT,
	ProductID INT,
	Price INT,
	Quantity INT,
	PRIMARY KEY (OrderID, ProductID),
	FOREIGN KEY (OrderID) REFERENCES Orders (OrderID),
	FOREIGN KEY (ProductID) REFERENCES Product (ProductID)
);

INSERT INTO OrderDetails VALUES (123, 1, 1000, 1);
INSERT INTO OrderDetails VALUES (123, 2, 200, 2);
INSERT INTO OrderDetails VALUES (123, 3, 100, 1);

INSERT INTO OrderDetails VALUES (14, 2, 200, 1);
INSERT INTO OrderDetails VALUES (14, 4, 3000, 1);
INSERT INTO OrderDetails VALUES (14, 5, 2400, 1);

INSERT INTO OrderDetails VALUES (1, 3, 100, 1);
INSERT INTO OrderDetails VALUES (1, 5, 2400, 1);

INSERT INTO OrderDetails VALUES (57, 2, 200, 1);
INSERT INTO OrderDetails VALUES (57, 4, 3000, 1);

-------------------------------- 4a.

SELECT * FROM Customer
WHERE CustomerID IN (SELECT CustomerID FROM Orders);

-------------------------------- 4b.

SELECT ProductID, NAME
FROM Product;

-------------------------------- 4c.

SELECT * FROM Orders;

-------------------------------- 5a.

SELECT * FROM Customer
ORDER BY NAME;

-------------------------------- 5b.

SELECT * FROM Product
ORDER BY Price DESC;

-------------------------------- 5c.

SELECT * FROM Product
WHERE ProductID IN (
	SELECT ProductID
	FROM OrderDetails
	WHERE OrderID IN (
		SELECT OrderID
		FROM ORDERS
		WHERE CustomerID = 3
	)
);

-------------------------------- 6a.

SELECT DISTINCT COUNT(CustomerID) FROM Orders;

-------------------------------- 6b.

SELECT DISTINCT COUNT(ProductID) FROM Product;

-------------------------------- 6c.

SELECT OrderID, SUM(Price) AS TotalOrderPrice
FROM OrderDetails
GROUP BY OrderID;
