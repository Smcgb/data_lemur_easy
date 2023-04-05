-- https://datalemur.com/questions/laptop-mobile-viewership

--This is the same question as problem #3 in the SQL Chapter of Ace the Data Science Interview!

--Assume that you are given the table below containing information on viewership by device type (where the three types are laptop, tablet, and phone). Define “mobile” as the sum of tablet and phone viewership numbers. Write a query to compare the viewership on laptops versus mobile devices.

--Output the total viewership for laptop and mobile devices in the format of "laptop_views" and "mobile_views".

--using case statement
SELECT 
  CASE WHEN device_type = 'laptop' THEN 1 ELSE 0 END AS laptop_views, 
  CASE WHEN device_type IN ('tablet', 'phone') THEN 1 ELSE 0 END AS mobile_views 
FROM viewership;

--using multiple subqueries
SELECT (select 
          count(*) from viewership where device_type = 'laptop') laptop_views,
        (select 
          count(*) from viewership where (device_type = 'phone') OR (device_type = 'tablet')) mobile_views;