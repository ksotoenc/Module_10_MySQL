USE university;

-- 1. Print out all the student first names and last names. (1pt)
SELECT first_name, last_name FROM student;

-- 2. Print out the IDs of all the tenured instructors. (1pt)
SELECT instructor_id FROM instructor WHERE tenured = 1;

-- 3. Print out the student first and last names along with their advisor's first and last names.
-- Make sure to alias descriptive column names. Leave out any students without advisors and any advisors without students.
SELECT s.first_name AS student_first_name, s.last_name AS student_last_name, 
		i.first_name AS advisor_first_name, i.last_name AS advisor_last_name
FROM student s
JOIN instructor i ON s.advisor_id = i.instructor_id; 

-- 4. Print out the ID, first name, and last name of all instructors who do not have any advisees 
-- (HINT: Lookup the different join types in MySQL and use "IS NULL" instead of "= NULL"). (1pt)
SELECT i.instructor_id, i.first_name, i.last_name
FROM instructor i 
LEFT JOIN student s ON s.advisor_id = i.instructor_id
WHERE s.advisor_id IS NULL; 

-- 5. Print out the first and last name of all the instructors along with the total number of credit hours they teach.
SELECT i.first_name, i.last_name, SUM(c.num_credits) AS total_credit_hours
FROM instructor i
JOIN course c ON i.instructor_id = c.instructor_id
GROUP BY i.instructor_id, i.first_name, i.last_name;

-- 6. Print out the course code and course name of all 3000 level courses (HINT: Lookup the SQL LIKE operator). (1pt)
SELECT course_code, course_name
FROM course
WHERE course_code LIKE '%3___';

-- 7. Print out the course schedule of the student with an ID of 1 by printing off the course code,
-- instructor first name, instructor last name, and number of credit hours for each course in which student 1 is enrolled.
SELECT c.course_code, i.first_name, i.last_name, c.num_credits
FROM student_schedule ss
INNER JOIN student s ON s.student_id = ss.student_id
INNER JOIN course c ON c.course_id = ss.course_id
INNER JOIN instructor i ON i.instructor_id = c.instructor_id
WHERE s.student_id = 1;