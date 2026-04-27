DROP TABLE IF EXISTS Progress;
DROP TABLE IF EXISTS Review;
DROP TABLE IF EXISTS Lesson;
DROP TABLE IF EXISTS Module;
DROP TABLE IF EXISTS Enrollment;
DROP TABLE IF EXISTS Course;
DROP TABLE IF EXISTS Instructor;
DROP TABLE IF EXISTS Students;

CREATE TABLE Students (
    student_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE Instructor (
    instructor_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE Course (
    course_id INTEGER PRIMARY KEY,
    title TEXT,
    instructor_id INTEGER,
    FOREIGN KEY (instructor_id) REFERENCES Instructor(instructor_id)
);

CREATE TABLE Enrollment (
    student_id INTEGER,
    course_id INTEGER,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Course(course_id)
);

CREATE TABLE Module (
    module_id INTEGER PRIMARY KEY,
    course_id INTEGER,
    title TEXT,
    FOREIGN KEY (course_id) REFERENCES Course(course_id)
);

CREATE TABLE Lesson (
    lesson_id INTEGER PRIMARY KEY,
    module_id INTEGER,
    title TEXT,
    FOREIGN KEY (module_id) REFERENCES Module(module_id)
);

CREATE TABLE Progress (
    student_id INTEGER,
    lesson_id INTEGER,
    status TEXT,
    PRIMARY KEY (student_id, lesson_id),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (lesson_id) REFERENCES Lesson(lesson_id)
);

CREATE TABLE Review (
    review_id INTEGER PRIMARY KEY,
    student_id INTEGER,
    course_id INTEGER,
    rating INTEGER,
    comment TEXT,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Course(course_id)
);