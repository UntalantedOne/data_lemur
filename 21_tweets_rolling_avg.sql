-- https://datalemur.com/questions/rolling-average-tweets
-- Twitter
-- Diff: Medium


-- First time using window function
with selected_tweets as (select user_id,
tweet_date,
count(tweet_id) as counter
from tweets
group by 1, 2
order by 1, 2)

select user_id,
tweet_date,
round(avg(counter) over(partition by user_id
order by user_id, tweet_date
rows between 2 preceding and current row), 2)
from selected_tweets

-- Official solutions are the same, either using CTE or subquery
