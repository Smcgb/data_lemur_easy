--https://datalemur.com/questions/teams-power-users

--Write a query to find the top 2 power users who sent the most messages on Microsoft Teams in August 2022. Display the IDs of these 2 users along with the total number of messages they sent. Output the results in descending count of the messages.


--using WHERE filtering
SELECT 
  sender_id,
  COUNT(message_id) AS count_messages
FROM messages
WHERE EXTRACT(MONTH FROM sent_date) = '8'
  AND EXTRACT(YEAR FROM sent_date) = '2022'
GROUP BY sender_id
ORDER BY count_messages DESC
LIMIT 2; 

--using cte
with t1 as (SELECT 
  sender_id,
    EXTRACT(MONTH FROM sent_date) as month, 
    EXTRACT(YEAR FROM sent_date) as year,
    count(*) as num_messages
    FROM messages
GROUP BY sender_id, 3, 2),

t2 as (SELECT sender_id, num_messages 
from t1
WHERE month = 8 
  AND year = 2022)
  
SELECT * FROM t2
ORDER BY num_messages DESC
LIMIT 2;
  
