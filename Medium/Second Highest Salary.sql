With temp_result as (
SELECT salary,
Rank() over (Order By Salary DESC) AS salary_rank
FROM employee
)
SELECT salary as second_highest_salary
from temp_result
Where salary_rank = 2;

------------------------
-- Best Performance:
SELECT MAX(salary) AS second_highest_salary
FROM employee
WHERE salary < (
    SELECT MAX(salary)
    FROM employee
);
