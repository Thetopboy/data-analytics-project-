Customer Retention Analysis Project
-- Author: Collins K Rotich

-- 1) Total number of unique customers and total purchases
SELECT COUNT(DISTINCT customer_id) AS total_customers,
       COUNT(order_id) AS total_purchases
FROM transactions;

-- 2) Repeat customers vs one-time customers
SELECT customer_id,
       COUNT(order_id) AS purchase_count
FROM transactions
GROUP BY customer_id
ORDER BY purchase_count DESC;

-- 3) Churn rate (customers with only one purchase)
SELECT COUNT(*) * 100.0 / (SELECT COUNT(DISTINCT customer_id) FROM transactions) AS churn_rate
FROM (
    SELECT customer_id
    FROM transactions
    GROUP BY customer_id
    HAVING COUNT(order_id) = 1
) AS one_time_customers;

-- 4) Monthly retention trends
SELECT DATE_TRUNC('month', order_date) AS month,
       COUNT(DISTINCT customer_id) AS retained_customers
FROM transactions
GROUP BY month
ORDER BY month;
