# Total Cost of Orders

## 📌 Problem

Calculate the total order cost for each customer.

Return:
- Customer ID
- First Name
- Total Order Cost

Sort the result alphabetically by the customer's first name.

---

## 🛠️ SQL Solution

```sql
SELECT
    c.id,
    c.first_name,
    SUM(o.total_order_cost) AS total_order_cost
FROM customers AS c
INNER JOIN orders AS o
    ON c.id = o.cust_id
GROUP BY
    c.id,
    c.first_name
ORDER BY
    c.first_name;
```

---

## 💡 Approach

1. Join the `customers` and `orders` tables using `INNER JOIN`.
2. Group the data by customer ID and first name.
3. Calculate the total order cost using `SUM()`.
4. Sort the result alphabetically by the customer's first name.

---

## 🧠 SQL Concepts

- INNER JOIN
- GROUP BY
- SUM()
- ORDER BY

---

## ✅ Key Learning

- Choose the correct JOIN based on the business requirement.
- Use `GROUP BY` when combining aggregate functions with regular columns.
- Aggregate functions calculate values for each group.