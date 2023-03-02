-- https://datalemur.com/questions/laptop-mobile-viewership
-- NYT
-- Diff: Easy

-- This is the same question as problem #3 in the SQL Chapter of Ace the Data Science Interview!

-- Assume that you are given the table below containing information on viewership by device type (where the three types are laptop, tablet, and phone). 
-- Define “mobile” as the sum of tablet and phone viewership numbers. Write a query to compare the viewership on laptops versus mobile devices.

-- Output the total viewership for laptop and mobile devices in the format of "laptop_views" and "mobile_views".

-- Once again using cte to select only necessary rows before aggregating, can be done differently, but I find CTEs the most readable
-- Aggregating through case statement

with counter as(
select case when device_type = 'laptop' then count(user_id) else 0
end as laptop_views,
case when device_type in ('phone','tablet') then count(user_id) else 0
end as mobile_views
from viewership
group by device_type
)
select sum(laptop_views) as laptop_views,
sum(mobile_views) as mobile_views
from counter

-- Solution 1:
SELECT 
  SUM(CASE WHEN device_type = 'laptop' THEN 1 ELSE 0 END) AS laptop_views, 
  SUM(CASE WHEN device_type IN ('tablet', 'phone') THEN 1 ELSE 0 END) AS mobile_views 
FROM viewership;

-- Solution 2:
SELECT 
  COUNT(CASE WHEN device_type = 'laptop' THEN 1 ELSE NULL END) AS laptop_views, 
  COUNT(CASE WHEN device_type IN ('tablet', 'phone') THEN 1 ELSE NULL END) AS mobile_views 
FROM viewership;

