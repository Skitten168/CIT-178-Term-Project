CREATE DATABASE cliffHangerClimbingGyms;

GO
USE cliffHangerClimbingGyms;
CREATE TABLE Zipcode(
Zipcode varchar(10) NOT NULL,
City varchar(30) NOT NULL,
State varchar(30) NOT NULL,
PRIMARY KEY(Zipcode)
);
GO
CREATE TABLE Inventory(
ProductID int NOT NULL,
ProductDescription varchar(30) NOT NULL,
Cost money,
Price money,
PRIMARY KEY(ProductID)
);
GO
CREATE TABLE Customers(
CustomerID int NOT NULL,
FirstName varchar(20) NOT NULL,
LastName varchar(30) NOT NULL,
Zipcode varchar(10) NOT NULL,
PhoneNumber varchar(15),
Email varchar(30),
BelayCertified varchar(10),
LeadCertified varchar(10),
PRIMARY KEY(CustomerID)
);
GO
CREATE TABLE Gyms(
GymID int NOT NULL,
GymName varchar(20) NOT NULL,
Zipcode varchar(10) NOT NULL,
PhoneNumber varchar(15),
NumberOfRoutes int,
PRIMARY KEY(GymID)
);
GO
CREATE TABLE Sales(
SaleID int NOT NULL,
SaleDate date NOT NULL,
GymID int NOT NULL,
CustomerID int NOT NULL,
PRIMARY KEY(SaleID)
);
GO
CREATE TABLE Employees(
EmployeeID int NOT NULL,
FirstName varchar(20) NOT NULL,
LastName varchar(20) NOT NULL,
HomeGymID int NOT NULL,
Dept varchar (20),
PRIMARY KEY(EmployeeID)
);
GO
CREATE TABLE GymRoutes(
RouteID int NOT NULL,
GymID int NOT NULL,
RouteType varchar (20),
DifficultyRating varchar(10),
HoldColor varchar(20),
EmployeeID int NOT NULL,
DateSet date,
PRIMARY KEY (RouteID)
);
GO
CREATE TABLE SalesDetails(
ID int NOT NULL,
SalesID int NOT NULL,
ProductID int NOT NULL,
Qty int NOT NULL,
PRIMARY KEY(ID)
);



