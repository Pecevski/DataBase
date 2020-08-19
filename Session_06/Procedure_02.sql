--Create new procedure called CreateGradeDetail
--Procedure should add details for specific Grade (new record for new AchievementTypeID, Points, MaxPoints, Date for specific Grade)
--Output from this procedure should be resultset with SUM of GradePoints calculated with formula AchievementPoints/AchievementMaxPoints*ParticipationRate for specific Grade
CREATE PROCEDURE dbo.CreateGradeDetail
(
@GradeID int,
@AchievementTypeID tinyint,
@AchievementPoints tinyint,
@AchievementMaxPoints tinyint,
@Achievementdate datetime
)

AS
BEGIN
	INSERT INTO dbo.GradeDetails(GradeID, AchievementTypeID, AchievementPoints, AchievementMaxPoints, AchievementDate)
	VALUES (@GradeID, @AchievementTypeID, @AchievementPoints, @AchievementMaxPoints, @AchievementDate)

	SELECT SUM(gd.AchievementPoints / gd.AchievementMaxPoints * a.ParticipationRate) as GradePointsSum, a.[Name]
	from dbo.GradeDetails gd
	INNER JOIN dbo.AchievementType a on a.ID = gd.AchievementTypeID
	WHERE gd.AchievementTypeID = @AchievementTypeID 
	GROUP BY a.[Name]
	

END

-- Napomena : AcievementTypeId ne moze da bide 1 - Seminarska, 2 - Redovnost, bidejki nema poeni i GradePointSum ke bide 0

EXEC dbo.CreateGradeDetail 1, 3, 55, 100, '2020-05-15'



