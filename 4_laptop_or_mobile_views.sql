-- https://datalemur.com/questions/laptop-mobile-viewership
-- NYT
-- Diff: Easy

-- This is the same question as problem #3 in the SQL Chapter of Ace the Data Science Interview!

-- Assume that you are given the table below containing information on viewership by device type (where the three types are laptop, tablet, and phone). 
-- Define “mobile” as the sum of tablet and phone viewership numbers. Write a query to compare the viewership on laptops versus mobile devices.

-- Output the total viewership for laptop and mobile devices in the format of "laptop_views" and "mobile_views".

-- Using simple sum() with case statement

select
sum(case when device_type = 'laptop' then 1 else 0 end) as laptop_views,
sum(case when device_type != 'laptop' then 1 else 0 end) as mobile_views
from viewership

-- Solution 1 is the same as mine, the only difference is:
SUM(CASE WHEN device_type IN ('tablet', 'phone') THEN 1 ELSE 0 END) AS mobile_views
-- But as there only 3 device types, doesn't matter

-- Solution 2 uses count() + case statement:
SELECT 
  COUNT(CASE WHEN device_type = 'laptop' THEN 1 ELSE NULL END) AS laptop_views, 
  COUNT(CASE WHEN device_type IN ('tablet', 'phone') THEN 1 ELSE NULL END) AS mobile_views 
FROM viewership;
