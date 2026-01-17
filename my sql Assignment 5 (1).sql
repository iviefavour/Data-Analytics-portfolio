/* (1) In your own words, explain the concept of a CASE STATEMENT and how it works, create a sample tableof your choice to illustrate example.
A CASE statement in MySQL is a conditional expression that allows you to perform if-then-else logic directly in SQL queries.
It evaluates conditions and returns a value when the first condition is met.*/

-- Create a sample table
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    score INT
);
select* from students;
-- Insert data
INSERT INTO students VALUES 
(1, 'mary', 60),
(2, 'martha', 72),
(3, 'jude', 85),
(3, 'peter', 95);

-- Using CASE statement to categorize scores
SELECT 
    name,
    score,
    CASE 
        WHEN score >= 90 THEN 'A'
        WHEN score >= 80 THEN 'B'
        WHEN score >= 70 THEN 'C'
        WHEN score >= 60 THEN 'D'
        ELSE 'F'
    END AS grade
FROM students;

-- (2) What are aggregate functions in MySQL?, Provide at least seven examples of aggregate functions, and support your explaination with practical illustration each using a database and table that you have created.

														
    	-- ANSWER--
/* Aggregate functions are functions use for calculations in MYSQL, they calculates multiple rows of data or sets of values and
return a single value, they are commonly used with GROUP BY clause to summarize data by rows*/ 

-- Create Sales table--
CREATE TABLE Sales (
  Product_ID INT,
  Product_Name VARCHAR(45),
  Quantity INT,
  Price DECIMAL(11, 2)
);
select*from Sales;
INSERT INTO Sales 
VALUES(1, 'Bag of Rice', 100, 150000.00),
	  (2, 'Bag of Beans', 50, 120000.00),
	  (3, 'Carton of Eggs', 30, 7000.00),
      (4, 'Basket of Onions', 20, 25000.00);

SELECT
	Product_Name, 
	SUM(Quantity * Price) AS Total_Sales
FROM Sales
GROUP BY Product_Name;


/* 2. AVG()
The AVG() function calculates the average value of a set of numbers. */
SELECT
AVG(Price) AS Average_Price
FROM Sales;


/* 3. MAX()
The MAX() function returns the maximum value in a set of numbers. */


SELECT
    MAX(Price) AS Maximum_Price
FROM Sales;


/* 4. MIN()
The MIN() function returns the minimum value in a set of numbers.*/
SELECT 
    MIN(Price) AS Minimum_Price
FROM Sales;


/* 5. COUNT()
The COUNT() function returns the number of rows in a table or the number of non-NULL values in a column. */
SELECT 
	Product_Name, 
    COUNT(*) AS Number_Of_Rows
FROM Sales
GROUP BY Product_Name;

/* (6) DISTINCT: 
it is use to remove duplicate values from a dataset, i.e, distinct returns only unique values(rows)-- */
				
select distinct
   Product_ID
from Sales;


/* (7) STANDARD DEVIATION (STD): It is a function used to calculate the variation or dispertion between values in a dataset, it is the square root of the 
average of squared deviations of the items from their mean*/

SELECT 
STD(Price) AS Price_std_dev 
FROM Sales


/*(3) -- Write short note on the following functions/statements Left join, Right Join, Multiple join, distict, groupby, having, orderby, Union, Primarykey, Secondarykey.
	Provide one sythax representation for each and one example each using your own created database and table.*/

/*LEFT JOIN
Returns all records from the left table and matched records from the right table.*/

SELECT employeesdetails.First_Name, deptdetails.deptName
FROM employeesdetails
LEFT JOIN deptdetails ON employeesdetails.DeptID = deptdetails.DeptID;

/*RIGHT JOIN
Returns all records from the right table and matched records from the left table.*/
SELECT employeesdetails.First_Name, deptdetails.DeptName
FROM employeesdetails
RIGHT JOIN deptdetails ON employeesdetails.DeptID = deptdetails.DeptID;

/*MULTIPLE JOIN
Joining multiple tables in a single query.*/
SELECT film.title, actor.first_name, actor.last_name
FROM film
JOIN film_actor ON film.film_id = film_actor.film_id
JOIN actor ON film_actor.actor_id = actor.actor_id;

/*DISTINCT
Returns unique values in a specified column */
SELECT DISTINCT rating FROM film;

/*GROUP BY
Groups rows that have the same values in specified columns.*/
SELECT rating, COUNT(*) AS total_films
FROM film
GROUP BY rating;

