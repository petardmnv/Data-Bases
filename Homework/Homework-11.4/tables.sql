Drop Database if exists Gradebook;
Create Database Gradebook;
Use Gradebook;

Create Table Student(
	id int not null primary key auto_increment,
	name varchar(100) unique not null,
	age int not null
);

Create Table Grades(
	id int not null primary key auto_increment,
	grade_name ENUM('Bel', 'Math', 'Subd'),
	grade int not null default 2,
	Check (grade >= 2 and grade <= 6),
	student_id int,
	FOREIGN KEY(student_id) REFERENCES Student(id)
);
