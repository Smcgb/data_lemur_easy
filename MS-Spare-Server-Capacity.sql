--https://datalemur.com/questions/sql-spare-server-capacity

--Microsoft Azure's capacity planning team wants to understand how much data its customers are using, and how much spare capacity is left in each of its data centers. 
-- You’re given three tables: customers, data centers, and forecasted_demand.

--Write a query to find each data centre’s total unused server capacity. 
--Output the data center id in ascending order and the total spare capacity.

--Definitions:

    --monthly_capacity is the total monthly server capacity for each centers.
    --monthly_demand is the server demand for each customer.

-- This is a premium excercise

--with CTE

with t1 as (

  SELECT datacenter_id, SUM(monthly_demand) demand
  FROM forecasted_demand
  GROUP BY datacenter_id
)

SELECT
  d.datacenter_id, (d.monthly_capacity - t1.demand) spare_capacity
FROM datacenters as d
JOIN t1
  on t1.datacenter_id = d.datacenter_id
ORDER BY d.datacenter_id ASC;
