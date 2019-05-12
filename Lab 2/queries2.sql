use lab2;

create table emp (
	eno int primary key,
	ename varchar(50),
	phone_no int(10),
	desg varchar(20),
	salary int,
	age int,
	country varchar(20)
);

insert into emp values (110, "mishal", 999091013, "Executive Member", 10000, 20, "India");
insert into emp values (111, "ashwin", 999091003, "Secretary", 1000000, 21, "India");
insert into emp values (112, "bobby", 999091023, "Executive Member", 50000, 22, "India");
insert into emp values (113, "praveen", 999091033, "Development SDE", 45000, 20, "India");
insert into emp values (114, "moksh", 999091043, "SIG Head", 22000, 19, "India");
insert into emp values (115, "ashwin", 999091053, "Convenor", 56000, 20, "India");
insert into emp values (116, "shashank", 999091063, "Executive Member", 10000, 20, "India");
insert into emp values (117, "omkar", 999091073, "Systems IRIS", 10000, 20, "India");
insert into emp values (118, "naveen", 999091083, "Executive Member", 15000, 20, "India");
insert into emp values (119, "dibyadarshan", 999091093, "Problem Curator", 1000, 20, "India");

select eno as eid, ename as emp_name from emp;

select * from emp where (salary between 20000 and 50000) and (eno<>111 and eno<>112);

select ename, desg from emp where ename like 'a%' and length(emp.ename)>4;

select count(distinct	 country) from emp;

select * from emp where salary in (select min(salary) from emp);

update emp set salary=salary*0.25 where salary<18000;

select ename, salary from emp;