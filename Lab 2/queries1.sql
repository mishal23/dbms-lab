create database lab2;

use lab2;

create table customers(
	cid int primary key,
	cname varchar(50),
	age int(3),
	address varchar(100),
	city varchar(20),
	postalcode int(10),
	gender varchar(5),
	country varchar(20)
);

insert into customers values (001, "mishal", 19, "Balajinagar Soc.,", "Vadodara", 390022, "Male", "India");
insert into customers values (002, "bobby", 21, "New OMnagar", "Nagpur", 440019, "Male", "India");
insert into customers values (003, "ashwin", 22, "HSR Layout", "Bangalore", 560012, "Male", "India");
insert into customers values (004, "praveen", 23, "Madhya Marg", "Chandigarh", 440019, "Male", "India");
insert into customers values (005, "moksh", 18, "Borivali", "Mumbai", 440019, "Male", "India");
insert into customers values (006, "mahim", 25, "HSR Layout", "Bangalore", 560017, "Male", "India");
insert into customers values (007, "shashank", 20, "Pabbas", "Mangalore", 440019, "Male", "India");
insert into customers values (008, "naveen", 17, NULL, "Bangalore", 560036, "Male", "India");
insert into customers values (009, "dibyadarshan", 22, "narmada road", "Jamnagar", 440019, "Male", "India");
insert into customers values (010, "hlpr", 20, "Hassan", "Bangalore", 560063, "Male", "India");


select * from customers where (city="Bangalore" or city="Hyderabad") and country="India";

select cid, cname from customers where address is NULL;

select count(*) from customers where gender="Female";

select * from customers where city="Mangalore" limit 3;

select *  from customers order by age desc;

select count(*) from customers where cname like ('%a') or cname like ('%h');

select * from customers where postalcode like ('5%') and (cname like ('s%') or cname like ('t%') or cname like ('p%'));

select * from customers where (city="Bangalore" or city="Pune" or city="Chennai");