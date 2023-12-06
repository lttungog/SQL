CREATE DATABASE Lab1
USE Lab1

CREATE TABLE Users (
	UserID INT,
	FirstName NVARCHAR(50),
	LastName NVARCHAR(50),
	Age INT
)

SELECT * FROM Users

INSERT INTO Users values (1, 'John', 'Doe', 25)
INSERT INTO Users values (2, 'Jane', 'Smith', 30)
INSERT INTO Users values (3, 'Bob', 'Johnson', 22)

ALTER TABLE Users
ADD Email VARCHAR(25)

UPDATE Users
SET Email='john.doe@example.com'
WHERE FirstName='John'
UPDATE Users
SET Email='jane.smith@example.com'
WHERE FirstName='Jane'
UPDATE Users
SET Email='bob.johnson@example.com'
WHERE FirstName='Bob'

-- Delete table to be recreated
-- DROP TABLE Users