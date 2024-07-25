USE HR;

-- Add Employee

INSERT INTO tblEmployee
VALUES(5001, 2, 'first_name_5001', 'last_name_5001', 'first_name_last_name_5001@gmail.com', '1234567890', 2);

-- Add Manager

INSERT INTO tblManager (MID, First_Name, Last_Name, Email, Contact)
VALUES(6, 'Randy', 'Orten', 'randyorten@gmail.com', '1234567890')


-- Add Employee Performance Review

INSERT INTO tblPerformance_Review
VALUES(5001, 5001, '2024-09-02', 3, 'Nice')

-- Add Salary

INSERT INTO tblSalary
VALUES(7, 5400000, 800000);

-- Add Employee Benefit

INSERT INTO tblBenefit
VALUES(5001, 'Health Insurance', 'Coverage for halth insurance');

-- Add 

select *
from tblEmployee_Benefit

select *
from tblBenefit

-- Table for Benefits

INSERT INTO tblBenefit
VALUES(3, 'Provided Fund', 'This is part of your salary');

-- Add Employee Benefit

INSERT INTO tblEmployee_Benefit
VALUES(5001, 2, '2024-08-01');

