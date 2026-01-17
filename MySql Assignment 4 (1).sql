 /* MYSQL Assignment 4

(1) Explain the difference between INNER JOIN, LEFT JOIN, RIGHT JOIN, and FULL JOIN.

-- Answer --
       The INNER JOIN  selects records that have matching values in both tables,
       and exclude the unmatched records.
       
WHILE

	   The LEFT JOIN  returns all records from the left table (table1), 
and the matching records from the right table (table2).

WHILE

       The RIGHT JOIN returns all records from the right table (table2),
 and the matching records from the left table (table1).
 The result is 0 records from the left side, if there is no match.
 
 WHILE
 
	   The FULL OUTER JOIN  returns all records when there is a match in left (table1)
or right (table2) table records.
*/

/* (2) Write a query to display all employees along with their department names from two tables:

    Employees(emp_id, name, dept_id)

    Departments(dept_id, dept_name) */
    
    -- Answer --
    use ivie;
    
    create table Departments(
    dept_id int primary key,
    dept_name varchar(25)
    );
    
    select* from Departments;
    
    insert into Departments
    values(1,'livestock'),
		  (2,'Fisheries'),
          (3,'sales'),
          (4,'IT');
    
    create table Employees(
    emp_id int primary key,
    emp_name varchar(50),
    dept_id int ,
    foreign key(dept_id) references Departments(dept_id)
    );
    
     select* from Employees;
     
     insert into Employees
     values (101,'jeff carson',1),
			(102,'ivie favour',2),
            (103,'izy Carolina',3),
            (104,'nicole osazee',4);
            
     
     
    

/*(4) How do you find the second highest salary from the Employees table?
            -- Answer --
	select
          salary
	from Employees
    order by salary desc;

(5) What is the difference between DISTINCT and GROUP BY?
            -- Answer --
The difference between DISTINCT and GROUP BY are
        The DISTINCT statement is used to return only different values and
eliminate duplicate rows from the result set. 

WHILE
        The GROUP BY statement is often used with aggregate functions to
group the result-set by one or more columns.
*/

-- (6) Write a query to count how many employees are in each department. --
              -- Answer --
select
      count(emp_id) as livestock
from Employees
where dept_id = '1';

select
      count(emp_id) as fisheries
from Employees
where dept_id = '2';

select
      count(emp_id) as sales
from Employees
where dept_id = '3';

select
      count(emp_id) as IT
from Employees
where dept_id = '4';
     

/* (7) How do you add a new column called email to the Employees table?
          -- Answer --
   Alter table Employees
   add column email varchar(50);
*/
-- (8) Write a query to rename the table Employees to Staff. --
          -- Answer --

rename table employees to staff;



/* (9) How do you remove duplicate records from a table? 
              Answer 
a) Identify duplicates
b)Delete duplicates 
*/


/* (10) What is a subquery in SQL? Give an example
               Answer
A subquery is a query embedded within another sql query.

Examples
*/
select* from Staff;
select* from Departments;

select emp_name as Staff_names
from Staff
where dept_id = (
    select dept_id
    from Departments
    where dept_name = 'sales'
    );


/*(11) What is a Primary Key? Can a table have multiple primary keys?
            -- Answer --
a)The PRIMARY KEY constraint is used to uniquely identify each record in a table.
b) Yes, it can have multiple primary Keys. 
*/


/*(12) What is a Foreign Key? Give an example.
        -- Answer --
A FOREIGN KEY is a collection of fields in one table, 
that refers to the PRIMARY KEY in another table.

Example
*/

create table student(
      student_id int primary key,
      sex varchar(10)
      );
      
      insert into student
      values (1,'male'),
             (2,'female');
select* from student;

create table Teachers(
Teachers_id int primary key,
first_name varchar(30),
last_name varchar(30),
student_id int ,
FOREIGN KEY (student_id) REFERENCES student(student_id)
);

select* from Teachers;


insert into Teachers
values(1,'Brendan','Clarke',1),
      (2,'Suzanna','Clee',1),
	  (3,'Alexandra','Close',2),
      (4,'Brenda','Cocker',1),
      (5,'Mario','Colledg',2),
      (6,'Sonya','Adeyemi',2),
      (7,'Suzfda','Chjee',1);
	  
      