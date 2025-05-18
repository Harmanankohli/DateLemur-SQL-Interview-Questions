-- Taken from discussion
SELECT order_id as corrected_order_id,
COALESCE(
CASE  
    WHEN order_id % 2 <> 0 THEN LEAD(item) OVER (ORDER BY order_id) 
    WHEN order_id % 2 = 0 THEN LAG(item) OVER (ORDER BY order_id)
  END, item) as item
FROM orders 

-- Solution from chatgpt  
WITH paired_orders AS (
  SELECT 
    order_id,
    item,
    LEAD(item) OVER (ORDER BY order_id) AS next_item,
    LAG(item) OVER (ORDER BY order_id) AS prev_item
  FROM orders
)

SELECT 
  order_id,
  CASE
    WHEN MOD(order_id, 2) = 1 AND next_item IS NOT NULL THEN next_item
    WHEN MOD(order_id, 2) = 0 THEN prev_item
    ELSE item
  END AS corrected_item
FROM paired_orders
ORDER BY order_id;
