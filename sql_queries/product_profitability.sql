1. Which product categories generate the highest profit margin?

SELECT category,
       SUM(quantity*sales) AS total_revenue,
       SUM(profit) AS total_profit,
       ROUND(SUM(profit)::NUMERIC*100/SUM(quantity*sales), 2) profit_margin_pct
FROM orders
GROUP BY category
ORDER BY profit_margin_pct DESC
============================================================================================================================================================
  
2.What are the most profitable products in each category?

WITH cte AS
  (SELECT category,
          product_name,
          SUM(profit) AS total_profit
   FROM orders
   GROUP BY category,product_name)
SELECT *,
       DENSE_RANK() OVER(PARTITION BY category ORDER BY total_profit DESC) AS rank
FROM cte
============================================================================================================================================================
  
3. Which products consistently generate losses?

WITH cte AS
  (SELECT category,
          product_name,
          SUM(profit) total_profit
   FROM orders
   GROUP BY category,product_name)
SELECT category,
       product_name,
       total_profit,
       DENSE_RANK() OVER(PARTITION BY category ORDER BY total_profit ASC) AS rank
FROM cte
