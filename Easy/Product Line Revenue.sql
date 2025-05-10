SELECT p.product_line, SUM(t.amount) as total_revenue
FROM product_info p
LEFT JOIN transactions t
ON p.product_id = t.product_id
GROUP BY p.product_line
ORDER BY total_revenue DESC;
