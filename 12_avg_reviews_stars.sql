-- https://datalemur.com/questions/sql-avg-review-ratings
-- Amazon
-- Diff: Easy

-- Given the reviews table, write a query to get the average stars for each product every month.

-- The output should include the month in numerical value, product id, and average star rating rounded to two decimal places.
-- Sort the output based on month followed by the product id.

select
extract(month from submit_date) as mth,
product_id,
round(avg(stars), 2) as avg_stars
from reviews
group by 1, 2
order by 1, 2

-- Official solution is the same
