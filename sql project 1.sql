use hr;

-- 1. Write a query to display the names (first_name, last_name) using alias name “First Name", "Last name"--

select first_name , last_name as "first name" , "last name"
from employees;

-- 2. Write a query to get unique department ID from employee table--

select distinct department_id
from employees;

-- 3. Write a query to get all employee details from the employee table order by first name, descending--

select *
from employees
order by first_name desc;

-- 4. Write a query to get the names (first_name, last_name), salary, PF of all the employees (PF is calculated as 15% of salary)--

select first_name , last_name, salary, salary* .15
from employees;

-- 5. Write a query to get the employee ID, names (first_name, last_name), salary in ascending order of salary--

select employee_id , first_name, last_name, salary
from employees
order by salary asc;

-- 6. Write a query to get the total salaries payable to employees --

select sum(salary)
from employees;

-- 7. Write a query to get the maximum and minimum salary from employees table --

select max(salary), min(salary)
from employees;

-- 8. Write a query to get the average salary and number of employees in the employees table --

select avg(salary), count(*)
from employees;

-- 9. Write a query to get the number of employees working with the company --

select count(*)
from employees;

-- 10. Write a query to get the number of jobs available in the employees table --

select count(job_id)
from employees;

-- 11. Write a query get all first name from employees table in upper case --

select first_name,
upper(first_name)
from employees;

-- 12. Write a query to get the first 3 characters of first name from employees table --

select first_name, 
left(first_name, 3)
from employees;

-- 13. Write a query to get first name from employees table after removing white spaces from both side--
select first_name,
trim(first_name)
from employees;

-- 14. Write a query to get the length of the employee names (first_name, last_name) from employees table --

select first_name, last_name,
length(first_name)+length(last_name)
from employees;

-- 15. Write a query to check if the first_name fields of the employees table contains numbers --

select *
from employees
where first_name regexp '[0-9]';

-- 16. Write a query to display the name (first_name, last_name) and salary for all employees whose salary isnot in the range $10,000 through $15,000 --

select first_name, last_name, salary
from employees
where salary not between 10000 and 15000;

-- 17. Write a query to display the name (first_name, last_name) and department ID of all employees indepartments 30 or 100 in ascending order

select first_name, last_name, department_id
from employees
where department_id in (30, 100)
order by department_id asc;

-- 18. Write a query to display the name (first_name, last_name) and salary for all employees whose salary is not the range $10,000 through $15,000 and are in department 30 or 100

select first_name, last_name, salary, department_id
from employees
where salary not between 10000 and 15000
and department_id in(30, 100);

-- 19. Write a query to display the name (first_name, last_name) and hire date for all employees who were hired in1987 --

select first_name, last_name, hire_date
from employees
where year (hire_date) like '1987%';

-- 20. Write a query to display the first_name of all employees who have both "b" and "c" in their first name --

select first_name 
from employees
where first_name like '%b%'
and first_name like '%c%';

-- 21. Write a query to display the last name, job, and salary for all employees whose job is that of aProgrammer or a Shipping Clerk, and whose salary is not equal to $4,500, $10,000, or $15,000 --

select last_name, job_id, salary
from employees
where job_id in('it_prog','sh_clerk')
and salary not in(4500, 10000, 15000);

-- 22. Write a query to display the last name of employees whose names have exactly 6 characters --

select last_name 
from employees
where last_name like'______';

-- 23. Write a query to display the last name of employees having 'e' as the third character--

select last_name
from employees
where last_name like '__e%';

/*24. Write a query to get the job_id and related employee's id
Partial output of the query :
job_id Employees ID
AC_ACCOUNT206
AC_MGR 205
AD_ASST 200
AD_PRES 100
AD_VP 101 ,102
FI_ACCOUNT 110 ,113 ,111 ,109 ,112*/

select job_id, group_concat(employee_id,' ') 'employees id'
from employees group by job_id;

