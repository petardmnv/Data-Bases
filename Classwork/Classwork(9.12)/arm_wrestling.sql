DROP DATABASE IF EXISTS ArmWrestling;
CREATE DATABASE ArmWrestling;
Use ArmWrestling;

CREATE TABLE Person(
    id int auto_increment not null ,
    name varchar(50) unique,
    PRIMARY KEY (id)
);

CREATE TABLE Battle(
    id int primary key auto_increment not null,
    winner_id int,
    looser_id int,
    FOREIGN KEY (winner_id) REFERENCES Person(id),
    FOREIGN KEY (looser_id) REFERENCES Person(id),
    CHECK (looser_id != winner_id)
);



INSERT INTO Person(name) VALUES ("Peho");
INSERT INTO Person(name) VALUES ("Debeliq");
INSERT INTO Person(name) VALUES ("Ochilatko");
INSERT INTO Person(name) VALUES ("Dankata na popravka");
INSERT INTO Person(name) VALUES ("Vladi");

INSERT INTO Battle(winner_id, looser_id) VALUES(1, 2);
INSERT INTO Battle(winner_id, looser_id) VALUES(1, 3);
INSERT INTO Battle(winner_id, looser_id) VALUES(1, 4);
INSERT INTO Battle(winner_id, looser_id) VALUES(1, 5);
INSERT INTO Battle(winner_id, looser_id) VALUES(2, 1);
INSERT INTO Battle(winner_id, looser_id) VALUES(2, 3);
INSERT INTO Battle(winner_id, looser_id) VALUES(2, 1);
INSERT INTO Battle(winner_id, looser_id) VALUES(2, 4);
INSERT INTO Battle(winner_id, looser_id) VALUES(2, 4);
INSERT INTO Battle(winner_id, looser_id) VALUES(3, 1);
INSERT INTO Battle(winner_id, looser_id) VALUES(3, 1);
INSERT INTO Battle(winner_id, looser_id) VALUES(3, 2);
INSERT INTO Battle(winner_id, looser_id) VALUES(3, 4);
INSERT INTO Battle(winner_id, looser_id) VALUES(4, 1);
INSERT INTO Battle(winner_id, looser_id) VALUES(4, 2);
INSERT INTO Battle(winner_id, looser_id) VALUES(4, 5);
INSERT INTO Battle(winner_id, looser_id) VALUES(4, 5);
INSERT INTO Battle(winner_id, looser_id) VALUES(5, 2);
INSERT INTO Battle(winner_id, looser_id) VALUES(5, 3);
INSERT INTO Battle(winner_id, looser_id) VALUES(5, 1);

Select count(*) from Battle
LEFT JOIN Person
ON Person.id = Battle.winner_id
Where Person.name = "Peho";

Select Looser.name as "Looser", Winner.name as "Winner" from Battle
LEFT JOIN Person as Looser
on Looser.id = Battle.looser_id
LEFT JOIN Person as Winner
on Winner.id = Battle.winner_id
Where Looser.name = "Peho";

Select Looser.name as "Looser", Winner.name as "Winner" from Battle
LEFT JOIN Person as Looser
ON Looser.id = Battle.looser_id
LEFT JOIN Person as Winner
ON Winner.id = Battle.winner_id;
