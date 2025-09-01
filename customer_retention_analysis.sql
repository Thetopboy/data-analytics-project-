Total number of customers
SELECT COUNT(DISTINCT customer_id) AS total_customers
FROM transactions;

-- Repeat customers
SELECT customer_id, COUNT(*) AS purchases
FROM transactions
GROUP BY customer_id
HAVING COUNT(*) > 1;

-- Monthly retention
SELECT customer_id, DATE_TRUNC('month', purchase_date) AS month, COUNT(*) AS purchases
FROM transactions
GROUP BY customer_id, DATE_TRUNC('month', purchase_date)
ORDER BY month;
