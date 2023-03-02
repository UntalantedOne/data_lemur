-- https://datalemur.com/questions/sql-page-with-no-likes
-- Facebook
-- Diff: Easy

-- Assume you are given the tables below about Facebook pages and page likes. 
-- Write a query to return the page IDs of all the Facebook pages that don't have any likes. The output should be in ascending order.

-- The easiest solution would be to left join on a Null with likes table
-- I like to write left join with a subquery, as it became a habit after using column-oriented DB, as it allowed to make queries more efficient
-- By joining only a needed number of columns from a table, intead of joining every single one


select a.page_id from pages a
left join (select distinct page_id from page_likes) b
on a.page_id = b.page_id
where b.page_id is null
order by a.page_id asc
