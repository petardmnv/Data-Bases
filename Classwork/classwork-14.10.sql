Drop database if exists Store

Create database Store;
use Store;

Create table Product (
	id int primary key not null auto_increment,
	name varchar(50) unique,
	quantity float,
	price float not null 
);

INSERT INTO Product(name, quantity, price) VALUES("egg", 200, 2.2);
INSERT INTO Product(name, quantity, price) VALUES("tomato", 2111.5, 1.5);
INSERT INTO Product(name, quantity, price) VALUES("cheese", 220, 4.5);
INSERT INTO Product(name, quantity, price) VALUES("apple", 1000, 0.3);
INSERT INTO Product(name, quantity, price) VALUES("airian", 50, 0.65);

Update Product
set quantity = quantity - 5
where name = "egg";

Update Prduuct 
set price = price / 2 
where quantity <= 5;

Select * from Product
where price in (0.22, 0.3);

Select count(*) from Product
where quantity between 50 and 55;

Select name from Product
where quantity is not null
or quantity > 0;




