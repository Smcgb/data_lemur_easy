--https://datalemur.com/questions/final-account-balance

--This is a premium excercise

--Given a table containing information about bank deposits and withdrawals made using Paypal, write a query to retrieve the final account balance for each account, taking into account all the transactions recorded in the table with the assumption that there are no missing transactions.account.

-- using CTE with join
with t1 as 
  (SELECT account_id, sum(amount) dep
    FROM transactions
    WHERE transaction_type = 'Deposit'
    GROUP BY account_id
    ),
    
t2 as
  (SELECT account_id, sum(amount) wd
    FROM transactions
    WHERE transaction_type = 'Withdrawal'
    GROUP BY account_id
    )

SELECT t1.account_id, (t1.dep - t2.wd)
  FROM t1
  JOIN t2 ON 
    t2.account_id = t1.account_id;

--using CASE

SELECT
  account_id,
  CASE 
    WHEN transaction_type = 'Deposit' THEN amount
    ELSE -amount END AS final_balance
FROM transactions
GROUP BY account_id;