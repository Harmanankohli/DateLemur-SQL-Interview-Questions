WITH temp_result as (
SELECT transaction_date, user_id, COUNT(product_id) AS purchase_count,
DENSE_RANK() OVER(PARTITION BY user_id ORDER BY transaction_date DESC ) AS tr
FROM user_transactions
GROUP BY transaction_date, user_id
ORDER BY transaction_date
)
SELECT transaction_date, user_id, purchase_count
FROM temp_result
WHERE tr = 1;
