--https://datalemur.com/questions/sql-avg-review-ratings

--Given the reviews table, write a query to get the average stars for each product every month.

--The output should include the month in numerical value, product id, and average star rating rounded to two decimal places. Sort the output based on month followed by the product id.


--basic solution
SELECT 
  EXTRACT(MONTH FROM submit_date) AS mth,
  product_id,
  ROUND(AVG(stars), 2) AS avg_stars
FROM reviews
GROUP BY EXTRACT(MONTH FROM submit_date), product_id
ORDER BY mth, product_id;


--Using CTE
with t1 as (SELECT extract("MONTH" from submit_date) mnth, product_id product, stars FROM reviews
ORDER BY submit_date DESC)

SELECT mnth, product, round(avg(stars), 2)
FROM t1
GROUP BY product, mnth
ORDER BY 1, 2;