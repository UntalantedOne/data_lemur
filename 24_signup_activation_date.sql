-- https://datalemur.com/questions/signup-confirmation-rate
-- TikTok
-- Diff: Medium


-- Make a CTE to decide whether user completed text confirmation once (no matter how many texts they got)
with aggreg as (
select 
e.email_id,
1 as counter,
max(case when signup_action = 'Confirmed' then 1 else 0 end)::decimal as confirmed
from emails e
left join texts t
on e.email_id = t.email_id
group by 1, 2)
-- Just count confirmed users from CTE to all users
select round(sum(confirmed)::decimal / sum(counter)::decimal, 2) as confirm_rate
from aggreg

-- Solution 1:

WITH rate AS (
SELECT
  user_id,
  CASE WHEN texts.email_id IS NOT NULL THEN 1
    ELSE 0 END AS activation_count
FROM emails
LEFT JOIN texts
  ON emails.email_id = texts.email_id
  AND signup_action = 'Confirmed'
)
  
SELECT 
  ROUND(
    SUM(activation_count)::DECIMAL 
      / COUNT(user_id), 2) AS activation_rate
FROM rate;

-- Solution 2:

SELECT
  ROUND(
    SUM(
      CASE WHEN texts.email_id IS NOT NULL THEN 1
      ELSE 0 END)::DECIMAL
    / COUNT(user_id),2) AS activation_rate
FROM emails
LEFT JOIN texts
  ON emails.email_id = texts.email_id
  AND signup_action = 'Confirmed';
