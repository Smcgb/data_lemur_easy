--https://datalemur.com/questions/revenue-by-product-line

--As a business analyst on the revenue forecasting team at NVIDIA, you are given a table of NVIDIA transactions in 2021.

--Write a query to summarize the total sales revenue for each product line. The product line with the highest revenue should be at the top of the results.

--Assumption:

    --There will be at least one sale of each product line.

--This is a premium excercise

--with CTE

with t1 as (
  SELECT product_id 
        ,sum(amount) rev
  FROM transactions
  GROUP BY product_id),
  
t2 as (
  SELECT pi.product_id
        ,pi.product_line
        ,t1.rev
        
    FROM product_info as pi
    JOIN t1
      on t1.product_id = pi.product_id
)
  
SELECT product_line
      ,sum(rev) revenue
FROM t2
GROUP BY product_line
order by sum(rev) DESC;

-- using window function
SELECT
  DISTINCT product.product_line,
  SUM(amount) OVER (
    PARTITION BY product.product_line) AS total_revenue
FROM transactions
INNER JOIN product_info AS product
  ON transactions.product_id = product.product_id
ORDER BY total_revenue DESC;