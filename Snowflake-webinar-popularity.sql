--https://datalemur.com/questions/snowflake-webinar-popularityS

--As a Data Analyst on Snowflake's Marketing Analytics team, 
--you're analyzing the CRM to determine what percent of marketing touches were of type "webinar" in April 2022. 
--Round your percentage to the nearest integer.

--This is a premium excercise

--with CTE

with t1 AS
 (SELECT COUNT(contact_id) aprweb
    FROM marketing_touches 
    WHERE event_type = 'webinar'
    AND DATE_TRUNC('month', event_date) = '04/01/2022'),
    

t2 AS (
  SELECT COUNT(contact_id) apr_ttl
      FROM marketing_touches 
      WHERE DATE_TRUNC('month', event_date) = '04/01/2022')

SELECT ROUND(
  (t1.aprweb::decimal *100  / t2.apr_ttl))  webinar_pct
FROM t1, t2

--with CASE
SELECT 
  ROUND(100 *
    SUM(CASE WHEN event_type='webinar' THEN 1 ELSE 0 END)/
    COUNT(*)) as webinar_pct
FROM marketing_touches
WHERE DATE_TRUNC('month', event_date) = '04/01/2022';