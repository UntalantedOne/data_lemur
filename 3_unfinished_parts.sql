-- https://datalemur.com/questions/tesla-unfinished-parts
-- Tesla
-- Diff: easy

-- Tesla is investigating bottlenecks in their production, and they need your help to extract the relevant data. 
-- Write a query that determines which parts have begun the assembly process but are not yet finished.

-- Assumptions

-- Table parts_assembly contains all parts in production.
-- A part with no finish_date is an unfinished part.

-- I simply select all the parts, which are not finished, i.e. the last assembly step does not have a finished_date timestamp
-- Ideally, it would also be nice to calculate which steps take longer, which parts are bottlenecked on which step, but this is already Medium level)

select distinct part from parts_assembly
where assembly_step <=5
and finish_date is null

-- Solution 1:
SELECT part
FROM parts_assembly
WHERE finish_date IS NULL
GROUP BY part;

-- Solution 2:
SELECT DISTINCT part
FROM parts_assembly
WHERE finish_date IS NULL;
