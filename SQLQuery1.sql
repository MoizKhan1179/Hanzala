create database practical;

create table customers (
cId int primary key,
fname varchar(255),
lname varchar (255),
email varchar (255),
phonenumber int
);

create table orders (
orderId int primary key,
cId int,
orderdate date,
totalamount varchar (212),
FOREIGN KEY (cId) REFERENCES customers(cId)
);

create table ordersdetails (
ordersdetailId int primary key,
orderId int,
productId int,
quntity int,
unitprice varchar (212),
FOREIGN KEY (orderId) REFERENCES orders(orderId),
FOREIGN KEY (productId) REFERENCES products (productId)
);

create table products (
productId int primary key,
productname varchar(255),
unitprice varchar (255),
instockquantity varchar (255)
);


INSERT INTO customers (cId,fname, lname,email, phonenumber)
VALUES
    (1, 'John', 'Doe','doe@gmail.com',032978279 ),
    (2, 'Jane', 'Smith','jane@gmail.com',03333782 ),
    (3,'Mike', 'Johnson','mike@gmail.com',0333282 ),
    (4, 'Emily', 'Williams','emily@gmail.com',03333270),
    (5, 'David', 'Brown','brown@gmail.com',03097827 ),
    (6, 'Sarah', 'Miller', 'miller@gmail.com',033789),
    (7, 'Chris', 'Wilson','chirs@gmail.com',03092789),
    (8, 'Anna', 'Jones', 'anna@gmail.com',037773789),
    (9, 'Brian', 'Taylor', 'brian@gmail.com',0382789),
    (10, 'Laura', 'Anderson','laura@gmail.com',039782789);

	
INSERT INTO orders (orderId, cId, orderdate, totalamount)
VALUES (3,1,'2022-1-11',400), (4,4,'2002-3-2',8900), (5,5,'2220-4-3',2800),
(6,6,'2220-6-7',4300), (7,7,'2220-5-3',3400), (8,8,'2220-3-2',9500), (9,9,'2220-7-3',2300), (10,10,'2052-9-3',5300);

select * from orders

INSERT INTO ordersdetails (ordersdetailId, orderId, productId ,quntity,unitprice)
values (1,1,1,1,'1'), (2,2,2,2,'12'), (3,3,3,21,'111'), (4,4,4,4,'4'), (5,5,5,5,'2'),
(6,6,6,6,'430'), (7,7,7,7,'400'), (8,8,8,8,'9'), (9,9,9,9,'300'), (10,10,10,10,'30');

select * from ordersdetails

INSERT INTO products (productId,productname,unitprice ,instockquantity)
values (1,'lays','20','22'), (2,'cake','20','2'), (3,'bally','3','400'), (4,'paper','2','90'), (5,'dog','2','90'),
(6,'ball','1','11'), (7,'bat','3','11'), (8,'wicket','2','5'), (9,'shirt','3','3'), (10,'pant' ,'2','30');

select * from products

-- query1
create login order_clerk with password ='1234';
 create user order_clerk for login order_clerk;
 grant insert,update on dbo.orders to order_clerk;

 --query2
	create trigger update_stock_audit on products
	for UPDATE
	as
	begin
	print'data insert'
	end

--query3
select fname,lname,orderdate,totalamount from customers as c inner join orders as o on c.cId=o.cId;


--query4
select count(totalamount), productname , quntity,totalamount from products as p inner join ordersdetails as o on p.productId=o.productId
inner join orders as oo on o.orderId=oo.orderId; 

--query5
create procedure getorderbycustomer
	@id varchar(215)
	as
	begin
	select * from customers where cId = @id;
	end

	exec getorderbycustomer @id = 2;

	--query6
	create view ordersummary as
	SELECT orderId,cId,orderdate,totalamount 
from orders;

	select * from ordersummary;

	--query7
	create view productinventory as
	SELECT productname,instockquantity
from products;
	select * from productinventory;

	--query8	
	select fname, lname, orderId,orderdate,totalamount from ordersummary as o inner join customers as c on o.cId= c.cId;