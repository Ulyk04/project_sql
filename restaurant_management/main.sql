SELECT 
    orders.order_date,
    orders.total_amount,
    customers.name,
    customers.phone
FROM
    orders
JOIN customers ON orders.customer_id =customers.customer_id