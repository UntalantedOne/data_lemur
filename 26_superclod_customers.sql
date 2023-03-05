-- https://datalemur.com/questions/supercloud-customer
-- Microsoft
-- Diff: Medium

-- Seems like a very uncomplicated task for this difficulty

select customer_id from customer_contracts cc
join products p
on cc.product_id = p.product_id
group by 1 having count(distinct product_category) = 3

-- While official solution is overcomplicating easy concepts:

WITH supercloud AS (
SELECT 
  customers.customer_id, 
  COUNT(DISTINCT products.product_category) as unique_count
FROM customer_contracts AS customers
LEFT JOIN products 
  ON customers.product_id = products.product_id
GROUP BY customers.customer_id
)

SELECT customer_id
FROM supercloud
WHERE unique_count = (
  SELECT COUNT(DISTINCT product_category) 
  FROM products)
ORDER BY customer_id;
