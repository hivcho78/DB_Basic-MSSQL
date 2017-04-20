--01.Problem-create table
use master
go
create database Minions1
go

--02.Problem-create tables
create table Minions
(
Id int identity not null,
Name varchar(50) not null,
Age int
constraint PK_Minions primary key(Id)
)
 create table Towns
 (
 Id int identity not null,
 Name varchar(50)
 constraint PK_Towns primary key(Id)
 )

 --03.Problem-alter Minions table
 alter table Minions
 add TownId int
 constraint FK_Minions1_Towns foreign key(TownId) references Towns(Id)

 --04.Problem-Insert Records in Both Tables
 insert into Towns(Name)
 values('Sofia'),('Plovdiv'),('Varna')

 insert into Minions(Name,Age,TownId)
 values('Kevin',22,1),('Bob',15,3),('Steward',null,2)

 select*from Minions
 select*from Towns

 --Problem 5.	Truncate Table Minions
 truncate table Minions
 
 --Problem 6.	Drop All Tables
 drop table Minions
 drop table Towns
 
 --Problem 7.	Create Table People
create table People
(
Id int identity,
Name varchar(200) not null,
Picture varbinary(max),
Height numeric(10,2),
Weight numeric(10,2),
Gender char(1) not null,
Birthdate date not null,
Biography nvarchar(max)
constraint PK_People primary key(Id)
)

INSERT INTO People (Name, Picture, Height, Weight, Gender, Birthdate, Biography)
VALUES
('Kevin', NULL, 1.82, 82.24, 'm', '01/02/2001', 'Some Biography here'),
('Marie Poppinz', NULL, 1.60, 40.55, 'f', '01/03/2001', 'Some Biography here'),
('Steward', NULL, 1.84, 95.00, 'm', '01/04/2001', 'Some Biography here'),
('Bob Bob', NULL, 1.86, 101.99, 'm', '06/11/2001', 'Some Biography here'),
('An Ann Annie', NULL, 1.72, 60.22, 'f', '01/12/2001', 'Some Biography here')

SELECT COUNT(*) FROM People

--Problem 8.	Create Table Users
create table Users
(
Id BIGINT identity not null,
Username varchar(30) not null,
Password varchar(30) not null,
ProfilePicture varbinary(max),
LastLoginTime date,
IsDeleted bit
constraint PK_Users primary key(Id)
)

INSERT INTO Users (Username, Password, ProfilePicture, LastLoginTime, IsDeleted)
VALUES
('pesho', '123456', NULL, GETDATE(), 0),
('gosho', '234567', NULL, GETDATE(), 0),
('mitko', '345678', NULL, GETDATE(), 1),
('cecko', '456789', NULL, GETDATE(), 0),
('bosko', '5678910', NULL, GETDATE(), 1)

SELECT COUNT(*) FROM Users

--Problem 9.	Change Primary Key
alter table Users
drop constraint PK_Users

alter table Users
add constraint PK_Users primary key(Id,Username)

--Problem 10.	Add Check Constraint
alter table Users
add constraint chk_PasswordLenght check(len(Password)>5)

--Problem 11.	Set Default Value of a Field
alter table Users
add default getdate() for LastLoginTime

--Problem 12.	Set Unique Field
alter table Users
drop constraint PK_Users

alter table Users
add constraint PK_Users primary key(Id)

alter table Users
add constraint uc_Username unique(Username)

alter table Users
add constraint uc_UsernameLenght check(len(username)>3)

--Problem 13.	Movies Database
create database Movies

create table Directors
(
Id int identity not null,
DirectorName nvarchar(50) not null,
Notes nvarchar(1000)
constraint PK_Directors primary key(Id)
)

create table Genres
(
Id int identity not null,
GenreName nvarchar(20) not null,
Notes nvarchar(1000)
constraint PK_Genres primary key(Id)
)

create table Categories
(
Id int identity not null,
CategoryName nvarchar(20) not null,
Notes nvarchar(1000)
constraint PK_Categories primary key(Id)
)

create table Movies
(
Id INT IDENTITY NOT NULL,
Title NVARCHAR(50) NOT NULL,
DirectorId INT NOT NULL,
CopyrightYear SMALLINT,
Length INT,
GenreId INT,
CategoryId INT,
Rating NUMERIC,
Notes NVARCHAR(1000)
CONSTRAINT PK_Movies PRIMARY KEY (Id)
)

