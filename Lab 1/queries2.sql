-- ###
-- Create a table flights with following information: flight(flno,fromplace,toplace,distance,departs,arrives)
-- ###
create table flights (
	flno varchar(10),
	fromplace varchar(50),
	toplace varchar(50),
	distance decimal(10),
	departs time,
	arrives time
);
-- Query OK, 0 rows affected (0.05 sec)

-- mysql> desc flights;
-- +-----------+---------------+------+-----+---------+-------+
-- | Field     | Type          | Null | Key | Default | Extra |
-- +-----------+---------------+------+-----+---------+-------+
-- | flno      | varchar(10)   | YES  |     | NULL    |       |
-- | fromplace | varchar(50)   | YES  |     | NULL    |       |
-- | toplace   | varchar(50)   | YES  |     | NULL    |       |
-- | distance  | decimal(10,0) | YES  |     | NULL    |       |
-- | departs   | time          | YES  |     | NULL    |       |
-- | arrives   | time          | YES  |     | NULL    |       |
-- +-----------+---------------+------+-----+---------+-------+
-- 6 rows in set (0.00 sec)

-- ###
-- Inserting data into the flight with five entries.
-- ###
mysql> insert into flights values ("F120", "BDQ", "ILX", 2000, "11:30:00", "12:45:00");
-- Query OK, 1 row affected (0.00 sec)
mysql> insert into flights values ("F120", "CIA", "BDQ", 2000, "1:30:00", "2:45:00");
-- Query OK, 1 row affected (0.00 sec)
mysql> insert into flights values ("F120", "DL", "BDQ", 2000, "2:30:00", "4:30:00");
-- Query OK, 1 row affected (0.00 sec)
mysql> insert into flights values ("F120", "BDQ", "COM", 2000, "5:30:00", "8:30:00");
-- Query OK, 1 row affected (0.00 sec)
mysql> insert into flights values ("F120", "ILX", "COM", 2000, "6:30:00", "9:30:00");
-- Query OK, 1 row affected (0.00 sec)

-- ###
-- Altering table by adding new column price.
-- ###
mysql> alter table flights add price int;
-- Query OK, 5 rows affected (0.04 sec)
-- Records: 5  Duplicates: 0  Warnings: 0

-- mysql> select * from flights;
-- +------+-----------+---------+----------+----------+----------+-------+
-- | flno | fromplace | toplace | distance | departs  | arrives  | price |
-- +------+-----------+---------+----------+----------+----------+-------+
-- | F120 | BDQ       | ILX     |     2000 | 11:30:00 | 12:45:00 |  NULL |
-- | F120 | CIA       | BDQ     |     2000 | 01:30:00 | 02:45:00 |  NULL |
-- | F120 | DL        | BDQ     |     2000 | 02:30:00 | 04:30:00 |  NULL |
-- | F120 | BDQ       | COM     |     2000 | 05:30:00 | 08:30:00 |  NULL |
-- | F120 | ILX       | COM     |     2000 | 06:30:00 | 09:30:00 |  NULL |
-- +------+-----------+---------+----------+----------+----------+-------+
-- 5 rows in set (0.00 sec)

-- ###
-- Deleting a row from the table
-- ###
mysql> delete from flights where fromplace="ILX";
-- Query OK, 1 row affected (0.00 sec)

-- mysql> select * from flights;
-- +------+-----------+---------+----------+----------+----------+-------+
-- | flno | fromplace | toplace | distance | departs  | arrives  | price |
-- +------+-----------+---------+----------+----------+----------+-------+
-- | F120 | BDQ       | ILX     |     2000 | 11:30:00 | 12:45:00 |  NULL |
-- | F120 | CIA       | BDQ     |     2000 | 01:30:00 | 02:45:00 |  NULL |
-- | F120 | DL        | BDQ     |     2000 | 02:30:00 | 04:30:00 |  NULL |
-- | F120 | BDQ       | COM     |     2000 | 05:30:00 | 08:30:00 |  NULL |
-- +------+-----------+---------+----------+----------+----------+-------+
-- 4 rows in set (0.00 sec)

-- ###
-- Drop column distance
-- ###
mysql> alter table flights drop distance;
-- Query OK, 4 rows affected (0.05 sec)
-- Records: 4  Duplicates: 0  Warnings: 0

-- mysql> select * from flights;
-- +------+-----------+---------+----------+----------+-------+
-- | flno | fromplace | toplace | departs  | arrives  | price |
-- +------+-----------+---------+----------+----------+-------+
-- | F120 | BDQ       | ILX     | 11:30:00 | 12:45:00 |  NULL |
-- | F120 | CIA       | BDQ     | 01:30:00 | 02:45:00 |  NULL |
-- | F120 | DL        | BDQ     | 02:30:00 | 04:30:00 |  NULL |
-- | F120 | BDQ       | COM     | 05:30:00 | 08:30:00 |  NULL |
-- +------+-----------+---------+----------+----------+-------+
-- 4 rows in set (0.01 sec)

-- ###
-- Enter any one row with price value accepting Null value and then update it to particular price.
-- ###
mysql> update flights set price=10000 where fromplace="DL";
-- Query OK, 1 row affected (0.00 sec)
-- Rows matched: 1  Changed: 1  Warnings: 0

-- mysql> select * from flights;
-- +------+-----------+---------+----------+----------+-------+
-- | flno | fromplace | toplace | departs  | arrives  | price |
-- +------+-----------+---------+----------+----------+-------+
-- | F120 | BDQ       | ILX     | 11:30:00 | 12:45:00 |  NULL |
-- | F120 | CIA       | BDQ     | 01:30:00 | 02:45:00 |  NULL |
-- | F120 | DL        | BDQ     | 02:30:00 | 04:30:00 | 10000 |
-- | F120 | BDQ       | COM     | 05:30:00 | 08:30:00 |  NULL |
-- +------+-----------+---------+----------+----------+-------+
-- 4 rows in set (0.00 sec)

-- ###
-- Delete all the data from the table.
-- ###
mysql> delete from flights;
-- Query OK, 4 rows affected (0.00 sec)
-- mysql> select * from flights;
-- Empty set (0.00 sec)

-- ###
-- Rename a column price to journey_price.
-- ###
mysql> alter table flights change column price journey_price INT(7);
-- Query OK, 0 rows affected (0.05 sec)
-- Records: 0  Duplicates: 0  Warnings: 0

-- mysql> desc flights;
-- +---------------+-------------+------+-----+---------+-------+
-- | Field         | Type        | Null | Key | Default | Extra |
-- +---------------+-------------+------+-----+---------+-------+
-- | flno          | varchar(10) | YES  |     | NULL    |       |
-- | fromplace     | varchar(50) | YES  |     | NULL    |       |
-- | toplace       | varchar(50) | YES  |     | NULL    |       |
-- | departs       | time        | YES  |     | NULL    |       |
-- | arrives       | time        | YES  |     | NULL    |       |
-- | journey_price | int(7)      | YES  |     | NULL    |       |
-- +---------------+-------------+------+-----+---------+-------+
-- 6 rows in set (0.00 sec)
