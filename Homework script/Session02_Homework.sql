--Find all Students with FirstName = Antonio
SELECT *
FROM Student
WHERE FirstName = 'Antonio'

--Find all Students with DateOfBirth greater than ‘01.01.1999’
SELECT *
FROM Student
WHERE DateOfBirth > '1999-01-01'

--Find all Male students
SELECT *
FROM Student
WHERE Gender = 'M'

--Find all Students with LastName starting With ‘T’
SELECT *
FROM Student
WHERE LastName LIKE 'T%'

--Find all Students Enrolled in January/1998
SELECT *
FROM Student
WHERE EnrolledDate >= '1998-01-01' AND EnrolledDate < '1998-02-01'

--Find all Students with LastName starting With ‘J’ enrolled in January/1998
SELECT *
FROM Student
WHERE EnrolledDate >= '1998-01-01' AND EnrolledDate < '1998-02-01' AND LastName LIKE 'J%'

--Find all Students with FirstName = Antonio ordered by Last Name
SELECT *
FROM Student
WHERE FirstName = 'Antonio'
ORDER BY LastName

--List all Students ordered by FirstName
SELECT *
FROM Student
ORDER BY FirstName

--Find all Male students ordered by EnrolledDate, starting from the last enrolled
SELECT *
FROM Student
WHERE Gender = 'M'
ORDER BY EnrolledDate DESC

--List all Teacher First Names and Student First Names in single result set with duplicates
SELECT FirstName
FROM Teacher
UNION ALL
SELECT FirstName
FROM Student


--List all Teacher Last Names and Student Last Names in single result set. Remove duplicates
SELECT LastName
FROM  Teacher
UNION
SELECT LastName
FROM Student

--List all common First Names for Teachers and Students
SELECT FirstName
FROM Teacher
INTERSECT
SELECT FirstName
FROM Student

--Change GradeDetails table always to insert value 100 in AchievementMaxPoints column if no value is provided on insert
ALTER TABLE GradeDetails
ADD CONSTRAINT DF_GradeDetails_AchievementMaxPoints
DEFAULT 100 FOR AchievementMaxPoints

--Change GradeDetails table to prevent inserting AchievementPoints that will more than AchievementMaxPoints
ALTER TABLE GradeDetails WITH CHECK
ADD CONSTRAINT CHK_GradeDetails_AchievementMaxPoints
CHECK  (AchievementPoints <= AchievementMaxPoints)

--Change AchievementType table to guarantee unique names across the Achievement types
ALTER TABLE AchievementType WITH CHECK
ADD CONSTRAINT CHK_AchievementType_Names 
UNIQUE (Name)

--List all possible combinations of Courses names and AchievementType names that can be passed by student
SELECT c.Name as CourseName , a.Name as AchievementTypename
FROM Course c
CROSS JOIN AchievementType a


--List all Teachers that has any exam Grade
SELECT DISTINCT t.FirstName as Teacher
FROM Grade g
INNER JOIN Teacher t on g.TeacherID = t.ID

--List all Teachers without exam Grade
SELECT DISTINCT t.FirstName as Teacher
FROM Teacher t
LEFT JOIN Grade g on t.ID = g.TeacherID
WHERE g.ID is NULL

--List all Students without exam Grade (using Right Join)
SELECT DISTINCT s.FirstName 
FROM Grade g
RIGHT JOIN Student s on s.ID = g.StudentID
WHERE g.StudentID is NULL