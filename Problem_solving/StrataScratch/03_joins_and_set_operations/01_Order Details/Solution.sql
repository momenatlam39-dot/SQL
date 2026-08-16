SELECT customers.first_name,
       order_date,
       order_details,
       total_order_cost
FROM orders
JOIN customers ON customers.id = orders.cust_id
WHERE customers.first_name IN ('Jill',
                               'Eva')
ORDER BY cust_id;