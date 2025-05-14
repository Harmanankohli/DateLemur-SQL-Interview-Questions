WITH temp_result AS (
SELECT d.department_name, e.name, e.salary,
DENSE_RANK() OVER (PARTITION BY d.department_id ORDER BY e.salary DESC) as ranking
FROM employee e
LEFT JOIN  department d
ON e.department_id= d.department_id
ORDER BY d.department_name ASC, e.salary DESC, e.Name ASC
)
SELECT department_name, name, salary FROM temp_result
WHERE ranking <= 3;
