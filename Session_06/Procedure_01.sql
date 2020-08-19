--Create new procedure called CreateGrade
--Procedure should create only Grade header info (not Grade Details) 
--Procedure should return the total number of grades in the system for the Student on input (from the CreateGrade)
--Procedure should return second resultset with the MAX Grade of all grades for the Student and Teacher on input (regardless the Course)
CREATE PROCEDURE dbo.CreateGrade
(
@StudentID int,
@CourseID smallint,
@TeacherID smallint,
@Grade tinyint,
@CreatedDate datetime
)

AS
BEGIN
	INSERT INTO dbo.Grade(StudentID, CourseID, TeacherID, Grade, CreatedDate)
	VALUES (@StudentID, @CourseID, @TeacherID, @Grade, @CreatedDate)

	SELECT COUNT(*) as TotalNumberGrades
	FROM dbo.Grade
	WHERE StudentID = @StudentID

	SELECT MAX(Grade) as MaxGrade
	FROM dbo.Grade
	WHERE StudentID = @StudentID AND TeacherID = @TeacherID


END

EXEC dbo.CreateGrade 13, 3, 3, 10, '2020-08-18'

