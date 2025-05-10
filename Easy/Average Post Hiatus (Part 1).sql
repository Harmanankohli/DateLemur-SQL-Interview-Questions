SELECT user_id, 
EXTRACT(DAY FROM (max(post_date) - min(post_date))) as days_between
FROM posts
WHERE EXTRACT(YEAR FROM post_date) = '2021'
GROUP BY user_id
HAVING COUNT(post_content) >= 2;
