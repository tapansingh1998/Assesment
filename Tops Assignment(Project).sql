#HR(1)
# 1. Display all information in the tables EMP and DEPT. 
Use hr;
SELECT *
FROM employees;
SELECT *
FROM  departments;
# 2. Display only the hire date and employee name for each employee. 
SELECT hire_date,first_name 
FROM employees;

# 3. Display the ename concatenated with the job ID, separated by a comma and space, and name the column Employee and Title 
SELECT concat(first_name,", ",job_id)  AS "Employee & Title" 
FROM employees;

# 4. Display the hire date, name and department number for all clerks.

SELECT hire_date,first_name,department_id
FROM employees
WHERE job_id like '%CLERK';

#5. Create a query to display all the data from the EMP table. Separate each column by a comma. Name the column THE OUTPUT

SELECT CONCAT_WS(",",employee_id,
first_name,
last_name, 
email,  
phone_number, 
hire_date,  
job_id,
salary,
commission_pct, 
manager_id, 
department_id) AS THE_OUTPUT
FROM employees;

# 6. Display the names and salaries of all employees with a salary greater than 2000.

SELECT first_name,salary
FROM employees
WHERE salary>2000;

# 7. Display the names and dates of employees with the column headers "Name" and "Start Date"

SELECT first_name as NAME, hire_date as StartDate
FROM employees;

#8. Display the names and hire dates of all employees in the order they were hired. 

SELECT first_name,hire_date 
FROM employees
order by hire_date;

# 9. Display the names and salaries of all employees in reverse salary order. 
SELECT
first_name,salary
FROM employees
order by salary desc;

# 10. Display 'ename" and "deptno" who are all earned commission and display salary in reverse order.
SELECT first_name,department_id,salary 
FROM employees
where commission_pct is not null order by salary desc; 

# 11. Display the last name and job title of all employees who do not have a manager 
SELECT last_name,job_id
FROM employees 
WHERE manager_id is null;

# 12. Display the last name, job, and salary for all employees whose job is sales representative  or stock clerk and whose salary is not equal to $2,500, $3,500, or $5,000
SELECT last_name,job_id,salary
FROM employees
WHERE  salary <>2500 AND salary<>3500 AND  salary<>5000 AND job_id in ('ST_CLERK','SA_REP');




#  1) Display the maximum, minimum and average salary and commission earned. 
SELECT MAX(salary),MIN(salary),Avg(salary),MAX(commission_pct),MIN(commission_pct),Avg(commission_pct)
FROM employees;

# 2) Display the department number, total salary payout and total commission payout for each department.
SELECT department_id,sum(salary),sum(commission_pct)
FROM employees
group by department_id;

# 3) Display the department number and number of employees in each department.
SELECT department_id, count(*)
FROM employees
group by department_id;

# 4) Display the department number and total salary of employees in each department. 
SELECT department_id , SUM(salary) AS Total_Salary
FROM employees
GROUP BY  department_id;
# 5) Display the employee's name who doesn't earn a commission. Order the result set without using the column name
SELECT first_name
FROM employees
WHERE commission_pct is null order by 1; 
# order by 1 important

# 6) Display the employees name, department id and commission. If an Employee doesn't earn the commission, then display as 'No commission'. Name the columns appropriately
SELECT first_name,department_id,
CASE 
when commission_pct is null then 'No commission'
when commission_pct is not null then commission_pct
END as commission
FROM employees;

# 7) Display the employee's name, salary and commission multiplied by 2. If an Employee doesn't earn the commission, then display as 'No commission. Name the columns appropriately

SELECT first_name,salary,
CASE 
when commission_pct is null then 'No commission'
when commission_pct is not null then commission_pct*2
END as commission
FROM employees;

# 8) Display the employee's name, department id who have the first name same as another employee in the same department
SELECT first_name,department_id
FROM employees group by first_name,department_id
having COUNT(first_name)>1 and count(department_id)>1;

# 9) Display the sum of salaries of the employees working under each Manager.
SELECT SUM(salary) , manager_id
FROM employees
GROUP BY manager_id
having manager_id is not null;

# 10) Select the Managers name, the count of employees working under and the department ID of the manager.
SELECT e.first_name as manager_name,count(*),e.department_id
FROM employees as e join employees as m on e.employee_id = m.manager_id
group by e.employee_id;
# 11) Select the employee name, department id, and the salary. Group the result with the manager name and the employee last name should have second letter 'a!
SELECT e.first_name as employee_name,e.department_id,e.salary,m.first_name as manager_name
FROM employees as e JOIN employees as m on e.manager_id=m.employee_id
where e.last_name like'_a%';


