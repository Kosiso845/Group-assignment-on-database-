--  View all books in the store
SELECT * FROM book;

-- Show all orders placed with customer names
SELECT 
    o.order_id, o.order_date, c.first_name, c.last_name
FROM 
    cust_order o
JOIN 
    customer c ON o.customer_id = c.customer_id;

-- Find total sales per order
SELECT 
    order_id,
    SUM(quantity * price) AS total_order_value
FROM 
    order_line
GROUP BY 
    order_id;

-- Show orders and their status history
SELECT 
    o.order_id, o.order_date, os.status_name, oh.status_date
FROM 
    cust_order o
JOIN 
    order_history oh ON o.order_id = oh.order_id
JOIN 
    order_status os ON oh.status_id = os.status_id
ORDER BY 
    o.order_id, oh.status_date;
