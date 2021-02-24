
# 1. Join all the tables and create a new table called combined_table.
#    (market_fact, cust_dimen, orders_dimen, prod_dimen, shipping_dimen)

CREATE TABLE combined_all AS (
SELECT product_category,product_sub_category,p.prod_id,
o.order_id,order_date,order_priority,o.ord_id, c.cust_id,customer_name,Province,Region,Customer_segment,
ship_mode,ship_date,s.ship_id, sales,discount,Order_quantity,profit,shipping_cost,product_base_margin
FROM cust_dimen AS  c 
INNER JOIN market_fact AS m 
ON c.cust_id = m.cust_id
INNER JOIN orders_dimen AS o 
ON m.ord_id=o.ord_id
INNER JOIN shipping_dimen AS s 
ON s.order_id=o.order_id
INNER JOIN prod_dimen AS p 
ON p.prod_id=m.prod_id
);


SELECT * FROM combined_all 
ORDER BY prod_id;


#   2. Find the top 3 customers who have the maximum number of orders

SELECT c.*,m.number_of_orders 
FROM cust_dimen AS c,
( SELECT cust_id, COUNT(DISTINCT (ord_id)) AS number_of_orders FROM market_fact 
GROUP BY cust_id) AS m
WHERE c.cust_id=m.cust_id
ORDER BY number_of_orders DESC
LIMIT 3;


#  3. Create a new column DaysTakenForDelivery that contains the date difference of Order_Date and Ship_Date.

SELECT  o.order_id, order_date, ship_date, DATEDIFF(ship_date, order_date) AS DaysTakenForDelivery
FROM orders_dimen AS o 
INNER JOIN shipping_dimen AS s 
ON o.order_id=s.order_id
ORDER BY DaysTakenForDelivery DESC;


#  4. Find the customer whose order took the maximum time to get delivered.

SELECT  c.cust_id, c.customer_name, o.order_id,order_date, ship_date, DATEDIFF(ship_date,order_date) AS DaysTakenForDelivery
FROM orders_dimen AS o 
INNER JOIN shipping_dimen AS s 
ON o.order_id=s.order_id 
INNER JOIN market_fact AS m 
ON s.ship_id=m.ship_id
INNER JOIN cust_dimen AS c 
ON c.cust_id=m.cust_id
WHERE DATEDIFF(ship_date,order_date) IN 
( SELECT  MAX( DATEDIFF(ship_date,order_date)) FROM orders_dimen AS o 
INNER JOIN shipping_dimen AS s 
ON o.order_id=s.order_id);


#  5. Retrieve total sales made by each product from the data (use Windows function)

SELECT DISTINCT m.Prod_id,Product_Category,Product_Sub_Category, 
ROUND(SUM(sales) OVER( PARTITION BY Prod_id),2) AS total_sales 
FROM market_fact AS m
INNER JOIN prod_dimen AS p 
ON m.Prod_id=p.Prod_id
ORDER BY total_sales DESC; 


#   6. Retrieve total profit made from each product from the data (use windows function)

SELECT DISTINCT m.prod_id,Product_Category,Product_Sub_Category,
ROUND(SUM(profit) OVER( PARTITION BY prod_id),2) AS total_profit
FROM  market_fact AS m 
INNER JOIN prod_dimen AS p 
ON m.prod_id=p.prod_id
ORDER BY total_profit DESC;        


