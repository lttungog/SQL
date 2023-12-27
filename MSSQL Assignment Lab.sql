CREATE TABLE Employee (
	EmployeeID INT PRIMARY KEY,
	Name varchar(100),
	Tel char(11),
	Email varchar(30)
);

INSERT INTO Employee VALUES (1, 'Tung', 123456789, 'tung@gmail.com');
INSERT INTO Employee VALUES (2, 'Hieu', 987631235, 'hieu@gmail.com');
INSERT INTO Employee VALUES (3, 'Lam', 293847561, 'lam@gmail.com');
INSERT INTO Employee VALUES (4, 'Xuan', 209475896, 'xuan@gmail.com');
INSERT INTO Employee VALUES (5, 'Mai', 102937584, 'mai@gmail.com');
INSERT INTO Employee VALUES (6, 'Hung', 103947563, 'hung@gmail.com');
INSERT INTO Employee VALUES (7, 'Manh', 384750967, 'manh@gmail.com');
INSERT INTO Employee VALUES (8, 'Son', 392083645, 'son@gmail.com');
INSERT INTO Employee VALUES (9, 'Quoc Anh', 102956473, 'qa@gmail.com');
INSERT INTO Employee VALUES (10, 'Van', 394758690, 'van@gmail.com');
INSERT INTO Employee VALUES (11, 'Hung', 283746578, 'hung1@gmail.com');
INSERT INTO Employee VALUES (12, 'Linh', 209374657, 'linh@gmail.com');
INSERT INTO Employee VALUES (13, 'Vinh', 384756321, 'vinh@gmail.com');



---------------------------------

CREATE TABLE Project (
	ProjectID INT PRIMARY KEY,
	ProjectName varchar(30),
	StartDate datetime,
	Period INT,
	Cost money
);

INSERT INTO Project VALUES (1, 'Project1', '1990-02-02', 10, 100000);
INSERT INTO Project VALUES (2, 'Project2', '1993-03-03', 15, 170000);
INSERT INTO Project VALUES (3, 'Project3', '1995-01-03', 5, 80000);
INSERT INTO Project VALUES (4, 'Project4', '1996-07-05', 11, 125000);
INSERT INTO Project VALUES (5, 'Project5', '1997-11-20', 9, 113000);



---------------------------------

CREATE TABLE Group1 (
	GroupID INT PRIMARY KEY,
	GroupName varchar(30),
	LeaderID INT,
	ProjectID INT,
	FOREIGN KEY (ProjectID) REFERENCES Project (ProjectID)
);

INSERT INTO Group1 VALUES (1, 'TheRejects', 1, 1);
INSERT INTO Group1 VALUES (22, 'TheSmiths', 3, 4);
INSERT INTO Group1 VALUES (13, 'Dota2Nerds', 5, 2);
INSERT INTO Group1 VALUES (15, 'CSHackers', 2, 3);


---------------------------------

CREATE TABLE GroupDetail (
	GroupID INT,
	EmployeeID INT,
	Status char(20),
	PRIMARY KEY (GroupID, EmployeeID),
	FOREIGN KEY (GroupID) REFERENCES Group1 (GroupID),
	FOREIGN KEY (EmployeeID) REFERENCES Employee (EmployeeID)
);

INSERT INTO GroupDetail VALUES (1, 1, 'In Process');
INSERT INTO GroupDetail VALUES (1, 4, 'In Process');
INSERT INTO GroupDetail VALUES (1, 6, 'In Process');
INSERT INTO GroupDetail VALUES (22, 3, 'Done');
INSERT INTO GroupDetail VALUES (22, 7, 'Done');
INSERT INTO GroupDetail VALUES (13, 8, 'In Process');
INSERT INTO GroupDetail VALUES (13, 9, 'In Process');
INSERT INTO GroupDetail VALUES (13, 5, 'In Process');
INSERT INTO GroupDetail VALUES (15, 10, 'Preparing');
INSERT INTO GroupDetail VALUES (15, 11, 'Preparing');
INSERT INTO GroupDetail VALUES (15, 2, 'Preparing');


--------------------------------

SELECT * FROM Employee;
SELECT * FROM Group1;
SELECT * FROM Project;
SELECT * FROM GroupDetail;

-------------------------------- 3a

SELECT * FROM Employee;

-------------------------------- 3b

SELECT * FROM Employee
WHERE EmployeeID IN (
	SELECT EmployeeID FROM GroupDetail
	WHERE GroupID = (
		SELECT GroupID FROM Group1
		WHERE ProjectID = (
			SELECT ProjectID FROM Project
			WHERE ProjectName = 'Project1'
		)
	)
);

------------------------------- 3c

SELECT GroupID, COUNT(EmployeeID) AS SoLuongNV_TheoNhom
FROM GroupDetail
GROUP BY GroupID;

------------------------------- 3d

SELECT Employee.EmployeeID, Employee.Name, Employee.Tel, Employee.Email, Group1.GroupID
FROM Employee
JOIN Group1
ON Employee.EmployeeID = Group1.LeaderID;

------------------------------- 3e

SELECT GroupDetail.GroupID, Employee.EmployeeID, Employee.Name, Employee.Tel, Employee.Email
FROM GroupDetail
LEFT JOIN Employee
ON GroupDetail.EmployeeID = Employee.EmployeeID
WHERE Employee.EmployeeID IN (
	SELECT EmployeeID FROM GroupDetail
	WHERE GroupID IN (
		SELECT GroupID FROM Group1
		WHERE ProjectID IN (
			SELECT ProjectID FROM Project
			WHERE StartDate <= '1996-01-01'
		)
	)
);

-------------------------------- 3f

SELECT Employee.EmployeeID, Employee.Name, Employee.Tel, Employee.Email, GroupDetail.GroupID
FROM Employee
FULL JOIN GroupDetail
ON Employee.EmployeeID = GroupDetail.EmployeeID;
WHERE GroupDetail.GroupID = NULL;

------------------------------- 3g

SELECT Employee.EmployeeID, Employee.Name, Employee.Tel, Employee.Email, GroupDetail.GroupID, GroupDetail.Status
FROM Employee
JOIN GroupDetail
ON Employee.EmployeeID = GroupDetail.EmployeeID
WHERE Status = 'Done';

------------------------------- 4a

ALTER TABLE Employee
ALTER COLUMN Name varchar(100) NOT NULL;

------------------------------- 4b

ALTER TABLE Project
ADD CHECK (COST > 1000);
