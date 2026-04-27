-- JOIN
SELECT s.name, c.title
FROM Students s
JOIN Enrollment e ON s.student_id = e.student_id
JOIN Course c ON e.course_id = c.course_id;

-- JOIN with Progress
SELECT s.name, l.title, p.status
FROM Students s
JOIN Progress p ON s.student_id = p.student_id
JOIN Lesson l ON p.lesson_id = l.lesson_id;

-- COUNT
SELECT COUNT(*) FROM Students;

-- GROUP BY
SELECT course_id, COUNT(*) 
FROM Enrollment
GROUP BY course_id;

-- FILTER
SELECT * FROM Review WHERE rating >= 4;

-- REAL WORLD
SELECT c.title, AVG(r.rating)
FROM Course c
JOIN Review r ON c.course_id = r.course_id
GROUP BY c.title;