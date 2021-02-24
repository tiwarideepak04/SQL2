use hr;
## View creation

create view all_emp as
select * from employees;

## Refer the view as a table

select * from all_emp;

## Simple view

create view location_details as
select * from locations;

## Complex view

create view sales_emp_locations as
select employee_id, first_name, last_name, city, country_id, department_name
from employees e , departments d, locations l
where e.department_id = d.department_id
and d.location_id = l.location_id
and d.department_name = 'sales';

select * from sales_emp_locations;

## Horizontal views

create view emp_50 as
select * from employees where department_id =50;

select * from emp_50;

## Vertical view

create view emp_contact_details as
select employee_id, first_name, last_name, email, phone_number
from employees;

select * from emp_contact_details;

## Group view

create view departmental_salary_summary as
select department_id, max(salary) max_salary, min(salary) min_salary,
avg(salary) average_salary, sum(salary)  total_salary,
count(*) employee_count 
from employees 
group by department_id;

select * from departmental_salary_summary;

## Join views
create view manager_data as 
select  e1.first_name emp_name, e2.first_name manager_name
from employees e1, employees e2
where e1.manager_id = e2.employee_id; 


select * from manager_data;

create view all_managers as
select first_name, last_name from employees e 
where exists (select * from employees e1 where 
e1.manager_id = e.employee_id);

select * from all_managers;

## Check option

create or replace view high_salary as
select * from emp where salary >10000;

select * from high_salary;

insert into high_salary values(225, 'John','Picket','JPICKET',
'511.45.5564','2000-12-05','ST_CLERK',8000,null,201,40);

select * from emp;

select * from high_salary;

create or replace view high_salary_chk as
select * from emp where salary >10000 
with check option;

select * from high_salary_chk;

##ERROR due to check option
insert into high_salary_chk values(225, 'John','Picket','JPICKET',
'511.45.5564','2000-12-05','ST_CLERK',8000,null,201,40);

create view higher_salary as
select * from high_salary where salary<15000 
with local check option;

select * from higher_salary;

insert into higher_salary values(225, 'John','Picket','JPICKET',
'511.45.5564','2000-12-05','ST_CLERK',8000,null,201,40);

delete from employees where employee_id =225;

create view higher_salary_cascade_chk as
select * from high_salary where salary<15000 
with cascaded check option;

## Error - cascade check option
insert into higher_salary_cascade_chk values(225, 'John','Picket','JPICKET',
'511.45.5564','2000-12-05','ST_CLERK',8000,null,201,40);