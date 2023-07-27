--https://datalemur.com/questions/apple-pay-volume

--This is a premium excercise

--Visa is analysing its partnership with ApplyPay. Calculate the total transaction volume for each merchant where the transaction was performed via ApplePay.

--Output the merchant ID and the total transactions. For merchants with no ApplePay transactions, output their total transaction volume as 0. Display the result in descending order of the transaction volume.

-- Using basic SQL
SELECT merchant_id, sum(transaction_amount) ttl_trans
FROM transactions
WHERE LOWER(payment_method) like '%apple%'
GROUP BY merchant_id
ORDER BY ttl_trans DESC;

--The above doesn't pass due to not including rows with a 0 sum. 
--As an analyst, I feel this could be explained easily with an additional comment or showing another query with customers with a 0 sum in apple pay category.

--Using Case
SELECT merchant_id,
  SUM(
    CASE
    WHEN LOWER(payment_method) LIKE '%apple%'
          THEN transaction_amount
        ELSE 0
        END) as ttl_trans
FROM transactions
GROUP BY merchant_id
ORDER BY ttl_trans DESC;