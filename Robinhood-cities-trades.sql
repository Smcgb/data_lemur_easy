--https://datalemur.com/questions/completed-trades

--This is the same question as problem #2 in the SQL Chapter of Ace the Data Science Interview!

--You are given the tables below containing information on Robinhood trades and users. Write a query to list the top three cities that have the most completed trade orders in descending order.

--Output the city and number of orders.

--Inner Join Solution
SELECT 
	u.city, 
	count(t.*) total_orders
FROM trades as t
INNER JOIN 
	users as u
on 
	t.user_id = u.user_id
WHERE t.status = 'Completed'
GROUP BY 1
ORDER by 2 DESC
LIMIT 3


