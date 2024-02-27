--https://datalemur.com/questions/tesla-unfinished-parts

--Tesla is investigating bottlenecks in their production, and they need your help to extract the relevant data. Write a query that determines which parts have begun the assembly process but are not yet finished.

--Basic null filter
SELECT part FROM parts_assembly
WHERE finish_date is NULL
GROUP BY part;

--The above solution no longer registers as valid as of 2024

--Updated 2024 query that adds `assembly_step` to pass updated query
SELECT part, assembly_step from parts_assembly
WHERE finish_date is NULL;
