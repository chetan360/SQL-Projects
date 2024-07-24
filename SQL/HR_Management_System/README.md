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

   cd SQL-Projects\SQL\HR_Management_System

## Indexes

1. Non Clustered Index for Sorting Base Salary then Bonus Salary

```bash
CREATE NONCLUSTERED INDEX IX_tblSalary_Base_Salary
ON tblSalary (Base_Salary DESC, Bonus_Salary DESC)
```

2. Sort Name by First Name and then last name

```bash
CREATE NONCLUSTERED INDEX IX_tblEmployee_Name
ON tblEmployee (First_Name ASC, Last_Name ASC)
```

3. Filtered Index for Email are not empty

```bash
CREATE NONCLUSTERED INDEX IX_tblApplicant_Email
ON tblApplicant (Email)
WHERE Email IS NOT NULL
```
