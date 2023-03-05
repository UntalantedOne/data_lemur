-- https://datalemur.com/questions/second-day-confirmation
-- TikTok
-- Diff: Easy

-- New TikTok users sign up with their emails and each user receives a text confirmation to activate their account.
-- Assume you are given the below tables about emails and texts.

-- Write a query to display the ids of the users who did not confirm on the first day of sign-up, but confirmed on the second day.

-- Assumption:

-- action_date is the date when the user activated their account and confirmed their sign-up through the text.


-- once again, joining a subquery to have more readability and better performance in case of using column DB

select user_id from emails em
left join (select email_id,
action_date
from texts
where signup_action = 'Confirmed'
) t
on em.email_id = t.email_id
where extract(DOY from action_date) - extract(DOY from signup_date) = 1

-- Official solution:

SELECT DISTINCT user_id
FROM emails 
INNER JOIN texts
  ON emails.email_id = texts.email_id
WHERE texts.action_date = emails.signup_date + INTERVAL '1 day'
  AND texts.signup_action = 'Confirmed';
