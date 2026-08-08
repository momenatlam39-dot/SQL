SELECT
    department,
    first_name,
    salary,
    AVG(salary) OVER (PARTITION BY department) AS avg_salary
FROM employee