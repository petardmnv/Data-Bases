DROP DATABASE IF EXISTS Facebook;
CREATE DATABASE Facebook;
USE Facebook;

CREATE TABLE User(
	id int primary key not null auto_increment,
	name varchar(100) unique not null
);

CREATE TABLE GGroup(
	id int primary key not null auto_increment,
	name varchar(100) unique not null
);

CREATE TABLE Post(
	id int primary key not null auto_increment,
	name varchar(100) unique not null,
	content varchar(100) not null,
	group_id int,
	FOREIGN KEY (group_id) references GGroup(id)
	-- FOREIGN KEY (person_id) references Person(id)
);

CREATE TABLE Comment(
	id int primary key not null auto_increment,
	content varchar(100) not null,
	user_id int,
	FOREIGN KEY (user_id) references User(id),
	post_id int,
	FOREIGN KEY (post_id) references Post(id)
	-- FOREIGN KEY (person_id) references Person(id)
);

CREATE TABLE UserGGroup(
	id int primary key not null auto_increment,
	user_id int,
	FOREIGN KEY (user_id) references User(id),
	group_id int,
	FOREIGN KEY (group_id) references GGroup(id)
);

INSERT INTO GGroup(name) VALUES("Tues");
INSERT INTO GGroup(name) VALUES("SU");

INSERT INTO User(name) VALUES("Peho");
INSERT INTO User(name) VALUES("Bliznacite");
INSERT INTO User(name) VALUES("Jordan");
INSERT INTO User(name) VALUES("Dankata");

INSERT INTO Post(name, content, group_id) VALUES("Iskam da leftna", "Na poprafka sam po subd:)", 1);
INSERT INTO Post(name, content, group_id) VALUES("Tues me nau4i na ...", "hustle", 1);
INSERT INTO Post(name, content, group_id) VALUES("Su dobur sait li e", "za lesni programisti da", 2);
INSERT INTO Post(name, content, group_id) VALUES("SU u4i li te..", "Emi realno na povurhnostta na programirneto", 2);

INSERT INTO Comment(content, user_id, post_id) VALUES("OK br", 1, 1);
INSERT INTO Comment(content, user_id, post_id) VALUES("Sat br", 2, 1);
INSERT INTO Comment(content, user_id, post_id) VALUES("NE brat", 2, 2);
INSERT INTO Comment(content, user_id, post_id) VALUES("Moje bi nqkoi hora(ne i dankata)", 1, 2);
INSERT INTO Comment(content, user_id, post_id) VALUES("Da", 3, 3);
INSERT INTO Comment(content, user_id, post_id) VALUES("Absolutno", 1, 4);
INSERT INTO Comment(content, user_id, post_id) VALUES("Ne mislq", 3, 4);


INSERT INTO UserGGroup(user_id, group_id) VALUES(1, 2);
INSERT INTO UserGGroup(user_id, group_id) VALUES(1, 1);
INSERT INTO UserGGroup(user_id, group_id) VALUES(2, 1);
INSERT INTO UserGGroup(user_id, group_id) VALUES(3, 2);


-- Select Comment.content as "Content", User.name as " User mame", Post.name as "Post name", GGroup.name as "Group name" 
-- FROM Comment
-- RIGHT JOIN User ON Comment.user_id = User.id
-- RIGHT JOIN Post ON Comment.post_id = Post.id
-- RIGHT JOIN GGroup ON Post.group_id = GGroup.id;


-- Select User.name as "User name" from User
-- RIGHT JOIN Comment ON Comment.user_id = User.id
-- WHERE Comment.user_id is null;




-- 4 - Изведете хората, които никога не са писали коментар.
-- 5 - Изведете хората, които участват в групи.
-- 6 - Изведете групите, в които няма нито един човек.
-- 7 - Изведете всички групи, които имат поне един коментар, който има по-малко от 10 символа (https://www.w3schools.com/sql/func_mysql_length.asp)


-- AAAAAAA ne mi se pravqt tolkova zaqvki sartttttt
