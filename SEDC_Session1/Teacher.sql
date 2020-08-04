CREATE TABLE dbo.Teacher
(
	ID smallint IDENTITY(1,1) NOT NULL,
	FirstName nvarchar(50) NOT NULL,
	LastName nvarchar(50)  NOT NULL,
	DateOfBirth date NOT NULL,
	AcademicRank nvarchar(50) NOT NULL,
	HireDate date NOT NULL,
	CONSTRAINT PK_Teacher PRIMARY KEY(ID ASC)
)