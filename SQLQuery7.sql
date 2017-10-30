--Exercises: Functions and Procedures
--Part I – Queries for SoftUni Database
--Problem 1.	Employees with Salary Above 35000

/*CREATE PROC usp_GetEmployeesSalaryAbove35000
AS
BEGIN
SELECT FirstName,LastName
FROM Employees
WHERE Salary > 35000
END
EXEC usp_GetEmployeesSalaryAbove35000
*/

--Problem 2.	Employees with Salary Above Number
/*CREATE PROC usp_GetEmployeesSalaryAboveNumber (@minSalary money)
AS 
SELECT  FirstName,LastName
FROM Employees
WHERE Salary >=@minSalary
EXEC  usp_GetEmployeesSalaryAboveNumber[48100]
*/

--Problem 3.	Town Names Starting With
CREATE PROC usp_GetTownsStartingWith(@startingWith varchar(max))
AS 
BEGIN
SELECT Name AS Town
FROM Towns
WHERE Name LIKE CONCAT(@startingWith,'%')
END
EXEC usp_GetTownsStartingWith[b]

--Problem 4.	Employees from Town

CREATE PROC usp_GetEmployeesFromTown 

