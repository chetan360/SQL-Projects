USE HR;

-- Table for Managers
CREATE TABLE tblManager (
    MID INT PRIMARY KEY,
    First_Name NVARCHAR(255) NOT NULL,
    Last_Name NVARCHAR(255),
    Email NVARCHAR(255),
    Contact NVARCHAR(10),
    Img VARBINARY(MAX)
);

-- Table for Departments
CREATE TABLE tblDepartment (
    DID INT PRIMARY KEY,
    MID INT,
    Department_Name NVARCHAR(255),
    FOREIGN KEY (MID) REFERENCES tblManager(MID)
);

-- Table for Salary
CREATE TABLE tblSalary (
    SID INT PRIMARY KEY,
    Base_Salary INT,
    Bonus_Salary INT
);

-- Table for Employees
CREATE TABLE tblEmployee (
    EID INT PRIMARY KEY,
    DID INT,
    First_Name NVARCHAR(255) NOT NULL,
    Last_Name NVARCHAR(255),
    Email NVARCHAR(255),
    Contact NVARCHAR(10),
    Salary_ID INT,
    FOREIGN KEY (Salary_ID) REFERENCES tblSalary(SID),
    FOREIGN KEY (DID) REFERENCES tblDepartment(DID)
);

-- Table for Benefits
CREATE TABLE tblBenefit (
    BID INT PRIMARY KEY,
    Benefit_Type NVARCHAR(255),
    Description VARCHAR(MAX)
);

-- Table for Performance Review
CREATE TABLE tblPerformance_Review (
    PRID INT PRIMARY KEY,
    EID INT,
    Review_Date DATE,
    Rating INT,
    Comment NVARCHAR(255),
    FOREIGN KEY (EID) REFERENCES tblEmployee(EID)
);

-- Table for Employee Benefits
CREATE TABLE tblEmployee_Benefit (
    EID INT,
    BID INT,
    Enrollment_Date DATE,
    PRIMARY KEY (EID, BID),
    FOREIGN KEY (EID) REFERENCES tblEmployee(EID),
    FOREIGN KEY (BID) REFERENCES tblBenefit(BID)
);

-- Table for Applicants
CREATE TABLE tblApplicant (
    AID INT PRIMARY KEY,
    First_Name NVARCHAR(255) NOT NULL,
    Last_Name NVARCHAR(255),
    Email NVARCHAR(255),
    Contact NVARCHAR(10),
    CV VARBINARY(MAX) NOT NULL,
    Img VARBINARY(MAX),
	Status NVARCHAR(50), -- Viewed/Not Viewed
    Short_Listed NVARCHAR(50) -- Yes/No
);
