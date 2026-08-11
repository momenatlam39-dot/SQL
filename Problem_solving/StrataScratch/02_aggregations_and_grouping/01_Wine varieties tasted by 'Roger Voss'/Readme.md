# 🧩 Wine varieties tasted by 'Roger Voss' (ID 10024)

## Description
Find wine varieties tasted by 'Roger Voss' that have a value in the 'region_1' column of the dataset. Output unique variety names only.

## Table Schema
* country
* description
* designation
* id
* points
* price
* province
* region_1
* region_2
* taster_name
* taster_twitter_handle
* title
* variety
* winery

## Goal
Return unique variety names tasted by Roger Voss with a non-null `region_1` value.

## Approach
* **Main idea:** Filter rows by taster name and non-null region, then extract unique wine varieties.
* **SQL concept used:** `WHERE` filtering, `IS NOT NULL`, and `DISTINCT`.
* **Key step:** Use `DISTINCT` to remove duplicate variety names from the output.

## SQL
```sql
SELECT DISTINCT 
    variety
FROM winemag_p2
WHERE taster_name = 'Roger Voss' 
  AND region_1 IS NOT NULL;