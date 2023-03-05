-- https://datalemur.com/questions/sql-third-transaction
-- Uber
-- Diff: Medium

with transact_dt AS
(
select rank() over (partition by user_id order by 
transaction_date asc) as rank_tr,
user_id,
spend,
transaction_date
from transactions
)
select user_id,
spend,
transaction_date from transact_dt
where rank_tr = 3

-- Official solution is the same/using subquery
