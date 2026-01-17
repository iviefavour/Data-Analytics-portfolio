Create schema Bank_info;

/* Methods of creating Database
1.) Type Create database (the name of the database);
create database Bank;
2.)Type create schema ( the name of the schema); */

create table Bank_info(
Bank_id INT NULL,
Bank_name varchar(50) Null,
Bank_manager varchar(50) Null,
Bank_location varchar (50) Not Null,
Bank_Address varchar (50) Null,
Phone_number varchar(20) Not Null,
Email varchar (20) Null,
Fax varchar (20) Null
);
select* from Bank_info


use Bank_info;
insert into Bank_info
values(101,"Zenith","Mr paul","Benin city","sapele Road",08036722277,"zenithbank@gmail.com",2348147227788),
	  (102,"UBA","Mr Jude","Asaba","Okpanam road", 09046733388,"uba@gmail.com", 2348594994499),
	  (103,"Sterling","Mr Etiko","Warri","Effurun road", 09044653388,"sterling@gmail.com", 2348123994499),
	  (104,"First bank","Mr Odiase","Benin","sakponba road", 08146733388,"firstbank@gmail.com", 2348594912399),
	  (105,"Wema","Mrs Akpofure","Asaba","Nnebisi road", 09046709088,"wema@gmail.com", 2348594994499),
        (106,"First bank","Mr Osakpolor","Benin","ugbowo road", 08146733388,"firstbank@gmail.com", 2348594912399);
	


2b) /* what is unique constaint? show examples*\
A unique constraint ensures that all values in a column are different,no duplicate values allowed.it enforces uniqueness 
for the specialized column(s)
Example
Create Table students(
student_id INT, Primary key
student email varchar (50) unique
this ensures that no two users can have the same email.

2c) Explain the concept of how to change column name,move column and replace table name with examples
To change column name:
Alter table Bank_info
rename coulmn phone_number to fax
select* from Bank_info

To move coulumn:
Alter table Bank_info
modify Bank_address varchar(50) after Bank_address
select* from Bank_info

To replace table name:
Rename table from initial name Bank_info to new name School_info
