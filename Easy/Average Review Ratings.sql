SELECT EXTRACT(Month from submit_date) as mth,
product_id as product, Round(AVG(stars),2) as avg_stars
FROM reviews
GRoup By mth, product
Order by mth, product;
