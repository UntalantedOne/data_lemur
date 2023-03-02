-- https://datalemur.com/questions/click-through-rate
-- Facebook
-- Diff: Easy

-- Assume you have an events table on app analytics. Write a query to get the app’s click-through rate (CTR %) in 2022. 
-- Output the results in percentages rounded to 2 decimal places.

-- Notes:

-- Percentage of click-through rate = 100.0 * Number of clicks / Number of impressions
-- To avoid integer division, you should multiply the click-through rate by 100.0, not 100.

-- This was not accepted, even though it is completely right

select
app_id,
round(100 * 
sum(case when event_type = 'click' then 1 else 0 end) /
sum(case when event_type = 'impression' then 1 else 0 end), 2) as ctr
from events
where timestamp between '2022-01-01' and '2023-01-01'
group by 1

-- This was accepted

with counter as (
select app_id,
round(sum(case when event_type = 'click' then 1 else 0 end), 2) as clicks,
round(sum(case when event_type = 'impression' then 1 else 0 end), 2) as shows
from events
where timestamp between '2022-01-01' and '2023-01-01'
group by 1)

select app_id,
round(100*(clicks/shows), 2) as ctr
from counter

-- Solution 1 (same as the 1 I did not get accepted):

SELECT
  app_id,
  ROUND(100.0 *
    SUM(CASE WHEN event_type = 'click' THEN 1 ELSE 0 END) /
    SUM(CASE WHEN event_type = 'impression' THEN 1 ELSE 0 END), 2)  AS ctr_rate
FROM events
WHERE timestamp >= '2022-01-01' 
  AND timestamp < '2023-01-01'
GROUP BY app_id;

-- Solution 2:

SELECT
  app_id,
  ROUND(100.0 *
    COUNT(CASE WHEN event_type = 'click' THEN 1 ELSE NULL END) /
    COUNT(CASE WHEN event_type = 'impression' THEN 1 ELSE NULL END), 2)  AS ctr_rate
FROM events
WHERE timestamp >= '2022-01-01' 
  AND timestamp < '2023-01-01'
GROUP BY app_id;

-- Solution 3:

SELECT
  app_id,
  ROUND(100.0 *
    SUM(1) FILTER (WHERE event_type = 'click') /
    SUM(1) FILTER (WHERE event_type = 'impression'), 2) AS ctr_app
FROM events
WHERE timestamp >= '2022-01-01' 
  AND timestamp < '2023-01-01'
GROUP BY app_id;
