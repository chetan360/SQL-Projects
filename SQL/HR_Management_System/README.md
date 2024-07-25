# HR Management System

## Description

This HR Management System allows for the management of employee records, payroll, benefits, and performance evaluations. It includes features for employee database management, payroll processing, benefits tracking, and performance reviews.

## Features

- Employee database management
- Payroll processing
- Benefits tracking
- Performance reviews

## Technologies Used

- SQL Server
- SQL scripts for database setup and management

## Setup Instructions

1. Clone the repository:

   ```bash
   git clone https://github.com/chetan360/SQL-Projects
   ```

2. ```bash
   cd SQL-Projects\SQL\HR_Management_System
   ```

## Indexes

## Non Clustered Index for Sorting Base Salary then Bonus Salary

```bash
CREATE NONCLUSTERED INDEX IX_tblSalary_Salary
ON tblSalary (Base_Salary DESC, Bonus_Salary DESC)
```

## Sort Name by First Name and then last name

```bash
CREATE NONCLUSTERED INDEX IX_tblEmployee_Name
ON tblEmployee (First_Name ASC, Last_Name ASC)
```

## Filtered Index for Email are not empty

```bash
CREATE NONCLUSTERED INDEX IX_tblApplicant_Email
ON tblApplicant (Email)
WHERE Email IS NOT NULL
```

## Full text index on Benefit

```bash
SELECT FULLTEXTSERVICEPROPERTY('IsFullTextInstalled') AS FullTextInstalled;
```

1. if result is 0 then install full text index
2. And after installation check again

### Create Full-Text Catalog

```bash
CREATE FULLTEXT CATALOG BenefitCatalog AS DEFAULT;
```

### Create Full-Text Index on tblBenefit

```bash
CREATE FULLTEXT INDEX ON tblBenefit (Benefit_Type, Description)
KEY INDEX PK__tblBenef__C6DE0D21CA472F9F
ON BenefitCatalog;
```

## Unique index on email

```bash
CREATE UNIQUE INDEX IX_tblEmployee
ON tblEmployee (Email);
```

### Full text searches

### Column contains the word Health

```bash
SELECT *
FROM tblBenefit
WHERE CONTAINS(Benefit_Type, 'Health');
```

### Description contains medical coverage related to health insurance

```bash
SELECT *
FROM tblBenefit
WHERE FREETEXT(Description, 'medical coverage');
```

### Column contains the word Health

### and then the result is in decsending order by rank in table format

```bash
SELECT *
FROM tblBenefit b
INNER JOIN CONTAINSTABLE( tblBenefit, Benefit_Type, 'Health') ct
ON b.BID = ct.[KEY]
ORDER BY RANK DESC;
```

### Description contains medical coverage related to health insurance

### and then the result is in decsending order by rank in table format

```bash
SELECT *
FROM tblBenefit b
INNER JOIN FREETEXTTABLE(tblBenefit, Description, 'medical coverage') ct
ON b.BID = ct.[KEY]
ORDER BY RANK DESC;
```

## Adding Data

### Add Employee

```bash
INSERT INTO tblEmployee
VALUES(5001, 2, 'first_name_5001', 'last_name_5001', 'first_name_last_name_5001@gmail.com', '1234567890', 2);
```

### Add Manager

```bash
INSERT INTO tblManager (MID, First_Name, Last_Name, Email, Contact)
VALUES(6, 'Randy', 'Orten', 'randyorten@gmail.com', '1234567890')
```

### Add Salary

```bash
INSERT INTO tblSalary
VALUES(7, 5400000, 800000);
```

### Add Employee Performance Review

```bash
INSERT INTO tblPerformance_Review
VALUES(5001, 5001, '2024-09-02', 3, 'Nice')
```

### Table for Benefits

```bash
INSERT INTO tblBenefit
VALUES(3, 'Provided Fund', 'This the part of salary');
```

### Add Employee Benefit

```bash
INSERT INTO tblEmployee_Benefit
VALUES(5001, 2, '2024-08-01');
```

## Fetching Data

### Display all applicant data

```bash
SELECT *
FROM tblApplicant
```

### Making Some Applicants status as Viewed

```bash
UPDATE tblApplicant
SET Status = 'Viewed'
WHERE AID BETWEEN 1 AND 3000
```

### Display Candidates Whos Profile is not Viewed

```bash
SELECT AID, First_Name, Email, Contact, CV
FROM tblApplicant
WHERE STATUS is NULL
```

### Assuming there are 5 openings for perticular role

```bash
DECLARE @i INT = 1;

WHILE(@i <= 5)
BEGIN
	UPDATE tblApplicant
	SET Short_Listed = 'Yes'
	WHERE AID = ABS(CHECKSUM(NEWID())) % 3000 + 1;
	SET @i = @i + 1;
END
GO
```

### Display Short Listed Candidates

```bash
SELECT *
FROM tblApplicant
Where Short_Listed = 'Yes';
```

### (Manual Work)

1. Short Listed candidate is get Interviewed

2. And then its depends on the HR to select or reject

3. If selected then added to Employee table

### Displaying the Manager's and thire currousponding departments

```bash
SELECT m.MID, First_Name, Last_Name, Contact, Email, Img, DID, Department_Name
FROM tblDepartment d INNER JOIN tblManager m
ON d.MID = m.MID
ORDER BY m.MID ASC;
```

### Displaying Employee and its Reviews

```bash
SELECT e.EID, e.First_Name, e.Last_Name, p.Comment, p.Rating, p.Review_Date
FROM tblEmployee e INNER JOIN tblPerformance_Review p
ON e.EID = p.EID
```

### Displaying Employee and its Salaries

```bash
SELECT  e.EID, e.First_Name, e.Last_Name, s.Base_Salary, s.Bonus_Salary,
s.Base_Salary + s.Bonus_Salary as TOTAL_SALARY
FROM tblEmployee e INNER JOIN tblSalary s
ON e.Salary_ID = s.SID;
```

### Displaying Employee and its Benefits

```bash
SELECT e.EID, e.First_Name, e.Last_Name, b.Benefit_Type, b.Description, eb.Enrollment_Date
FROM tblEmployee e INNER JOIN tblEmployee_Benefit eb ON e.EID = eb.EID
INNER JOIN tblBenefit b ON eb.BID = b.BID
```

### Getting all data about employee

```bash
SELECT e.EID, e.First_Name, e.Last_Name, s.Base_Salary + s.Bonus_Salary as Salary,
b.Benefit_Type, b.Description, eb.Enrollment_Date, p.Rating, p.Comment, p.Review_Date
FROM tblEmployee e INNER JOIN tblDepartment d ON e.DID = d.DID
INNER JOIN tblManager m ON m.MID = d.MID
INNER JOIN tblSalary s ON e.Salary_ID = s.SID
INNER JOIN tblEmployee_Benefit eb ON e.EID = eb.EID
INNER JOIN tblBenefit b ON b.BID = eb.BID
INNER JOIN tblPerformance_Review p ON e.EID = p.EID
```
