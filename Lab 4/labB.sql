create database if not exists lab4;

use lab4;

create table if not exists emp(
	FName varchar(100),
	LName varchar(100),
	EID int(10) primary key,
	Start_date date,
	city varchar(100),
	salary int(10),
	DNo int(10),
	Supervisor_ID int(10),
	Email varchar(50)
);

insert into emp values
	("John", "Taylor", 1777, '2007-04-13', "Sydney", 20000, 4, 1945, "jtaylor@yahoo.com"),
	("Mark", "Williams", 1945, '2012-06-23', "London", 55055, 4, 8888, "trev_william@gmail.com"),
	("Zoe", "Johnson", 2050, '2015-06-23', "Oslo", 55055, 5, 2534, "zoe777@msn.com"),
	("Kathy", "Franklin", 2051, '2013-06-29', "Sydney", 20000, 5, 2534, "kathyfrank@gmail.com"),
	("Trevor", "Jacob", 2398, '2012-06-23', "London", 55055, 4, 1945, "trevorJ235@aol.com"),
	("Mike", "Law", 5523, '2009-12-04', "London", 70000, 4, 7777, "mlaw9@gmail.com"),
	("Jude", "Owens", 7777, '2004-12-04', "London", 130000, 4, NULL, "mailjude@yahoo.com"),
	("Alice", "Bright", 8888, '1999-12-19', "London", 1111143, 7, NULL, "ab23@gmail.com");


select min(salary) as `Second lowest salary` from emp where salary not in (select min(salary) from emp);

select SUBSTRING_INDEX(email, '@', 1) as username from emp;