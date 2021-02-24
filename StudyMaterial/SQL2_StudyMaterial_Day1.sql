use hr;
## IN which department Sussan works (Name)
select department_id from employees where first_name = 'susan';
select department_name from departments where department_id = 40; 

select department_name from departments where department_id 
= (select department_id from employees where first_name = 'susan');

## List the details of employees for accounting dept
select department_id from departments where department_name = 'Accounting';
select * from employees where department_id =110;

select * from employees where department_id =
(select department_id from departments where department_name = 'Accounting');

## What is average salary of sales 
select avg(salary) from employees where department_id =
(select department_id from departments where department_name = 'sales');
## How many employees have salary greater than susan.
## Logic select * from employees where salary > susan's salary
select count(*) from employees where salary >
(select salary from employees where first_name = 'susan');

## Which departments have country code US 

select * from departments;
select * from locations;

select location_id from locations where country_id ='us';
select * from departments where location_id =
(select location_id from locations where country_id ='us'); ##error

select * from departments where location_id in
(select location_id from locations where country_id ='us');

##Display details of the employees who have salary greater than all employees joined in year 2000
select * from employees where salary> all(
select salary from employees where year(hire_date) = 2000);

select * from employees where salary> (
select max(salary) from employees where year(hire_date) = 2000);

## List employees who have salary greater than max salary of IT_prog or st_clerk
select * from jobs;
select * from employees where salary > any(
select max_salary from jobs where job_id in('IT_PROG', 'ST_CLERK'));

# Display the employees who have at least one person reporting to them
select distinct e1.first_name from employees e1, employees e2
where e1.employee_id=e2.manager_id;

select * from employees where employee_id in 
(select manager_id from employees);

select count(distinct department_id) from employees;
select * from departments;
## Exists operator
SELECT * from employees e where exists
(select employee_id from employees where manager_id =e.employee_id);

## display the name of department where at least one employee is working

select department_name from departments where department_id in
(select distinct department_id from employees);

## Inclass solution
use inclass;
select * from titanic_ds;
# Dataset used: titanic_ds.csv
# Use subqueries for every question

#Q1. Display the first_name, last_name, passenger_no , fare of the passenger who paid less than the  maximum fare. (20 Row)
select first_name,last_name,Passenger_no,fare from titanic_ds where fare <
(select max(fare) from titanic_ds);

#Q2. Retrieve the first_name, last_name and fare details of those passengers who paid fare greater than average fare. (11 Rows)
select first_name,last_name,fare from titanic_ds where fare >
(select avg(fare) from titanic_ds);

#Q4. Display first_name,embark_town where deck is equals to the deck of embark town ends with word 'town' (7 Rows)
select first_name,embark_town,passenger_no,deck from titanic_ds e
where deck in (select deck from titanic_ds where embark_town like '%town') ;

# Dataset used: youtube_11.csv
select * from youtube_11;
#Q5. Display the video Id and the number of likes of the video that has got less likes than maximum likes(10 Rows)
Select Video_Id,Likes from YouTube_11 where likes 
< (select max(likes) from YouTube_11);

#Q6. Write a query to print video_id and channel_title where trending_date is equals to the trending_date of  category_id 1(5 Rows)
select video_id, channel_title from youtube_11 where trending_date in
(select trending_date from youtube_11 where category_id=1);

#Q7. Write a query to display the publish date, trending date ,views and description where views are more than views of Channel 'vox'.(7 Rows))
Select Publish_Date,Trending_Date,Views,Description from YouTube_11 where 
views > (
Select views from YouTube_11 where Channel_Title = 'Vox');

#Q8. Write a query to display the channel_title, publish_date and the trending_date having category id in between 9 to Maximum category id .
# Do not use Max function(3 Rows)
select channel_title,publish_date,trending_date from youtube_11 where 
category_id between 9 and 
(select category_id from youtube_11 order by category_id desc limit 1);

#Q9. Write a query to display channel_title, video_id and number of view 
#of the video that has received more than  minimum views. (10 Rows)
select channel_title,video_id,views from youtube_11 
where views > (select min(views) from youtube_11);
