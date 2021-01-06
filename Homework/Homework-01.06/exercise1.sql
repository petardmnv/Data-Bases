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
    room_id int not null,
    foreign key (room_id) references Room(id) 
};


INSERT INTO Room(name, capacity, price) VALUES("01", 2, 23.5);
INSERT INTO Room(name, capacity, price) VALUES("02", 2, 123.5);
INSERT INTO Room(name, capacity, price) VALUES("01", 3, 223.5);

INSERT INTO Person(name, age, room_id), VALUES("Paco", 23, 1); 
INSERT INTO Person(name, age, room_id), VALUES("Milko", 17, 1); 
INSERT INTO Person(name, age, room_id), VALUES("Pepeto", 15, 2); 
INSERT INTO Person(name, age, room_id), VALUES("Jujeto", 3, 3); 
INSERT INTO Person(name, age, room_id), VALUES("Debelaka", 32, 3); 


SELECT Person.name, Room.name FROM Person
RIGHT JOIN ROOM
ON Person.room_id = Room.id;

SELECT * FROM Person
LEFT JOIN ROOM
ON Person.room_id = Room.id
WHERE Person.room_id is null;


Select Sum(price) from Person
RIGHT JOIN Room 
ON Room.id = Person.room_id;


ALTER TABLE Person ADD TYPE Enum("Young", "Old");

UPDATE Person
SET type = "Young"
WHERE Person.age <= 18;

UPDATE Person
SET type = "Old"
WHERE Person.age > 18;


