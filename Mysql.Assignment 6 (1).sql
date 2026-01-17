/* 1) Explain the difference between schema and database
                 -- Answer --
Schema refers to a logical name space that groups related database objects together.These objects can include;
. Tables
. views
. indexes etc
WHILE
Database is a collection of all data that is stored and accessed electronically. It is a container that holds everything
you need to store,manage and retrive data, such as;
. Tables (to store data in rows and columns)
. views
. indexes
. stored procedures
. fuctions



  1ii) what is DDL and DML show all the examples
				-- Answer --
Data Definition Language (DDL) is the command used to define,modify or remove database structures such as tables,schemas e.t.c.
Examples of DDL
a) Create - To create database or table
b) Alter - To modify information on the table
c) Drop - To delete table and database
d) Truncate - To delete entire row without the column being deleted
e) Rename - Use to rename tables,database and column names.

Data Manipulation Language (DML) is used for manipulating data stored in a database.
Examples of DML
a) Select - To view data
b) Insert - To insert data into table
c) Delete - To exit a row in a table
d) Update - To update information in a table


*/



/*2)Name all the steps of creating tables and databases with example
            -- Answer --
Step1 - Create database by using the keyword 'CREATE DATABASE'
Step2 - Set your database as Default Schema OR apply the keyword 'USE' database_name
Step3 - Create table by using the keyword 'CREATE TABLE'
*/

create database Beauty_product;
Use  Beauty_product;

create table Beauty_Products(
product_id int,
product_name varchar(40),
Quantity int,
Amount decimal(9,2)
); 



/* 3) How do you insert multiple rows into a  table in a single query */
                -- Answer --
INSERT INTO Beauty_Products
VALUES(1,'cosrx snail mucin essence',5,230000.00),
      (2,'cerave cleanser',4,120000.00),
      (3,'Ac well toner',10,55000.00),
      (4,'skin aqua',40,40000.00),
      (5,'Chance chanel',7,2500000.00);





/* 4) How do you use groupby clause with aggregate functions like sum or count */
                -- Answer --
-- For SUM --
SELECT
	product_name, 
	SUM(Quantity * Amount) AS Total_Sales
FROM Products
group by product_name;

-- For COUNT --
select 
	product_name, 
    COUNT(Quantity) AS Available_products
from Products
group by product_name;


/*5)Explain the concept of normalization in database with example */
                    -- Answer --
/*What is Normalization: is the process of organizing data to minimize data redundancy (data duplication),
 which in turn ensures data consistency
*/
-- Examples--

create table student(
student_id int primary key,
first_name varchar(30),
last_name varchar(30),
class_name varchar(15)
);

select* from student;

insert into student
values(1,'Brendan','Clarke','Jss1'),
      (2,'Suzanna','Clee','Jss1'),
	  (3,'Alexandra','Close','Jss2'),
      (4,'Brenda','Cocker','Jss2'),
      (5,'Mario','Colledg','Jss2');
      
      drop table student;
      
      create table Class(
      class_id int primary key,
      class_name varchar(15)
      );
      
      select* from Class;
      insert into Class
      values (1,'Jss1'),
             (2,'Jss2');


create table student(
student_id int primary key,
first_name varchar(30),
last_name varchar(30),
class_id int ,
FOREIGN KEY (class_id) REFERENCES Class(class_id)
);




select* from student;

insert into student
values(1,'Brendan','Clarke',1),
      (2,'Suzanna','Clee',1),
	  (3,'Alexandra','Close',2),
      (4,'Brenda','Cocker',2),
      (5,'Mario','Colledg',2);

select* from student;

/* 6)what is the difference between inner join, left join, right join, full join and outer join
                             -- Answer --
The INNER JOIN selects records that have matching values in both tables.
WHILE
The LEFT JOIN keyword returns all records from the left table (table1),
 and the matching records from the right table (table2). 
The result is 0 records from the right side, if there is no match.
WHILE
The RIGHT JOIN keyword returns all records from the right table (table2),
 and the matching records from the left table (table1).
 The result is 0 records from the left side, if there is no match.
 WHILE
 The FULL JOIN returns all records when there is a match in left (table1)
 or right (table2) table records.
 WHILE
 An outer join returns not only the rows where there is a match between two tables,
 but also the rows where there is no match — filling the missing side with NULL.