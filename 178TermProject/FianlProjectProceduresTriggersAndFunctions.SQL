---------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------
/*Final Project Procedures
---------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------
--STORED PROCEDURE
--Gets gym name list and number of routes for each gym

USE cliffHangerClimbingGyms;
GO
CREATE PROC spGymList
AS
BEGIN
	SELECT 
		GymName,
		NumberOfRoutes
	FROM Gyms
	ORDER BY 
		GymName ASC
END;

---------------------------------------------------------------------------------------------------------------------------------------------

--STORED PROCEDURE WITH 1 PARAMETER
-- Procedure to let user see all certification status 'yes' and 'no'

CREATE PROC spBelayCertificationStatus(@CertStatus AS VARCHAR(30))
AS
BEGIN
	SELECT FirstName +' '+ LastName AS [Climber Name], BelayCertified AS [Belay Certified]
	FROM 
		Customers
	WHERE
		BelayCertified = @CertStatus
	ORDER BY 
		[Climber Name] ASC;
END

spBelayCertificationStatus 'Yes'
GO
spBelayCertificationStatus 'No'
---------------------------------------------------------------------------------------------------------------------------------------------
--Extra input parameter practice
--MULTIPLE PARAMETER STORED PROCEDURE
--Stored procedure to view belay and lead-climb certification status

USE cliffHangerClimbingGyms
GO
CREATE PROC spBelayAndLeadCertificationStatus(@BelayCertStatus AS VARCHAR(30), @LeadCertStatus AS VARCHAR(30))
AS
BEGIN
	SELECT FirstName +' '+ LastName AS [Climber Name], BelayCertified AS [Belay Certified], LeadCertified AS[Lead Certified]
	FROM 
		Customers
	WHERE
		BelayCertified = @BelayCertStatus
		AND
		LeadCertified = @LeadCertStatus
	ORDER BY 
		[Climber Name] ASC
		END;

---------------------------------------------------------------------------------------------------------------------------------------------

--INPUT AND OUTPUT PARAMETERS
CREATE PROC spEmployeeFullNameByID (@EmpID int, @EmpName varchar(50) output)
AS
BEGIN
	SELECT @EmpName=FirstName+' '+LastName 
	FROM Employees
	WHERE EmployeeID = @EmpID

END

DECLARE @EmpName varchar(50)
Exec spEmployeeFullNameByID 123, @EmpName OUTPUT
PRINT @EmpName


SELECT * FROM GymRoutes;

---------------------------------------------------------------------------------------------------------------------------------------------

--RETURN VALUES
-- Reworking previous sp to return a count value
CREATE PROC spBelayCertifiedCount(@CertStatus AS VARCHAR(30))
AS
BEGIN
	SELECT FirstName +' '+ LastName AS [Climber Name], BelayCertified AS [Belay Certified]
	FROM 
		Customers
	WHERE
		BelayCertified = @CertStatus
	ORDER BY 
		[Climber Name] ASC;
	RETURN @@ROWCOUNT
END

--Returning belay certified climbers and a count of them
DECLARE @Count INT
EXEC @Count = spBelayCertifiedCount 'yes'

SELECT @Count AS [Number of belay certified climbers]


---------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------
/*Final Project Defined Functions*/
---------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------
--Long Form date function for date route was set

USE cliffHangerClimbingGyms
GO
CREATE FUNCTION [dbo].[fnFullDate]
	(
		@SetDate AS DATETIME
	)
RETURNS VARCHAR(MAX)
AS 
BEGIN
	RETURN DATENAME(DW, @SetDate) +' '+
	DATENAME(D, @SetDate) +
	--adding suffix to days
	CASE
		WHEN DAY(@SetDate) IN (1, 21, 31) THEN 'st'
		WHEN DAY(@SetDate) IN (2, 22) THEN 'nd'
		WHEN DAY(@SetDate) IN (3, 23) THEN 'rd'
		ELSE 'th'
	END +' '+
	DATENAME(M, @SetDate) +' '+
	DATENAME(YY, @SetDate)
END

SELECT
	EmployeeID,
	RouteType,
	DifficultyRating,
	[dbo].[fnFullDate](DateSet) AS[long form date]
FROM GymRoutes
---------------------------------------------------------------------------------------------------------------------------------------------

--Table function returning tables for each route type

USE cliffHangerClimbingGyms
GO
CREATE FUNCTION fnRoutes
	(
		@RouteType varchar(max))
		RETURNS table
	RETURN
	(SELECT * FROM GymRoutes WHERE @RouteType = GymRoutes.RouteType);

SELECT * FROM dbo.fnRoutes('Boulder')
SELECT * FROM dbo.fnRoutes('Lead')
SELECT * FROM dbo.fnRoutes('Top-Rope')


---------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------
/*Final Project Triggers*/
---------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------
--DELETION trigger


/*CREATE TRIGGER EmpTable_DELETE ON Employees
	AFTER DELETE
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @EmpID INT
	SELECT @EmpID = DELETED.EmployeeID
	FROM DELETED

	INSERT INTO EmpTableLog
	VALUES(@EmpID, 'Deleted')
END

DELETE FROM Employees WHERE EmployeeID = 456;

SELECT * FROM EmpTableLog

--Trigger to store employeeID and insert status when INSERTED

USE cliffHangerClimbingGyms
GO

CREATE TABLE EmpTableLog(
	EmpID INT,
	InsertStatus VARCHAR(20));

CREATE TRIGGER EmpTable_INSERT ON Employees
	AFTER INSERT
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @EmpID INT
	SELECT @EmpID = INSERTED.EmployeeID
	FROM INSERTED

	INSERT INTO EmpTableLog
	VALUES(@EmpID, 'Inserted')
END

INSERT INTO Employees(EmployeeID, FirstName, LastName, HomeGymID, Dept) VALUES (456, 'Liza', 'Jane', 4, 'Setter')
INSERT INTO Employees(EmployeeID, FirstName, LastName, HomeGymID, Dept) VALUES (567, 'Beau', 'Jangles', 2, 'Front Desk')

SELECT * FROM EmpTableLog;



CREATE TRIGGER EmpTable_UPDATE ON Employees
	AFTER UPDATE
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @EmpID INT
	DECLARE @UpdatedField varchar(50)
SELECT @EmpID = INSERTED.EmployeeID
FROM INSERTED

IF UPDATE (EmployeeID)
	SET @UpdatedField = 'Updated ID'
IF UPDATE (FirstName)
	SET @UpdatedField = 'Updated First Name'
IF UPDATE (LastName)
	SET @UpdatedField = 'Updated Last Name'
IF UPDATE (HomeGymID)
	SET @UpdatedField = 'Updated Home Gym'
IF UPDATE (Dept)
	SET @UpdatedField = 'Updated Department'

INSERT INTO EmpTableLog
	VALUES(@EmpID, @UpdatedField)
END

UPDATE Employees SET EmployeeID = 789 WHERE EmployeeID = 678
UPDATE Employees SET FirstName = 'Nicky' WHERE FirstName = 'Nick'
UPDATE Employees SET Dept = 'Instructor' WHERE FirstName = 'Beau'


SELECT * FROM EmpTableLog*/

