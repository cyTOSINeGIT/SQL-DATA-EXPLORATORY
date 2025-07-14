show databases;
create database Schooldata; 
use schooldata;

create database faithplant;

create table employees (
id INT PRIMARY KEY,
FIRST_NAME VARCHAR(50),
LAST_NAME VARCHAR(50),
DEPARTMENT VARCHAR(50)
);

INSERT INTO employees (id, first_name, last_name, department)
Values (1, 'john', 'Doe', 'HR');

select*;


CREATE DATABASE SCHOOL;

USE SCHOOL;

SHOW TABLES;

CREATE TABLE SCHOOL_DATA (
					ST_ID INT,
                    ST_NAME VARCHAR (30),
                    ST_CLASS INT,
                    ST_SECTION CHAR(1),
                    ST_MARKS INT
                    );
Insert into school_data values (101, 'petter', 10, 'a', 90, '1990-10-10');

alter table school_data add date_of_birth date;

select * from school_data;

Insert into school_data values (102, 'alex', 10, 'a', 92, '1991-10-10'),
 (103, 'paul', 10, 'b', 68, '1993-11-20'),
 (104, 'patrick', 10, 'a', 100, '1995-03-09');

create database customer;

create table customer( cust_id int,  
cust_name  varchar(30),  
cust_number varchar(20),  
cust_location varchar(30) );

insert into customer values (100, 'johny', '2589235689', 'uk');
 insert into customer values (101, 'star', '25569235689', 'usa'), 
 (103, 'harry', '1001001001', 'africa'),   
 (104, 'ola', '25569235689', 'europe'),   
 (102, 'rosy', '25520235689', 'russia');

select * from customer;



