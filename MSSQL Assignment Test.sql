USE Test;

CREATE TABLE Department (
	DepartID INT PRIMARY KEY,
	DepartName VARCHAR(50) NOT NULL,
	Description VARCHAR(100) NOT NULL
);

INSERT INTO Department VALUES (111, 'HR', 'Department responsible for finding employees');
INSERT INTO Department VALUES (222, 'Sales', 'Department responsible for sales');
INSERT INTO Department VALUES (333, 'Production', 'Department responsible for production');
INSERT INTO Department VALUES (444, 'Accounting', 'Department responsible for accounting');
INSERT INTO Department VALUES (555, 'Marketing', 'Department responsible for marketing');

--------------------------------------

CREATE TABLE Employee (
	EmpCode CHAR(6) PRIMARY KEY,
	FirstName VARCHAR(30) NOT NULL,
	LastName VARCHAR(30) NOT NULL,
	Birthday SMALLDATETIME NOT NULL,
	Gender BIT DEFAULT 1,
	Address VARCHAR(100),
	DepartID INT,
	Salary MONEY,
	FOREIGN KEY (DepartID) REFERENCES Department (DepartID)
);

INSERT INTO Employee VALUES ('1a', 'Tung', 'Luong', '1995-02-28', 1, 'Ha Noi', 444, 100000);
INSERT INTO Employee VALUES ('2b', 'Hai', 'Luong', '1987-01-15', 1, 'Ha Noi', 444, 110000);
INSERT INTO Employee VALUES ('3c', 'Lam', 'Phuc', '1997-11-18', 1, 'Ha Noi', 111, 80000);
INSERT INTO Employee VALUES ('4a', 'Xuan', 'Minh', '1996-09-07', 1, 'Ha Noi', 222, 85000);
INSERT INTO Employee VALUES ('5b', 'Mai', 'Phuong', '2001-04-23', 0, 'Da Nang', 555, 90000);
INSERT INTO Employee VALUES ('6a', 'Mai', 'Phuong', '2001-04-23', 0, 'Da Nang', 555, 0);

--------------------------------------

SELECT * FROM Department;
SELECT * FROM Employee;

-------------------------------------- 4

UPDATE Employee
SET Salary = Salary * 1.1;

-------------------------------------- 5

ALTER TABLE Employee
ADD CONSTRAINT CHK_Salary CHECK (Salary > 0);