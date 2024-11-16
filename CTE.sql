/*
	Common Table Expression (CTE)
*/

WITH CTE_Employee as 
( SELECT FirstName, LastName, Gender, Salary
, COUNT(Gender) OVER(PARTITION BY Gender) as TotalGender
, AVG(Salary) OVER ( PARTITION BY Gender) as AvgSalary
FROM SQLTutorial..EmployeeDemographics emp
JOIN SQLTutorial..EmployeeSalary sal
	ON emp.EmployeeID = sal.EmployeeID
WHERE Salary > '45000'
)

Select firstName, AvgSalary
From CTE_Employee
