DROP DATABASE IF EXISTS Kusta;
CREATE DATABASE Kusta;
USE Kusta;


CREATE TABLE ROOM{
    id int primary key not null auto_increment,
    name char(3) unique,
    capacity int not null,
    price decimal(5, 2) default 0
};

CREATE TABLE PERSON{
    id int primary key not null auto_increment,
    name char(30) unique,
    age int default 0 check(age > -1),
    room_id int not null
};

CREATE TABLE RESEPTION{
    id int primary key not null auto_increment,
    room_id int not null,
    foreign key (room_id) references Room(id),
    person_id int not null,
    foreign key (person_id) references Person(id),
    date DATE 
};


INSERT INTO Room(name, capacity, price) VALUES("01", 2, 23.5);
INSERT INTO Room(name, capacity, price) VALUES("02", 2, 123.5);
INSERT INTO Room(name, capacity, price) VALUES("01", 3, 223.5);

INSERT INTO Person(name, age, room_id), VALUES("Paco", 23); 
INSERT INTO Person(name, age, room_id), VALUES("Milko", 17); 
INSERT INTO Person(name, age, room_id), VALUES("Pepeto", 15); 
INSERT INTO Person(name, age, room_id), VALUES("Jujeto", 3); 
INSERT INTO Person(name, age, room_id), VALUES("Debelaka", 32); 

INSERT INTO Reception(room_id, person_id, date) VALUES(1, 1, "2020-12-12");
INSERT INTO Reception(room_id, person_id, date) VALUES(1, 2, "2020-12-12");
INSERT INTO Reception(room_id, person_id, date) VALUES(2, 1, "2020-11-12");
INSERT INTO Reception(room_id, person_id, date) VALUES(4, 2, "2020-12-12");
INSERT INTO Reception(room_id, person_id, date) VALUES(3, 3, "2020-12-12");

SELECT * FROM Person
RIGHT JOIN Reseption
ON Reseption.person_id = Person.id
GROUP BY Person.id; 

SELECT Person.name Count(*) FROM Person
RIGHT JOIN Reseption
ON Reseption.person_id = Person.id
GROUP BY Person.name
ORDER BY COUNT(*) DESC
LIMIT 1;

SELECT * FROM Person
RIGHT JOIN Reseption
ON Reseption.person_id = Person.id
RIGHT JOIN Reseption
ON Reseption.person_id = Person.id
WHERE Person.name like "Paco"
AND Reseption.date between "2020-10-12" and "2020-12-12"; 

SELECT DISTINCT Person.name FROM Person
RIGHT JOIN Reseption
ON Reseption.person_id = Person.id


ALTER TABLE Reseption ADD rating int default 0;
ALTER TABLE Reseption ADD Check(rationg between 0 and 5);

UPDATE Reseption
SET rating = 5
WHERE date < "2020-12-12";

UPDATE Reseption
SET rating = 4
WHERE date > "2020-12-12";

SELECT Room.name, AVG(rating), 


