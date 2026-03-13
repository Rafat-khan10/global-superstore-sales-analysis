
1. How does revenue change month-over-month?

  WITH cte AS
  (SELECT YEAR,
          EXTRACT(MONTH FROM order_date) AS month_num,
          TO_CHAR(order_date, 'Mon-YYYY') AS month_char,
          SUM(quantity*sales) AS current_month_revenue
   FROM orders
   GROUP BY YEAR,
            EXTRACT(MONTH FROM order_date),
            TO_CHAR(order_date, 'Mon-YYYY')
   ORDER BY YEAR ASC,EXTRACT(MONTH FROM order_date) ASC),
     cte2 AS
  (SELECT YEAR,
          month_num,
          month_char,
          current_month_revenue,
          LAG(current_month_revenue) OVER(ORDER BY YEAR ASC, month_num ASC) AS previous_month_revenue
   FROM cte)
SELECT YEAR,
       month_num,
       month_char,
       current_month_revenue,
       previous_month_revenue,
       current_month_revenue - previous_month_revenue AS revenue_difference_by_month,
       CONCAT(ROUND((current_month_revenue - previous_month_revenue)*100/NULLIF(previous_month_revenue, 0), 1), '%') AS Growth_percentage
FROM cte2

  ============================================================================================================================================================ 
  
  2. How does profit grow or decline each month?

  
  WITH cte AS
  (SELECT YEAR,
          EXTRACT(MONTH FROM order_date) AS month_num,
          TO_CHAR(order_date, 'Mon-YYYY') AS month_char,
          SUM(profit) AS current_month_profit
   FROM orders
   GROUP BY YEAR,
            EXTRACT(MONTH FROM order_date),
            TO_CHAR(order_date, 'Mon-YYYY')
   ORDER BY YEAR ASC,EXTRACT(MONTH FROM order_date) ASC),
     cte2 AS
  (SELECT YEAR,
          month_num,
          month_char,
          current_month_profit,
          LAG(current_month_profit) OVER( ORDER BY YEAR ASC, month_num ASC) AS previous_month_profit
   FROM cte)
SELECT YEAR,
       month_num,
       month_char,
       current_month_profit,
       previous_month_profit,
       current_month_profit - previous_month_profit AS profit_difference_by_month,
       CONCAT(ROUND((current_month_profit - previous_month_profit)*100/NULLIF(previous_month_profit, 0), 1), '%') AS profit_growth_percentage
FROM cte2

============================================================================================================================================================ 
  
  3. How does the number of active customers change over time?

WITH cte AS
  (SELECT YEAR,
          EXTRACT(MONTH FROM order_date) AS month_num,
          TO_CHAR(order_date, 'Mon-YYYY') AS month_char,
          COUNT(DISTINCT customer_id) AS active_customers
   FROM orders
   GROUP BY YEAR,
            EXTRACT(MONTH FROM order_date),
            TO_CHAR(order_date, 'Mon-YYYY')
   ORDER BY YEAR,
            EXTRACT(MONTH FROM order_date)),
     cte2 AS
  (SELECT YEAR,
          month_num,
          month_char,
          active_customers AS current_month_active_customer,
          LAG(active_customers) OVER( ORDER BY YEAR ASC ,month_num ASC) AS previous_month_active_customer
   FROM cte)
SELECT *,
       CONCAT((current_month_active_customer - previous_month_active_customer)*100/NULLIF(previous_month_active_customer, 0), '%') AS Growth_percentage
FROM cte2








