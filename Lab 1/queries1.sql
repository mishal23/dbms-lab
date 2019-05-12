-- ###
-- Create a table sub with following information: columns and data types: name varchar(8),age number(5),mark1 number(4),mark2 number(4),mark3number(4);
-- ###
mysql> create table sub (
    -> name varchar(8),
    -> age int(5),
    -> mark1 int(4),
    -> mark2 int(4),
    -> mark3 int(4)
    -> );
-- Query OK, 0 rows affected (0.06 sec)

mysql> show tables;
--
-- +-------------------+
-- | Tables_in_16co125 |
-- +-------------------+
-- | sub               |
-- +-------------------+
-- 1 row in set (0.00 sec)

-- ###
-- Enter atleast five tuples for the given relation.
-- ###
mysql> insert into sub (name, age, mark1, mark2, mark3) values ("mishal", 18, 80, 67, 81);
-- Query OK, 1 row affected (0.00 sec)
mysql> insert into sub (name, age, mark1, mark2, mark3) values ("ashwin", 20, 58, 50, 20);
-- Query OK, 1 row affected (0.00 sec)
mysql> insert into sub (name, age, mark1, mark2, mark3) values ("praveen", 25, 55, 60, 30);
-- Query OK, 1 row affected (0.00 sec)
mysql> insert into sub (name, age, mark1, mark2, mark3) values ("shashank", 15, 89, 80, 12);
-- Query OK, 1 row affected (0.00 sec)
mysql> insert into sub (name, age, mark1, mark2, mark3) values ("bobby", 19, 89, 80, 12);
-- Query OK, 1 row affected (0.00 sec)

-- ###
-- Add one more column with field name as total with data type as number(5).
-- ###
mysql> alter table sub add total int(5);
-- Query OK, 5 rows affected (0.04 sec)
-- Records: 5  Duplicates: 0  Warnings: 0
--
-- mysql> select * from sub;
-- +----------+------+-------+-------+-------+-------+
-- | name     | age  | mark1 | mark2 | mark3 | total |
-- +----------+------+-------+-------+-------+-------+
-- | mishal   |   18 |    80 |    67 |    81 |  NULL |
-- | ashwin   |   20 |    58 |    50 |    20 |  NULL |
-- | praveen  |   25 |    55 |    60 |    30 |  NULL |
-- | shashank |   15 |    89 |    80 |    12 |  NULL |
-- | bobby    |   19 |    89 |    80 |    12 |  NULL |
-- +----------+------+-------+-------+-------+-------+
-- 5 rows in set (0.00 sec)

-- ###
-- Update the age of sub for particular student.
-- ###
mysql> update sub set age=19 where name="shashank";
-- Query OK, 1 row affected (0.00 sec)
-- Rows matched: 1  Changed: 1  Warnings: 0

-- select * from sub;
-- +----------+------+-------+-------+-------+-------+
-- | name     | age  | mark1 | mark2 | mark3 | total |
-- +----------+------+-------+-------+-------+-------+
-- | mishal   |   18 |    80 |    67 |    81 |  NULL |
-- | ashwin   |   20 |    58 |    50 |    20 |  NULL |
-- | praveen  |   25 |    55 |    60 |    30 |  NULL |
-- | shashank |   19 |    89 |    80 |    12 |  NULL |
-- | bobby    |   19 |    89 |    80 |    12 |  NULL |
-- +----------+------+-------+-------+-------+-------+
-- 5 rows in set (0.00 sec)

-- ###
-- Deleting a row from the table.
-- ###
mysql> delete from sub where name="bobby";
-- Query OK, 1 row affected (0.00 sec)

-- mysql> select * from sub;
-- +----------+------+-------+-------+-------+-------+
-- | name     | age  | mark1 | mark2 | mark3 | total |
-- +----------+------+-------+-------+-------+-------+
-- | mishal   |   18 |    80 |    67 |    81 |  NULL |
-- | ashwin   |   20 |    58 |    50 |    20 |  NULL |
-- | praveen  |   25 |    55 |    60 |    30 |  NULL |
-- | shashank |   19 |    89 |    80 |    12 |  NULL |
-- +----------+------+-------+-------+-------+-------+
-- 4 rows in set (0.00 sec)

