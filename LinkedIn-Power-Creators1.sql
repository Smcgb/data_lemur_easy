--https://datalemur.com/questions/linkedin-power-creators

--This is a premium excercise

--The LinkedIn Creator team is seeking out individuals who have a strong influence on the platform, utilizing their personal profiles as a company or influencer page. 
--To identify such power creators, we can compare the number of followers on their LinkedIn page with the number of followers on the company they work for. 
--If a person's LinkedIn page has more followers than their company, we consider them to be a power creator.

--Write a query to retrieve the profile IDs of these LinkedIn power creators ordered in ascending order based on their IDs.

--Left join solution
SELECT pp.profile_id 
FROM personal_profiles pp
LEFT JOIN company_pages cp 
  ON pp.employer_id = cp.company_id
WHERE pp.followers > cp.followers
ORDER BY 1 ASC;

--Inner join solution
SELECT pp.profile_id
FROM personal_profiles pp
INNER JOIN company_pages cp
  ON pp.employer_id = cp.company_id
WHERE pp.followers > cp.followers
ORDER BY 1 ASC;