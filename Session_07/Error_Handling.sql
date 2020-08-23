--Add error handling on CreateGradeDetail procedure
ALTER PROCEDURE dbo.CreateGradeDetail
(
@GradeID int,
@AchievementTypeID tinyint,
@AchievementPoints tinyint,
@AchievementMaxPoints tinyint,
@Achievementdate datetime
)

AS
BEGIN

	BEGIN TRY

		INSERT INTO dbo.GradeDetails(GradeID, AchievementTypeID, AchievementPoints, AchievementMaxPoints, AchievementDate)
		VALUES (@GradeID, @AchievementTypeID, @AchievementPoints, @AchievementMaxPoints, @AchievementDate)

		SELECT SUM(gd.AchievementPoints / gd.AchievementMaxPoints * a.ParticipationRate) as GradePointsSum, a.[Name]
		from dbo.GradeDetails gd
		INNER JOIN dbo.AchievementType a on a.ID = gd.AchievementTypeID
		WHERE gd.AchievementTypeID = @AchievementTypeID 
		GROUP BY a.[Name]

	END TRY

	BEGIN CATCH  
	SELECT  
		ERROR_NUMBER() AS ErrorNumber  
		,ERROR_SEVERITY() AS ErrorSeverity  
		,ERROR_STATE() AS ErrorState  
		,ERROR_PROCEDURE() AS ErrorProcedure  
		,ERROR_LINE() AS ErrorLine  
		,ERROR_MESSAGE() AS ErrorMessage;  
	END CATCH; 

END

-- Napomena : AcievementTypeId ne moze da bide 1 - Seminarska, 2 - Redovnost, bidejki nema poeni i GradePointSum ke bide 0
-- AcievementTypeId ima soodvetno Id i dava rezultat
EXEC dbo.CreateGradeDetail 1, 3, 55, 100, '2020-05-15'

--Test the error handling by inserting not-existing values for AchievementTypeID
EXEC dbo.CreateGradeDetail @GradeID = 1, @AchievementTypeID = 13, @AchievementPoints = 55, @AchievementMaxPoints = 100, @AchievementDate = '2020-05-15'

