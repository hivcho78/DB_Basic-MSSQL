--Problem 1.	Records’ Count
SELECT COUNT(Id) FROM WizzardDeposits

--Problem 2.	Longest Magic Wand
SELECT MAX(MagicWandSize) AS [LongestMagicWand] FROM WizzardDeposits

--Problem 3.	Longest Magic Wand per Deposit Groups
SELECT DepositGroup,MAX(MagicWandSize) FROM WizzardDeposits
GROUP BY DepositGroup

--Problem 4.    Smallest Deposit Group per Magic Wand Size
SELECT TOP(1) WITH TIES DepositGroup FROM WizzardDeposits
GROUP BY DepositGroup
ORDER BY AVG(MagicWandSize)


--Problem 5.	Deposits Sum
SELECT DepositGroup,SUM(DepositAmount) AS [TotalSum] FROM WizzardDeposits
GROUP BY DepositGroup

--Problem 6.	Deposits Sum for Ollivander Family
SELECT DepositGroup,SUM(DepositAmount) AS [TotalSum] FROM WizzardDeposits
WHERE MagicWandCreator='Ollivander family'
GROUP BY DepositGroup

--Problem 7.	Deposits Filter
SELECT DepositGroup,SUM(DepositAmount) AS [TotalSum] FROM WizzardDeposits
WHERE MagicWandCreator='Ollivander family'
GROUP BY DepositGroup
HAVING SUM(DepositAmount)<150000
ORDER BY SUM(DepositAmount) DESC

--Problem 8.	Deposit Charge
SELECT DepositGroup,MagicWandCreator,MIN(DepositCharge) AS MinDepositCharge FROM WizzardDeposits
GROUP BY DepositGroup,MagicWandCreator

--Problem 9.	Age Groups
SELECT
CASE
WHEN Age>=0 AND Age <=10 THEN '[0-10]'
WHEN Age>=11 AND Age <=20 THEN '[11-20]'
WHEN Age>=21 AND Age <=30 THEN '[21-30]'
WHEN Age>=31 AND Age <=40 THEN '[31-40]'
WHEN Age>=41 AND Age <=50 THEN '[41-50]'
WHEN Age>=51 AND Age <=60 THEN '[51-60]'
ELSE'[61+]'
END AS[AgeGroup],COUNT(*) AS 'WizardCount' FROM WizzardDeposits
GROUP BY CASE
WHEN Age>=0 AND Age <=10 THEN '[0-10]'
WHEN Age>=11 AND Age <=20 THEN '[11-20]'
WHEN Age>=21 AND Age <=30 THEN '[21-30]'
WHEN Age>=31 AND Age <=40 THEN '[31-40]'
WHEN Age>=41 AND Age <=50 THEN '[41-50]'
WHEN Age>=51 AND Age <=60 THEN '[51-60]'
ELSE'[61+]'
END

--Problem 10.	First Letter
SELECT LEFT(FirstName,1) AS[FirstLetter] FROM WizzardDeposits
WHERE DepositGroup='Troll Chest'
GROUP BY LEFT(FirstName,1)

--Problem 11.	Average Interest 
SELECT DepositGroup,IsDepositExpired,AVG(DepositInterest) AS[AverageInterest] FROM WizzardDeposits
WHERE DepositStartDate >'01/01/1985'
GROUP BY DepositGroup,IsDepositExpired
ORDER BY DepositGroup DESC,IsDepositExpired ASC

--Problem 12.	* Rich Wizard, Poor Wizard
SELECT SUM(HostWizards.DepositAmount - GuestWizards.DepositAmount)
FROM WizzardDeposits AS HostWizards
INNER JOIN WizzardDeposits AS GuestWizards
ON HostWizards.Id + 1 = GuestWizards.Id

--Problem 13.	Departments Total Salaries
USE SoftUni
SELECT DepartmentID,SUM(Salary) AS[TotalSalary] FROM EMPLOYEES
GROUP BY  DepartmentID
ORDER BY DepartmentID

--Problem 14.	Employees Minimum Salaries
SELECT DepartmentID,MIN(Salary) AS[MinimumSalary] FROM EMPLOYEES
WHERE HireDate >'01/01/2000'
GROUP BY  DepartmentID
HAVING DepartmentID IN(2,5,7)

--Problem 15.	Employees Average Salaries
SELECT *INTO NewTable FROM Employees
WHERE Salary >30000

DELETE FROM NewTable
WHERE ManagerID =42

UPDATE NewTable
SET Salary+=5000
WHERE DepartmentID=1 

SELECT DepartmentID,AVG(Salary) AS[AverageSalary] FROM NewTable
GROUP BY DepartmentID

--Problem 16.	Employees Maximum Salaries
SELECT DepartmentID,MAX(Salary) AS[MaxSalary] FROM Employees
GROUP BY DepartmentID
HAVING MAX(Salary)<30000 or MAX(Salary) >70000

--Problem 17.	Employees Count Salaries
SELECT COUNT(*) AS[Count] FROM Employees
WHERE ManagerID IS NULL

--Problem 18.	*3rd Highest Salary