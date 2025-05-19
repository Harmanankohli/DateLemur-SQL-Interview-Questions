-- Solution taken from discussion tab
SELECT DISTINCT
ticker,
FIRST_VALUE(TO_CHAR(date,'Mon-YYYY')) OVER (PARTITION BY ticker ORDER BY open DESC) as highest_mth,
FIRST_VALUE(open) OVER(PARTITION BY ticker ORDER BY open DESC) as highest_open,
FIRST_VALUE(TO_CHAR(date,'Mon-YYYY')) OVER (PARTITION BY ticker ORDER BY open ) as lowest_mth,
FIRST_VALUE(open) OVER(PARTITION BY ticker ORDER BY open) as lowest_open
FROM stock_prices
ORDER BY ticker;

-- Solution by ChatGPT:

WITH ranked_data AS (
    SELECT
        ticker,
        TO_CHAR(date, 'Mon-YYYY') AS mon_year,
        open,
        ROW_NUMBER() OVER (PARTITION BY ticker ORDER BY open DESC) AS rn_high,
        ROW_NUMBER() OVER (PARTITION BY ticker ORDER BY open) AS rn_low
    FROM stock_prices
)
SELECT
    ticker,
    MAX(CASE WHEN rn_high = 1 THEN mon_year END) AS highest_mth,
    MAX(CASE WHEN rn_high = 1 THEN open END) AS highest_open,
    MAX(CASE WHEN rn_low = 1 THEN mon_year END) AS lowest_mth,
    MAX(CASE WHEN rn_low = 1 THEN open END) AS lowest_open
FROM ranked_data
GROUP BY ticker
ORDER BY ticker;
