
-- Insertiong Dummy Data

-- Dummy Managers Data
INSERT INTO tblManager (MID, First_Name, Last_Name, Email, Contact) 
VALUES (1, 'John', 'Cena', 'johncena@gmail.com', '1234567890'),
(2, 'Brock', 'Lesener', 'brocklesener@gmail.com', '1234567890'),
(3, 'The', 'Rock', 'therock@gmail.com', '1234567890'),
(4, 'Roman', 'Rings', 'romanrings@gmail.com', '1234567890'),
(5, 'Gold', 'Barg', 'goldbarg@gmail.com', '1234567890');

-- Dummy Department Data
INSERT INTO tblDepartment
VALUES (1, 2, 'Finance'),
(2, 1, 'Marketing'),
(3, 5, 'HR'),
(4, 4, 'IT');

-- Dummy Data for Salaries 
INSERT INTO tblSalary 
VALUES (1, 250000, 30000),
(2, 1500000, 300000),
(3, 4200000, 600000),
(4, 30000, 35000),
(5, 500000, 60000),
(6, 800000, 100000);

-- Inserting Dummy Employees
DECLARE @i INT = 1;

WHILE (@i <= 5000)
BEGIN
    INSERT INTO tblEmployee (EID, DID, First_Name, Last_Name, Email, Contact, Salary_ID)
    VALUES (
        @i, 
        ABS(CHECKSUM(NEWID())) % 4 + 1,  -- Random Department ID (assuming there are 4 departments)
        'FIRST_NAME_' + CONVERT(VARCHAR(10), @i), 
        'LAST_NAME_' + CONVERT(VARCHAR(10), @i), 
        'FirstName_LastName_' + CONVERT(VARCHAR(10), @i) + '@gmail.com', 
        '1234567890', 
        ABS(CHECKSUM(NEWID())) % 6 + 1   -- Random Salary ID (assuming there are 6 salary records)
    );

    SET @i = @i + 1;
END
GO

-- Inserting Dummy Applicant
DECLARE @i INT = 1;

WHILE (@i <= 100000)
BEGIN
    INSERT INTO tblApplicant (AID, First_Name, Last_Name, Email, Contact)
    VALUES (
        @i, 
        'FIRST_NAME_' + CONVERT(VARCHAR(10), @i), 
        'LAST_NAME_' + CONVERT(VARCHAR(10), @i), 
        'FirstName_LastName_' + CONVERT(VARCHAR(10), @i) + '@gmail.com', 
        '1234567890'
    );

    SET @i = @i + 1;
END
GO

-- Sample data for Benefit

INSERT INTO tblBenefit
VALUES(1, 'Health Insurance', 'Coverage for halth insurance');

INSERT INTO tblBenefit
VALUES(2, 'Retirement Plan', '401(k) plan with company match');


-- Dummy Employee Benefits

DECLARE @i INT = 1;

WHILE(@i <= 5000)
BEGIN
	INSERT INTO tblEmployee_Benefit 
	VALUES (
	@i,
	ABS(CHECKSUM(NEWID())) % 2 + 1,
	'2024-08-01'
	);
	SET @i = @i + 1;
END
GO

-- Dummy Data for Performance Review
-- Comment 1
DECLARE @i INT = 1;

WHILE(@i <= 2500)
BEGIN
	INSERT INTO tblPerformance_Review
	VALUES (
	@i,
	@i,
	'2024-8-1',
	ABS(CHECKSUM(NEWID())) % 5 + 1,
	'Nice'
	);

	SET @i = @i + 1;
END
GO

-- Comment 2
DECLARE @i INT = 2501;

WHILE(@i <= 5000)
BEGIN
	INSERT INTO tblPerformance_Review
	VALUES (
	@i,
	@i,
	'2024-8-2',
	ABS(CHECKSUM(NEWID())) % 5 + 1,
	'Bad'
	);

	SET @i = @i + 1;
END
GO