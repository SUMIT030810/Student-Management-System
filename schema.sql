-- Drop existing tables (if they exist) to avoid errors
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE Enrollments CASCADE CONSTRAINTS';
    EXECUTE IMMEDIATE 'DROP TABLE Students CASCADE CONSTRAINTS';
    EXECUTE IMMEDIATE 'DROP TABLE Courses CASCADE CONSTRAINTS';
EXCEPTION
    WHEN OTHERS THEN
        NULL;
END;
/

-- Sequence for StudentID
CREATE SEQUENCE seq_student START WITH 1 INCREMENT BY 1;

-- Table: Students
CREATE TABLE Students (
    StudentID NUMBER PRIMARY KEY,
    Name VARCHAR2(100) NOT NULL,
    Age NUMBER CHECK (Age > 0),
    Email VARCHAR2(255) UNIQUE
);

-- Trigger for auto-incrementing StudentID
CREATE OR REPLACE TRIGGER trg_student_id
BEFORE INSERT ON Students
FOR EACH ROW
BEGIN
    SELECT seq_student.NEXTVAL INTO :NEW.StudentID FROM DUAL;
END;
/

-- Sequence for CourseID
CREATE SEQUENCE seq_course START WITH 1 INCREMENT BY 1;

-- Table: Courses
CREATE TABLE Courses (
    CourseID NUMBER PRIMARY KEY,
    CourseName VARCHAR2(100) NOT NULL,
    Credits NUMBER CHECK (Credits > 0)
);

-- Trigger for auto-incrementing CourseID
CREATE OR REPLACE TRIGGER trg_course_id
BEFORE INSERT ON Courses
FOR EACH ROW
BEGIN
    SELECT seq_course.NEXTVAL INTO :NEW.CourseID FROM DUAL;
END;
/

-- Sequence for EnrollmentID
CREATE SEQUENCE seq_enrollment START WITH 1 INCREMENT BY 1;

-- Table: Enrollments
CREATE TABLE Enrollments (
    EnrollmentID NUMBER PRIMARY KEY,
    StudentID NUMBER,
    CourseID NUMBER,
    EnrollDate DATE DEFAULT SYSDATE,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID) ON DELETE CASCADE,
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID) ON DELETE CASCADE
);

-- Trigger for auto-incrementing EnrollmentID
CREATE OR REPLACE TRIGGER trg_enrollment_id
BEFORE INSERT ON Enrollments
FOR EACH ROW
BEGIN
    SELECT seq_enrollment.NEXTVAL INTO :NEW.EnrollmentID FROM DUAL;
END;
/