# 12) Display the average of sum of the salaries and group the result with the department id. Order the result with the department id. 
SELECT avg(salary),department_id
FROM employees
GROUP BY department_id 
HAVING department_id is not null
ORDER BY department_id;

# 13) Select the maximum salary of each department along with the department id 
SELECT MAX(salary),department_id
FROM employees
GROUP BY department_id 
HAVING department_id is not null;

# 14) Display the commission, if not null display 10% of salary, if null display a default value 1
SELECT
CASE 
WHEN commission_pct is not null then salary/10
WHEN commission_pct is null then 1
END as commission
FROM employees;

# 1. Write a query to display the last name, department number, department name for all employees.

SELECT e.last_name,d.department_id,d.department_name
FROM employees as e join departments as d
on e.department_id=d.department_id;

# 2. Create a unique list of all jobs that are in department 4. Include the location of the department in the output.

# wrong question.
# 3. Write a query to display the employee last name,department name,location id and city of all employees who earn commission.
SELECT e.last_name,d.department_name,l.location_id, l.city
FROM departments as d join employees as e on e.department_id=d.department_id
join locations as l on d.location_id=l.location_id where e.commission_pct is not null;

# 4. Display the employee last name and department name of all employees who have an 'a' in their last name 
SELECT e.last_name,d.department_name
FROM departments as d join employees as e on e.department_id=d.department_id
WHERE e.last_name like '%a%';

# 5. Write a query to display the last name,job,department number and department name for all employees who work in ATLANTA. 
# wrong question
# 6. Display the employee last name and employee number along with their manager's last name and manager number. 
SELECT e.last_name,e.employee_id,m.last_name as manager_lastname,m.employee_id as manager_id
FROM employees as e join employees as m on e.manager_id=m.employee_id;

# 7. Display the employee last name and employee number along with their manager's last name and manager number (including the employees who have no manager). 
SELECT e.last_name as employee_last_name,e.employee_id as employee_number,m.last_name as manager_last_name , m.employee_id as manager_number
FROM employees as e JOIN employees as m on e.manager_id=m.employee_id;


# 8. Create a query that displays employees last name,department number,and all the employees who work in the same department as a given employee. 


# 9. Create a query that displays the name,job,department name,salary,grade for all employees. Derive grade based on salary(>=50000=A, >=30000=B,<30000=C) 

SELECT e.first_name,j.job_title,d.department_name,e.salary,case
when e.salary>=50000 then 'A'
when e.salary>=30000 then 'B'
when e.salary<30000 then 'C'
END as grade
FROM employees as e join departments as d on e.department_id=d.department_id
join jobs as j on e.job_id=j.job_id;

# 10. Display the names and hire date for all employees who were hired before their managers along withe their manager names and hire date. Label the columns as Employee name, emp_hire_date,manager name,man_hire_date
SELECT  e.first_name as employee_name,e.hire_date as employee_hire_date,m.first_name as manager_name,m.hire_date as manager_hire_date
FROM employees as e JOIN employees as m on e.manager_id=m.employee_id
where date(e.hire_date)<date(m.hire_date);


# 1. Write a query to display the last name and hire date of any employee in the same department as SALES. 
SELECT last_name,hire_date
FROM employees
where job_id like'SA%';

# 2. Create a query to display the employee numbers and last names of all employees who earn more than the average salary. Sort the results in ascending order of salary. 
SELECT employee_id,last_name
FROM employees
WHERE salary>(SELECT AVG(salary) from employees)
order by salary;

# 3. Write a query that displays the employee numbers and last names of all employees who work in a department with any employee whose last name contains a' u

# 5. Display the last name and salary of every employee who reports to FILLMORE.
 SELECT e.last_name,e.salary
 from employees as e join employees as m on e.manager_id=m.employee_id
 where m.first_name like'%FILLMORE%';
 
 # 6. Display the department number, last name, and job ID for every employee in the OPERATIONS department. 
 SELECT e.department_id,e.last_name,e.job_id
 FROM employees as e join departments as d on e.department_id=d.department_id
 WHERE d.department_name="Operations";
 
 
 
 # 7. Modify the above query to display the employee numbers, last names, and salaries of all employees who earn more than the average salary and who work in a department with any employee with a 'u'in their name.alter
SELECT 


