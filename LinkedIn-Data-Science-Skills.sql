--Given a table of candidates and their skills, you're tasked with finding the candidates best suited for an open Data Science job. You want to find candidates who are proficient in Python, Tableau, and PostgreSQL.
--https://datalemur.com/questions/matching-skills

--Write a query to list the candidates who possess all of the required skills for the job. Sort the output by candidate ID in ascending order.

--Using IN list 
SELECT candidate_id
FROM candidates
WHERE skill IN ('Python', 'Tableau', 'PostgreSQL');

--Using CTE
with t1 as(SELECT candidate_id, count(*) skillnum
FROM candidates
WHERE skill in('Python', 'Tableau', 'PostgreSQL')
GROUP BY candidate_id)

SELECT candidate_id from t1
WHERE skillnum = 3;

