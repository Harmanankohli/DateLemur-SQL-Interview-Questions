SELECT COUNT(business_id) as business_count,
round(100.0 * COUNT(business_id) / (SELECT COUNT(business_id) FROM reviews),0) as top_rated_pct
FROM reviews
where review_stars >= 4;
