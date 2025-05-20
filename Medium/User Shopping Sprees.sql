--Solution given on the website:
SELECT T1.user_id
from transactions T1
INNER JOIN transactions T2
on DATE(T2.transaction_date) = DATE(T1.transaction_date) + 1
INNER JOIN transactions T3
ON DATE(T3.transaction_date) = DATE(T1.transaction_date) + 2
WHERE T1.user_id = T2.user_id and T2.user_id = T3.user_id
order by T1.user_id;

-- Creative Solution given in discussion form:
WITH temp_result as
(SELECT user_id, transaction_date,
LEAD(transaction_date,1) OVER(PARTITION BY user_id ORDER BY transaction_date asc) as next_date1,
LEAD(transaction_date,2) OVER(PARTITION BY user_id ORDER BY transaction_date asc) as next_date2
from transactions)
SELECT user_id from temp_result
where EXTRACT(DAY FROM next_date1 - transaction_date) = 1
and EXTRACT(DAY FROM next_date2 - next_date1) = 1

--Similar Solution by me using LAG
WITH temp_result as(
SELECT user_id, transaction_date,
LAG(transaction_date,1) OVER(PARTITION BY user_id ORDER BY transaction_date asc) as prev_date1,
LAG(transaction_date,2) OVER(PARTITION BY user_id ORDER BY transaction_date asc) as prev_date2
from transactions
)
SELECT user_id from temp_result
where EXTRACT(DAY FROM transaction_date - prev_date1) = 1
and EXTRACT(DAY FROM prev_date1 - prev_date2) = 1
