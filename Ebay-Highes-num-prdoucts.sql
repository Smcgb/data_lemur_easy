--https://datalemur.com/questions/sql-highest-products

--This is a premium excercise

--This is the same question as problem #5 in the SQL Chapter of Ace the Data Science Interview!

--Assume that you are given the table below containing information on various orders made by eBay customers. Write a query to obtain the user IDs and number of products purchased by the top 3 customers; these customers must have spent at least $1,000 in total.

--Output the user id and number of products in descending order. To break ties (i.e., if 2 customers both bought 10 products), the user who spent more should take precedence.

--using limit
SELECT user_id, count(product_id)
FROM user_transactions
GROUP BY user_id
HAVING sum(spend) >= 1000
ORDER BY 2 DESC, sum(spend) DESC
LIMIT 3;

--using dense_rank subquery

with t1 as
  (SELECT user_id,
          count(product_id) as total_prod,
          dense_rank() over(order by count(product_id) desc, sum(spend) desc) as user_rnk
  from user_transactions
  GROUP BY user_id
  HAVING sum(spend) >= 1000)
select user_id,
      total_prod
from t1 
where user_rnk <= 3