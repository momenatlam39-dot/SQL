SELECT 
    SUM(sales_revenue) AS total_revenue
FROM sales_performance
WHERE salesperson = 'Samantha' OR salesperson = 'Lisa';