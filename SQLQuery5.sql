--Exercises: Table Relations
CREATE DATABASE TableRelations

--Problem 1.	One-To-One Relationship
CREATE TABLE Passports(
PassportID INT PRIMARY KEY,
PassportNumber VARCHAR(8) NOT NULL
)

CREATE TABLE Persons(
PersonID INT PRIMARY KEY,
FirstName VARCHAR(45) NOT NULL,
Salary FLOAT,
PassportID INT UNIQUE
CONSTRAINT FK_Persons_Passports FOREIGN KEY REFERENCES Passports(PassportID)
)

--Problem 2.	One-To-Many Relationship
CREATE TABLE Manufacturers(
ManufacturerID INT PRIMARY KEY,
Name VARCHAR(25) NOT NULL,
EstablishedOn DATETIME
)

CREATE TABLE Models(
ModelID INT PRIMARY KEY,
Name VARCHAR(32) NOT NULL,
ManufacturerID INT
CONSTRAINT FK_Models_Manufacturers FOREIGN KEY(ManufacturerID)
REFERENCES Manufacturers(Manufacturerid)
)

--Problem 3.	Many-To-Many Relationship
CREATE TABLE Students(
StudentID INT NOT NULL,
Name VARCHAR(25) NOT NULL,
CONSTRAINT PK_STudents PRIMARY KEY(StudentID)
)

CREATE TABLE Exams(
ExamID INT NOT NULL,
Name VARCHAR(25) NOT NULL,
CONSTRAINT PK_Exams PRIMARY KEY(ExamID)
)

CREATE TABLE StudentsExams(
StudentID INT NOT NULL,
ExamID INT NOT NULL,
CONSTRAINT PK_StudentsExams PRIMARY KEY(StudentID,ExamID),
CONSTRAINT FK_StudentsExams_Students FOREIGN KEY(StudentID) REFERENCES Students(StudentID),
CONSTRAINT FK_StudentsExams_Exams FOREIGN KEY(ExamID) REFERENCES Exams(ExamID)
)

--Problem 4.	Self-Referencing 
CREATE TABLE Teachers(
TeacherID INT NOT NULL,
Name VARCHAR(25) NOT NULL,	
ManagerID INT,
CONSTRAINT PK_Teachers PRIMARY KEY(TeacherID),
CONSTRAINT FK_Teachers_TeacherID FOREIGN KEY(ManagerID) REFERENCES Teachers(TeacherID)
)

--Problem 5.	Online Store Database
CREATE TABLE Cities(
CityID INT,
Name VARCHAR(50),
CONSTRAINT PK_Cities PRIMARY KEY(CityID),
)

CREATE TABLE Customers(
CustomerID INT NOT NULL,
Name VARCHAR(50) NOT NULL,
Birthday  DATE,
CityID INT,
CONSTRAINT PK_Customers PRIMARY KEY(CustomerID),
CONSTRAINT FK_Customers_Cities FOREIGN KEY(CityID) REFERENCES Cities(CityID)

)

CREATE TABLE Orders(
OrderID INT NOT NULL,
CustomerID INT NOT NULL,
CONSTRAINT PK_Orders PRIMARY KEY(OrderID),
CONSTRAINT FK_Orders_Customers FOREIGN KEY(CustomerID) REFERENCES Customers(CustomerID)
)

CREATE TABLE ItemTypes(
  ItemTypeID int NOT NULL,
  Name varchar(50) NOT NULL,
  CONSTRAINT PK_ItemTypes PRIMARY KEY (ItemTypeID)
)

CREATE TABLE Items(
  ItemID int NOT NULL,
  Name varchar(50) NOT NULL,
  ItemTypeID int NOT NULL,
  CONSTRAINT PK_Items PRIMARY KEY (ItemID),
  CONSTRAINT FK_Items_ItemTypes FOREIGN KEY (ItemTypeID) REFERENCES ItemTypes(ItemTypeID)
)

CREATE TABLE OrderItems(
OrderID INT NOT NULL,
ItemID INT NOT NULL,
CONSTRAINT PK_OrderItems PRIMARY KEY(OrderID,ItemID),
CONSTRAINT FK_OrderItems_Items FOREIGN KEY(ItemID) REFERENCES Items(ItemID)
)

--Problem 6.	University Database
CREATE DATABASE University

 CREATE TABLE Majors(
 MajorID INT NOT NULL,
 Name VARCHAR(35),
 CONSTRAINT PK_Majors PRIMARY KEY(MajorID)
 )

 CREATE TABLE Students(
 StudentID INT NOT NULL,
 StudentNumber INT,
 SudentName VARCHAR(50),
 MajorID INT NOT NULL,
  CONSTRAINT PK_Students PRIMARY KEY(StudentID),
  CONSTRAINT FK_Students_Majors FOREIGN KEY(MajorID) REFERENCES Majors(MajorID)
 )

 CREATE TABLE Payments(
 PaymentID INT NOT NULL,
 PaymentDate DATE,
 PaymentAmount FLOAT,
 StudentID INT,
  CONSTRAINT PK_Payments PRIMARY KEY(PaymentID),
  CONSTRAINT FK_Payments_Students FOREIGN KEY(StudentID) REFERENCES Students(StudentID)
 )

  CREATE TABLE Subjects(
  SubjectID int NOT NULL,
  SubjectName VARCHAR(50) NOT NULL,
  CONSTRAINT PK_Subjects PRIMARY KEY(SubjectID)
 )

 CREATE TABLE Agenda(
  StudentID int NOT NULL,
  SubjectID int NOT NULL,
   CONSTRAINT PK_Agenda PRIMARY KEY(StudentID,SubjectID),
   CONSTRAINT FK_Agenda_Students FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
  CONSTRAINT FK_Agenda_Subjects FOREIGN KEY (SubjectID) REFERENCES Subjects(SubjectID)
)

--Problem9.     Peaks in Rila
SELECT MountainRange, PeakName, Elevation FROM Peaks as p
JOIN Mountains as m
ON m.Id = p.MountainId
WHERE MountainRange = 'Rila'
ORDER BY Elevation DESC

