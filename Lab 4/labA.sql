create database if not exists lab4;

use lab4;

create table if not exists employee(
	FName varchar(100),
	LName varchar(100),
	EID int(10) primary key,
	Start_date date,
	office varchar(100),
	salary int(10),
	DNo int(10),
	Bonus int(10),
	Email varchar(50)
);

insert into employee values
	("John", "Taylor", 1777, '2012-04-13', "Chicago", 20000, 4, 400, "jtaylor@yahoo.com"),
	("Trevor", "Williams", 1945, '1980-06-23', "London", 55055, 4, 1000, "trev_william@gmail.com"),
	("Zoe", "Johnson", 2050, '1992-06-23', "Paris", 55055, 5, 2000, "zoe777@msn.com"),
	("Kathy", "Franklin", 2051, '2013-06-29', "Chicago", 20000, 5, 0, "kathyfrank@gmail.com"),
	("Trevor", "Jacob", 2398, '1999-06-23', "London", 55055, 4, 0, "trevorJ235@aol.com"),
	("John", "Owens", 7777, '2004-12-04', "London", 130000, 4, 3500, "mailjude@yahoo.com"),
	("Alice", "Bright", 8888, '1973-12-19', "London", 111114, 7, 3500, "ab23@gmail.com");

create table if not exists Currency_table(
	Location varchar(100) primary key,
	currency_code varchar(10)
);

insert into Currency_table values
	("Chicago", "USD"),
	("London", "GBP"),
	("Paris", "EUR");

-- Display the city, EID and the salary of employees
-- (appended with their local currency_code)
select employee.office, employee.EID, CONCAT(Currency_table.currency_code,' ', employee.salary) as Salary 
from employee, Currency_table 
where employee.office = Currency_table.Location;

-- Find the Names and EID of all employees who share a First Name with a second employee
select distinct e1.Fname, e1.Lname ,e1.EID from employee as e1, employee as e2
where e1.Fname = e2.Fname and e1.eid <> e2.eid;

-- select substring(email,"@",1) as email from employee;
select trim(trailing ".com" from substring_index(email, '@', -1)) as mailservice, count(*) as count 
from employee 
group by trim(trailing ".com" from substring_index(email, '@', -1))
having count>1;

-- If 5% of an employee’s salary is deducted for various reasons, write a query to display the
-- amount deducted (display this value with a heading “Deduction”) and the net amount paid to
-- each employee (This will be the sum of Salary after deduction and the bonus. Display this value
-- with a heading “Final_salary”)
select EID,salary, (0.05*salary) as deduction, (salary - 0.05*salary) as Final_salary from employee;

-- Display all the information about employees, but the list is arranged according to the
-- decreasing order of salaries. If two employees have the same salary, then they are arranged
-- alphabetically according to their last name.
select * from employee order by
salary desc, Fname asc;

-- Write a query to display all the departments where more than one employee has received a
-- bonus
select distinct dno 
from employee 
where (select count(*) from employee as subemployee where bonus>0 and employee.dno = subemployee.dno)>1;