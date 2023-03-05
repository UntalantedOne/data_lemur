-- https://datalemur.com/questions/cards-issued-difference
-- JP Morgan
-- Diff: Easy

-- Your team at JPMorgan Chase is soon launching a new credit card, and to gain some context, you are analyzing how many credit cards were issued each month.

-- Write a query that outputs the name of each credit card and the difference in issued amount between the month with the most cards issued, 
-- and the least cards issued. Order the results according to the biggest difference.


select card_name,
max(issued_amount) - min(issued_amount) as difference
from monthly_cards_issued
group by 1
order by 2 desc;

-- Same as of solution
