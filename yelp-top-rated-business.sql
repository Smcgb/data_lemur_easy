--https://datalemur.com/questions/sql-top-businesses

--Assume you are given the table below containing information on user reviews. 
--Write a query to obtain the number and percentage of businesses that are top rated. 
--A top-rated busines is defined as one whose reviews contain only 4 or 5 stars.

--Output the number of businesses and percentage of top rated businesses rounded to the nearest integer.

--Assumption:

    --Each business has only one review (which is the business' average rating).

--This is a premium excercise

--with inline subqueries

SELECT 
    (SELECT COUNT(*) 
     FROM reviews 
     WHERE review_stars IN (4, 5)) AS biz_count,
    ((SELECT COUNT(*) 
      FROM reviews 
      WHERE review_stars IN (4, 5)) * 100 / COUNT(business_id)) AS top_rate_pct
FROM reviews;