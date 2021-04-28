Drop Database if exists Youtube;
Create Database Youtube;
Use Youtube;


Create table Userr(
    id int not null primary key auto_increment,
    name varchar(100) unique
);

Create table Chanel(
    id int not null primary key auto_increment,
    name varchar(100) unique
);


Create table UserChanel(
    id int not null primary key auto_increment,
    user_id int not null,
	FOREIGN KEY (user_id) references Userr(id),
	chanel_id int not null,
	FOREIGN KEY (chanel_id) references Chanel(id),
	constraint unique(user_id, chanel_id)
);

Create table Video(
    id int not null primary key auto_increment,
    title varchar(100),
    chanel_id int not null,
	FOREIGN KEY (chanel_id) references Chanel(id)
);


Create table Coment(
    id int not null primary key auto_increment,
    value varchar(100),
    user_id int not null,
    FOREIGN KEY (user_id) references Userr(id),
	video_id int not null,
	FOREIGN KEY (video_id) references Video(id)
);


Insert into Userr(name) Values("Petar");
Insert into Userr(name) Values("VrachevPedala");

Insert into Chanel(name) Values("GFakingG");
Insert into Chanel(name) Values("Glagovest BG Gaming");

Insert into Chanel(name) Values("GGamers");

Insert into UserChanel(user_id, chanel_id) Values(1, 1);
Insert into UserChanel(user_id, chanel_id) Values(2, 2);
Insert into UserChanel(user_id, chanel_id) Values(1, 3);
Insert into UserChanel(user_id, chanel_id) Values(2, 3);

Insert into Video(title, chanel_id) Values("Adfg", 1);
Insert into Video(title, chanel_id) Values("Koi moje o6te da me obijda bee", 2);
Insert into Video(title, chanel_id) Values("Sami se napuka", 3);
Insert into Video(title, chanel_id) Values(" Dimov i mi6o se biqt", 3);

Insert into Coment(value, user_id, video_id) Values("Shishko", 1, 2);
Insert into Coment(value, user_id, video_id) Values("Debelak", 1, 2);
Insert into Coment(value, user_id, video_id) Values("Ujs", 2, 1);


Select Userr.name as "User name", Chanel.name as "Chanel name" from UserChanel
Left join Userr On Userr.id = UserChanel.user_id
Left join Chanel On Chanel.id = UserChanel.chanel_id;


Select Video.title as "Video name", Chanel.name as "Chanel name" from Video
Left join Chanel On Chanel.id = Video.chanel_id;


Select Video.title as "Video name", Userr.name as "User name", Coment.value as "Comment" from Coment
Left join Userr On Userr.id = Coment.user_id
Left join Video On Video.id = Coment.video_id;

Select comentator.name as "Commentator" , comented.name as "Person chanel", Chanel.name as "In Chanel" from Userr as comentator
Left join Coment on Coment.user_id = comentator.id
Left join Video on Video.id = Coment.video_id
Left join Chanel on Chanel.id = Video.chanel_id
Left join UserChanel on UserChanel.chanel_id = Chanel.id
Left join Userr as comented on comented.id = UserChanel.user_id;