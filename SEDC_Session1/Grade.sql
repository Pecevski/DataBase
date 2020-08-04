CREATE TABLE dbo.Grade
(
	ID int IDENTITY(1,1) NOT NULL,
	StudentID int NOT NULL,
	CourseID smallint NOT NULL,
	TeacherID smallint NOT NULL,
	Grade tinyint NOT NULL,
	Comment nvarchar(max) NULL,
	CreatedDate datetime NOT NULL,
	CONSTRAINT PK_Grade PRIMARY KEY(ID ASC)
)