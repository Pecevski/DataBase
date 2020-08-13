--Foreign Key for Grade/Student
ALTER TABLE dbo.Grade
ADD CONSTRAINT FK_Grade_Student
FOREIGN KEY (StudentID)
REFERENCES dbo.Student(ID)

--Foreign Key for Grade/Course
ALTER TABLE dbo.Grade
ADD CONSTRAINT FK_Grade_Course
FOREIGN KEY (CourseID)
REFERENCES dbo.Course(ID)

--Foreign Key for Grade/Teacher
ALTER TABLE dbo.Grade
ADD CONSTRAINT FK_Grade_Teacher
FOREIGN KEY (TeacherID)
REFERENCES dbo.Teacher(ID)

--Foreign Key for GradeDetails/Grade
ALTER TABLE dbo.GradeDetails
ADD CONSTRAINT FK_GradeDetails_Grade
FOREIGN KEY (GradeID)
REFERENCES dbo.Grade(ID)

--Foreign Key for GradeDetails/AchievementType 
ALTER TABLE dbo.GradeDetails
ADD CONSTRAINT FK_GradeDetails_AchievementType
FOREIGN KEY (AchievementTypeID)
REFERENCES AchievementType(ID)