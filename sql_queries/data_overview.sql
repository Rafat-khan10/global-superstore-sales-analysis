1.What is the overall dataset summary (customers, orders, revenue)?

SELECT 
       COUNT(DISTINCT customer_id) AS total_customers,
       COUNT(DISTINCT order_id) AS total_orders,
       ROUND(SUM(quantity * sales)::NUMERIC, 2) AS total_revenue,
       ROUND(SUM(profit), 2) AS total_revenue,
       COUNT(DISTINCT category) AS total_categories
FROM orders;
