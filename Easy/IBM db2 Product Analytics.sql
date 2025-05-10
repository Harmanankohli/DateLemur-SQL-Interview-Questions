WITH trend_queries as (
SELECT e.employee_id, 
COALESCE(COUNT(DISTINCT q.query_id),0) as unique_queries
FROM employees e
LEFT JOIN queries q
on e.employee_id = q.employee_id
and EXTRACT(MONTH FROM q.query_starttime) IN (7,8,9)
GROUP By e.employee_id
)
SELECT unique_queries, COUNT(employee_id) AS employee_count
FROM trend_queries
GROUP BY unique_queries
ORDER by unique_queries asc;
