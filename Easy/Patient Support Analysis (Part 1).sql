With policy_queries as (
SELECT policy_holder_id, COUNT(case_id) as call_count
FROM callers
GROUP BY policy_holder_id
HAVING COUNT(case_id) > 2
ORDER BY COUNT(case_id))
SELECT Count(policy_holder_id)
from policy_queries;
