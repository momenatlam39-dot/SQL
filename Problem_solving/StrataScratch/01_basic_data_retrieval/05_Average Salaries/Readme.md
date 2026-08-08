#  Average Salaries

## 📌 Problem
Given an `employee` table, return each employee’s:
- department
- first_name
- salary
- average salary of their department

---

##  Table
employee

- department
- first_name
- salary

---

## 🎯 Goal
Compare each employee's salary with the average salary of their department.

---

##  Solution

```sql
SELECT
    department,
    first_name,
    salary,
    AVG(salary) OVER (PARTITION BY department) AS avg_salary
FROM employee;