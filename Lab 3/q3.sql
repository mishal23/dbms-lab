create database if not exists lab3;

use lab3;

CREATE TABLE Employee (
    Ename VARCHAR(100) PRIMARY KEY,
    Street VARCHAR(100),
    City VARCHAR(100)
);

CREATE TABLE Company (
    Cname VARCHAR(100) PRIMARY KEY,
    City VARCHAR(100)
);

CREATE TABLE Works (
    Ename VARCHAR(100) REFERENCES Employee(Ename) ON DELETE CASCADE,
    Cname VARCHAR(100) REFERENCES Company(Cname) ON DELETE CASCADE,
    Salary INT(12)
);

CREATE TABLE Manages (
    EmpName VARCHAR(100) REFERENCES Employee(Ename) ON DELETE CASCADE,
    MgrName VARCHAR(100) REFERENCES Employee(Ename) ON DELETE CASCADE
);

INSERT INTO Employee VALUES
    ("Mishal", "ABC", "Vadodara"),
    ("AJ", "XYZ", "Bangalore"),
    ("Praveen", "PQR", "Chandigarh"),
    ("Mahir", "AB", "Bangalore");

INSERT INTO Company VALUES
    ("State Bank Of India", "Bangalore"),
    ("ICICI", "Bangalore");

INSERT INTO Works VALUES
    ("Mishal", "ICICI", 645132),
    ("AJ", "State Bank Of India", 352146),
    ("Praveen", "State Bank Of India", 512463),
    ("Mahir", "State Bank Of India", 865741);

INSERT INTO Manages VALUES
    ("AJ", "Praveen"),
	("Praveen", "Mishal"),
    ("AJ", "Mahir");

SELECT Employee.Ename, Street, City FROM Employee, Works 
    WHERE (Employee.Ename=Works.Ename AND Cname="State Bank Of India" AND Salary>10000);

SELECT Employee.Ename FROM Employee, Company, Works
    WHERE Employee.Ename=Works.Ename AND Company.Cname=Works.Cname 
    AND Employee.City=Company.City;

SELECT EmpEmp.Ename FROM Employee AS EmpEmp, Manages, Employee AS MgrEmp
    WHERE EmpEmp.Ename=Manages.EmpName AND EmpEmp.City=MgrEmp.City 
    AND Manages.EmpName=EmpEmp.Ename AND Manages.MgrName=MgrEmp.Ename;

SELECT Employee.Ename FROM Employee, Works
    WHERE Employee.Ename=Works.Ename AND (NOT (Cname="State Bank Of India"));

SELECT Employee.Ename FROM Employee, Works
    WHERE Employee.Ename=Works.Ename AND Salary>(SELECT MAX(Salary) FROM Works WHERE Cname="ICICI");

SELECT Cname FROM Company
    WHERE (NOT(Cname="ICICI")) AND ((SELECT City FROM Company WHERE Cname="ICICI") IN 
    (SELECT City FROM Company GROUP BY Cname));

SELECT Employee.Ename FROM Employee, Works
    WHERE Employee.Ename=Works.Ename
    AND Salary > (SELECT AVG(Salary) FROM Works AS SubWorks 
    WHERE SubWorks.Cname=Works.Cname);

SELECT Cname FROM Works 
    WHERE (SELECT SUM(Salary) FROM Works AS SubWorks WHERE SubWorks.Cname=Works.Cname) 
    IN (SELECT MIN(PayRoll) FROM (SELECT SUM(Salary) as PayRoll FROM Works GROUP BY Cname) 
    AS PayRollPerCompany);