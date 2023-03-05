-- https://datalemur.com/questions/sql-highest-grossing
-- Amazon
-- Diff: Medium

-- Once again using window function with a CTE to rank products within categories and then picking only needed ranks
with ranking as (select category, product,
sum(spend) as total_spend,
row_number() over(partition by category order by sum(spend) desc) as rank
from product_spend
where transaction_date between '2022-01-01' and '2023-01-01'
group by 1, 2)
select category, product, total_spend
from ranking
where rank <= 2


-- IMO, official solution is more complex than it should be, as it uses 2 ctes consecutively, which is unnecessary

WITH product_category_spend AS (
SELECT 
  category, 
  product, 
  SUM(spend) AS total_spend 
FROM product_spend 
WHERE transaction_date >= '2022-01-01' 
  AND transaction_date <= '2022-12-31' 
GROUP BY category, product
),
top_spend AS (
SELECT *, 
  RANK() OVER (
    PARTITION BY category 
    ORDER BY total_spend DESC) AS ranking 
FROM product_category_spend)

SELECT category, product, total_spend 
FROM top_spend 
WHERE ranking <= 2 
ORDER BY category, ranking;
