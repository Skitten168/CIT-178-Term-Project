/*Final Project Views


--VIEW #1-- (Updatable View)
--Creating a view to show only gym members name and belay certification status.  No personal data available.

CREATE VIEW customers_public AS
SELECT FirstName+' '+LastName AS [Name], BelayCertified, LeadCertified
From Customers;

--Checking data
SELECT *
FROM customers_public;

--UPDATING VIEW #1--
--If a climber becomes certified to belay we can uppdate their status.(2 examples)

UPDATE customers_public
SET BelayCertified = 'Yes' WHERE NAME = 'Joe Paul';

UPDATE customers_public
SET BelayCertified = 'Yes' WHERE Name = 'Theo Isaacs';

--Checking data
SELECT *
FROM customers_public;

--VIEW #2--
--Climbing routes basic info exluding employee who set and set date.
SELECT * FROM GymRoutes;

CREATE VIEW basic_route_info AS
SELECT RouteID, RouteType, DifficultyRating
FROM GymRoutes;

--Checking data
SELECT *
FROM basic_route_info;

--VIEW #3--
--Creating a view that displays gym name and phone number.


CREATE VIEW Gym_Phone
AS 
SELECT GymName, PhoneNumber
FROM Gyms;

--Checking data
SELECT * FROM Gym_Phone;


--View #4--
--Viewing employees name and department.
SELECT * 
FROM Employees;

CREATE VIEW Employee_Dept 
AS
SELECT FirstName+' '+LastName AS[Name], Dept
FROM Employees; 

--Checking data
SELECT * 
FROM Employee_Dept;*/