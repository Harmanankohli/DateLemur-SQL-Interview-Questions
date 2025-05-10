SELECT customer_id, 
MAX(purchase_amount) as purchase_amount
from transactions
GROUP BY customer_id
ORDER BY purchase_amount desc;
