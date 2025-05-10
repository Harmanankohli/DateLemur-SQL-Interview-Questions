SELECT Round(CAST((SUM(item_count * order_occurrences) / SUM(order_occurrences)) as Numeric),1) AS mean
FROM items_per_order;
