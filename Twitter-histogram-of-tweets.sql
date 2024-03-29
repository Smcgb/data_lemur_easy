--https://datalemur.com/questions/sql-histogram-tweets

--This is the same question as problem #6 in the SQL Chapter of Ace the Data Science Interview!

--Assume you're given a table Twitter tweet data, write a query to obtain a histogram of tweets posted per user in 2022. Output the tweet count per user as the bucket and the number of Twitter users who fall into that bucket.

--In other words, group the users by the number of tweets they posted in 2022 and count the number of users in each group.

--with subquery, I prefer this method
with t1 as (SELECT 
  count(*) tweet_bucket,
  user_id
FROM tweets
WHERE tweet_date BETWEEN '2022-01-01' 
    AND '2022-12-31'
GROUP BY user_id)

SELECT
  tweet_bucket,
  count(*) users_count
FROM t1
GROUP BY tweet_bucket
ORDER BY tweet_bucket ASC;

--basic solution
SELECT 
  user_id, 
  COUNT(tweet_id) AS tweet_count_per_user 
FROM tweets 
WHERE tweet_date BETWEEN '2022-01-01' 
  AND '2022-12-31'
GROUP BY user_id;
