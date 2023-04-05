--Part 1
--https://datalemur.com/questions/top-profitable-drugs

--CVS Health is trying to better understand its pharmacy sales, and how well different products are selling. Each drug can only be produced by one manufacturer.

--Write a query to find the top 3 most profitable drugs sold, and how much profit they made. Assume that there are no ties in the profits. Display the result from the highest to the lowest total profit.

--basic solution
SELECT
  drug,
  total_sales - cogs AS total_profit
FROM pharmacy_sales
ORDER BY total_profit DESC
LIMIT 3;

--with CTE using Rank()
WITH t1 as (

SELECT product_id, total_sales - cogs as profit, drug
FROM pharmacy_sales

),

t2 as (SELECT 
    drug, 
    RANK() OVER(ORDER BY profit DESC) rank, 
    profit FROM t1)

SELECT drug, profit
FROM t2
WHERE rank <= 3;

--Part 2
--https://datalemur.com/questions/non-profitable-drugs

--CVS Health is trying to better understand its pharmacy sales, and how well different products are selling. Each drug can only be produced by one manufacturer.

--Write a query to find out which manufacturer is associated with the drugs that were not profitable and how much money CVS lost on these drugs. 

--Output the manufacturer, number of drugs and total losses. Total losses should be in absolute value. Display the results with the highest losses on top.

--Basic solution
SELECT 
  manufacturer, 
  count(*) drug_count, 
  (sum(total_sales) - sum(cogs)) *-1 as total_loss
FROM pharmacy_sales
WHERE (total_sales - cogs) < 0
GROUP BY manufacturer
ORDER BY 3 DESC;

--Part 3
--https://datalemur.com/questions/total-drugs-sales

--CVS Health is trying to better understand its pharmacy sales, and how well different products are selling.

--Write a query to find the total drug sales for each manufacturer. Round your answer to the closest million, and report your results in descending order of total sales.

--Because this data is being directly fed into a dashboard which is being seen by business stakeholders, format your result like this: "$36 million".

--Solution
SELECT manufacturer, 
concat('$',round(sum(total_sales)/1000000),' million') as sales_mil
FROM pharmacy_sales
GROUP BY 1
order by sum(total_sales) DESC;
