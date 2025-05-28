-- Reference: https://www.youtube.com/watch?v=Nw3dikSSCxk
WITH temp_result as (
SELECT name, category, product_id,
COUNT(category) over (ORDER BY product_id ASC) as count_track
FROM products
)
SELECT product_id, 
FIRST_VALUE(category) OVER(PARTITION BY count_track ORDER BY product_id ASC) as category,
name
FROM temp_result
