WITH temp_result as (
SELECT
COUNT(*) as total_calls,
SUM(CASE WHEN call_category = 'n/a' or call_category is NULL THEN 1 ELSE 0 END) as uncategorised_calls
FROM callers
)
SELECT round((100.0*uncategorised_calls / total_calls),1) as uncategorised_call_pct
FROM temp_result
