--https://datalemur.com/questions/quickbooks-vs-turbotax

--This is a premium excercise

--Intuit provides a range of tax filing products, including TurboTax and QuickBooks, available in various versions.

--Write a query to determine the total number of tax filings made using TurboTax and QuickBooks. Each user can file taxes once a year using only one product.

--If you find this question interesting, you may also want to try a similar question called Laptop vs Mobile Viewers!
--https://datalemur.com/questions/laptop-mobile-viewership

SELECT 
  SUM (CASE
    WHEN product like '%TurboTax%' THEN 1
    ELSE 0
    END) AS turbo_tax_total,
  SUM (CASE
    WHEN product like '%QuickBooks%' THEN 1
    ELSE 0
    END) AS quickbooks_total
FROM filed_taxes;