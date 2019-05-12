-- 1. For the following relation schema:
-- employee(employee-name, street, city) 
-- works(employee-name, company-name, salary)
-- company(company-name, city)
-- manages(employee-name, manager-name)
-- Give an expression in SQL for each of the following queries:

-- ##########################################################################################

mysql> CREATE TABLE Employee (
    -> Ename VARCHAR(100) PRIMARY KEY,
    -> Street VARCHAR(100),
    -> City VARCHAR(100)
    -> );
-- Query OK, 0 rows affected (0.32 sec)

mysql> CREATE TABLE Company (
    -> Cname VARCHAR(100) PRIMARY KEY,
    -> City VARCHAR(100)
    -> );
-- Query OK, 0 rows affected (0.33 sec)

mysql> CREATE TABLE Works (
    -> Ename VARCHAR(100) REFERENCES Employee(Ename) ON DELETE CASCADE,
    -> Cname VARCHAR(100) REFERENCES Company(Cname) ON DELETE CASCADE,
    -> Salary INT(12)
    -> );
-- Query OK, 0 rows affected (0.32 sec)

mysql> CREATE TABLE Manages (
    -> EmpName VARCHAR(100) REFERENCES Employee(Ename) ON DELETE CASCADE,
    -> MgrName VARCHAR(100) REFERENCES Employee(Ename) ON DELETE CASCADE
    -> );
-- Query OK, 0 rows affected (0.65 sec)

-- ##########################################################################################


mysql> INSERT INTO Employee VALUES
    -> ("Mishal", "ABC", "Vadodara"),
    -> ("AJ", "XYZ", "Bangalore"),
    -> ("Praveen", "PQR", "Chandigarh"),
    -> ("Mahir", "AB", "Bangalore");
-- Query OK, 4 rows affected (0.13 sec)
-- Records: 4  Duplicates: 0  Warnings: 0


mysql> INSERT INTO Company VALUES
    -> ("State Bank Of India", "Bangalore"),
    -> ("ICICI", "Bangalore");
-- Query OK, 2 rows affected (0.13 sec)
-- Records: 2  Duplicates: 0  Warnings: 0

mysql> INSERT INTO Works VALUES
    -> ("Mishal", "ICICI", 645132),
    -> ("AJ", "State Bank Of India", 352146),
    -> ("Praveen", "State Bank Of India", 512463),
    -> ("Mahir", "State Bank Of India", 865741);
-- Query OK, 3 rows affected (0.04 sec)
-- Records: 3  Duplicates: 0  Warnings: 0

mysql> INSERT INTO Manages VALUES
    -> ("AJ", "Praveen"),
    -> ("Praveen", "Mishal"),
    -> ("AJ", "Mahir");
-- Query OK, 2 rows affected (0.11 sec)
-- Records: 2  Duplicates: 0  Warnings: 0

-- ##########################################################################################

-- a) Find the names, street address, and cities of residence for all employees who work for
-- 'State Bank Of India' and earn more than $10,000.

mysql> SELECT Employee.Ename, Street, City FROM Employee, Works 
    -> WHERE (Employee.Ename=Works.Ename AND Cname="State Bank Of India" AND Salary>10000);
-- +---------+--------+------------+
-- | Ename   | Street | City       |
-- +---------+--------+------------+
-- | AJ      | XYZ    | Bangalore  |
-- | Praveen | PQR    | Chandigarh |
-- +---------+--------+------------+
-- 2 rows in set (0.00 sec)


-- ##########################################################################################

-- b) Find the names of all employees in the database who live in the same cities as the
-- companies for which they work.

mysql> SELECT Employee.Ename FROM Employee, Company, Works
    -> WHERE Employee.Ename=Works.Ename AND Company.Cname=Works.Cname 
    -> AND Employee.City=Company.City;
-- +-------+
-- | Ename |
-- +-------+
-- | AJ    |
-- +-------+
-- 1 row in set (0.00 sec)


-- ##########################################################################################

-- c) Find the names of all employees in the database who live in the same cities and on the
-- same streets as do their managers.

-- Only done for cities.
mysql> SELECT EmpEmp.Ename FROM Employee AS EmpEmp, Manages, Employee AS MgrEmp
    -> WHERE EmpEmp.Ename=Manages.EmpName AND EmpEmp.City=MgrEmp.City 
    -> AND Manages.EmpName=EmpEmp.Ename AND Manages.MgrName=MgrEmp.Ename;
-- +-------+
-- | Ename |
-- +-------+
-- | AJ    |
-- +-------+
-- 1 row in set (0.00 sec)


-- ##########################################################################################

-- d) Find the names of all employees in the database who do not work for 'State Bank Of India'.
-- Assume that all people work for exactly one company.

mysql> SELECT Employee.Ename FROM Employee, Works
    -> WHERE Employee.Ename=Works.Ename AND (NOT (Cname="State Bank Of India"));
-- +--------+
-- | Ename  |
-- +--------+
-- | Mishal |
-- +--------+
-- 1 row in set (0.00 sec)


-- ##########################################################################################

-- e) Find the names of all employees in the database who earn more than every employee of 'ICICI'.
-- Assume that all people work for at most one company.

mysql> SELECT Employee.Ename FROM Employee, Works
    -> WHERE Employee.Ename=Works.Ename AND Salary>(SELECT MAX(Salary) FROM Works WHERE Cname="ICICI");
-- +-------+
-- | Ename |
-- +-------+
-- | Mahir |
-- +-------+
-- 1 row in set (0.00 sec)


-- ##########################################################################################

-- f) Assume that the companies may be located in several cities. Find all companies
-- located in every city in which 'ICICI' is located.

mysql> SELECT Cname FROM Company
    -> WHERE (NOT(Cname="ICICI")) AND ((SELECT City FROM Company WHERE Cname="ICICI") IN 
    -> (SELECT City FROM Company GROUP BY Cname));
-- +---------------------+
-- | Cname               |
-- +---------------------+
-- | State Bank Of India |
-- +---------------------+
-- 1 row in set (0.01 sec)


-- ##########################################################################################

-- g) Find the names of all employees who earn more than the average salary of all
-- employees of their company. Assume that all people work for at most one company.

mysql> SELECT Employee.Ename FROM Employee, Works
    -> WHERE Employee.Ename=Works.Ename
    -> AND Salary > (SELECT AVG(Salary) FROM Works AS SubWorks 
    -> WHERE SubWorks.Cname=Works.Cname);
-- +-------+
-- | Ename |
-- +-------+
-- | Mahir |
-- +-------+
-- 1 row in set (0.00 sec)


-- ##########################################################################################

-- h) Find the name of the company that has the smallest payroll.

mysql> SELECT Cname FROM Works 
    -> WHERE (SELECT SUM(Salary) FROM Works AS SubWorks WHERE SubWorks.Cname=Works.Cname) 
    -> IN (SELECT MIN(PayRoll) FROM (SELECT SUM(Salary) as PayRoll FROM Works GROUP BY Cname) 
    -> AS PayRollPerCompany);
-- +-------+
-- | Cname |
-- +-------+
-- | ICICI |
-- +-------+
-- 1 row in set (0.00 sec)