INSERT INTO Directors (DirectorName, Notes)
VALUES
('Ben Affleck', 'sample notes'),
('Woody Allen', 'sample notes'),
('Luc Besson', 'sample notes'),
('Cameron Crowe', 'sample notes'),
('Clint Eastwood', 'sample notes')

INSERT INTO Genres (GenreName, Notes)
VALUES
('Action', 'sample notes'),
('Comedy', 'sample notes'),
('Horror', 'sample notes'),
('Thriller', 'sample notes'),
('Drama', 'sample notes')

INSERT INTO Categories (CategoryName, Notes)
VALUES
('0-3', 'suitable for infants'),
('7-12', 'suitable for kids'),
('12-16', 'suitable for teenagers'),
('16-18', NULL),
('18+', 'suitable for adults')

INSERT INTO Movies (Title, DirectorId, CopyrightYear, Length, GenreId, CategoryId, Rating, Notes)
VALUES
('Titanic', 1, 1998, 181, 1, 4, 8.2, 'sample notes'),
('Avatar', 4, 2008, 160, 2, 3, 9.22, 'sample notes'),
('Rocky 1', 2, 1980, 90, 3, 1, 9.99, 'sample notes'),
('Rocky 2', 3, 1983, 92, 5, 2, 10.1, 'sample notes'),
('Rocky 3', 1, 1986, 95, 1, 5, 6.2, 'sample notes')

SELECT COUNT(*) FROM Directors
SELECT COUNT(*) FROM Genres
SELECT COUNT(*) FROM Categories
SELECT COUNT(*) FROM Movies

--Problem 14.	Car Rental Database
create database CarRental

create table Categories
(
Id int identity not null,
CategoryName nvarchar(30) not null,
DailyRate numeric,
WeeklyRate numeric,
MonthlyRate numeric,
WeekendRate numeric
constraint PK_Categories primary key(Id)
)

create table Cars
(
Id int identity not null,
PlateNumber nvarchar(30) not null,
Manufacturer nvarchar(30) not null,
Model nvarchar(30) not null,
CarYear int,
CategoryId int,
Doors int,
Picture varbinary(max),
Condition nvarchar(30),
Available bit
constraint PK_Cars primary key(Id)
)

create table Employees
(
Id int identity not null,
FirstName nvarchar(50) not null,
LastName nvarchar(50) not null,
Title nvarchar(50),
Notes nvarchar(200)
constraint PK_Employess primary key(Id)
)
 

create table Customers
(
Id int identity not null,
DriverLicenceNumber nvarchar(10) not null,
FullName nvarchar(90) not null,
Address nvarchar(500),
City nvarchar(60),
ZIPCode nvarchar(15),
Notes nvarchar(200)
constraint PK_Customers primary key(id)
)

create table RentalOrders
(
Id INT IDENTITY NOT NULL,
EmployeeId INT NOT NULL,
CustomerId INT NOT NULL,
CarId INT NOT NULL,
CarCondition NVARCHAR(20),
TankLevel NUMERIC(10,2),
KilometrageStart INT,
KilometrageEnd INT,
TotalKilometrage INT,
StartDate DATE,
EndDate DATE,
TotalDays INT,
RateApplied INT,
TaxRate NUMERIC,
OrderStatus NVARCHAR(10),
Notes NVARCHAR(200)
CONSTRAINT PK_RentalOrders PRIMARY KEY (Id)
)

INSERT INTO Categories (CategoryName)
VALUES ('Car'), ('Truck'), ('Van')

INSERT INTO Cars (PlateNumber, Manufacturer, Model)
VALUES
('A1234AA', 'Opel', 'Omega'),
('A6542AB', 'Ford', 'Focus'),
('OB4444AP', 'Lada', 'Niva')

INSERT INTO Employees (FirstName, LastName)
VALUES
('Ivan', 'Ivanov'),
('Petar', 'Petrov'),
('Misha', 'Mishav')

INSERT INTO Customers (DriverLicenceNumber, FullName)
VALUES
('A12345', 'Ivan Ivanov Ivanov'),
('A12346', 'Ivan Ivanov Petrov'),
('A12342', 'Petar Ivanov Ivanov')

INSERT INTO RentalOrders (EmployeeId, CustomerId, CarId)
VALUES
(1, 2, 3),
(2, 3, 1),
(2, 2, 2)

