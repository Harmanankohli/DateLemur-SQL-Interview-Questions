WITH temp_result as (
SELECT card_name, issued_amount, issue_month, issue_year,
DENSE_RANK() OVER(PARTITION BY card_name ORDER BY issue_year ASC, issue_month ASC)
AS cr
FROM monthly_cards_issued
)
SELECT card_name, issued_amount
FROM temp_result
WHERE cr = 1
ORDER BY issued_amount DESC;
