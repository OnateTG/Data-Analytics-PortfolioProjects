--Case Statement
/*
	Having Caluse
*/

SELECT JobTitle, AVG(Salary)
FROM SQLTutorial.DBO.EmployeeDemographics
JOIN SQLTutorial.dbo.EmployeeSalary
	on EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
Group by JobTitle
Having AVG(Salary) > 45000
ORDER BY AVG(Salary)
