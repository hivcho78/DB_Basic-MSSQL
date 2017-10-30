--7.Exercises - Joins, Subqueries, CTE and Indices

--Problem 1.	Employee Address
use SoftUni

SELECT TOP(5) e.EmployeeID,e.JobTitle,a.AddressId,a.AddressText
FROM Employees AS e
JOIN Addresses AS a
ON a.AddressID=e.AddressID
ORDER BY e.AddressID

--Problem 2.	Addresses with Towns
SELECT TOP(50)  e.FirstName,e.LastName,t.Name AS Town,a.AddressText
FROM Employees AS e
JOIN Addresses AS a
ON a.AddressID=e.AddressID
Join Towns AS t
ON t.TownID=a.TownID
ORDER BY e.FirstName ASC,e.LastName ASC

--Problem 3.	Sales Employee
SELECT e.EmployeeID,e.FirstName,e.LastName,d.Name AS DepartmentName
FROM Employees AS e
JOIN Departments AS d
ON d.DepartmentID=e.DepartmentID
WHERE d.Name='Sales'
ORDER BY e.EmployeeID

--Problem 4.	Employee Departments
SELECT TOP(5) e.EmployeeID,e.FirstName,e.Salary,d.Name AS DepartmentName
FROM Employees AS e
JOIN Departments AS d
ON d.DepartmentID=e.DepartmentID
WHERE e.Salary >15000
ORDER BY d.DepartmentID

--Problem 5.	Employees Without Project
SELECT TOP(3) e.EmployeeID,e.FirstName
FROM Employees AS e
LEFT JOIN EmployeesProjects AS ep
ON ep.EmployeeID=e.EmployeeID
WHERE ep.EmployeeID IS NULL
ORDER BY EmployeeID

--Problem 6.	Employees Hired After
SELECT  e.FirstName,e.LastName,e.HireDate,d.Name AS DeptName
FROM Employees AS e
JOIN Departments AS d
ON d.DepartmentID=e.DepartmentID
WHERE e.HireDate >'1.1.1999 '
AND d.Name ='Sales' OR d.Name='Finance'
ORDER BY e.HireDate

--Problem 7.	Employees with Project
SELECT TOP(5) e.EmployeeID,e.FirstName,p.Name AS ProjectName
FROM Employees AS e
JOIN EmployeesProjects as ep
ON ep.EmployeeID=e.EmployeeID
JOIN Projects AS p ON
p.ProjectID=ep.ProjectID
WHERE p.StartDate>'2002-08-13 00:00:00'
ORDER BY e.EmployeeID

--Problem 8.	Employee 24
SELECT  e.EmployeeID,e.FirstName,CASE WHEN DATEPART(YEAR,p.StartDate)>=2005 THEN null ELSE p.Name END AS ProjectName
FROM Employees AS e JOIN EmployeesProjects as ep
ON ep.EmployeeID=e.EmployeeID JOIN Projects AS p ON
p.ProjectID=ep.ProjectID
WHERE e.EmployeeID=24

--Problem 9.	Employee Manager
SELECT  e.EmployeeID,e.FirstName,e.ManagerID,e2.FirstName AS ManagerName FROM Employees AS e
JOIN Employees AS e2 ON e.ManagerID=e2.EmployeeID
WHERE e.ManagerID IN(3,7)
ORDER BY e.EmployeeID

--Problem 10.	Employee Summary
SELECT TOP(50)  e.EmployeeID,e.FirstName+' '+e.LastName AS EmployeeName,e2.FirstName+' '+e2.LastName AS ManagerName,
d.Name AS DepartmentName
 FROM Employees AS e
 JOIN Employees AS e2 ON e.ManagerID=e2.EmployeeID
 JOIN Departments AS d ON e.DepartmentID=d.DepartmentID
 ORDER BY e.EmployeeID