create database if not exists lab5;

use lab5;

create table if not exists customers (
	cid int(10),
	fname varchar(100),
	lname varchar(100),
	dob date,
	joining_date date,
	city varchar(100),
	state varchar(100),
	street varchar(100),
	phone_no int(10),
	fax int(10),
	monthly_discount int(10),
	pack_id int(10)
);

create table if not exists packages (
	pack_id int(10),
	speed int(10),
	start_date date,
	monthly_payment int(10),
	sid int(10)
);

create table if not exists sectors (
	sid int(10),
	sname varchar(100)
);

create table if not exists pack_grades (
	grade_id int(10),
	gname varchar(100),
	min_price int(10),
	max_price int(10)
);

-- a) Write a query to display first name, last name, package number
-- and internet speed for all customers.
select c.fname, c.lname, c.pack_id, p.speed 
from customers as c, packages as p
where c.pack_id = p.pack_id;


-- b) Write a query to display first name, last name, package number
-- and internet speed for all customers whose package number
-- equals 100 or 107. Order the query in ascending order by last
-- name.
select c.fname, c.lname, c.pack_id, p.speed 
from customers as c, packages as p
where c.pack_id = p.pack_id and (p.pack_id = 100 or p.pack_id = 107)
order by c.lname asc;


-- c) Display the package number, internet speed, monthly payment
-- and sector name for all packages.
select p.pack_id, p.speed, p.monthly_payment, s.sname
from packages as p, sectors as s
where p.sid = s.sid;


-- d) Display the customer name, package number, internet speed,
-- monthly payment and sector name for all customers.
select c.pack_id, p.speed, p.monthly_payment, s.sname 
from customers as c, packages as p, sectors as s
where c.pack_id = p.pack_id and p.sid = s.sid;


-- e) Display the customer name, package number, internet speed,
-- monthly payment and sector name for all customers in the
-- business sector.
select c.pack_id, p.speed, p.monthly_payment, s.sname 
from customers as c, packages as p, sectors as s
where c.pack_id = p.pack_id and p.sid = s.sid and s.sname="Business";


-- f) Display the last name, first name, join date, package number,
-- internet speed and sector name for all customers in the private
-- sector who joined the company in the year 2017.
select c.fname, c.lname, c.joining_date, c.pack_id, p.speed, s.sname
from customers as c, packages as p, sectors as s
where c.pack_id = p.pack_id and s.sid = p.sid and s.sname = "Private" and YEAR(c.joining_date) = "2017";


-- g) Display the package number, internet speed, monthly payment
-- and package grade for all packages.
alter table packages add grade_id int(10);

select p.pack_id, p.speed, p.monthly_payment, g.gname 
from packages as p, pack_grades as g
where p.grade_id = g.grade_id;


-- h) Display the first name, last name, internet speed and monthly
-- payment for all customers. Use INNER JOIN.
select fname, lname, speed, monthly_payment 
from customers inner join packages on packages.pack_id = customers.pack_id;


-- i) Modify last query to display all customers, including those without
-- any internet package.
select fname, lname, speed, monthly_payment 
from customers left outer join packages on customers.pack_id = packages.pack_id;


-- j) Modify last query to display all packages, including those without
-- any customers.
select fname, lname, speed, monthly_payment 
from customers right outer join packages on customers.pack_id = packages.pack_id;


-- k) Modify last query to display all packages and all customers.
select fname, lname, speed, monthly_payment 
from customers left outer join packages on customers.pack_id = packages.pack_id
union
select fname, lname, speed, monthly_payment 
from customers right outer join packages on customers.pack_id = packages.pack_id;

-- l) select p.pack_id, p.speed, p.start_date, p.monthly_payment, p.sid
-- from packages as p left join customers on p.pack_id = customers.pack_id
-- union 
-- select p.pack_id, p.speed, p.start_date, p.monthly_payment, p.sid
-- from packages as p;


select * from packages;
select * from customers;


-- l) Display the last name, first name and package number for all
-- customers who have the same package number as customer
-- named ‘Blake’ and ‘Smith’.
select c1.lname, c1.fname, c1.pack_id
from customers as c1, customers as c2, customers as c3
where c1.pack_id = c2.pack_id and c1.pack_id = c3.pack_id and c2.fname = "Blake" and c3.fname = "Smith";


-- m) Display the last name, first name and monthly discount for all
-- customers whose monthly discount is lower than the monthly
-- discount of employee number 102.
select c1.lname, c1.fname, c1.monthly_discount
from customers as c1, customers as c2
where c2.cid = 102 and c1.monthly_discount < c2.monthly_discount;


-- n) Display the package number and internet speed for all packages
-- whose internet speed is equal to the internet speed of package
-- number 7.
select p1.pack_id, p1.speed
from packages as p1, packages as p2
where p2.pack_id = 7 and p1.speed = p2.speed;


select p1.speed, c1.fname, c1.cid, c1.pack_id
from customers as c1, customers as c2, packages as p1, packages as p2, pack_grades as g1, pack_grades as g2
where c1.pack_id = p1.pack_id and p1.grade_id = g1.grade_id 
and c2.pack_id = p2.pack_id and p2.grade_id = g2.grade_id 
 and YEAR(c1.joining_date) = "2017" and YEAR(c2.joining_date) = "2017" 
 and p1.speed > p2.speed and p1.speed = (select max(p1.speed) from packages as p1)
 and (g1.max_price - g1.min_price) > (g2.max_price - g1.min_price) 
 and (g1.max_price-g1.min_price) = (select max(g1.max_price-g1.min_price) from pack_grades as g1);


