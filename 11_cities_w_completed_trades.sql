-- https://datalemur.com/questions/completed-trades
-- Robinhood
-- Diff: Easy

-- Simple join
select u.city, count(order_id) from trades t
join users u on t.user_id = u.user_id
where status = 'Completed'
group by 1
order by 2 desc
limit 3

-- Full solution is the same
