DROP DATABASE IF EXISTS GR;
Create Database GR;
Use GR;

Create Table GroupTable(
	id int not null primary key auto_increment,
	name varchar(100) not null,
	last_meet timestamp default current_timestamp
);

Create Table Member(
	id int not null primary key auto_increment,
	name varchar(100) unique not null,
	type ENUM('Student', 'Teacher')
);

Create Table GroupMembers(
	id int not null primary key auto_increment,
	group_id int,
	FOREIGN KEY(group_id) REFERENCES GroupTable(id),
	member_id int,
	FOREIGN KEY(member_id) REFERENCES Member(id)
);


INSERT INTO GroupTable(name, last_meet) VALUES("1 Group", "2011-11-10 23:59:59");
INSERT INTO GroupTable(name) VALUES("2 Group");
INSERT INTO GroupTable(name) VALUES("3 Group");


INSERT INTO Member(name, type) VALUES("Dimba", "Student");
INSERT INTO Member(name, type) VALUES("Mimba", "Student");
INSERT INTO Member(name, type) VALUES("Tishba", "Student");

INSERT INTO Member(name, type) VALUES("Jordan", "Teacher");
INSERT INTO Member(name, type) VALUES("Alex", "Teacher");


INSERT INTO GroupMembers(group_id, member_id) VALUES(1, 1);
INSERT INTO GroupMembers(group_id, member_id) VALUES(1, 2);
INSERT INTO GroupMembers(group_id, member_id) VALUES(1, 4);


INSERT INTO GroupMembers(group_id, member_id) VALUES(2, 5);


INSERT INTO GroupMembers(group_id) VALUES(3);


SELECT GroupTable.name AS "Group name", Member.name AS "Member name",
Member.type AS "type" FROM GroupMembers
RIGHT JOIN GroupTable ON GroupTable.id = GroupMembers.group_id
LEFT JOIN Member ON Member.id = GroupMembers.member_id;

SELECT GroupTable.name AS "Group name", Count(GroupMembers.member_id) AS "Members Count" FROM GroupMembers
RIGHT JOIN GroupTable ON GroupTable.id = GroupMembers.group_id
GROUP BY GroupTable.name;

SELECT GroupTable.name AS "Group name", Count(DISTINCT(GroupMembers.member_id)) AS "Members Count" FROM GroupMembers
RIGHT JOIN GroupTable ON GroupTable.id = GroupMembers.group_id
LEFT JOIN Member ON Member.id = GroupMembers.member_id
WHERE Member.type LIKE "Student" GROUP BY GroupTable.name;

SELECT GroupTable.name AS "Group name", Count(DISTINCT(GroupMembers.member_id)) AS "Members Count" FROM GroupMembers
RIGHT JOIN GroupTable ON GroupTable.id = GroupMembers.group_id
LEFT JOIN Member ON Member.id = GroupMembers.member_id
WHERE Member.type LIKE "Teacher" GROUP BY GroupTable.name;

SELECT GroupTable.name AS "Group Name", GroupTable.last_meet AS "First Meet" FROM GroupTable
WHERE GroupTable.last_meet > "2010-10-10 00:00:00" AND GroupTable.last_meet < "2011-11-11 23:59:59";