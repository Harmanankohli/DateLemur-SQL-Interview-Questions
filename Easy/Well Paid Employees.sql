SELECT e1.employee_id, e1.name FROM employee e1
inner join employee e2
on e1.manager_id = e2.employee_id
where e1.salary > e2.salary;
