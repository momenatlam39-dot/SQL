# StrataScratch - Finding User Purchases

###  Problem Info
* **Platform:** [StrataScratch](https://platform.stratascratch.com/coding/10322-finding-user-purchases)
* **Problem ID:** `10322`
* **Difficulty:** `Medium`
* **Company:** `Amazon`
* **SQL Dialect:** `PostgreSQL`

---

##  Problem Description
Identify returning active users by finding users who made a second purchase within **1 to 7 days** after their first purchase. 
* *Note:* Ignore same-day purchases (where the difference between purchase dates is 0).
* *Output:* A list of unique `user_id`s.

---

##  Database Schema
### `amazon_transactions`
| Column Name | Data Type | Description |
| :--- | :--- | :--- |
| `id` | `bigint` | Unique transaction ID |
| `user_id` | `bigint` | Unique identifier for each user |
| `item` | `text` | Name of the purchased item |
| `created_at` | `date` | Date of the transaction |
| `revenue` | `bigint` | Revenue generated from the transaction |

---

##  Solution Approach
To solve this problem efficiently:
1. **Identify the first purchase date** for each user using a Common Table Expression (CTE) with the `MIN(created_at)` function.
2. **Join the original table** with the CTE on `user_id` to compare subsequent purchases with their first purchase.
3. **Filter the results** where the difference between transaction dates is `BETWEEN 1 AND 7` days. This automatically excludes same-day purchases (0 days difference).
4. **Select unique users** using `DISTINCT` to avoid duplicate records.

---

##  SQL Query

```sql
WITH first_purchases AS (
    SELECT 
        user_id, 
        MIN(created_at) AS first_purchase_date
    FROM amazon_transactions
    GROUP BY user_id
)

SELECT DISTINCT t.user_id
FROM amazon_transactions t
JOIN first_purchases f 
  ON t.user_id = f.user_id
WHERE t.created_at - f.first_purchase_date BETWEEN 1 AND 7;