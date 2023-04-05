--https://datalemur.com/questions/sql-average-post-hiatus-1

--Given a table of Facebook posts, for each user who posted at least twice in 2021, write a query to find the number of days between each user’s first post of the year and last post of the year in the year 2021. Output the user and number of the days between each user's first and last post.

--using Extract and HAVING clause. DataLemur recommends using ::DATE in postgres.

SELECT
  user_id,
  EXTRACT(DAY FROM MAX(post_date)-MIN(post_date)) days_between
from posts
GROUP BY user_id
HAVING min(post_date) < MAX(post_date)
  AND MAX(post_date) < '2022-01-01';