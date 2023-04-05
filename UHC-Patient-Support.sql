--Part 1
--https://datalemur.com/questions/frequent-callers

--UnitedHealth has a program called Advocate4Me, which allows members to call an advocate and receive support for their health care needs – whether that's behavioural, clinical, well-being, health care financing, benefits, claims or pharmacy help.

--Write a query to find how many UHG members made 3 or more calls. case_id column uniquely identifies each call made.

--Using CTE
with t1 as 
	(SELECT policy_holder_id, 
			count(case_id) calls 
	FROM callers
	GROUP BY policy_holder_id
	HAVING count(case_id) >= 3)

SELECT count(policy_holder_id) member_count
FROM t1;

--Part2
--https://datalemur.com/questions/uncategorized-calls-percentage

--UnitedHealth Group has a program called Advocate4Me, which allows members to call an advocate and receive support for their health care needs – whether that's behavioural, clinical, well-being, health care financing, benefits, claims or pharmacy help.

--Calls to the Advocate4Me call centre are categorised, but sometimes they can't fit neatly into a category. These uncategorised calls are labelled “n/a”, or are just empty (when a support agent enters nothing into the category field).

--Write a query to find the percentage of calls that cannot be categorised. Round your answer to 1 decimal place.

--Solution using Filter()
SELECT
  ROUND (100.0 * 
    COUNT (case_id) FILTER (
      WHERE call_category IS NULL OR call_category = 'n/a')
    / COUNT (case_id), 1) AS uncategorised_call_pct
FROM callers;

--Solution with CASE statement
SELECT 
  ROUND(100 * 
        (SUM(CASE
          WHEN call_category IS NULL then 1.0
          WHEN call_category = 'n/a' then 1
          ELSE 0
        END)) /count(*), 1)
  FROM callers;
  