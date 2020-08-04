CREATE TABLE dbo.GradeDetails
(
	ID int IDENTITY(1,1) NOT NULL,
	GradeID int NOT NULL,
	AchievementTypeID nvarchar(20) NOT NULL,
	AchievementPoints int NOT NULL,
	AchievementMaxPoints int NOT NULL,
	AchievementDate date NOT NULL,
	CONSTRAINT PK_GradeDeatils PRIMARY KEY(ID ASC)
)
