WITH dept_avg AS
  (SELECT department,
          AVG(salary) AS avg_salary
   FROM employee
   GROUP BY department)
SELECT e.department,
       e.first_name,
       e.salary,
       d.avg_salary
FROM employee e
JOIN dept_avg d ON e.department = d.department
ORDER BY e.department;