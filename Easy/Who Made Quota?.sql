WITH sales_tmp as (
SELECT d.employee_id, s.quota, SUM(d.deal_size) as total_deal_size
FROM deals d
LEFT JOIN sales_quotas s
ON d.employee_id = s.employee_id
GROUP BY d.employee_id, s.quota
ORDER BY d.employee_id ASC
)
SELECT employee_id,
CASE WHEN total_deal_size >= quota THEN 'yes' ELSE 'no'
END as made_quota
FROM sales_tmp;
