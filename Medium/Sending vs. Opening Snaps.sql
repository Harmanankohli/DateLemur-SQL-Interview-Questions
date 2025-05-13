SELECT ab.age_bucket,
ROUND((100.0 * SUM(CASE WHEN LOWER(a.activity_type) = 'send' THEN a.time_spent ELSE 0 END) / 
SUM(a.time_spent)),2)
as send_perc,
ROUND((100.0 * SUM(CASE WHEN LOWER(a.activity_type) = 'open' THEN a.time_spent ELSE 0 END) / 
SUM(a.time_spent )),2)
as open_perc
FROM activities a
LEFT JOIN age_breakdown ab
ON a.user_id = ab.user_id
WHERE LOWER(a.activity_type) in ('open','send')
GROUP BY ab.age_bucket
