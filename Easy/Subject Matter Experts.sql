SELECT employee_id
FROM employee_expertise
GROUP BY employee_id
HAVING (COUNT(domain) = 1 and sum(years_of_experience) >= 8)
or (COUNT(domain) = 2 and sum(years_of_experience) >= 12);
