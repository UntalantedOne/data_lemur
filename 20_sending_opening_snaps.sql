-- https://datalemur.com/questions/time-spent-snaps
-- Snapchat
-- Diff: Medium


with time_tots as (
select user_id,
sum(case when activity_type = 'send' then time_spent
else NULL end) as send_time,
sum(case when activity_type = 'open' then time_spent
else null end) as open_time
from activities
group by 1
)
select ab.age_bucket,
round(100.0 * send_time / (send_time + open_time),2) as send_perc,
round(100.0 * open_time / (send_time + open_time),2) as open_perc
from time_tots tt
left join age_breakdown ab
on tt.user_id = ab.user_id
group by age_bucket,send_time,open_time

-- Solution 1 is the same

-- Solution 2:

SELECT 
  age.age_bucket, 
  ROUND(100.0 * 
    SUM(activities.time_spent) FILTER (WHERE activities.activity_type = 'send')/
      SUM(activities.time_spent),2) AS send_perc, 
  ROUND(100.0 * 
    SUM(activities.time_spent) FILTER (WHERE activities.activity_type = 'open')/
      SUM(activities.time_spent),2) AS open_perc
FROM activities
INNER JOIN age_breakdown AS age 
  ON activities.user_id = age.user_id 
WHERE activities.activity_type IN ('send', 'open') 
GROUP BY age.age_bucket;
