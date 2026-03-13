
1. Who are the highest revenue generating customers?

WITH customer_value AS
  (SELECT customer_id,
          SUM(quantity*sales) AS total_revenue
   FROM orders
   GROUP BY customer_id),
     percentile AS
  (SELECT customer_id,
          total_revenue,
          NTILE(10) OVER( ORDER BY total_revenue DESC) AS Decile
   FROM customer_value)
SELECT decile,
       COUNT(DISTINCT customer_id) AS customer_count,
       SUM(total_revenue),
       CONCAT(ROUND(SUM(total_revenue)*100/
                      (SELECT SUM(total_revenue)
                       FROM percentile), 2), '%') AS pecentage
FROM percentile
GROUP BY decile
ORDER BY decile

  ============================================================================================================================================================

2. • How can customers be segmented using RFM analysis?

WITH cte AS
  (SELECT customer_id,
          order_date AS current_order_date,
          LEAD(order_date) OVER(PARTITION BY customer_id ORDER BY order_date ASC) AS next_order_date
   FROM orders),
     cte_recency AS
  (SELECT customer_id,
          ROUND (AVG(DATE(next_order_date) - DATE(current_order_date))) AS avg_days
   FROM cte
   WHERE next_order_date > current_order_date
   GROUP BY customer_id),
     cte_fm AS
  (SELECT customer_id,
          COUNT(DISTINCT order_id) AS total_orders,
          SUM(sales*quantity) AS total_revenue
   FROM orders
   GROUP BY customer_id),
     cte2 AS
  (SELECT f.customer_id,
          r.avg_days,
          f.total_orders,
          f.total_revenue
   FROM cte_fm AS f
   INNER JOIN cte_recency AS r USING(customer_id)),
     cte3 AS
  (SELECT customer_id,
          avg_days AS recency,
          total_orders AS frequency,
          total_revenue AS monetary,
          NTILE(5) OVER(ORDER BY avg_days DESC) AS recency_score,
          NTILE(5) OVER(ORDER BY total_orders ASC) AS frequency_score,
          NTILE(5) OVER(ORDER BY total_revenue ASC) AS monetary_score
   FROM cte2),
     cte4 AS
  (SELECT *,
          recency_score + frequency_score + monetary_score AS Loyalty_score,
          DENSE_RANK() OVER (ORDER BY recency_score + frequency_score + monetary_score DESC) AS loyal_customer_rank,
          CASE
              WHEN recency_score>=4
                   AND frequency_score>=4
                   AND monetary_score>=4 THEN 'Champion'
              WHEN recency_score>=4
                   AND frequency_score>=4 THEN 'Loyal Customers'
              WHEN recency_score>=4
                   AND frequency_score <=2 THEN 'New Customers'
              WHEN recency_score <=2
                   AND frequency_score >=3 THEN ' At Risk'
              WHEN recency_score =1
                   AND frequency_score =1 THEN 'Lost Customer'
              ELSE 'Needs Attention '
          END AS customer_segment
   FROM cte3),
     cte5 AS
  (SELECT customer_segment,
          COUNT(*) AS customer_numbers
   FROM cte4
   GROUP BY customer_segment
   ORDER BY COUNT(*) DESC)
SELECT *,
       CONCAT(ROUND(customer_numbers*100::NUMERIC/
                      (SELECT SUM(customer_numbers)
                       FROM cte5), 2), '%') AS percentage
FROM cte5

  ============================================================================================================================================================

3. How many new customers are acquired each month?

WITH first_purchase AS
  (SELECT customer_id,
          DATE_TRUNC('MONTH', MIN(order_date)) AS first_month
   FROM orders
   GROUP BY customer_id)
SELECT EXTRACT(YEAR FROM first_month) AS YEAR,
       EXTRACT(MONTH FROM first_month) AS Month_num,
       TO_CHAR(first_month, 'Mon') AS Month_char,
       COUNT(customer_id) AS cohort_size
FROM first_purchase
GROUP BY EXTRACT(YEAR FROM first_month),
         EXTRACT(MONTH FROM first_month),
         TO_CHAR(first_month, 'Mon')
ORDER BY YEAR ASC,cohort_size DESC

  ============================================================================================================================================================

4. What is the average order value per customer?

WITH Aov AS
  (SELECT YEAR,
          customer_id,
          COUNT(order_id) AS total_orders,
          SUM(quantity*sales) AS total_revenue
   FROM orders
   GROUP BY YEAR,customer_id)
SELECT *,
       ROUND(total_revenue/total_orders, 2) AS Average_spent_per_order
FROM Aov
ORDER BY YEAR ASC,Average_spent_per_order DESC

  ============================================================================================================================================================
  
5. Which customers rely heavily on discounts?

SELECT customer_id,
       COUNT(order_id) AS total_orders,
       ROUND(AVG(discount)*100, 2) AS avg_discount,
       SUM(sales*quantity) AS total_spent
FROM orders
GROUP BY customer_id
HAVING ROUND(AVG(discount)*100, 2) > 20
ORDER BY total_spent DESC;



