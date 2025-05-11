WITH temp_result as (
SELECT user_id, 
spend, transaction_date,
ROW_NUMBER() OVER (
PARTITION BY user_id
ORDER BY transaction_date) AS row_num FROM transactions
)
SELECT user_id, 
spend, transaction_date from temp_result
WHERE row_num = 3;
