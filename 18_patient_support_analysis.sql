-- p1: https://datalemur.com/questions/frequent-callers
-- p2: https://datalemur.com/questions/uncategorized-calls-percentage
-- United Health
-- Diff: Easy

-- p1:

with callers_3 as (
select
policy_holder_id,
count(case_id) as counter
from callers
group by 1 having count(case_id) >= 3)
select count(policy_holder_id) from callers_3

-- p2:
select
round(100 * sum(case when call_category is null or call_category = 'n/a'
then 1 else 0 end)::decimal /
count(case_id)::decimal, 1) as call_percentage
from callers
