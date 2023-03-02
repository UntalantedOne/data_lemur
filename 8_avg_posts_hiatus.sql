-- https://datalemur.com/questions/sql-average-post-hiatus-1
-- Facebook
-- Diff: Easy

-- Given a table of Facebook posts, for each user who posted at least twice in 2021, 
-- write a query to find the number of days between each user’s first post of the year and last post of the year in the year 2021. 
-- Output the user and number of the days between each user's first and last post.


-- Select only users with 2 posts at least

with posters as (
select user_id, count(post_id) as counter
from posts
-- User extract, as postgresql does not have year() function
where extract(year from (post_date)) = 2021
group by 1 having count(post_id) > 1)
select p.user_id, 
-- Use extract(), as postgresql does not have date_diff
  extract(day from (max(post_date) - min(post_date))) as days_between
from posts p
join posters ps
on p.user_id = ps.user_id


Official solution:
SELECT 
	user_id, 
    MAX(post_date::DATE) - MIN(post_date::DATE) AS days_between
FROM posts
WHERE DATE_PART('year', post_date::DATE) = 2021 
GROUP BY user_id
HAVING COUNT(post_id)>1;

More concise certainly, but I personally dislike `group by having` without selecting the field
