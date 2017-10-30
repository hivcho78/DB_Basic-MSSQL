--Exercises: Built-in Functions

--Part I Queries for SoftUni Database

--Problem 1.	Find Names of All Employees by First Name
SELECT FirstName LastName FROM Employees
WHERE SUBSTRING (FirstName,1,2)='SA'

--Problem 2.	  Find Names of All employees by Last Name 
SELECT FirstName LastName FROM Employees
WHERE CHARINDEX('ei',LastName) > 0

--Problem 3.	Find First Names of All Employees
SELECT FirstName FROM Employees
WHERE DepartmentID IN(3, 10) AND YEAR(HireDate) BETWEEN 1995 AND 2005

--Problem 4.	Find All Employees Except Engineers
SELECT FirstName LastName FROM Employees
WHERE JobTitle !='engineer'

--Problem 5.	Find Towns with Name Length
SELECT Name FROM Towns
WHERE LEN(Name) IN(5,6)
ORDER BY Name ASC

--6.  Find Towns Starting With
SELECT Name FROM Towns
WHERE LEFT(Name,1) IN('M','K','B','E')
ORDER BY Name ASC

--7.Find Towns Not Starting With
SELECT Name FROM Towns
WHERE LEFT(Name,1) NOT IN('R','B','D')
ORDER BY Name ASC

--Problem 8.	Create View Employees Hired After 2000 Year
CREATE VIEW V_EmployeesHiredAfter2000  AS
SELECT FirstName,LastName FROM Employees
WHERE YEAR(HireDate)>2000

--Problem 9.	Length of Last Name
SELECT FirstName,LastName FROM Employees
WHERE LEN(LastName)=5

--Part II – Queries for Geography Database 
--Problem 10.	Countries Holding ‘A’ 3 or More Times
SELECT CountryName,IsoCode FROM Countries
WHERE CountryName LIKE '%a%a%a%'
ORDER BY IsoCode

--Problem 11.	 Mix of Peak and River Names

SELECT PeakName, RiverName, 
LOWER(SUBSTRING(PeakName,1,LEN(PeakName)-1)+RiverName) AS Mix
FROM Peaks Join Rivers
ON RIGHT(Peaks.PeakName,1)=LEFT(Rivers.RiverName,1)
ORDER BY Mix

--Part III – Queries for Diablo Database
--Problem 12.	Games from 2011 and 2012 year
SELECT TOP(50) Name,FORMAT([Start],'yyyy-MM-dd') FROM Games 
WHERE Start BETWEEN '2011-01-01' AND '2012-12-31'
ORDER BY Start,Name

--Problem 13.	 User Email Providers
SELECT Username ,RIGHT(Email,LEN(Email)-CHARINDEX('@',Email)) AS[Email Provider] FROM Users
ORDER BY [Email Provider],Username


