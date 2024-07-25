USE HR;

-- Display all applicant data 
SELECT * 
FROM tblApplicant

-- Making Some Applicants status as Viewed
UPDATE tblApplicant
SET Status = 'Viewed'
WHERE AID BETWEEN 1 AND 3000

-- Display Candidates Whos Profile is not Viewed 
SELECT AID, First_Name, Email, Contact, CV
FROM tblApplicant
WHERE STATUS is NULL


-- Assuming there are 5 openings for perticular role
DECLARE @i INT = 1;

WHILE(@i <= 5)
BEGIN
	UPDATE tblApplicant
	SET Short_Listed = 'Yes'
	WHERE AID = ABS(CHECKSUM(NEWID())) % 3000 + 1;
	SET @i = @i + 1;
END
GO

-- Display Short Listed Candidates
SELECT * 
FROM tblApplicant
Where Short_Listed = 'Yes';

-- (Manually Work)
-- Sort Listed candidate is get Interviewed
-- And then its depends on the HR to select or reject 
-- If selected then added to Employee table


-- Displaying the Manager's and thire currousponding departments 
SELECT m.MID, First_Name, Last_Name, Contact, Email, Img, DID, Department_Name 
FROM tblDepartment d INNER JOIN tblManager m
ON d.MID = m.MID
ORDER BY m.MID ASC;

-- Displaying Employee and its Reviews
SELECT e.EID, e.First_Name, e.Last_Name, p.Comment, p.Rating, p.Review_Date
FROM tblEmployee e INNER JOIN tblPerformance_Review p
ON e.EID = p.EID

-- Displaying Employee and its Salaries
SELECT  e.EID, e.First_Name, e.Last_Name, s.Base_Salary, s.Bonus_Salary, 
s.Base_Salary + s.Bonus_Salary as TOTAL_SALARY 
FROM tblEmployee e INNER JOIN tblSalary s
ON e.Salary_ID = s.SID;

-- Displaying Employee and its Benefits
SELECT e.EID, e.First_Name, e.Last_Name, b.Benefit_Type, b.Description, eb.Enrollment_Date
FROM tblEmployee e INNER JOIN tblEmployee_Benefit eb ON e.EID = eb.EID
INNER JOIN tblBenefit b ON eb.BID = b.BID

-- Getting all data about employee
SELECT e.EID, e.First_Name, e.Last_Name, s.Base_Salary + s.Bonus_Salary as Salary,
b.Benefit_Type, b.Description, eb.Enrollment_Date, p.Rating, p.Comment, p.Review_Date
FROM tblEmployee e INNER JOIN tblDepartment d ON e.DID = d.DID
INNER JOIN tblManager m ON m.MID = d.MID 
INNER JOIN tblSalary s ON e.Salary_ID = s.SID
INNER JOIN tblEmployee_Benefit eb ON e.EID = eb.EID
INNER JOIN tblBenefit b ON b.BID = eb.BID
INNER JOIN tblPerformance_Review p ON e.EID = p.EID

