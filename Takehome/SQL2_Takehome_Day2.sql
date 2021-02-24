CREATE SCHEMA IF NOT EXISTS Video_Games;
USE Video_Games;
SELECT * FROM Video_Games_Sales;

# 1. Display the names of the Games, platform and total sales in North America for respective platforms.
select  distinct name,platform,sum(na_sales)
 over(partition by platform) as platform
from Video_Games_Sales;
# 2. Display the name of the game, platform , Genre and total sales in North America for corresponding Genre as Genre_Sales,total sales for the given platform as Platformm_Sales and also display the global sales as total sales .
# Also arrange the results in descending order according to the Total Sales.
select name,platform,genre,
sum(na_sales)over (partition by genre ) as genre_sales,
sum(na_sales)over (partition by platform ) as platform_sales,
sum(na_sales)over (partition by global_sales ) as total_sales
from Video_Games_Sales order by genre_sales desc,platform_sales desc,total_sales desc;


# 3. Use nonaggregate window functions to produce the row number for each row 
# within its partition (Platform) ordered by release year.
select *,
row_number() over(partition by platform order by year_of_release) as platform_rank
from Video_Games_Sales;
select * from Video_Games_Sales;
# 4. Use aggregate window functions to produce the average global sales of each row within its partition (Year of release). Also arrange the result in the descending order by year of release.
select avg(global_sales)
over(partition by year_of_release ) as global_rank
from Video_Games_Sales order by year_of_release desc;   

# 5. Display the name of the top 5 Games with highest Critic Score For Each Publisher. 
select * from video_games_sales;
select  distinct first_value(name) over(partition by publisher order by critic_score)
from video_games_sales where critic_score>1
limit 5;

------------------------------------------------------------------------------------
# Dataset Used: website_stats.csv and web.csv
use inclass2;
select * from website_stats;
select * from web;
------------------------------------------------------------------------------------
# 6. Write a query that displays the opening date two rows forward i.e. the 1st row should display the 3rd website launch date
select *,lead(launch_date,2) over() 3_website_launch_date
from web;
# 7. Write a query that displays the statistics for website_id = 1 i.e. for each row, show the day, the income and the income on the first day.

select day,income,
first_value(income) over()
from website_stats ;
-----------------------------------------------------------------
# Dataset Used: play_store.csv 
-----------------------------------------------------------------
# 8. For each game, show its name, genre and date of release. In the next three columns, show RANK(), DENSE_RANK() and ROW_NUMBER() sorted by the date of release.
select * from play_store;
select name,genre,released,
rank() over(order by released ) as rel_rank,
dense_rank() over(order by released) as dense_rel_rank,
row_number() over(order by released) as roe_rank
from play_store;