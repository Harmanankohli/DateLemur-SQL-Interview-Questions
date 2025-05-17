WITH temp_result as (
SELECT CAST(measurement_time as DATE) as measurement_day, measurement_value,
ROW_NUMBER() OVER (
PARTITION BY CAST(measurement_time as DATE)
ORDER BY measurement_time
) as measurement_num
 FROM measurements
)
SELECT measurement_day,
SUM(CASE WHEN measurement_num % 2 <> 0 THEN measurement_value ELSE 0 END) AS odd_sum,
SUM(CASE WHEN measurement_num % 2 = 0 THEN measurement_value ELSE 0 END) AS even_sum
FROM temp_result
GROUP BY measurement_day
