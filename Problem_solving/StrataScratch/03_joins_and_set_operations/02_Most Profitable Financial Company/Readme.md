# 🧩 Most Profitable Financial Company (ID 9663)

## Description
Find the most profitable company from the financial sector. Output the result along with the continent.

## Table Schema
* assets
* company
* continent
* country
* industry
* marketvalue
* profits
* rank
* sector

## Goal
Output the company name and its continent for the company with the highest profits in the 'Financials' sector.

## Approach
* **Main idea:** Use a Common Table Expression (CTE) to find the maximum profit within the financial sector, then join it back to the main table to retrieve the corresponding company and continent.
* **SQL concept used:** `WITH` clause (CTE), aggregate function `MAX()`, `INNER JOIN`, and `WHERE` filtering.
* **Key step:** Filter by `sector = 'Financials'` in both the subquery/CTE and the main query to isolate financial companies before matching on maximum profit.

## SQL
```sql
WITH max_profits AS (
    SELECT 
        MAX(profits) AS max_profits
    FROM forbes_global_2010_2014
    WHERE sector = 'Financials'
)
SELECT 
    company,
    continent
FROM forbes_global_2010_2014
JOIN max_profits
  ON forbes_global_2010_2014.profits = max_profits.max_profits
WHERE sector = 'Financials';