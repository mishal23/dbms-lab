create database virtualclinic;

use virtualclinic;

create table speciality(
	name varchar(50),
	description varchar(100)	
)

create table symptom(
	name varchar(50),
	description varchar(100)	
)

create table location(
	city varchar(50),
	zip varchar(50),
	state varchar(50),
	country varchar(50) default "India",
	address varchar(50)
)

create table