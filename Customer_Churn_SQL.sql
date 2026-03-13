use fingertips;

-- 1. Total number of customers
SELECT COUNT(*) AS total_customers
FROM customer_chrun_clean_data;

-- 2. Total churned customers
SELECT COUNT(*) AS churned_customers
FROM customer_chrun_clean_data
WHERE churn = 1;

-- 3. Churn rate
SELECT 
ROUND(SUM(churn) / COUNT(*) * 100, 2) AS churn_rate_percentage
FROM customer_chrun_clean_data;

-- 4. Churn by country
SELECT country,
COUNT(*) AS total_customers,
SUM(churn) AS churned_customers
FROM customer_chrun_clean_data
GROUP BY country;

-- 5. Average balance of churn vs non-churn customers
SELECT churn,
ROUND(AVG(balance),2) AS avg_balance
FROM customer_chrun_clean_data
GROUP BY churn;

-- 6. Churn by gender
SELECT gender,
COUNT(*) AS total_customers,
SUM(churn) AS churned_customers
FROM customer_chrun_clean_data
GROUP BY gender;

-- 7. Churn by number of products
SELECT products_number,
COUNT(*) AS total_customers,
SUM(churn) AS churned_customers
FROM customer_chrun_clean_data
GROUP BY products_number
ORDER BY products_number;

-- 8. Churn by active membership
SELECT active_member,
COUNT(*) AS total_customers,
SUM(churn) AS churned_customers
FROM customer_chrun_clean_data
GROUP BY active_member;

-- 9. Average credit score of churned customers
SELECT ROUND(AVG(credit_score),2) AS avg_credit_score_churned
FROM customer_chrun_clean_data
WHERE churn = 1;

-- 10. Top 5 customers with highest balance
SELECT customer_id, balance
FROM customer_chrun_clean_data
ORDER BY balance DESC
LIMIT 5;