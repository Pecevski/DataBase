CREATE TABLE dbo.AchievementType
(
	ID int IDENTITY(1,1) NOT NULL,
	[Name] nvarchar(100) NOT NULL,
	[Description] nvarchar(max)  NULL,
	ParticipationRate nvarchar(10) NULL,
	CONSTRAINT PK_AchievementType PRIMARY KEY(ID ASC)
)
