use hr;

SELECT 
    employee_id, YEAR(hire_date), department_id, salary
FROM
    employees
ORDER BY YEAR(hire_date) , department_id , salary;

select sum(salary) total  from employees;

SELECT 
    department_id, SUM(salary) dept_sal
FROM
    employees
GROUP BY department_id
ORDER BY department_id;

SELECT employee_id,  year(hire_date), department_id, salary,         
SUM(salary) OVER() AS total       
FROM employees order by department_id;

SELECT         employee_id,  year(hire_date), department_id, salary,         
SUM(salary) OVER() AS total,         
SUM(salary) OVER(PARTITION BY department_id) AS dept_sal       
FROM employees order by department_id; 


SELECT employee_id,  year(hire_date), department_id, salary,         
SUM(salary) OVER() AS total,         
SUM(salary) OVER w AS dept_sal # w is a window name      
FROM employees 
window w as (PARTITION BY department_id) ## define w as window specification     
ORDER BY  department_id, salary;

SELECT employee_id,  year(hire_date), department_id, salary,         
SUM(salary) OVER() AS total,         
SUM(salary) OVER(PARTITION BY department_id) AS dept_sal       
FROM employees order by department_id; 

## Cumulative sum
SELECT  employee_id,  year(hire_date), department_id, salary,         
SUM(salary) OVER() AS total,         
SUM(salary) OVER(PARTITION BY department_id order by salary rows unbounded preceding) AS dept_sal       
FROM employees order by department_id;

## moving average
SELECT  employee_id,  year(hire_date), department_id, salary,                  
AVG(salary) OVER(rows unbounded preceding) AS moving_average       
FROM employees order by department_id;

## Moving average of size 2
SELECT         employee_id,  year(hire_date), department_id, salary,                  
AVG(salary) OVER(rows 1 preceding) AS moving_average       
FROM employees order by department_id;


SELECT         employee_id,  year(hire_date), department_id, salary,                  
AVG(salary) OVER(partition by department_id rows 1 preceding) AS moving_average       
FROM employees order by department_id;


## Row_number()
select first_name, hire_date,salary from employees order by salary;

select first_name, hire_date, salary,
row_number() over() as sr_no
from employees;

select first_name, hire_date, salary,
row_number() over(order by salary) as salary_rank
from employees;

select first_name, hire_date, salary, department_id,
row_number() over(partition by department_id) as ranks
from employees;

select first_name, hire_date, salary, department_id,
row_number() over( partition by department_id order by salary desc) as ranks
from employees;


## Unique rows with row_number()
use db;
CREATE TABLE temp1 (
    id INT,
    name VARCHAR(10) NOT NULL
);
INSERT INTO temp1(id,name) 
VALUES (3,'C'),
      (4,'D');
select * from temp1 order by id;


delete from temp1;
SELECT id, name, ROW_NUMBER() 
OVER (PARTITION BY id, name ORDER BY id) AS row_num 
FROM temp1;
 use hr;
## Rank()

select first_name, hire_date from employees order by salary;

select first_name, hire_date, salary,
rank() over(order by salary) as salary_rank
from employees;

select first_name, hire_date, salary,
rank() over() as salary_rank
from employees;

select first_name, hire_date,
rank() over( order by salary) as salry_rank
from employees;

select first_name, hire_date, salary,
rank() over( partition by year(hire_date) order by salary ) as salary_rank
from employees;

select first_name, hire_date, salary,
rank() over( partition by year(hire_date) order by salary desc) as salary_rank
from employees;

## Dense_rank()

select first_name, hire_date, salary,
dense_rank() over( order by salary) as salary_rank
from employees;

select first_name, hire_date, salary,
dense_rank() over( partition by year(hire_date) order by salary) as salary_rank
from employees;

## Percent_rank()

select first_name, hire_date, salary,
percent_rank() over( order by salary ) as salary_rank
from employees;

select first_name, hire_date, salary,department_id,
percent_rank() over( partition by department_id order by salary ) as salary_rank
from employees;
##___________________________________________________
use hr;

## With clause

select dept_30.salary +1000, dept_30.first_name
from (select first_name, salary from employees where department_id =30) dept_30;
use hr;
with dept_grps(sal,dept) as
(select avg(salary), department_id from employees group by department_id)
select case 
when sal>10000 then "Good" else "Poor"
end as salary_remarks, dept from dept_grps;

with temp as
(select salary, first_name from employees where hire_date >= '1997-01-01')
select distinct employee_id, temp.salary + 2000, e.salary+1000
from temp, employees e
where e.hire_date <'1997-01-01';

## Inclass solution
use inclass;

-- --------------------------------------------------------------
# Dataset Used: wine.csv
-- --------------------------------------------------------------

SELECT * FROM wine;

# Q1. Rank the winery according to the quality of the wine (points).-- Should use dense rank
select winery, points,
dense_rank() over(order by points) as winery_rank
from wine;

# Q2. Give a dense rank to the wine varities on the basis of the price.
select country,designation,points, variety, price,
dense_rank() over(partition by variety order by price) as dens_rank
from wine;

# Q3. Use aggregate window functions to find the average of points for each row within its partition (country). 
-- -- Also arrange the result in the descending order by country.
select *,avg(points) over(partition by country) averagepoints
from wine
order by country desc;

-----------------------------------------------------------------
# Dataset Used: students.csv
-- --------------------------------------------------------------
select * from students;
# Q4. Rank the students on the basis of their marks subjectwise.
select student_id,subject, marks, rank() over(partition by subject order by marks desc) 
from students;

# Q5. Provide the new roll numbers to the students on the basis of their names alphabetically.
select *,
row_number() over(order by name) as new_roll_numbers
from students;

# Q6. Use the aggregate window functions to display the sum of marks in each row within its partition (Subject).
select *,sum(marks) over(partition by subject) 
totalmarks from students;

# Q7. Display the records from the students table where partition should be done 
-- on subjects and use sum as a window function on marks, 
-- -- arrange the rows in unbounded preceding manner.
select *,
sum(marks) over(partition by subject rows unbounded preceding) 
as std_records
from students;


# Q8. Find the dense rank of the students on the basis of their marks subjectwise. Store the result in a new table 'Students_Ranked'

create table Students_Ranked as 
select subject,
dense_rank() over(partition by subject order by marks) as subject_rank
from students;
select * from students_ranked;
