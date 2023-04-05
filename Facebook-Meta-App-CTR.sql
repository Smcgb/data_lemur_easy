--https://datalemur.com/questions/click-through-rate

--This is the same question as problem #1 in the SQL Chapter of Ace the Data Science Interview!

--Assume you have an events table on app analytics. Write a query to get the app’s click-through rate (CTR %) in 2022. Output the results in percentages rounded to 2 decimal places.


--Using CASE statement 
SELECT
  app_id,
  ROUND(100.0 *
    SUM(CASE WHEN event_type = 'click' THEN 1 ELSE 0 END) /
    SUM(CASE WHEN event_type = 'impression' THEN 1 ELSE 0 END), 2)  AS ctr
FROM events
WHERE timestamp >= '2022-01-01' 
  AND timestamp < '2023-01-01'
GROUP BY app_id;


--Using CTE
with t1 as (select app_id, event_type, count(*) as clicks
FROM events
WHERE 
  timestamp >= '2022-01-01' AND timestamp <= '2023-01-01'
  AND event_type = 'click'
GROUP BY app_id, event_type),

t2 as (select app_id, event_type, count(*) as impressions
FROM events
WHERE 
  timestamp >= '2022-01-01' AND timestamp <= '2023-01-01'
  AND event_type = 'impression'
GROUP BY app_id, event_type),

t3 as (
  select t2.app_id, t2.impressions, t1.clicks
  FROM t2
  JOIN t1 ON t1.app_id = t2.app_id
)

SELECT app_id, round((cast(clicks as decimal) / impressions * 100),2) as ctr FROM t3
