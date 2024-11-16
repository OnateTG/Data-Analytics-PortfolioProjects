/*
	Temp Tables
*/

CREATE TABLE #temp_Employee (
EmployeeID int,
Jobtitle Varchar(100),
Salary int
)

Select *
FROM #temp_Employee

--INSERT INTO #temp_Employee vALUES (
--'1001', 'HR', '45000'
--)

--INSERT INTO #temp_Employee
--SELECT *
--FROM SQLTutorial..EmployeeSalary

DROP Table if EXists #TEMP_Employee2
CREATE TABLE #TEMP_Employee2(
JobTitle varchar (50),
EmployeePerJob int,
AvgAge int,
AvgSalary int)


INSERT INTO #TEMP_Employee2
SELECT JobTitle, Count(JobTitle), Avg(Age), Avg(Salary)
From SQLTutorial..EmployeeDemographics emp
Join SQLTutorial..EmployeeSalary sal
	ON emp.EmployeeID = sal.EmployeeID
Group by JobTitle

Select *
From #TEMP_Employee2
