/*
	String Functions - Trim, Ltrim, Rtrimi, Replace, Substring, Upper, Lower
*/




CREATE TABLE EmployeeErrors (
EmployeeID varchar(50)
, FristName varchar(50)
, LastName varchar(50)
)

INSERT INTO EmployeeErrors Values
('1001  ', 'Jimibo', 'Halbert')
,('  1002', 'Pamela', 'Beasely')
,('1005', 'Toby', 'Flenderson - Fired')

SELECT *
FROM EmployeeErrors


-- Using Trim, LTRIM, RTRIM

Select EmployeeID, TRIM(EmployeeID) as IDTRIM
From EmployeeErrors

Select EmployeeID, LTRIM(EmployeeID) as IDTRIM
From EmployeeErrors

Select EmployeeID, RTRIM(EmployeeID) as IDTRIM
From EmployeeErrors


-- Using Replace

Select LastName, REPLACE(LastName, ' - Fired' , '') as LastNameFixed
From EmployeeErrors


-- Using Substring

Select SUBSTRING(FristName, 1,3)
From EmployeeErrors


Select err.FristName, SUBSTRING(err.FristName,1,3), dem.FirstName, SUBSTRING(dem.FirstName,1,3)
From EmployeeErrors err
JOIN SQLTutorial..EmployeeDemographics dem
	ON SUBSTRING(err.FristName,1,3) = SUBSTRING(dem.FirstName,1,3)


--Using UPPER and lower

Select FristName, LOWER(FristName)
From EmployeeErrors
