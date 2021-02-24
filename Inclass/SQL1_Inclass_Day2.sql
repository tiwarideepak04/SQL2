-- --------------------------------------------------------
# Datasets Used: cricket_1.csv, cricket_2.csv
-- cricket_1 is the table for cricket test match 1.
-- cricket_2 is the table for cricket test match 2.
-- --------------------------------------------------------

# Q1. Find all the players who were present in the test match 1 as well as in the test match 2.

use bank;
select player_id, player_name from c_1 union
select player_id, player_name from c_2;

# Q2. Write a query to extract the player details player_id, runs and player_name from the table “cricket_1” who
#  scored runs more than 50

select * from c_1 where runs > 50;

# Q3. Write a query to extract all the columns from cricket_1 where player_name starts with ‘y’ and ends with ‘v’.

select * from c_1 where player_name like 'y%' and '%v';

# Q4. Write a query to extract all the columns from cricket_1 where player_name does not end with ‘t’.
 
 select * from c_1 where player_name not like '%t';
 
-- --------------------------------------------------------
# Dataset Used: cric_combined.csv 
-- --------------------------------------------------------

# Q5. Write a MySQL query to create a new column PC_Ratio that contains the divsion ratio 
# of popularity to charisma .(Hint :- Popularity divide by Charisma)

select * from c_c;
select popularity, charisma, (popularity/charisma) as pc_ratio from c_c;

# Q6. Write a MySQL query to find the top 5 players having the highest popularity to charisma ratio.

select player_name, popularity, charisma, (popularity/charisma) as pc_ratio from c_c order by pc_ratio desc limit 5;

# Q7. Write a MySQL query to find the player_ID and the name of the player that contains the character “D” in it.

select * from c_c;
select player_id, player_name from c_c where player_name like '%D%';

# Q8. Extract Player_Id  and PC_Ratio where the PC_Ratio is between 0.12 and 0.25.

select player_id, (popularity/charisma) as pc_ratio from c_c where  (popularity/charisma) between 0.12 and 0.25;

-- --------------------------------------------------------
# Dataset Used: new_cricket.csv
-- --------------------------------------------------------
# Q9. Extract the Player_Id and Player_name of the players where the charisma value is null.

select * from new_c;
select player_id, player_name, charisma from new_c where charisma is null;
 
# Q10. Write a MySQL query to display all the NULL values imputed with 0.

SELECT IFNULL(`player_name_[0]`, 0)Player_name,
IFNULL(`player_id_[0]`, 0)Player_id,ifnull(charisma,0)Charisma,
IFNULL(`runs_[0]`, 0)runs FROM new_c;
select * from new_c;
 
# Q11. Separate all Player_Id into single numeric ids (example PL1 =  1).

select player_id, substr(player_id, 3) as id from new_c;
 
# Q12. Write a MySQL query to extract Player_Id , Player_Name and charisma where the charisma is greater than 25.

select player_id, player_name, charisma from new_c where charisma > 25;

-- --------------------------------------------------------
# Dataset Used: churn1.csv 
-- --------------------------------------------------------

# Q13. Write a query to display the rounding of lowest integer value of monthlyservicecharges and rounding of higher integer value of totalamount 
# for those paymentmethod is through Electronic check mode.

select * from churn1;
select paymentmethod, monthlyservicecharges, round(monthlyservicecharges) 
as round_off 
from churn1 
where paymentmethod = 'Electronic check';

# Q14. Rename the table churn1 to “Churn_Details”.

alter table churn1 rename to churn_details;
show tables;

# Q15. Write a query to create a new column new_Amount that contains the sum of TotalAmount and MonthlyServiceCharges.

select * from churn_details;
select monthlyservicecharges, totalamount, (monthlyservicecharges + totalamount) new_amount from churn_details;
alter table churn_details add column new_amount int after totalamount;
set sql_safe_updates = 0;
update churn_details set new_amount= (monthlyservicecharges + totalamount);

# Q16. Rename column new_Amount to Amount.

alter table churn_details change new_amount Amount float;

# Q17. Drop the column “Amount” from the table “Churn_Details”.

alter table churn_details drop column Amount;
select * from churn_details;

# Q18. Write a query to extract the customerID, InternetConnection and gender 
# from the table “Churn_Details ” where the value of the column “InternetConnection” has ‘i’ 
# at the second position.

select customerid, internetconnection, gender from churn_details where internetconnection like '_i%';

# Q19. Find the records where the tenure is 6x, where x is any number.

select tenure, (tenure/6) as d from churn_details;
select tenure, (select (tenure/6) as d) from churn_details;

# Q20. Write a query to display the player names in capital letter and arrange in alphabatical order along with the charisma,
# display 0 for whom the charisma value is NULL.

use bank;
select * from new_c;
select upper(player_name), ifnull(charisma,0) Charisma_0 from new_c order by player_name;