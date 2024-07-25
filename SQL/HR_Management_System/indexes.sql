-- Non Clustered Index for Sorting Base Salary then Bonus Salary

CREATE NONCLUSTERED INDEX IX_tblSalary_Salary
ON tblSalary (Base_Salary DESC, Bonus_Salary DESC)

-- Sort Name by First Name and then last name

CREATE NONCLUSTERED INDEX IX_tblEmployee_Name
ON tblEmployee (First_Name ASC, Last_Name ASC)

-- Filtered Index for Email are not empty

CREATE NONCLUSTERED INDEX IX_tblApplicant_Email
ON tblApplicant (Email)
WHERE Email IS NOT NULL

-- Full text index on Benefit

SELECT FULLTEXTSERVICEPROPERTY('IsFullTextInstalled') AS FullTextInstalled;
-- if result is 0 then install full text index
-- And after installation check again

-- Create Full-Text Catalog
CREATE FULLTEXT CATALOG BenefitCatalog AS DEFAULT;

-- Create Full-Text Index on tblBenefit
CREATE FULLTEXT INDEX ON tblBenefit (Benefit_Type, Description)
KEY INDEX PK__tblBenef__C6DE0D21CA472F9F
ON BenefitCatalog;

-- Full text searches

-- Column contains the word Health
SELECT * 
FROM tblBenefit
WHERE CONTAINS(Benefit_Type, 'Health');

-- Description contains medical coverage related to health insurance 
SELECT *
FROM tblBenefit
WHERE FREETEXT(Description, 'medical coverage');

-- Column contains the word Health
-- and then the result is in decsending order by rank in table format
SELECT *
FROM tblBenefit b
INNER JOIN CONTAINSTABLE( tblBenefit, Benefit_Type, 'Health') ct
ON b.BID = ct.[KEY]
ORDER BY RANK DESC;

-- Description contains medical coverage related to health insurance 
-- and then the result is in decsending order by rank in table format
SELECT *
FROM tblBenefit b
INNER JOIN FREETEXTTABLE(tblBenefit, Description, 'medical coverage') ct
ON b.BID = ct.[KEY]
ORDER BY RANK DESC;