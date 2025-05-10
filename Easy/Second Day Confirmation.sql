SELECT e.user_id FROM emails e 
LEFT JOIN texts t 
on e.email_id = t.email_id
WHERE t.signup_action = 'Confirmed'
and EXTRACT(Day from (action_date - signup_date)) = 1;
