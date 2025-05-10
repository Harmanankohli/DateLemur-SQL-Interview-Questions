SELECT merchant_id, 
SUM(CASE WHEN lower(payment_method) like '%apple pay%' then transaction_amount
else 0 end) AS total_transaction
from transactions
GROUP BY merchant_id
order by total_transaction desc;
