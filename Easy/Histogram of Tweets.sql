With tweets_2022 as (
Select COUNT(msg) as tweets_count, user_id from tweets
where EXTRACT(YEAR FROM tweet_date) = 2022
GROUP BY user_id
)
Select tweets_count, COUNT(user_id)  from tweets_2022
GROUP BY tweets_count;
