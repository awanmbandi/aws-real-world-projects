-- Shows all databases available on the MySQL server.
-- Useful to confirm whether a database already exists
SHOW DATABASES;


-- Creates a new database named BTW_Customer_Financial_Records.
-- This database will store all customer-related data
CREATE DATABASE BTW_Customer_Financial_Records; 


-- Selects BTW_Customer_Financial_Records as the active database.
-- All tables and queries executed after this point will apply here
USE BTW_Customer_Financial_Records;


-- Creates a table called Customer.
-- A table is used to store structured data in rows and columns
CREATE TABLE Customer (
    CustomerID varchar(255),     -- Unique ID assigned to each customer
    FirstName varchar(255),       -- Customer's given name
    MiddleName varchar(255),      -- Customer's middle name (if applicable)
    LastName varchar(255),        -- Customer's family name
    City varchar(255),            -- City of residence
    PhoneNumber varchar(255),     -- Contact phone number
    Occupation varchar(255),      -- Customer's profession or job title
    DOB varchar(255)              -- Date of birth (stored as text for now)
);


-- Displays all tables within the currently selected database.
-- Confirms that the Customer table was created successfully
SHOW TABLES;


-- Inserts the first customer record into the Customer table.
-- The values must follow the same order as the table columns
INSERT INTO Customer 
VALUES ('A00001','Donald','Fred','Yonda','Boston','+12391983453','Doctor','1968-12-06');

-- Inserts the second customer record
INSERT INTO Customer 
VALUES ('A00002','James','Manon','Ekande','Chicago','+15432453456','Artist','1998-01-23');

-- Inserts the third customer record
INSERT INTO Customer 
VALUES ('A00003','Koudi','Tomson','Adeje','Philadelphia','+16102453456','Engineer','1970-01-23');


-- Retrieves all rows and all columns from the Customer table.
-- Used to verify that data was inserted correctly
SELECT * FROM Customer;


-- Retrieves only specific columns (FirstName, LastName, City)
-- Useful when you do not need all data from the table
SELECT FirstName, LastName, City 
FROM Customer;


-- Retrieves all customers who live in the city of Chicago
-- The WHERE clause is used to filter records based on a condition
SELECT * 
FROM Customer 
WHERE City = 'Chicago';


-- Retrieves all customer records and sorts them alphabetically by LastName
-- ORDER BY is used to organize query results
SELECT * 
FROM Customer 
ORDER BY LastName;
