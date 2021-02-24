## cume_dist()
select first_name, hire_date from employees order by salary;
use hr;
select first_name, hire_date, salary,
cume_dist() over (order by salary) as cumulative 
from employees;

select first_name, hire_date, department_id, salary,
cume_dist() over (partition by department_id order by salary) as cumulative 
from employees;

## Lag()

select last_name, first_name, department_id, hire_date,    
          LAG(first_name, 1) over (partition by department_id
                                  order by hire_date) prev_hire_emp
     from employees
   order by department_id, hire_date, last_name, first_name;
   
   select last_name, first_name, department_id, hire_date,    
          LAG(first_name, 2,"No body") over (order by hire_date) prev_hire_date
     from employees
   order by  hire_date, last_name, first_name;
   
    select last_name, first_name,
		LAG(first_name, 1,"No body") over (order by hire_date) prev_hire_emp,
          LAG(first_name, 2,"No body") over (order by hire_date) twoposition_emp
     from employees
   order by  hire_date, last_name, first_name;
   
   ## Lead()
   
   select last_name, first_name, department_id, hire_date,
           LAG(first_name, 1, null) over (partition by department_id
                                   order by hire_date) prev_hire_date,
           LEAD(first_name, 1, "Nothing") over (partition by department_id
                                   order by hire_date) following_hire_date
      from employees
   order by department_id, hire_date, last_name, first_name;
   
   
   ##first_value()
   
   select first_name, employee_id, salary,
   first_value(first_name) over(order by salary desc)
   from employees 
   order by salary;

   select first_name, employee_id, salary, department_id,
   first_value(first_name) over(partition by department_id order by salary desc) top_sal_emp,
   first_value(salary) over(partition by department_id order by salary desc) top_sal
   from employees 
   order by department_id,salary;
   
   ##last_value()
   
	select first_name, employee_id, salary,
   last_value(first_name) over(order by salary)
   from employees 
   order by salary;

select first_name, employee_id, salary, department_id,
   last_value(first_name) over(order by salary RANGE BETWEEN
            UNBOUNDED PRECEDING AND
            UNBOUNDED FOLLOWING) as last_val
   from employees 
   order by department_id,salary;
   
   select first_name, employee_id, salary, department_id,
   last_value(first_name) over(partition by department_id order by salary RANGE BETWEEN
            UNBOUNDED PRECEDING AND
            UNBOUNDED FOLLOWING) as last_val
   from employees 
   order by department_id,salary;
   
   
   ##Nth_value()
   
   select first_name, employee_id, salary,HIRE_DATE,
   nth_value(first_name,3) over(order by SALARY)
   from employees 
   order by SALARY;

   select first_name, employee_id, salary, department_id,
   nth_value(first_name,3) over(partition by department_id order by salary)
   from employees 
   order by department_id,salary;
   
   
  ##ntile()
   
   select first_name, employee_id, salary,
   ntile(3) over(order by salary)
   from employees 
   order by salary;

   select first_name, employee_id, salary, department_id,
   ntile(3) over(partition by department_id order by salary)
   from employees 
   order by department_id,salary;
   
   desc job_history;
   
   select start_date, end_date, hire_date, e.employee_id from employees e, job_history j where 
   e.employee_id = j.employee_id;
   
   select IFNULL(null,0);
   select ifnull(1,2);
   select isnull(null);
   select true;
   select false;
   select isnull(1/0);
   select coalesce(1,2,null);
   select coalesce(null,null,'hi');
   
   ###### Inclass solutions #####
   
   # Dataset Used: website_stats.csv and web.csv
-----------------------------------------------------------------
use inclass;
select day,no_users, 
(total_2_days-no_users) as num_next_day
from
(select day,no_users,
sum(no_users) over(rows between current row and 1 following) as total_2_days
from website_stats) a;
update website_stats set day = str_to_date(day, '%d-%m-%Y');
# Q9. Show day, number of users and the number of users the next day (for all days when the website was used)
SELECT Day,No_Users,ID,Name,
	LEAD(No_Users,1) OVER(order by day) AS Day_Total
	FROM web AS W INNER JOIN website_stats AS WS
	ON W.id = WS.website_id;
    
    SELECT day,no_users,
