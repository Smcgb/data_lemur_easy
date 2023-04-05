--https://datalemur.com/questions/second-day-confirmation

--New TikTok users sign up with their emails and each user receives a text confirmation to activate their account. Assume you are given the below tables about emails and texts.

--Write a query to display the ids of the users who did not confirm on the first day of sign-up, but confirmed on the second day.


--Basic solution
SELECT DISTINCT user_id
FROM emails 
INNER JOIN texts
  ON emails.email_id = texts.email_id
WHERE texts.action_date = emails.signup_date + INTERVAL '1 day'
  AND texts.signup_action = 'Confirmed';


--CTE using Between 
with t1 as
(
SELECT 
  e.user_id, 
  t.action_date, e.signup_date,
  EXTRACT(EPOCH FROM (t.action_date - e.signup_date)) AS difference
FROM emails as e
LEFT JOIN texts as t 
ON t.email_id = e.email_id
WHERE t.signup_action = 'Confirmed'
)

SELECT user_id from t1
WHERE difference BETWEEN 86399 and 172799;