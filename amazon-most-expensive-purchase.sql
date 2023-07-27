-- https://datalemur.com/questions/most-expensive-purchase

-- This is a premium excercise

--Amazon is trying to identify their high-end customers. To do so, they first need your help to write a query that obtains the most expensive purchase made by each customer. Order the results by the most expensive purchase first.

--Using MAX
SELECT
  customer_id, max(purchase_amount)
FROM
  transactions
GROUP BY customer_id
ORDER BY 2 DESC;
