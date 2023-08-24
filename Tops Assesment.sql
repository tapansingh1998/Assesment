# assesement 1
create database W;
Use W;
Create table Workers(W_id int, F_name varchar(15),L_name varchar(15),Salary int, J_date date,Dept varchar(10));

Insert into Workers values(1,'Monika','Arora',100000,'2014-2-20','HR'),(2,'Nisha','Verma',800000,'2014-6-11','Admin'),(3,'Vishal','Singhal',300000,'2014-2-20','HR'),(4,'Vishal','Singh',400000,'2014-2-20','Account'),(5,'Vipul','Rastogi',500000,'2014-2-22','Admin'),(6,'Satish','Mishra',600000,'2014-6-11','HR'),(7,'Jalpa','Patel',500000,'2014-3-12','Account'),(8,'Kalpa','Patel',500000,'2014-3-12','Account');
# 1. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending.
Select * FROM workers
order by F_name asc,Dept desc;
# 2.Write an SQL query to print details for Workers with the first names “Vipul” and “Satish” from the Worker table.
Select * FROM workers 
where F_name="Vipul" or F_name="Satish";
# 3. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets. 
Select * FROM workers 
where F_name like '%h' and length(F_name)=6;
# 4. Write an SQL query to print details of the Workers whose SALARY lies between 1.
# wrong question
# 5. Write an SQL query to fetch duplicate records having matching data in some fields of a table. 
 # not understood the question

# 6. Write an SQL query to show the top 6 records of a table. 
Select * FROM Workers limit 6;
# 7. Write an SQL query to fetch the departments that have less than five people in them.
Select Dept from workers group by Dept having count(*)<5;
# 8. Write an SQL query to show all departments along with the number of people in there. 
Select count(*),Dept from workers group by Dept ;
# 9. Write an SQL query to print the name of employees having the highest salary in each department.
select e1.f_name,e1.dept,e1.salary
FROM workers e1 join workers e2 on e1.dept=e2.dept
WHERE e1.salary = (SELECT MAX(e2.salary)
                   FROM workers e2 group by e2.dept
                   );


Use W;
Create table student(S_id int,S_name varchar(20),Sex varchar(20),percentage int,class int,Sec varchar(10),Strm varchar(10),DOB date );
Insert into student values(1,'Bhargav','M',80,12,'A','Sci','1996-08-17'),(2,'Bharav','M',82,12,'A','Sci','1998-08-17'),(3,'Arav','M',70,12,'A','Com','1996-08-17'),(4,'Purnima','F',80,11,'A','Sci','1996-05-17'),(5,'Aarti','F',60,12,'A','Sci','1996-08-17');
#1 To display all the records form STUDENT table. 
SELECT * FROM student ;
# 2. To display any name and date of birth from the table STUDENT.
 SELECT S_Name, DOB 
FROM student ; 
#3. To display all students record where percentage is greater of equal to 80 FROM student table. 
SELECT * FROM student WHERE percentage >= 80; 
# 4. To display student name, stream and percentage where percentage of student is more than 80 
SELECT S_name, Strm, Percentage from student WHERE percentage > 80;
 #5. To display all records of science students whose percentage is more than 75 form student table. 
SELECT * From student WHERE strm = 'Sci' AND percentage > 75;