SELECT COUNT(*) FROM Categories
SELECT COUNT(*) FROM Cars
SELECT COUNT(*) FROM Employees
SELECT COUNT(*) FROM Customers
SELECT COUNT(*) FROM RentalOrders

--Problem 15. Hotel Database
CREATE DATABASE Hotel

CREATE TABLE Employees
(
Id INT IDENTITY NOT NULL,
FirstName NVARCHAR(50) NOT NULL,
LastName NVARCHAR(50) NOT NULL,
Title NVARCHAR(20),
Notes NVARCHAR(200)
CONSTRAINT PK_Employees PRIMARY KEY (Id)
)

CREATE TABLE Customers
(
AccountNumber BIGINT NOT NULL,
FirstName NVARCHAR(50) NOT NULL,
LastName NVARCHAR(50) NOT NULL,
PhoneNumber NVARCHAR(15) NOT NULL,
EmergencyName NVARCHAR(50),
EmergencyNumber NVARCHAR(15),
Notes NVARCHAR(200)
CONSTRAINT PK_Customers PRIMARY KEY (AccountNumber)
)

CREATE TABLE RoomStatus
(
RoomStatus NVARCHAR(10) NOT NULL,
Notes NVARCHAR(200)
CONSTRAINT PK_RoomStatus PRIMARY KEY (RoomStatus)
)

CREATE TABLE RoomTypes
(
RoomType NVARCHAR(10) NOT NULL,
Notes NVARCHAR(200)
CONSTRAINT PK_RoomTypes PRIMARY KEY (RoomType)
)

CREATE TABLE BedTypes
(
BedType NVARCHAR(10) NOT NULL,
Notes NVARCHAR(200)
CONSTRAINT PK_BedTypes PRIMARY KEY (BedType)
)

CREATE TABLE Rooms
(
RoomNumber INT NOT NULL,
RoomType NVARCHAR(10) NOT NULL,
BedType NVARCHAR(10) NOT NULL,
Rate NUMERIC,
RoomStatus NVARCHAR(10) NOT NULL,
Notes NVARCHAR(200)
CONSTRAINT PK_Rooms PRIMARY KEY (RoomNumber)
)

CREATE TABLE Payments
(
Id INT IDENTITY NOT NULL,
EmployeeId INT NOT NULL,
PaymentDate DATE NOT NULL,
AccountNumber BIGINT NOT NULL,
FirstDateOccupied DATE,
LastDateOccupied DATE,
TotalDays INT,
AmountCharged NUMERIC NOT NULL,
TaxRate NUMERIC,
TaxAmount NUMERIC,
PaymentTotal NUMERIC NOT NULL,
Notes NVARCHAR(200)
CONSTRAINT PK_Payments PRIMARY KEY (Id)
)

CREATE TABLE Occupancies
(
Id INT IDENTITY NOT NULL,
EmployeeId INT NOT NULL,
DateOccupied DATE,
AccountNumber BIGINT NOT NULL,
RoomNumber INT NOT NULL,
RateApplied NUMERIC,
PhoneCharge NUMERIC,
Notes NVARCHAR(200)
CONSTRAINT PK_Occupancies PRIMARY KEY (Id)
)

INSERT INTO Employees (FirstName, LastName)
VALUES
('Ivan', 'Ivanov'),
('Petar', 'Petrov'),
('Mitko', 'Dimitrov')

INSERT INTO Customers(AccountNumber, FirstName, LastName, PhoneNumber)
VALUES
(34545674545, 'Ivan', 'Petrov', '+35988999999'),
(35436554234, 'Misho', 'Petrovanov', '+359889965479'),
(12480934333, 'Nikolay', 'Nikov', '+35988999919')

INSERT INTO RoomStatus (RoomStatus)
VALUES
('Occupied'),
('Available'),
('Cleaning')

INSERT INTO RoomTypes (RoomType)
VALUES
('Single'),
('Double'),
('Apartment')

INSERT INTO BedTypes (BedType)
VALUES
('Double'),
('Queen'),
('King')

INSERT INTO Rooms (RoomNumber, RoomType, BedType, RoomStatus)
VALUES
(1, 'Single', 'Double', 'Available'),
(2, 'Double', 'King', 'Available'),
(12, 'Apartment', 'Queen', 'Occupied')

