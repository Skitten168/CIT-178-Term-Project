USE cliffHangerClimbingGyms
GO
CREATE INDEX idx_Zipcode ON Customers(Zipcode);
GO
CREATE INDEX idx_Gym_Zipcode ON Gyms(Zipcode);
GO
CREATE INDEX idx_GymID ON Sales(GymID);
GO
CREATE INDEX idx_CustID ON Sales(CustomerID);
GO
CREATE INDEX idx_HomeGym ON Employees(HomeGymID);
GO
CREATE INDEX idx_EmpID ON GymRoutes(EmployeeID);
GO 
CREATE INDEX ixd_Route_Gym_ID ON GymRoutes(RouteGymID);
GO
CREATE INDEX idx_Product_ID ON SalesDetails(ProductID);
GO
CREATE INDEX idx_Sale_ID ON SalesDetails(SalesID);