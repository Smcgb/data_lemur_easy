--https://datalemur.com/questions/subject-matter-experts

--This is a premium excercise

--You are tasked with identifying Subject Matter Experts (SMEs) at Accenture based on their work experience in specific domains. An employee qualifies as an SME if they meet either of the following criteria:

    --They have 8 or more years of work experience in a single domain.
    --They have 12 or more years of work experience across two different domains.


SELECT
employee_id 
FROM employee_expertise
GROUP BY employee_id 
HAVING (sum(years_of_experience) >= 12 AND COUNT(employee_id) = 2) OR
  (sum(years_of_experience) >= 8 AND COUNT(employee_id ) = 1);