-- ###
-- Drop column mark3.
-- ###
mysql> alter table sub drop mark3;
-- Query OK, 4 rows affected (0.03 sec)
-- Records: 4  Duplicates: 0  Warnings: 0

-- mysql> select * from sub;
-- +----------+------+-------+-------+-------+
-- | name     | age  | mark1 | mark2 | total |
-- +----------+------+-------+-------+-------+
-- | mishal   |   18 |    80 |    67 |  NULL |
-- | ashwin   |   20 |    58 |    50 |  NULL |
-- | praveen  |   25 |    55 |    60 |  NULL |
-- | shashank |   19 |    89 |    80 |  NULL |
-- +----------+------+-------+-------+-------+
-- 4 rows in set (0.00 sec)

-- ###
-- Modify the table by changing the data type of ,mark3 to number(6)
-- ###
mysql> alter table sub add mark3 int(6);
-- Query OK, 4 rows affected (0.04 sec)
-- Records: 4  Duplicates: 0  Warnings: 0

-- mysql> select * from sub;
-- +----------+------+-------+-------+-------+-------+
-- | name     | age  | mark1 | mark2 | total | mark3 |
-- +----------+------+-------+-------+-------+-------+
-- | mishal   |   18 |    80 |    67 |  NULL |  NULL |
-- | ashwin   |   20 |    58 |    50 |  NULL |  NULL |
-- | praveen  |   25 |    55 |    60 |  NULL |  NULL |
-- | shashank |   19 |    89 |    80 |  NULL |  NULL |
-- +----------+------+-------+-------+-------+-------+
-- 4 rows in set (0.00 sec)

-- ###
-- Modify the table by changing the data type of mark3 to number(6)
-- ###
mysql> alter table sub modify mark3 int(6);
-- Query OK, 0 rows affected (0.04 sec)
-- Records: 0  Duplicates: 0  Warnings: 0

-- select * from sub;
-- +----------+------+-------+-------+-------+-------+
-- | name     | age  | mark1 | mark2 | total | mark3 |
-- +----------+------+-------+-------+-------+-------+
-- | mishal   |   18 |    80 |    67 |  NULL |  NULL |
-- | ashwin   |   20 |    58 |    50 |  NULL |  NULL |
-- | praveen  |   25 |    55 |    60 |  NULL |  NULL |
-- | shashank |   19 |    89 |    80 |  NULL |  NULL |
-- +----------+------+-------+-------+-------+-------+
-- 4 rows in set (0.00 sec)

mysql> alter table sub modify mark3 int(5);
-- Query OK, 0 rows affected (0.03 sec)
-- Records: 0  Duplicates: 0  Warnings: 0

-- mysql> select * from sub;
-- +----------+------+-------+-------+-------+-------+
-- | name     | age  | mark1 | mark2 | total | mark3 |
-- +----------+------+-------+-------+-------+-------+
-- | mishal   |   18 |    80 |    67 |  NULL |  NULL |
-- | ashwin   |   20 |    58 |    50 |  NULL |  NULL |
-- | praveen  |   25 |    55 |    60 |  NULL |  NULL |
-- | shashank |   19 |    89 |    80 |  NULL |  NULL |
-- +----------+------+-------+-------+-------+-------+
-- 4 rows in set (0.00 sec)

mysql> alter table sub modify mark3 int(6);
-- Query OK, 0 rows affected (0.02 sec)
-- Records: 0  Duplicates: 0  Warnings: 0

-- ###
-- Delete all the data from sub table.
-- ###
mysql> delete from sub;
-- Query OK, 4 rows affected (0.00 sec)

mysql> select * from sub;
-- Empty set (0.00 sec)

-- ###
-- Delete the table.
-- ###
mysql> drop table sub;
-- Query OK, 0 rows affected (0.00 sec)

mysql> select * from sub;
-- ERROR 1146 (42S02): Table '16co125.sub' doesn't exist
mysql> show tables;
-- Empty set (0.00 sec)
