1.How do different discount levels affect profitability?

SELECT CASE
           WHEN discount = 0 THEN 'No Discount'
           WHEN discount <= 0.2 THEN 'Low Discount'
           WHEN discount <= 0.4 THEN 'Medium Discount'
           ELSE 'High Discount'
       END AS discount_level,
       COUNT(DISTINCT order_id) AS total_orders,
       SUM(sales*quantity) AS total_revenue,
       SUM(profit) AS total_profit,
       ROUND(AVG(discount) * 100, 2) AS avg_discount_pct
FROM orders
GROUP BY discount_level
ORDER BY avg_discount_pct ASC

  ============================================================================================================================================================

2. Which product categories receive the highest discounts?

SELECT category,
       ROUND(AVG(discount) * 100, 2) AS avg_discount_pct,
       ROUND(SUM(profit)::NUMERIC, 2) AS total_profit,
       ROUND(SUM(quantity * sales)::NUMERIC, 2) AS total_revenue
FROM orders
GROUP BY category
ORDER BY avg_discount_pct DESC;
