-- https://datalemur.com/questions/duplicate-job-listings
-- LinkedIn
-- Diff: Easy

-- This is the same question as problem #8 in the SQL Chapter of Ace the Data Science Interview!

-- Assume you are given the table below that shows job postings for all companies on the LinkedIn platform. 
-- Write a query to get the number of companies that have posted duplicate job listings.

-- Clarification:

-- Duplicate job listings refer to two jobs at the same company with the same title and description.


-- Just writing a cte to catch all the duplicates

with dups as 
(
select title,
description,
company_id,
count(job_id)
from job_listings
group by 1,2,3
having count(job_id) > 1
)
select count(company_id) from dups



--Solution 1:

WITH jobs_grouped AS (
  SELECT 
    company_id, 
    title, 
    description, 
    COUNT(job_id) AS job_count
  FROM job_listings
  GROUP BY 
    company_id, 
    title, 
    description)

SELECT COUNT(DISTINCT company_id) AS co_w_duplicate_jobs
FROM jobs_grouped
WHERE job_count > 1;

-- Solution 2:
SELECT COUNT(DISTINCT company_id) AS co_w_duplicate_jobs
FROM (
  SELECT 
    company_id, 
    title, 
    description, 
    COUNT(job_id) AS job_count
  FROM job_listings
  GROUP BY 
    company_id, 
    title, 
    description) AS jobs_grouped
WHERE job_count > 1;
