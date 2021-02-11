DROP DATABASE IF EXISTS Classbook;

CREATE DATABASE Classbook;
USE Classbook;

CREATE TABLE Student(
    id int auto_increment not null,
    name varchar(100) not null,
    age int,
    check (age > 0),
    primary key (id)
);

CREATE TABLE Grades(
    id int auto_increment not null,
    grade_bg int not null  default 2,
    check (grade_bg <= 6 and grade_bg >= 2),
    grade_math int not null default 2,
    check (grade_math <= 6 and grade_math >= 2),
    grade_subd int not null default 2,
    check (grade_subd <= 6 and grade_subd >= 2),
    student_id int,
    primary key (id),
    foreign key (student_id) references Student(id)
);


INSERT INTO Student(name, age) VALUES("Peho", 17);
INSERT INTO Student(name, age) VALUES("Vanko", 17);
INSERT INTO Student(name, age) VALUES("Misho", 17);
INSERT INTO Student(name, age) VALUES("Marso", 24);

INSERT INTO Grades(grade_bg, grade_math, grade_subd, student_id) VALUES(6, 6, 5, 1);
INSERT INTO Grades(grade_bg, grade_math, grade_subd, student_id) VALUES(5, 5, 5, 2);
INSERT INTO Grades(grade_bg, grade_math, grade_subd, student_id) VALUES(6, 5, 6, 3);
INSERT INTO Grades(grade_bg, grade_math, grade_subd, student_id) VALUES(2, 2, 2, 4);


SELECT Student.name, Grades.grade_bg, Grades.grade_math, Grades.grade_subd
FROM Student
LEFT JOIN Grades on Student.id = Grades.student_id
WHERE name = "ALEX";

SELECT Student.name, Grades.grade_bg, Grades.grade_math, Grades.grade_subd
FROM Student
LEFT JOIN Grades on Student.id = Grades.student_id
WHERE name LIKE '%a%';

SELECT Student.name, Grades.grade_bg, Grades.grade_math, Grades.grade_subd
FROM Student 
LEFT JOIN Grades on Student.id = Grades.student_id 
WHERE ((grade_bg + grade_math + grade_subd)/3) > 5;

SELECT Student.name, Grades.grade_bg, Grades.grade_math
FROM Student 
LEFT JOIN Grades on Student.id = Grades.student_id 
WHERE ((grade_bg + grade_math)/2) > 5;