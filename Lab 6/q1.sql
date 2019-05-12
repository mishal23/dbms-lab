create table orders (
	id int,
	order_date date,
	order_number int,
	customerID int,
	totalamt int
);

create table customer (
	id int,
	fname varchar(100),
	lname varchar(100),
	city varchar(100),
	country varchar(100),
	phone int(10)
);

create table order_item (
	id int,
	order_id int,
	product_id int,
	unitprice int,
	quantity int
);

create table product (
	id int,
	product_name varchar(100),
	supplier_id int,
	unitprice int,
	package int,
	isDiscounted varchar(100)
);

create table supplier (
	id int,
	companyname varchar(100),
	contactname varchar(100),
	city varchar(100),
	country varchar(100),
	phone int(10),
	fax int(10)
);

insert into orders values 
	(1, '1998-08-20',1,2,1000),
	(2, '1998-08-20',2,1,2000),
	(3, '1998-08-20',3,5,3000),
	(4, '1998-08-20',4,3,4000),
	(5, '1998-08-20',5,4,5000);


insert into supplier values
	(1,'company-1','name-1','city-1','USA',999999999,111222),
	(2,'company-2','name-2','city-2','UK',999999999,111222),
	(3,'company-3','name-3','city-3','Japan',999999999,111222),
	(4,'company-4','name-4','city-4','India',999999999,111222),
	(5,'company-5','name-5','city-5','USA',999999999,111222);


insert into product values
	(1,'name-1',3,200,123,'yes'),
	(2,'name-2',2,400,223,'yes'),
	(3,'name-3',1,300,323,'yes'),
	(4,'name-4',5,500,423,'yes'),
	(5,'name-5',4,999,523,'yes');

insert into customer values
	(1,'bobby','patil','nagpur','India',999888776),
	(2,'hardik','rana','ahmeda','USA',999888776),
	(3,'pawan','gondia','gondia','UK',999888776),
	(4,'himanshu','patil','nagpur','India',999888776),
	(5,'rupesh','nitne','ohh','China',999888776);

insert into order_item values
	(1,2,2,100,20),
	(2,1,3,200,1),
	(3,3,4,300,100),
	(4,5,5,400,101),
	(5,4,1,500,200);

-- 1. List all suppliers from the USA, UK, OR Japan
select * from supplier where country="USA" or country="UK" or country="Japan";
select * from supplier where country in ("USA","UK","Japan");

-- 2. List all products that are not exactly $10, $20, $30, $40, or $50.
select * from product where unitprice<>10 or unitprice<>20 or unitprice<>30 or unitprice<>40 or unitprice<>50;


-- 3. List all customers that are from
-- the same countries as the suppliers.
select fname, lname, supplier.country from customer, supplier where customer.country = supplier.country;


-- 4. List all orders with customer information
select * from customer, orders
where orders.customerID = customer.Id;

-- 5. List all orders with  product names, quantities, and prices.
select product.product_name, order_item.quantity, order_item.unitprice
from product, orders, order_item
where product.id = order_item.product_id and orders.id = order_item.order_id;

-- 6. List customers that have not placed orders.
select customer.id, sum(order_item.quantity) from customer, orders, order_item
where customer.id = orders.customerID and orders.id=order_item.order_id
group by customerID HAVING sum(order_item.quantity)=0;


-- 7. Match all customers and suppliers by country.
select fname, lname, customer.country, contactname from customer, supplier
where customer.country = supplier.country;


-- 8. Match customers that are from the same city and country.
select c1.fname as c1_fname, c1.lname as c1_lname,
	c2.fname as c2_fname, c2.lname as c2_lname from customer c1, customer c2
where c1.city = c2.city and c1.country = c2.country and c1.id <> c2.id;


-- 9. List all contacts, i.e., suppliers and customers.
select phone from supplier
UNION
select phone from customer;


-- 10. List products with order quantities greater than 100.
select product_id from product, order_item
where product.id = order_item.product_id
group by product_id
having sum(quantity)>100;


-- 11.  List all customers with their total number of orders.
select customer.id, sum(order_item.quantity) from customer, orders, order_item
where customer.id=orders.customerID and orders.id = order_item.order_id
group by customerID;


-- 12. Which products were sold by the unit (i.e. quantity = 1).
select * from product
where unitprice=1;