SELECT p.page_id FROM 
pages p
LEFT JOIN page_likes pl
On p.page_id = pl.page_id
WHERE pl.liked_date is NULL
ORDER BY p.page_id;
