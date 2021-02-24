use inclass2;

-- --------------------------------------------------------------
# Dataset Used: wine.csv
-- --------------------------------------------------------------

SELECT * FROM wine;

# Q1. Rank the winery according to the quality of the wine (points).-- Should use dense rank
select winery,points,
dense_rank() over(order by points) as winery_rank
from wine;
# Q2. Give a dense rank to the wine varities on the basis of the price.
select winery,variety,
dense_rank() over(partition by variety order by price) as variety_rank
from wine; 
# Q3. Use aggregate window functions to find the average of points for each row within its partition (country). 
-- -- Also arrange the result in the descending order by country.
select * from wine;
select * ,avg(points)
over() as Total_points,
avg(points) over(partition by country) as country_avg_points
from wine order by country desc; 
-----------------------------------------------------------------
# Dataset Used: students.csv
-- --------------------------------------------------------------
select * from students;
# Q4. Rank the students on the basis of their marks subjectwise.
select subject,marks,
rank() over(partition by subject order by marks desc) as marks_rank
from students;
# Q5. Provide the new roll numbers to the students on the basis of their names alphabetically.
select * from students;
select student_id,subject,name,marks,
row_number() over(order by name) as roll_no
from students;
# Q6. Use the aggregate window functions to display the sum of marks in each row within its partition (Subject).
select student_id,subject,name,
sum(marks) over(partition by subject) as subject_sum_marks
from students order by subject;
# Q7. Display the records from the students table where partition should be done 
-- on subjects and use sum as a window function on marks, 
-- -- arrange the rows in unbounded preceding manner.
select *,sum(marks)
over(partition by subject rows unbounded preceding) as moving_avg_ranks
from students order by subject;
# Q8. Find the dense rank of the students on the basis of their marks subjectwise. Store the result in a new table 'Students_Ranked'
create table Students_Ranked as 
select subject,
dense_rank() over(partition by subject order by marks) as subject_rank
from students;
select * from students_ranked;
-----------------------------------------------------------------
# Dataset Used: website_stats.csv and web.csv
-----------------------------------------------------------------

select * from website_stats;
# Q9. Show day, number of users and the number of users the next day (for all days when the website was used)
select day,no_users,id,name,
lead(no_users,1) over(order by day) nxt_day_user -- partition by department_id 
from web as w inner join website_stats as ws 
on w.id=ws.website_id;


# Q10. Display the difference in ad_clicks between the current day and the next day for the website 'Olympus'

select *,ad_clicks-lead(ad_clicks,1) over() adclicksdifference from website_stats
where website_id =
(select id from web where name='Olympus');


# Q11. Write a query that displays the statistics for website_id = 3 such that for each row, show the day, the number of users and the smallest number of users ever.
select day,no_users,first_value(no_users) over(order by no_users) smallestnousers
 from website_stats where website_id=3;
# Q12. Write a query that displays name of the website and it's launch date. The query should also display the date of recently launched website in the third column.
select name,launch_date,first_value(launch_date) 
over(order by str_to_date(launch_date,'%d-%m-%Y') desc) 
recentlaunchdate from web;

select* from web;




-----------------------------------------------------------------
# Dataset Used: play_store.csv and sale.csv
-----------------------------------------------------------------
select * from play_store;
select * from sale;
# Q13. Write a query thats orders games in the play store into three buckets as per editor ratings received  
select name,editor_rating,
ntile(3) over(order by editor_rating)
from play_store;
# Q14. Write a query that displays the name of the game, the price, the sale date and the 4th column should display 
# the sales consecutive number i.e. ranking of game as per the sale took place, so that the latest game sold gets number 1. Order the result by editor's rating of the game
select name,price,date sale_date,
rank() over(order by str_to_date(date,'%d-%m-%y') desc)as data_rank
from play_store as ps join sale as s
on ps.id=s.game_id
order by editor_rating;
# Q15. Write a query to display games which were both recently released and recently updated. For each game, show name, 
#date of release and last update date, as well as their rank
#Hint: use ROW_NUMBER(), sort by release date and then by update date, both in the descending order
select * from (
select name,released,updated,
rank() over(order by str_to_date(released,'%d-%m-%y') desc) as released_rank,
row_number() over(order by str_to_date(updated,'%d-%m-%y') desc) as updated_rank
from play_store)a where released_rank=updated_rank limit 1;
-----------------------------------------------------------------
# Dataset Used: movies.csv, customers.csv, ratings.csv, rent.csv
-----------------------------------------------------------------
# Q16. Write a query that displays basic movie informations as well as the previous rating provided by customer for that same movie 
# make sure that the list is sorted by the id of the reviews.
select * from movies;
select * from ratings;
select title,release_year,genre,editor_rating,
lag(rating,1,'no rating') over(partition by title ) 
from ratings r join movies m on  r.movie_id=m.id
order by r.id;


# Q17. For each movie, show the following information: title, genre, average user rating for that movie 
# and its rank in the respective genre based on that average rating in descending order (so that the best movies will be shown first).

# Q18. For each rental date, show the rental_date, the sum of payment amounts (column name payment_amounts) from rent 
#on that day, the sum of payment_amounts on the previous day and the difference between these two values.
