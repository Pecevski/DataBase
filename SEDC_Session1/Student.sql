CREATE TABLE dbo.Student
(
	ID int IDENTITY(1,1) NOT NULL,
	FirstName nvarchar(50) NOT NULL,
	LastName nvarchar(50) NOT NULL,
	DateOfBirth date NULL,
	EnrolledDate date NULL,
	Gender nchar(1) NULL,
	NationalIDNumber nvarchar(20) NULL,
    StudentCardNumber nvarchar(20) NULL,
	CONSTRAINT PK_Student PRIMARY KEY(ID ASC)

)