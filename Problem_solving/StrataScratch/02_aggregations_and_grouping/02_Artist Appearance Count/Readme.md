# 🧩 Artist Appearance Count (ID 9992)

## Description
A music analytics team wants to identify which artists appear most frequently in Spotify's worldwide song rankings. Count the number of times each artist appears in the ranking data.

## Table Schema
* artist
* id
* position
* region
* stream_date

## Goal
Output the artist name and the corresponding number of appearances, ordered by the count in descending order.

## Approach
* **Main idea:** Group the dataset by each artist and aggregate the row count to find total appearances.
* **SQL concept used:** `GROUP BY`, `COUNT(*)`, and `ORDER BY`.
* **Key step:** Order the grouped results by `n_occurences DESC` to rank artists from most to least frequent.

## SQL
```sql
SELECT 
    artist,
    COUNT(*) AS n_occurences
FROM spotify_worldwide_daily_song_ranking
GROUP BY artist
ORDER BY n_occurences DESC;