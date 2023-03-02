-- https://datalemur.com/questions/matching-skills
-- From Linkedin
-- Diff: Easy

-- Given a table of candidates and their skills, you're tasked with finding the candidates best suited for an open Data Science job.
-- You want to find candidates who are proficient in Python, Tableau, and PostgreSQL.

-- Write a query to list the candidates who possess all of the required skills for the job. Sort the output by candidate ID in ascending order.

-- Assumption:

-- There are no duplicates in the candidates table.

-- candidates Table:
-- Column Name	Type
-- candidate_id	integer
-- skill	varchar



-- All the SQL code will be lower case, as upper case SQL is laughed at by every community I've been in
-- Personally am a fan of CTEs
-- I think it would be easier to solve that way and more readable
-- I select only candidates having at least 1 of the skills
-- Also select 1 as counter
-- IMO, in real-life for the task it may be beneficial to also know who posseses 2 skills
-- So I leave leaway then

with skills as (
select candidate_id,
skill,
1 as counter
from candidates
where skill in ('Python', 'Tableau', 'PostgreSQL'))
select candidate_id from skills
group by 1 having sum(counter) = 3


-- Official solution:

SELECT candidate_id
FROM candidates
WHERE skill IN ('Python', 'Tableau', 'PostgreSQL')
GROUP BY candidate_id
HAVING COUNT(skill) = 3
ORDER BY candidate_id;
