-- https://datalemur.com/questions/frequently-purchased-pairs
-- Walmart
-- Diff: Medium


-- Seems like too easy for a medium difficulty question
select count(*) from 
(select transaction_id,
count(distinct product_id)  as counter
from transactions 
group by transaction_id) sub
where counter >= 2

-- While official solution does self-join:
SELECT COUNT(DISTINCT CONCAT(t1.product_id, t2.product_id)) AS unique_pairs
FROM transactions t1 
JOIN transactions t2 
  ON t1.transaction_id = t2.transaction_id
  AND t1.product_id > t2.product_id;
