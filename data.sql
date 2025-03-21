-- Insert Students
INSERT INTO Students (Name, Age, Email) VALUES 
('Alice Johnson', 20, 'alice@example.com'),
('Bob Smith', 22, 'bob@example.com'),
('Charlie Brown', 21, 'charlie@example.com');

-- Insert Courses
INSERT INTO Courses (CourseName, Credits) VALUES 
('Mathematics', 4),
('Computer Science', 5),
('History', 3);

-- Insert Enrollments
INSERT INTO Enrollments (StudentID, CourseID, EnrollDate) VALUES 
(1, 1, TO_DATE('2024-03-01', 'YYYY-MM-DD')),
(1, 2, TO_DATE('2024-03-05', 'YYYY-MM-DD')),
(2, 3, TO_DATE('2024-03-10', 'YYYY-MM-DD')),
(3, 1, TO_DATE('2024-03-15', 'YYYY-MM-DD'));
