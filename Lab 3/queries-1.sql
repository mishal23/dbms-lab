CREATE DATABASE IF NOT EXISTS `lab3`;

use lab3;

CREATE TABLE IF NOT EXISTS `employee`(
	`eid` int NOT NULL AUTO_INCREMENT,
	`ename` varchar(50),
	`street` varchar(50),
	`city` varchar(50),
	PRIMARY KEY (`eid`)
);

CREATE TABLE IF NOT EXISTS `company`(
	`cid` int NOT NULL AUTO_INCREMENT,
	`cname` varchar(50),
	`city` varchar(50),
	PRIMARY KEY (`cid`)
);

CREATE TABLE IF NOT EXISTS `works`(
	`eid` int UNIQUE,
	`cid` int UNIQUE,
	`salary` int(12),
	CONSTRAINT FOREIGN KEY (`eid`) REFERENCES `employee` (`eid`) ON DELETE CASCADE,
	CONSTRAINT FOREIGN KEY (`cid`) REFERENCES `company` (`cid`) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS `manages`(
	`eid` int UNIQUE,
	`mid` int UNIQUE,
	CONSTRAINT FOREIGN KEY (`eid`) REFERENCES `employee`(`eid`) ON DELETE CASCADE,
	CONSTRAINT FOREIGN KEY (`mid`) REFERENCES `employee`(`eid`) ON DELETE CASCADE
);

insert into employee values (110, "Mishal Shah", "ABC", "Vadodara");
insert into employee values (111, "Ashwin Joisa", "XYZ", "Bangalore");
insert into employee values (112, "Praveen Gupta", "LMN", "Chandigarh");
insert into employee values (113, "Mahir Jain", "PQR", "Bangalore");

insert into company values (201, "ICICI", "Pune");
insert into company values (202, "State Bank of India", "Mumbai");

insert into works values (110, 201, 20000);
insert into works values (111, 202, 100000);

insert into manages values (111, 113);	
insert into manages values (112, 110);


select employee.ename, employee.street, employee.city from employee, works, company
where (employee.eid=works.eid and works.cid=company.cid and company.cname="State Bank of India" and salary>1000);

select employee.ename from employee, works, company 
where (employee.eid=works.eid and works.cid=company.cid and employee.city = company.city);

select (employee.ename from employee, manages)
where (employee.eid=manages.eid or employee.eid = manages.mid) and (employee.city = 
)