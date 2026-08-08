SELECT b.worker_title AS best_paid_title
FROM worker a
JOIN title b ON a.worker_id = b.worker_ref_id
WHERE a.salary = (
    SELECT MAX(w.salary)
    FROM worker w
    JOIN title t ON w.worker_id = t.worker_ref_id
    WHERE t.worker_title IS NOT NULL
)
ORDER BY best_paid_title;