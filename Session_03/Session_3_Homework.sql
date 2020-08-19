--Calculate the count of all grades in the system​
SELECT COUNT(*) as GradeCount
FROM dbo.Grade


--Calculate the count of all grades per Teacher in the system​
SELECT DISTINCT t.FirstName + N' ' + t.LastName as Teacher, COUNT(*) as GradesPerTeacher
FROM dbo.Grade g
INNER JOIN dbo.Teacher t on t.ID = g.TeacherID
GROUP BY t.FirstName , t.LastName


--Calculate the count of all grades per Teacher in the system for first 100 Students (ID < 100)​
SELECT DISTINCT  t.FirstName + N' ' + t.LastName as Teacher, COUNT(*) as GradesPerTeacher
FROM dbo.Grade g
INNER JOIN dbo.Teacher t on t.ID = g.TeacherID
WHERE g.StudentID < 100
GROUP BY t.FirstName , t.LastName


--Find the Maximal Grade, and the Average Grade per Student on all grades in the system​
SELECT DISTINCT s.FirstName + N' ' + s.LastName as Student, MAX(g.Grade) as GradeMax, AVG(g.Grade) as GradeAvg
FROM dbo.Grade g
INNER JOIN dbo.Student s on s.ID = g.StudentID
GROUP BY s.FirstName , s.LastName


--Calculate the count of all grades per Teacher in the system and filter only grade count greater then 200​
SELECT DISTINCT  t.FirstName + N' ' + t.LastName as Teacher, COUNT(*) as GradesPerTeacher
FROM dbo.Grade g
INNER JOIN dbo.Teacher t on t.ID = g.TeacherID
GROUP BY t.FirstName , t.LastName
HAVING COUNT(*) > 200


--Calculate the count of all grades per Teacher in the system for first 100 Students (ID < 100) and filter teachers with more than 50 Grade count​
SELECT DISTINCT  t.FirstName + N' ' + t.LastName as Teacher, COUNT(*) as GradesPerTeacher
FROM dbo.Grade g
INNER JOIN dbo.Teacher t on t.ID = g.TeacherID
WHERE g.StudentID < 100
GROUP BY t.FirstName , t.LastName
HAVING COUNT(*) > 50


--Find the Grade Count, Maximal Grade, and the Average Grade per Student on all grades in the system. Filter only records where Maximal Grade is equal to Average Grade​
SELECT DISTINCT s.FirstName + N' ' + s.LastName as Student,COUNT(*) as GradeCount, MAX(g.Grade) as GradeMax, AVG(g.Grade) as GradeAvg
FROM dbo.Grade g
INNER JOIN dbo.Student s on s.ID = g.StudentID
GROUP BY s.FirstName , s.LastName
HAVING MAX(g.Grade) = AVG(g.Grade)

--List Student First Name and Last Name next to the other details from previous query​
SELECT DISTINCT s.FirstName as StudentFirstName, s.LastName as StudentLastName,COUNT(*) as GradeCount, MAX(g.Grade) as GradeMax, AVG(g.Grade) as GradeAvg
FROM dbo.Grade g
INNER JOIN dbo.Student s on s.ID = g.StudentID
GROUP BY s.FirstName , s.LastName 
HAVING MAX(g.Grade) = AVG(g.Grade)


--Create new view (vv_StudentGrades) that will List all StudentIds and count of Grades per student​
CREATE VIEW dbo.vv_StudentGrades
AS
SELECT g.StudentID as StudentID, COUNT(g.Grade) as GradesPerStudent
FROM dbo.Grade g
GROUP BY g.StudentID

SELECT * 
FROM dbo.vv_StudentGrades

--Change the view to show Student First and Last Names instead of StudentID​
ALTER VIEW dbo.vv_StudentGrades
AS
SELECT s.FirstName as FirstName, s.LastName as LastName, COUNT(g.Grade) as GradesPerStudent
FROM dbo.Grade g
INNER JOIN dbo.Student s on s.ID = g.StudentID
GROUP BY s.FirstName, s.LastName

SELECT * 
FROM dbo.vv_StudentGrades


--List all rows from view ordered by biggest Grade Count​
SELECT *
FROM dbo.vv_StudentGrades
ORDER BY GradesPerStudent DESC
​

--Create new view (vv_StudentGradeDetails) that will List all Students (FirstName and LastName) and Count the courses he passed through the exam(Ispit)​
CREATE VIEW dbo.vv_StudentGradeDetails
AS
SELECT s.FirstName as FirstName, s.LastName as LastName, COUNT(g.CourseID) as PassedCourse
FROM dbo.Grade g
INNER JOIN dbo.Student s on s.ID = g.StudentID
INNER JOIN dbo.Course c on c.ID = g.CourseID
INNER JOIN dbo.GradeDetails gd on gd.GradeID = g.ID
INNER JOIN dbo .AchievementType a on a.ID = gd.AchievementTypeID
WHERE a.[Name] = 'Ispit'
GROUP BY s.FirstName, s.LastName

SELECT *
FROM dbo.vv_StudentGradeDetails
ORDER BY PassedCourse DESC
