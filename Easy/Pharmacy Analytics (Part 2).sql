SELECT manufacturer, COUNT(drug) as drug_count,
abs(sum(total_sales - cogs)) as total_loss
FROM pharmacy_sales
Where (total_sales - cogs) <= 0
GROUP BY manufacturer
order by total_loss desc;
