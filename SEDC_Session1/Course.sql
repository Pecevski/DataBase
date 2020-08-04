CREATE TABLE dbo.Course
(
	ID smallint IDENTITY(1,1) NOT NULL,
	[Name] nvarchar(100) NOT NULL,
	Credit int NOT NULL,
	AcademicYear date NOT NULL,
	Semester datetime NOT NULL,
	CONSTRAINT PK_Course PRIMARY KEY(ID ASC)
)
