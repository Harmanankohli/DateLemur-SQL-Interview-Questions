SELECT app_id,
ROUND((100.0 * 
SUM(CASE WHEN event_type = 'click' then 1 else 0 end) / 
SUM(CASE WHEN event_type = 'impression' then 1 else 0 end)),2) as ctr
FROM events
WHERE EXTRACT(YEAR FROM timestamp) = 2022
Group by app_id;
