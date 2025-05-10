SELECT candidate_id from candidates
where skill in ('Python', 'Tableau', 'PostgreSQL')
Group by candidate_id
HAVING Count(skill) = 3;