INSERT INTO Payments (EmployeeId, PaymentDate, AccountNumber, AmountCharged, PaymentTotal, TaxRate)
VALUES
(1, GETDATE(), 34545675676, 10.20, 12.20, 2.4),
(3, GETDATE(), 34545675676, 220.20, 240.22, 2.1),
(2, GETDATE(), 34545675676, 190.20, 215.88, 1.1)

INSERT INTO Occupancies (EmployeeId, AccountNumber, RoomNumber)
VALUES
(1, 34545675676, 2),
(2, 34545675676, 1),
(2, 34545675676, 12)

SELECT COUNT(*) FROM Employees
SELECT COUNT(*) FROM Customers
SELECT COUNT(*) FROM RoomStatus
SELECT COUNT(*) FROM RoomTypes
SELECT COUNT(*) FROM BedTypes
SELECT COUNT(*) FROM Rooms
SELECT COUNT(*) FROM Payments
SELECT COUNT(*) FROM Occupancies

--Problem 16. Create SoftUni Database
CREATE DATABASE SoftUni

CREATE TABLE Towns
(
	Id INT IDENTITY,
	Name NVARCHAR(50)
	CONSTRAINT PK_TownsId PRIMARY KEY (Id)
)

CREATE TABLE Addresses
(
	Id INT IDENTITY,
	AddressText NVARCHAR(100),
	TownId INT
	CONSTRAINT PK_AdressesId PRIMARY KEY (Id)
	CONSTRAINT FK_Adresses_Towns FOREIGN KEY (TownId) REFERENCES Towns(Id)
)
CREATE TABLE Departments
(
	Id INT IDENTITY,
	Name NVARCHAR(50)
	CONSTRAINT PK_DepartmentsId PRIMARY KEY (Id)
)

CREATE TABLE Employees
(
	Id INT IDENTITY,
	FirstName NVARCHAR(50),
	MiddleName NVARCHAR(50),
	LastName NVARCHAR(50),
	JobTitle NVARCHAR(20),
	DepartmentId INT,
	HireDate DATE,
	Salary MONEY,
	AddressId INT
	CONSTRAINT PK_EmployeesID PRIMARY KEY (Id),
	CONSTRAINT FK_Employees_Deparments FOREIGN KEY (DepartmentId) REFERENCES Departments(Id),
	CONSTRAINT FK_Employees_Addresses FOREIGN KEY (AddressId) REFERENCES Addresses(Id)
)

--Problem 17. Backup Database
BACKUP DATABASE SoftUni
	TO DISK = 'D:\softuni-backup.bak' --location where the backup file will be saved
		WITH FORMAT,
			MEDIANAME = '',
			NAME = 'Full Backup of SoftUni db';
GO

RESTORE DATABASE SoftUni
FROM DISK = 'D:\softuni-backup.bak' --location of the db on your hard drive
GO

--Problem 18. Basic Insert
USE SoftUni
GO

INSERT INTO Towns (Name)
VALUES ('Sofia'), ('Plovdiv'), ('Varna'), ('Burgas')

INSERT INTO Departments (Name) 
VALUES ('Engineering'), ('Sales'), ('Marketing'), ('Software Development'), ('Quality Assurance')

INSERT INTO Employees (FirstName, MiddleName, LastName, JobTitle, DepartmentId, HireDate, Salary) 
VALUES 
('Ivan', 'Ivanov', 'Ivanov', '.NET Developer', 4, '01/02/2013', 3500.00),
('Petar', 'Petrov', 'Petrov', 'Senior Engineer', 1, '02/03/2004', 4000.00),
('Maria', 'Petrova', 'Ivanova', 'Intern', 5, '08/28/2016', 525.25),
('Georgi', 'Terziev', 'Ivanov', 'CEO', 2, '09/12/2007', 3000.00),
('Peter', 'Pan', 'Pan', 'Intern', 3, '08/28/2016', 599.88)

--Problem 20.	Basic Select All Fields and Order Them
select * from Towns
select * from Departments
select * from Employees

--Problem 21.	Basic Select Some Fields
select Name from Towns order by Name
select Name from Departments order by Name
select FirstName,LastName,JobTitle,Salary from Employees order by Salary desc

--Problem 22.	Increase Employees Salary
update Employees
set Salary+=Salary*0.1
select Salary from Employees

--Problem 23.	Decrease Tax Rate
use Hotel
go
update Payments
set TaxRate-=TaxRate *0.03
select TaxRate from Payments

--Problem 24.	Delete All Records
DELETE FROM Occupancies
SELECT COUNT(*) FROM Occupancies
