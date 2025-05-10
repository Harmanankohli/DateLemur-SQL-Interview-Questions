SELECT 
Round(100.0*SUM(CASE WHEN event_type = 'webinar' then 1 else 0 end ) / COUNT(*),0)
as webinar_pct
FROM marketing_touches 
WHERE EXTRACT(YEAR FROM event_date) = '2022'
AND EXTRACT(MONTH FROM event_date) = '4'
