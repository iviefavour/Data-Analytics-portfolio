
 -- ASSIGNMENT ---
  
  -- EXPLAIN THE CONCEPT OF PRIMARY KEY AND SHOW EXAMPLE IN CODING TABLE --
  
-- primary key is used to  define table serial number. it is help to prevent duplication or data or data redundancy -- EXAMPLE BELOW


Create table food (
 product_id INT PRIMARY KEY,
 product_name varchar(50),
 Quantity INT,
 price decimal (5,2)
 );

Insert into food
 values(001,"Rice",500,480.20),
	   (002,"Plantain",450,420.20),
       (003,"Beans",700,368.10);
       
select* from food;       
       
-- pull out actors name, where first_names are penelope
       
use mavenmovies;
select first_name from actor
where actor_id = 1;

select* from actor; 

-- pull out first_name and last_name from actors table --

select first_name, last_name from actor
where actor_id = 1;

-- How many actors do we have in mavenmovies --

select count(*)
from actor;

-- pull out customers records, where first_names are john --


SELECT* FROM actor
WHERE first_name = 'JOHN';

-- how many actors got tony Award --

SELECT *
FROM actor_award
WHERE awards IN ('Tony');

select* from actor_award;



-- extract the records of actors with awards (tony, Emmy, oscar) --

SELECT *
FROM actor_award
WHERE awards IN ("Tony", "Emmy", "Oscar");


