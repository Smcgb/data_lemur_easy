--https://datalemur.com/questions/duplicate-job-listings

--This is the same question as problem #8 in the SQL Chapter of Ace the Data Science Interview!

--Assume you are given the table below that shows job postings for all companies on the LinkedIn platform. Write a query to get the number of companies that have posted duplicate job listings.

--Using CTE
with t1 as (
SELECT 
	company_id, 
	title, 
	description, 
	count(*) as dupes 
from job_listings
GROUP BY company_id,title,description)

SELECT count(company_id) co_w_duplicate_jobs
from t1
WHERE dupes > 1