LEAD(no_users,1,NULL)  OVER(ORDER BY day) AS Next_Day_No_Users
FROM website_stats;
select 	website_id,day,no_users,
		lead(no_users,1,"Last Used") over(partition by website_id order by day asc) Next_Day_Users 
from website_stats;


# Q10. Display the difference in ad_clicks between the current day and the next day for the website 'Olympus'
SELECT website_id,day,ad_clicks,
LEAD(ad_clicks,1,0)  OVER (ORDER BY day) AS Next_Day_ad_clicks,
(ad_clicks)-(LEAD(ad_clicks,1,0)  over (order by day)) As Difference
FROM website_stats
WHERE website_id=(SELECT id FROM web where name='Olympus');

SELECT ws. website_id, w.name, day, ad_clicks, Lead(ad_clicks,1,Null) OVER(Order by Day) AS Next_day_clicks,
(ad_clicks - Lead(ad_clicks,1,Null) OVER(Order by Day)) AS ad_click_Difference 
FROM website_stats ws inner join web w
ON ws.website_id = w.id
WHERE w.name = 'Olympus';

select ws.website_id, w.name, ws.day,(ws.ad_clicks) -
 (lead(ws.ad_clicks,1) over (partition by w.name order by ws.day)) as next_day_clicks 
 from website_stats ws join web w on ws.website_id = w.id
 where w.name like '%oly%' ;

# Q11. Write a query that displays the statistics for website_id = 3 such that for each row, show the day, the number of users and the smallest number of users ever.
SELECT day, no_users, MIN(no_users) OVER( ) AS Smallest_user FROM website_stats WHERE website_id = 3 ; 

SELECT * FROM website_stats;
SELECT website_id, Day, no_users, first_value(no_users) OVER(order by no_users) AS Min_No_users FROM website_stats
WHERE website_id = 3;

SELECT day,no_users,
	 Min(no_users)OVER() least_no_of_users,
     STDDEV(no_users)  OVER() std_dev,
     AVG(no_users) OVER() avarage
    FROM website_stats WHERE website_id =3;



# Q12. Write a query that displays name of the website and it's launch date. The query should also display the date of recently launched website in the third column.
SELECT website_id, name, launch_date, day FROM
(select website_id, day , Rank() OVER(partition by website_id Order by Day DESC) as Row_Num FROM website_stats) AS Dummy_T 
INNER JOIN WEB w
ON Dummy_t.website_id = w.id 
WHere Row_Num =1;

SELECT id,name,launch_date,
last_value(launch_date) over(order by str_to_date(launch_date,'%d-%m-%y')
RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) as Recent_Website
FROM web;
select name,launch_date,first_value(launch_date) 
over(order by str_to_date(launch_date,'%d-%m-%Y') desc) 
recentlaunchdate from web;

###### Data Integrity  #######

use temp;
create table person(
adhaarno int(12) primary key,
pname varchar(40) not null,
mobile varchar(10) unique,
income float(9,2) default 0,
age int check(age>18));

desc person;

insert into person values
(1234567890,'Deepali',2222222,12000,40);
#error - duplicate primary ke
insert into person values
(1234567890,'Deepali',2222222,12000,40);
## error -- null primary key
insert into person values
(null,'Deepali',2222222,12000,40);
## duplicate mobile no
insert into person values
(1234567891,'Deepali',2222222,12000,40);
## successful
insert into person values
(1234567891,'Deepali',2222221,12000,40);
## error - null value for name
insert into person values
(1234567892,null,2222223,12000,40);
# successful
insert into person values
(1234567892,'Deepa',2222223,null,40);

select * from person;
# successful -- income should take default value 0
insert into person(adhaarno,pname) values
(12345678,'Deeps');

select * from person;
## Error - age<18
insert into person values
(1234567893,'Deepa',2222224,1234,4);

## check(city in ('Pune', 'Mumbai', 'Benglore', 'Chennai'))

 
