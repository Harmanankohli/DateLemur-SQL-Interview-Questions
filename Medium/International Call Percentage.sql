--Solution: https://www.youtube.com/watch?v=2gqxdILHmOM

WITH temp_result as (
SELECT 
COUNT(*) as total_calls,
SUM(CASE WHEN ci.country_id != ri.country_id then 1 else 0 end) as international_calls
FROM phone_calls as pc
JOIN phone_info as ci on ci.caller_id = pc.caller_id
JOIN phone_info as ri on ri.caller_id = pc.receiver_id
)
SELECT round((100.0*international_calls / total_calls),1)
FROM temp_result;