-- 25. Write a query to update the portion of the phone_number in the employees table, within the phonenumber the substring '124' will be replaced by '999'--

-- 26. Write a query to get the details of the employees where the length of the first name greater than orequal to 8--

select*
from employees
where length (first_name)>=8;

-- 27. Write a query to append '@example.com' to email field --

select email, concat(email, "","@example.com")
from employees;

-- 28. Write a query to extract the last 4 character of phone numbers --

select right(phone_number,4) as 'ph.no.'
from employees;

-- 29. Write a query to get the last word of the street address --

-- 30. Write a query to get the locations that have minimum street length --

select * from locations
where length(street_address) <= (select min(length(street_address))
from locations);


-- 31. Write a query to display the first word from those job titles which contains more than one words --

select job_title, substr(job_title,1, instr(job_title, ' ')-1)
from jobs;

-- 32. Write a query to display the length of first name for employees where last name contain character 'c' after 2nd position --

select first_name, last_name
from employees
where instr(last_name, 'c') > 2;


-- 33. Write a query that displays the first name and the length of the first name for all employees whose
-- name starts with the letters 'A', 'J' or 'M'. Give each column an appropriate label. Sort the results by the
-- employees' first names--

select first_name,
length(first_name)
from employees
where first_name like 'a%'
or first_name like 'j%'
or first_name like 'm%'
order by first_name;

-- 34. Write a query to display the first name and salary for all employees. Format the salary to be 10
-- characters long, left-padded with the $ symbol. Label the column SALARY--

select first_name,
lpad(salary, 10, '$')salary
from employees;


-- 35. Write a query to display the first eight characters of the employees' first names and indicates the
-- amounts of their salaries with '$' sign. Each '$' sign signifies a thousand dollars. Sort the data in
-- descending order of salary--

select left(first_name, 8),
repeat('$', floor(salary/1000)))
'salary($)' salary
from employees
order by salary desc;



  --  36. Write a query to display the employees with their code, first name, last name and hire date who hired
-- either on seventh day of any month or seventh month in any year 

select employee_id, first_name, last_name, hire_date
from employees
where position("07" in date_format(hire_date, '%d,  %m, %y'))>0;

show databases;
use northwind;
show tables;

-- 1. Write a query to get Product name and quantity/unit --


select productname,
quantityperunit
from products;


-- 2. Write a query to get current Product list (Product ID and name) --

select productid, productname
from products
where discontinued = 'false'
order by productname;

-- 3. Write a query to get discontinued Product list (Product ID and name)--

select productid, productname
from products
where discontinued = '1'
order by productname;

-- 4. Write a query to get most expense and least expensive Product list (name and unit price) --

select productname, unitprice 
from products
order by unitprice desc;


-- 5. Write a query to get Product list (id, name, unit price) where current products cost less than $20 --

select productid, productname, unitprice
from  products
where ((unitprice<20)) and (discontinued = false)
order by unitprice desc;

-- 6. Write a query to get Product list (id, name, unit price) where products cost between $15 and $25 --

select productname, unitprice
from products
where (((unitprice)>=15 and (unitprice)<=25)
and ((products.discontinued) = false))
order by products.unitprice desc;


-- 7. Write a query to get Product list (name, unit price) of above average price--

select distinct productname, unitprice 
from products
where unitprice > (select avg(unitprice) from products)
order by unitprice;


-- 8. Write a query to get Product list (name, unit price) of ten most expensive products--


select * from
(select distinct ProductName as Ten_Most_Expensive_Products, 
           UnitPrice
    from Products
    order by UnitPrice desc) as a limit 10;


-- 9. Write a query to count current and discontinued products--

select count(productname)
from products
group by discontinued;


-- 10. Write a query to get Product list (name, units on order , units in stock) of stock is less than the quantity on order--


select productname, unitsonorder, unitsinstock
from products
where (((discontinued = false) and (unitsinstock)<(unitsonorder)));













