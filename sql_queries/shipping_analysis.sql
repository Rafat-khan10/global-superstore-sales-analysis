1. How do shipping costs impact profit across categories and shipping modes?

WITH cte AS
  (SELECT category,
          ship_mode,
          ROUND(SUM(shipping_cost), 2) AS total_ship_cost,
          ROUND(AVG(shipping_cost), 2) AS avg_ship_cost,
          ROUND(AVG(profit), 2) AS avg_profit
   FROM orders
   GROUP BY category, ship_mode
   ORDER BY avg_ship_cost DESC)
SELECT *,
       DENSE_RANK() OVER(PARTITION BY category ORDER BY avg_profit DESC) AS rank_by_avg_profit
FROM cte

