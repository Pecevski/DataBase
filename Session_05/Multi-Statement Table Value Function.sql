--Create multi-statement table value function that for specific Teacher and Course will return list of students (FirstName, LastName) who passed the exam, together with Grade and CreatedDate
CREATE FUNCTION dbo.StudentListPassedExam(@Teacher int, @Course int)
RETURNS @Result TABLE (StudentFirstName nvarchar(50),StudentLastName nvarchar(50), Grade tinyint, CreatedDate datetime)
AS
BEGIN
	INSERT INTO @Result(StudentFirstName, StudentLastName, Grade, CreatedDate)
	SELECT s.FirstName as StudentFirstName, s.LastName as StudentLastName, g.Grade as Grade, g.CreatedDate as CreatedDate
	FROM dbo.Grade g
	INNER JOIN dbo.Student s on s.ID = g.StudentID
	WHERE g.TeacherID = @Teacher AND g.CourseID = @Course
	GROUP BY s.FirstName, s.LastName, g.Grade, g.CreatedDate

	RETURN
END

GO


SELECT *
FROM dbo.StudentListPassedExam(3,3)

GO

DROP FUNCTION IF EXISTs dbo.StudentListPassedExam
