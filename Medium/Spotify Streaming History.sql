WITH weekly_plays AS (
    SELECT 
        user_id, 
        song_id, 
        COUNT(*) AS song_plays
    FROM songs_weekly
    WHERE listen_time < '2022-08-05'
    GROUP BY user_id, song_id
),
combined as (
SELECT user_id, song_id, song_plays from songs_history
UNION ALL
SELECT * FROM weekly_plays
)

SELECT user_id, song_id, SUM(song_plays) as song_plays
FROM combined
GROUP BY user_id, song_id
ORDER BY song_plays DESC;
