-- https://datalemur.com/questions/top-fans-rank
-- Spotify
-- Diff: Medium

-- This is a sad-sad, very sad task...

-- My solution:
with apperances as (
select a.artist_name, 
a.artist_id,
count(gsr.song_id) as appereance
from artists a
join songs s
on a.artist_id = s.artist_id
join (select song_id from global_song_rank gsr
where gsr.rank <= 10) gsr
on s.song_id = gsr.song_id
group by 1, 2),

pre_final as
(
select artist_name,
dense_rank() over(order by appereance desc) as artist_rank
from apperances
)
select * from pre_final
where artist_rank < 6


-- It is a sad task, as it requires to only pick artists with dense rank < 6, requiring to filter the data with a second CTE.
-- Furthermore, my solution above was not accepted, as the results after running my query put Adele and Lady Gaga (same rank) in reverse order
-- Compared to official solution, so had to add `order by 2 asc, 1 asc`

-- Official solution:

WITH top_artists
AS (
  SELECT 
    artist_id,
    DENSE_RANK() OVER (
      ORDER BY song_count DESC) AS artist_rank
  FROM (    
    SELECT songs.artist_id, COUNT(songs.song_id) AS song_count
    FROM songs
    INNER JOIN global_song_rank AS ranking
      ON songs.song_id = ranking.song_id
    WHERE ranking.rank <= 10
    GROUP BY songs.artist_id) 
AS top_songs)

SELECT 
  artists.artist_name, top_artists.artist_rank
FROM top_artists
INNER JOIN artists
  ON top_artists.artist_id = artists.artist_id
WHERE top_artists.artist_rank <= 5
ORDER BY top_artists.artist_rank, artists.artist_name;
