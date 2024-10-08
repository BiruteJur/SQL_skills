CREATE DATABASE hrcompany;

USE hrcompany;

-- JobPositions Table
CREATE TABLE JobPositions (
    JobPositionID INT AUTO_INCREMENT PRIMARY KEY,
    PositionTitle VARCHAR(50),
    JobDescription TEXT
);

-- Departments Table
CREATE TABLE Departments (
    DepartmentID INT AUTO_INCREMENT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

-- Employees Table
CREATE TABLE Employees (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DateOfBirth DATE,
    Gender VARCHAR(10),
    Email VARCHAR(100),
    Phone VARCHAR(20),
    Address TEXT,
    HireDate DATE,
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- Salaries Table
CREATE TABLE Salaries (
    SalaryID INT AUTO_INCREMENT PRIMARY KEY,
    EmployeeID INT,
    SalaryAmount DECIMAL(10, 2),
    SalaryStartDate DATE,
    SalaryEndDate DATE,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

-- Skills Table
CREATE TABLE Skills (
    SkillID INT AUTO_INCREMENT PRIMARY KEY,
    SkillName VARCHAR(50)
);

-- EmployeeSkills Table
CREATE TABLE EmployeeSkills (
    EmployeeSkillID INT AUTO_INCREMENT PRIMARY KEY,
    EmployeeID INT,
    SkillID INT,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
    FOREIGN KEY (SkillID) REFERENCES Skills(SkillID)
);

-- LeaveRequests Table
CREATE TABLE LeaveRequests (
    LeaveRequestID INT AUTO_INCREMENT PRIMARY KEY,
    EmployeeID INT,
    LeaveStartDate DATE,
    LeaveEndDate DATE,
    LeaveType VARCHAR(50),
    Status VARCHAR(20),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

-- PerformanceReviews Table
CREATE TABLE PerformanceReviews (
    ReviewID INT AUTO_INCREMENT PRIMARY KEY,
    EmployeeID INT,
    ReviewDate DATE,
    ReviewerID INT,
    ReviewText TEXT,
    Rating INT,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
    FOREIGN KEY (ReviewerID) REFERENCES Employees(EmployeeID)
);

-- Benefits Table
CREATE TABLE Benefits (
    BenefitID INT AUTO_INCREMENT PRIMARY KEY,
    BenefitName VARCHAR(50),
    Description TEXT,
    Cost DECIMAL(10, 2)
);

-- EmployeeBenefits Table
CREATE TABLE EmployeeBenefits (
    EmployeeBenefitID INT AUTO_INCREMENT PRIMARY KEY,
    EmployeeID INT,
    BenefitID INT,
    EnrollmentDate DATE,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
    FOREIGN KEY (BenefitID) REFERENCES Benefits(BenefitID)
);