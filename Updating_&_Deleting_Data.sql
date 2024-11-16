/*
	Updating/Deleting Data
*/

SELECT *
FROM SQLTutorial.dbo.EmployeeDemographics

UPDATE SQLTutorial.dbo.EmployeeDemographics
SET EmployeeID = 1001, firstName= 'Jim', LastName = 'Halpert', Gender = 'Male', Age = 30
where EmployeeID = 1012


Delete from SQLTutorial.dbo.EmployeeDemographics
Where EmployeeID = 1005
