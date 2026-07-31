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