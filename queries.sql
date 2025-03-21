-- View all students
SELECT * FROM Students;

-- View all courses
SELECT * FROM Courses;

-- View all enrollments with student and course names
SELECT Enrollments.EnrollmentID, Students.Name AS StudentName, 
       Courses.CourseName, Enrollments.EnrollDate
FROM Enrollments
JOIN Students ON Enrollments.StudentID = Students.StudentID
JOIN Courses ON Enrollments.CourseID = Courses.CourseID;

-- Find students who are enrolled in 'Mathematics'
SELECT Students.Name FROM Students
JOIN Enrollments ON Students.StudentID = Enrollments.StudentID
JOIN Courses ON Enrollments.CourseID = Courses.CourseID
WHERE Courses.CourseName = 'Mathematics';
