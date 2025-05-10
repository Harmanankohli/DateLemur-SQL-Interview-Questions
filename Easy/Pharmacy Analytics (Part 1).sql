SELECT drug, (total_sales - cogs) as total_profit
FROM pharmacy_sales
Group By drug, total_profit
Order by total_profit DESC
LIMIT 3;
