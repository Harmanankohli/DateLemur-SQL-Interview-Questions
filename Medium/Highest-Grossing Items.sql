With temp_result as (
SELECT category, product,
SUM(spend) as total_spend,
RANK() over (PARTITION BY category order by SUM(spend) DESC) AS prod_rank
FROM product_spend
WHERE EXTRACT(YEAR FROM transaction_date) = 2022
GROUP BY category, product
)
SELECT category, product, total_spend
FROM temp_result
WHERE prod_rank <=2 ;
