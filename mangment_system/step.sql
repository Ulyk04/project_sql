CREATE TABLE students(
    student_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    date_of_birth DATE
)

CREATE TABLE courses(
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    credits INT NOT NULL
)

CREATE TABLE enrollments(
    enrollment_id SERIAL PRIMARY KEY,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    grade VARCHAR(10) NOT NULL,

    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
)

INSERT INTO students(name , email , date_of_birth)
VALUES ('John Wick' , 'johnw@gmail.com' , '1999-05-01'),
('Mat Demon' , 'demon1@gmail.com' , '2000-10-12'),
('Blade Nolan' , 'bnolan@gmail.com' , '1991-08-15')

INSERT INTO courses(course_name , credits)
VALUES('Programming' , 3),
('Biology' , 4),
('Mathematic' , 6)

INSERT INTO enrollments(student_id , course_id , grade)
VALUES(1 , 1 , 'A'),
(1 , 2 , 'B'),
(1 , 3 , 'A'),
(2 , 1 ,  'B'),
(2 , 2 , 'C'),
(2 , 3 , 'A'),
(3 , 1 , 'A'),
(3 , 2 , 'A'),
(3 , 3 , 'A')

SELECT s.student_id, s.name, s.email, s.date_of_birth
FROM students s
JOIN enrollments e ON s.student_id = e.student_id