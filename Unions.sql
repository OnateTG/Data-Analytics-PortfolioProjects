--SELECT TOP (1000) [EmployeeID]
--      ,[FirstName]
--      ,[LastName]
--      ,[Age]
--      ,[Gender]
--      ,[WarehouseID]
--  FROM [SQLTutorial].[dbo].[WarehouseEmployees]

SELECT *
FROM SQLTutorial.dbo.EmployeeDemographics
FULL Outer Join SQLTutorial.dbo.WarehouseEmployeeDemographics
	ON EmployeeDemographics.EmployeeID =	WareHouseEmployeeDemographics.EmployeeID


SELECT *
FROM SQLTutorial.dbo.EmployeeDemographics
UNION ALL
SELECT *
FROM SQLTutorial.dbo.WareHouseEmployeeDemographics
ORDER BY EmployeeID

--SELECT EmployeeID, FirstName, Age
--FROM SQLTutorial.dbo.EmployeeDemographics
--UNION
--SELECT EmployeeID, JobTitle, Salary
--FROM SQLTutorial.dbo.EmployeeSalary
--ORDER BY EmployeeID


--Create Table WareHouseEmployeeDemographics
--(EmployeeID int,
--FirstName varchar(50),
--LasstName varchar(50),
--Age int,
--Gender varchar(50)
--)

INSERT INTO WareHouseEmployeeDemographics VALUES
(1013, 'Darry', 'Phiben','23', 'Male'),
(1050, 'Ray', 'Anderson', 32, 'Male'),
(1051, 'Henderson', 'Handy', 40, 'Male'),
(1052, 'Val', 'Johnson', 31, 'Female')
