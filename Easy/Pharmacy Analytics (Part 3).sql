SELECT manufacturer,
CONCAT('$',Round(sum(total_sales) / 10^6), ' million') 
as sale 
FROM pharmacy_sales
group by manufacturer
order by sum(total_sales) desc;
