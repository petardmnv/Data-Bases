--
-- Връзка 1:n (едно към много)
-- Един ученик може да има много учебници.
-- Мишо има Математика на Анубис.
-- Мими има Български на Просвета.
-- Покажете как Мими не може да има Математика на Анубис.


-- Връзка n:n (много към много) с повтаряне

-- Ученик може да седи на много компютри.
-- Един компютър може да бъде посетен от много ученици.
-- Един ученик може да посети един и същи компютър повече от един път.

-- Връзка n:n (много към много) без повтаряне

-- Ученик може да седи на много компютри.
-- Един компютър може да бъде посетен от много ученици.
-- Един ученик не може да посети един и същи компютър повече от един път.
-- Покажете как  'ученик не може да посети компютър втори път'.


-- Очаква се SQL код, който имплементира тези 3 абстрактни примера.
-- Може да запишете като коментари в този код обяснението.
-- Може да качите картинка на диаграма, ако ви е по-лесно.


DROP DATABASE IF EXISTS Workbook;
CREATE DATABASE Workbook;
USE Workbook;

CREATE TABLE Student(
	id int primary key not null auto_increment,
	name varchar(100) unique not null
);

CREATE TABLE Book(
	id int primary key not null auto_increment,
	name varchar(100) not null, 
	author varchar(100) not null,
	student_id int,
	FOREIGN KEY (student_id) references Student(id),
	-- W@ith constraint we will have one book of a kind "name1", "1author"
	constraint unique_book unique(name, author)
);

CREATE TABLE Comp(
	id int primary key not null auto_increment
);

CREATE TABLE CompStudent(
	id int primary key not null auto_increment,
	sitting_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	student_id int,
	FOREIGN KEY (student_id) references Student(id),
	comp_id int,
	FOREIGN KEY (comp_id) references Comp(id),
	-- This is stupid but if table has unique value  spec_id = student_id + comp_id +> spec_id = 13 
	-- when student_id = 1, comp_id = 3
		-- W@ith constraint we will have one book of a kind "name1", "1author"
	-- spec_id int unique
	-- With constraint we will have Peter sat on computer just one 
	constraint unique_seat unique(student_id, comp_id)
);


INSERT INTO Student(name) VALUES("Dankata");
INSERT INTO Student(name) VALUES("Peho");
INSERT INTO Student(name) VALUES("Vrachev");
INSERT INTO Student(name) VALUES("Mi6o");
INSERT INTO Student(name) VALUES("Marto");



INSERT INTO Book(name, author, student_id) VALUES("Matematika", "Prosveta", 4);
INSERT INTO Book(name, author, student_id) VALUES("Matematika", "Anubis", 2);
-- when student_id is unique second person can't get the same book as first
-- INSERT INTO Book(name, author, student_id) VALUES("Matematika", "Anubis", 3);
INSERT INTO Book(name, author, student_id) VALUES("Matematika", "Arhimed", 3);
INSERT INTO Book(name, author, student_id) VALUES("Bulgarski", "Prosveta", 2);
INSERT INTO Book(name, author, student_id) VALUES("Bulgarski", "Anubis", 4);
INSERT INTO Book(name, author, student_id) VALUES("Bulgarski", "Arhimed", 3);

INSERT INTO Comp(id) VALUES (1);
INSERT INTO Comp(id) VALUES (2);
INSERT INTO Comp(id) VALUES (3);
INSERT INTO Comp(id) VALUES (4);

INSERT INTO CompStudent(student_id, comp_id, sitting_time) VALUES (2, 4, "2019-02-12 00:11:00");
INSERT INTO CompStudent(student_id, comp_id, sitting_time) VALUES (3, 1,"2019-02-12 00:11:00");
INSERT INTO CompStudent(student_id, comp_id, sitting_time) VALUES (4, 2, "2019-02-12 00:11:00");
INSERT INTO CompStudent(student_id, comp_id, sitting_time) VALUES (5, 3, "2019-02-12 00:11:00");


INSERT INTO CompStudent(student_id, comp_id, sitting_time) VALUES (2, 1, "2019-03-13 00:11:00");
INSERT INTO CompStudent(student_id, comp_id, sitting_time) VALUES (3, 2,"2019-03-13 00:11:00");
INSERT INTO CompStudent(student_id, comp_id, sitting_time) VALUES (4, 3, "2019-03-13 00:11:00");
INSERT INTO CompStudent(student_id, comp_id, sitting_time) VALUES (5, 4, "2019-03-13 00:11:00");

-- INSERT INTO CompStudent(student_id, comp_id, sitting_time) VALUES (4, 3, "2019-04-13 00:11:00");

SELECT Book.name as "Subject", Book.author as "Author", Student.name as "Student" from Book
LEFT JOIN Student ON Book.student_id = Student.id;

SELECT  Student.name as "Student", CompStudent.sitting_time as "sat on day", Comp.id as "on computer number" from CompStudent
LEFT JOIN Student ON CompStudent.student_id = Student.id
LEFT JOIN Comp ON CompStudent.comp_id = Comp.id;
