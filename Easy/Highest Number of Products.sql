Select user_id, COUNT(product_id) AS prod_num from user_transactions
GROUP BY user_id
HAVING SUM(spend) >= 1000
ORDER BY COUNT(product_id) desc, SUM(spend) DESC
LIMIT 3;