# 8. Display the names of all employees whose job title is the same as anyone in the sales dept.
SELECT first_name
FROM employees 
WHERE job_id='SA_MAN' or job_id='SA_REP';

# 9. Write a compound query to produce a list of employees showing raise percentages, employee IDs, and salaries. Employees in department 1 and 3 are given a 5% raise, employees in department 2 are given a 10% raise, employees in departments 4 and 5 are given a 15% raise, and employees in department 6 are not given a raise. 
# question wrong

# 10. Write a query to display the top three earners in the EMPLOYEES table. Display their last names and salaries.
SELECT last_name,salary
FROM employees
order by salary desc LIMIT 3;

# 11. Display the names of all employees with their salary and commission earned. Employees with a null commission should have O in the commission column
SELECT first_name,salary,
CASE
WHEN commission_pct is null then 0
WHEN commission_pct is not null then commission_pct
END as commission
FROM employees;

# 12. Display the Managers (name) with top three salaries along with their salaries and department information.
SELECT distinct(m.first_name) as manager_name,m.department_id,m.salary
FROM employees as e join employees as m on e.manager_id=m.employee_id
order by m.salary desc limit 3;

# 1. Write a query that displays the employee's last names only from the string's 2-5th position with the first letter capitalized and all other letters lowercase, Give each column an appropriate label. 
SELECT concat(upper(substr(last_name,2,1)),lower(substr(last_name,3,3))) FROM employees;

 #2. Write a query that displays the employee's first name and last name along with a " in between for e.g.: first name : Ram; last name : Kumar then Ram-Kumar. Also displays the month on which the employee has joined
 SELECT first_name,last_name, month(hire_date) as month_of_hiring,concat_ws("-",first_name,last_name) as fullname
 FROM employees;
 # 3. Write a query to display the employee's last name and if half of the salary is greater than ten thousand then increase the salary by 10% else by 11.5% along with the bonus amount of 1500 each. Provide each column an appropriate label.
 SELECT last_name,
 CASE 
 when 0.5*salary>10000 then salary*1.1+1500
 when 0.5*salary<=10000 then salary*1.15+1500
 End as Salary_increment
 FROM employees;
 # 4. Display the employee ID by Appending two zeros after 2nd digit and 'E' in the end, department id, salary and the manager name all in Upper case, if the Manager name consists of 'z' replace it with '$!
SELECT concat(substr(e.employee_id,1,2),'00',substr(e.employee_id,3,6),'E') as employee_id,e.department_id,e.salary,m.first_name(Select )

FROM employees as e JOIN employees as m ON e.manager_id=m.employee_id;
# 5. Write a query that displays the employee's last names with the first letter capitalized and all other letters lowercase, and the length of the names, for all employees whose name starts with J, A, or M. Give each column an appropriate label. Sort the results by the employees' last names
SELECT concat(upper(substr(last_name,1,1)),lower(substr(last_name,2,5))) as mo_last_name,
case
when first_name like 'J%' or 'A%' or 'M%' then length(last_name)
end as length_str
from employees;	

#6. Create a query to display the last name and salary for all employees. Format the salary to be 15 characters long, left-padded with $. Label the column SALARY
 SELECT last_name,lpad(salary,15,'$')as SALARY
 from employees;
 
 #7. Display the employee's name if it is a palindrome 
 
 
 # 8. Display First names of all employees with initcaps.
 SELECT concat(upper(substr(last_name,1,1)),lower(substr(last_name,2,6))) as First_names FROM employees;
 
 # 11. Display the names and job titles of all employees with the same job as Trenna.
 SELECT e.first_name,j.job_title
 FROM employees as e join jobs as j on e.job_id=j.job_id
 WHERE e.job_id=(Select e.job_id from employees as e  where e.first_name="Trenna");
 # 12. Display the names and department name of all employees working in the same city as Trenna.
 SELECT e.first_name,d.department_name
 FROM departments as d join employees as e on d.department_id=e.department_id  join locations as l on d.location_id=l.location_id
 WHERE l.city=(SELECT l.city FROM departments as d join employees as e on d.department_id=e.department_id  join locations as l on d.location_id=l.location_id  where e.first_name="Trenna");
 
 # 13. Display the name of the employee whose salary is the lowest.
 SELECT first_name FROM
 employees order by salary limit 1;
 
 # 14. Display the names of all employees except the lowest paid
 SELECT first_name FROM employees 
 where salary>(Select min(salary) from employees) ;
 