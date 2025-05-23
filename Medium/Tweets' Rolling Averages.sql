SELECT user_id, tweet_date,
round(AVG(tweet_count) OVER (PARTITION BY user_id
ORDER BY tweet_date
ROWS BETWEEN 2 PRECEDING AND CURRENT ROW),2) as rolling_avg_3d
FROM tweets;
