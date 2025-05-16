-- Latest Solution:
SELECT cc.customer_id
FROM customer_contracts cc
JOIN products p ON cc.product_id = p.product_id
GROUP BY cc.customer_id
HAVING COUNT(DISTINCT p.product_category) = (
    SELECT COUNT(DISTINCT product_category) FROM products
);


/* Earlier Solution - Even though this works, it is:

1. Less performant than COUNT(DISTINCT ...)
2. More prone to break if:
3. Categories contain trailing spaces
4. Collation/locale sorting changes
5. NULL values sneak in
*/
------------------------------------------
SELECT cc.customer_id
FROM customer_contracts cc
LEFT JOIN products p 
on cc.product_id = p.product_id
GROUP BY cc.customer_id
HAVING STRING_AGG(DISTINCT p.product_category, ', ' ORDER BY p.product_category ASC) = 
(SELECT STRING_AGG(DISTINCT product_category, ', ' ORDER BY product_category ASC) FROM products)
*/
