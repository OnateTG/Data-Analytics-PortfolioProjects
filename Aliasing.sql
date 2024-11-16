/*
	Aliasing
*/

--SELECT Demo.EmployeeID
--From SQLTutorial.dbo.EmployeeDemographics AS Demo
--JOIN SQLTutorial.dbo.EmployeeSalary AS Sal
--	on Demo.EmployeeID = Sal.EmployeeID

SELECT Demo.EmployeeID, Demo.FirstName, Demo.firstName, Sal.JObtitle, Ware.Age 
From SQLTutorial.dbo.EmployeeDemographics Demo
Left JOin SQLTutorial.dbo.EmployeeSalary Sal
	ON Demo.EmployeeID = Sal.EmployeeID
Left Join SQLTutorial.dbo.WareHouseEmployeeDemographics Ware
	ON Demo.EmployeeID = Ware.EmployeeID
