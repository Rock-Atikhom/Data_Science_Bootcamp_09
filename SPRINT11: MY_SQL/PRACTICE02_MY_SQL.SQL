-- SELECST CLAUSE

SELECT 
	FirstName,
	Lastname
FROM EmployeeDemographics;


-- SELECT CLAUSE WITH TOP FIVE LINE

SELECT TOP 5 *
FROM EmployeeDemographics;


-- SELECT CLAUSE WITH DISTINCT

SELECT DISTINCT(EmployeeID)
FROM EmployeeDemographics;

SELECT DISTINCT(Gender)
FROM EmployeeDemographics;


-- SELECT CLAUSE WITH COUNT

SELECT COUNT(Lastname) AS LastNameCount
FROM EmployeeDemographics;


-- SELECT CLAUSE WITH AGGREGATION

SELECT MAX(Salary)
FROM EmployeeSalary;

SELECT MIN(Salary)
FROM EmployeeSalary;

SELECT AVG(Salary)
FROM EmployeeSalary;


-- ANOTHER DATABASES

SELECT *
FROM [SQL Tutorial].dbo.EmployeeSalary;
