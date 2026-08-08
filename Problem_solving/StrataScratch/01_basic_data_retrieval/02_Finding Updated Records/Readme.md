# Finding Updated Records (StrataScratch ID 10299)

## 📌 Problem Overview
We have a dataset containing employee salary records. Some records are outdated and contain old salary information. Since there is no timestamp present, we assume salary is non-decreasing over time. 

The goal is to find the **current salary** for each employee, defined as the highest salary value among their records. The output should include the employee's ID, first name, last name, department ID, and current salary, sorted by employee ID in ascending order.

* **Platform:** StrataScratch
* **Difficulty:** Easy
* **Dialect:** PostgreSQL

---

## 💡 Approach & Logic

To fetch the record with the maximum salary for each employee:
1. **Window Function (`ROW_NUMBER()`):** We partition the data by employee `id` and order the rows by `salary DESC`. This assigns a rank (`rn = 1`) to the highest salary for each employee.
2. **Subquery Filtering:** Using a derived table, we filter for records where `rn = 1` to extract only the latest/highest salary entry per employee.
3. **Ordering:** Finally, the result set is ordered by `id` in ascending order as requested.

---

## 🛠️ SQL Solution

```sql
SELECT 
    id,
    first_name,
    last_name,
    department_id,
    salary
FROM (
    SELECT 
        *,
        ROW_NUMBER() OVER(PARTITION BY id ORDER BY salary DESC) AS rn
    FROM ms_employee_salary
) AS subquery
WHERE rn = 1
ORDER BY id ASC;