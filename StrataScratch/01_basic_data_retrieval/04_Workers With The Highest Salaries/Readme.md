# Highest Paid Employee Title

##  Problem

Find the title(s) of the worker(s) with the highest salary among workers who have a corresponding record in the `title` table.

---

##  SQL Solution

```sql
SELECT b.worker_title AS best_paid_title
FROM worker a
JOIN title b
    ON a.worker_id = b.worker_ref_id
WHERE a.salary = (
    SELECT MAX(w.salary)
    FROM worker w
    JOIN title t
        ON w.worker_id = t.worker_ref_id
)
ORDER BY best_paid_title;
```

---

##  Approach

1. Join the `worker` and `title` tables.
2. Find the highest salary among workers who have a matching title.
3. Return the title(s) of workers whose salary equals that maximum value.
4. Sort the result alphabetically.

---

##  SQL Concepts

- INNER JOIN
- Subquery
- MAX()
- WHERE
- ORDER BY

---

##  Key Learning

- A subquery can return a single value that is used by the outer query.
- Always apply the business requirement before calculating aggregates.
- INNER JOIN ensures that only workers with a matching title are included.