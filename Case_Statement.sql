

SELECT FirstName, LastName, Age,
CASE
	WHEN Age > 30 THEN 'OLD'
	WHEN Age BETWEEN 27 AND 30 THEN 'Young'
	ELSE 'Baby'
END
FROM SQLTutorial.dbo.EmployeeDemographics
WHERE Age is NOT NULL
ORDER BY Age


--SELECT FirstName, LastName, Age,
--CASE
	
--	WHEN Age = 38 THEN 'Stanley'
--	WHEN Age > 30 THEN 'OLD'
--	ELSE 'Baby'
--END
--FROM SQLTutorial.dbo.EmployeeDemographics
--WHERE Age is NOT NULL
--ORDER BY Age


SELECT FirstName, LastName, JobTitle, Salary,
CASE
	WHEN JobTitle = 'Salesman' THEN Salary + (Salary * .10)
	WHEN JobTitle = 'Accountant' THEN Salary + (Salary * .05)
	WHEN JobTitle = 'HR' THEN Salary + (Salary * .00001)
	ELSE Salary + (Salary * .03)
END AS SalaryAfterRaise
FROM SQLTutorial.DBO.EmployeeDemographics
JOIN SQLTutorial.DBO.EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
