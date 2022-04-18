
/* #1 Query to see how many of a particular route type are in all gyms

USE cliffHangerClimbingGyms;
SELECT COUNT(GymRoutes.RouteType) AS [boulder route count]
FROM GymRoutes
WHERE RouteType = 'Boulder';
*/

/*#2Total Price of inventory sold with item description*/

/*SELECT COUNT(SalesDetails.ProductID) [Inventory Purchsed], Inventory.ProductDescription,
SUM(SalesDetails.QTY)*Inventory.Price AS [Total]
FROM SalesDetails JOIN Inventory ON SalesDetails.ProductID=Inventory.ProductID
GROUP BY Inventory.ProductDescription, Inventory.Price, SalesDetails.ProductID;*/

/*TEST

SELECT *
FROM SalesDetails
SELECT * 
FROM Inventory;*/

/*#3 Finding the Gym with the least routes, most routes and average number of routes per gym

SELECT MIN(Gyms.NumberOfRoutes) AS [Fewest Routes],
		MAX(Gyms.NumberOfRoutes)AS [Most Routes],
		AVG(Gyms.NumberOfRoutes) AS[Average Number of Routes per Gym]
FROM Gyms;*/


/*#4 Average cost of an sale


SELECT COUNT (SalesDetails.ProductID) AS [Inventory Items Sold],
AVG(Inventory.Price) AS [Average Cost of Inventory Sold]
FROM SalesDetails JOIN Inventory ON Inventory.ProductID=SalesDetails.ProductID;
*/
