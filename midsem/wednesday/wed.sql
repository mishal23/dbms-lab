create database if not exists wednesday;

use wednesday;


create table if not exists `order_details` (
	`detail_id` int NOT NULL,
	`order_id` int NOT NULL,
	`product_id` int NOT NULL,
	`quantity` int,
	PRIMARY KEY (`order_id`)
);

create table if not exists `supplier` (
	`supplier_id` int NOT NULL,
	`supplier_name` varchar(100),
	`contact_name` varchar(100),
	`city` varchar(100),
	`postal_code` int(10),
	`country` char(100),
	PRIMARY KEY (`supplier_id`)
);

create table if not exists `customers` (
	`customer_id` int NOT NULL,
	`customer_name` varchar(100),
	`contact_name` varchar(100),
	`address` varchar(100),
	`city` varchar(100),
	`postal_code` int(10),
	`country` char(100),
	PRIMARY KEY (`customer_id`)
);

create table if not exists `product` (
	`product_id` int NOT NULL,
	`product_name` varchar(500),
	`supplier_id` int NOT NULL,
	`category_id` int,
	`unit` int,
	`price` int,
	PRIMARY KEY (`product_id`),
	CONSTRAINT FOREIGN KEY (`supplier_id`) REFERENCES `supplier`(`supplier_id`) ON DELETE CASCADE
);

insert into supplier values (201, "Parle G", "Mukesh", "Bangalore", 585401, "India");
insert into supplier values (202, "Parle G", "Mukesh", "Bangalore", 585401, "USA");
insert into supplier values (203, "Parle G", "Mukesh", "Bangalore", 585401, "USA");

-- select * from products where product_name rlike 
insert into product values (101, 'amarnatmnsaheb', 201, 301, 5, 200);

select * from product where length(product_name)>11 and product_name like "a%mn%eb";

create table `shipper`  (
	`shipper_id` int(10),
	`ship_name` varchar(100)
);

insert into order_details values 
	(101, 201, 301, 5, 401),
	(102, 202, 302, 5, 401),
	(103, 203, 303, 5, 402),
	(104, 204, 304, 5, 402),
	(105, 205, 305, 5, 403);


insert into shipper values 
	(401, "Bobby"),
	(402, "Mishal"),
	(403, "DBMS");

select shipper.ship_name as shipname, count(order_details.shipper_id)  as count
from shipper, order_details
where shipper.shipper_id = order_details.shipper_id
group by(shipname);