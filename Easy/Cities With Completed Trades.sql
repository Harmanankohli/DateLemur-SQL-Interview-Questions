SELECT u.city, COUNT(t.order_id) as total_orders
FROM users u 
LEFT Join trades t
on u.user_id = t.user_id
WHERE t.status = 'Completed'
Group by u.city
ORDER BY total_orders DESC
LIMIT 3;
