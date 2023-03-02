-- https://datalemur.com/questions/teams-power-users
-- Microsoft
-- Diff: Easy

-- Write a query to find the top 2 power users who sent the most messages on Microsoft Teams in August 2022. 
-- Display the IDs of these 2 users along with the total number of messages they sent. Output the results in descending count of the messages.

-- Assumption:

-- No two users has sent the same number of messages in August 2022.

-- Count all messages
select sender_id,
count(message_id)
from messages
-- Specify year and month
where extract(Year from sent_date) = 2022
and extract(month from sent_date) = 8
group by 1
-- Sort and leave only top 2
order by 2 desc
limit 2

Official solution is the same