/*HAVING
Filters groups after GROUP BY is applied.*/
SELECT film_category.category_id, COUNT(*) AS film_count
FROM film_category
GROUP BY film_category.category_id
HAVING COUNT(*) > 60;

/*ORDER BY
Sorts the result set in ascending or descending order.*/
SELECT * FROM product 
ORDER BY product_price DESC;

/*UNION
Combines the result sets of two or more SELECT statements.*/
SELECT first_name, last_name FROM staff
UNION
SELECT first_name, last_name FROM customer;

/*PRIMARY KEY
A column or set of columns that uniquely identifies each row in a table.*/
SHOW KEYS FROM rental WHERE Key_name = 'PRIMARY';

/*SECONDARY KEY (Foreign Key)
A field in one table that uniquely identifies a row in another table.*/
SHOW CREATE TABLE payment;


/*4. What is Normalization in your own words? Create your own Database/table to explain your example
Normalization is the process of organizing data in a database to reduce redundancy and improve data integrity */
-- Examples--

create table Clinic(
nurses_id int primary key,
first_name varchar(30),
last_name varchar(30),
clinic_ward varchar(10)
);

select* from Clinic;

insert into Clinic
values(1,'Brendan','Clarke','male'),
      (2,'Suzanna','Clee','male'),
	  (3,'Alexandra','Close','female'),
      (4,'Brenda','Cocker','male'),
      (5,'Mario','Colledg','female'),
      (6,'Sonya','Adeyemi','female'),
      (7,'Suzfda','Chjee','male'),
	  (8,'Alexassaa','Udara','female'),
      (9,'Blick','Noboby','male'),
	  (10,'Ajax','Meee','female');
      
      
      
      create table Wards(
      ward_id int primary key,
      clinic_ward varchar(10)
      );
      
      insert into Wards
      values (1,'male'),
             (2,'female');
             
      drop table Clinic;

create table Clinic(
nurses_id int primary key,
first_name varchar(30),
last_name varchar(30),
ward_id int ,
FOREIGN KEY (ward_id) REFERENCES Wards(ward_id)
);

select* from Clinic;

insert into Clinic
values(1,'Brendan','Clarke',1),
      (2,'Suzanna','Clee',1),
	  (3,'Alexandra','Close',2),
      (4,'Brenda','Cocker',1),
      (5,'Mario','Colledg',2),
      (6,'Sonya','Adeyemi',2),
      (7,'Suzfda','Chjee',1),
	  (8,'Alexassaa','Udara',2),
      (9,'Blick','Noboby',1),
	  (10,'Ajax','Meee',2);
      


/*(5)a) create table named product and provide the paramentals 
	b)  Insert into the product_table values:
 
      (101,"mango",200.50,150.11),
      (102,"banana",300.16,250.12),
      (103,"paw paw",350.20,300.16),
      (104,"avacado",378.12,350.07),
      (105,"orange",400.16,380.28),
      (106,"cashew",100.18,50.02),
      (107,"carrot",600.12,550.20),
      (108,"pinnapple",700.14,600.17),
      (109,"apple",900.13,780.18),
      (110,"guava",150.11,100.19);
      */
CREATE TABLE product (
product_id INT PRIMARY KEY,
product_name VARCHAR(50),
product_price Decimal(10,2),
cost_price Decimal(10,2)
);
select* from product;
-- b) Insert into the product_table values
Insert into product values 
      (101,"mango",200.50,150.11),
      (102,"banana",300.16,250.12),
      (103,"paw paw",350.20,300.16),
      (104,"avacado",378.12,350.07),
      (105,"orange",400.16,380.28),
      (106,"cashew",100.18,50.02),
      (107,"carrot",600.12,550.20),
      (108,"pinnapple",700.14,600.17),
      (109,"apple",900.13,780.18),
      (110,"guava",150.11,100.19);
      
/*c)  place discount column before product_price*/

Alter table products 
Add column discount Decimal(10,2) null after product_name;
select * from product;

/*(6) Using marvenmovies as the Database, Pull out the records of Customer_Id,
Count of rental_Id ( As Total Rental) with more than 25 rental. Sort from smallest to highest.*/
SELECT 
    customer_id,
    COUNT(rental_id) AS Total_Rental
FROM 
    rental
GROUP BY 
    customer_id
HAVING 
    COUNT(rental_id) > 25
ORDER BY 
    Total_Rental ASC;
