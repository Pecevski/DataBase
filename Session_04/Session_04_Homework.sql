--Declare scalar variable for storing FirstName values
--Assign value ‘Antonio’ to the FirstName variable
--Find all Students having FirstName same as the variable
DECLARE @FirstName nvarchar(50)
SET @FirstName = 'Antonio'

SELECT *
FROM dbo.Student
WHERE FirstName = @FirstName
GO

--Declare table variable that will contain StudentId, StudentName and DateOfBirth
--Fill the table variable with all Female students
DECLARE @NewTable TABLE
(StudentId int, StudentName nvarchar(50), DateOfBirth date)

INSERT INTO @NewTable
SELECT ID, FirstName, DateOfBirth
FROM dbo.Student
WHERE Gender = 'F'

SELECT *
FROM @NewTable
GO

--Declare temp table that will contain LastName and EnrolledDate columns
--Fill the temp table with all Male students having First Name starting with ‘A’
--Retrieve the students from the table which last name is with 7 characters
CREATE TABLE #NewTempTable 
(LastName nvarchar(50), EnrolledDate date)

INSERT INTO #NewTempTable
SELECT LastName, EnrolledDate
FROM dbo.Student
WHERE Gender = 'M' AND FirstName LIKE 'A%'

SELECT *
FROM #NewTempTable
WHERE LEN(LastName) = 7
GO


--Find all teachers whose FirstName length is less than 5 and the first 3 characters of their FirstName and LastName are the same
SELECT *
FROM dbo.Teacher
WHERE LEN(FirstName) > 5 AND SUBSTRING(FirstName, 1, 3) = SUBSTRING(LastName, 1, 3)
GO

--Declare scalar function (fn_FormatStudentName) for retrieving the Student description for specific StudentId in the following format:
--StudentCardNumber without “sc-”
--“ – “
--First character of student FirstName
--“.”
--Student LastName
CREATE FUNCTION dbo.fn_FormatStudentName (@StudentId int)
RETURNS NVARCHAR(100)
AS
BEGIN

DECLARE @Output NVARCHAR(100)
SELECT  @Output = REPLACE(StudentCardNumber, 'sc-', '') + ' - ' + LEFT(FirstName, 1) + '.' + LastName
FROM dbo.Student
WHERE ID = @StudentId

RETURN @Output
END

GO

SELECT *, dbo.fn_FormatStudentName(ID) as StudentFunction
FROM dbo.Student

DROP FUNCTION IF EXISTS dbo.fn_FormatStudentName;
GO