# 🧩 Order Details (ID 9913)

## Description
Find order details made by Jill and Eva. Consider Jill and Eva as first names of customers. Output the order date, details, and cost along with the first name. Order records based on the customer id in ascending order.

## Table Schema
**customers**
* address
* city
* first_name
* id
* last_name

**orders**
* cust_id
* id
* order_date
* order_details
* total_order_cost

## Goal
Output `first_name`, `order_date`, `order_details`, and `total_order_cost` for customers named 'Jill' or 'Eva', ordered by customer `id` in ascending order.

## Approach
* **Main idea:** Join the `orders` table with the `customers` table on customer IDs, filter for customers named 'Jill' or 'Eva', and sort the results by customer ID.
* **SQL concept used:** `INNER JOIN`, `WHERE ... IN (...)`, and `ORDER BY`.
* **Key step:** Join `customers.id` with `orders.cust_id` and sort explicitly using `c.id ASC`.

## SQL
```sql
SELECT 
    first_name,
    order_date,
    order_details,
    total_order_cost
FROM orders AS o
JOIN customers AS c
  ON c.id = o.cust_id
WHERE c.first_name IN ('Jill', 'Eva')
ORDER BY c.id;