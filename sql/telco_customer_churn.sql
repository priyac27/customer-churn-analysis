-- CUSTOMER CHURN ANALYSIS
-- SQL Analysis
-------------------------
create database customer_churn_analysis;
use customer_churn_analysis;

-- 1. DATA VALIDATION 
-------------------------
select *
from telco_customer_churn
limit 10;

select count(*) as total_customers
from telco_customer_churn;

-- 2. OVERALL CHURN ANALYSIS
------------------------------
-- Churn Distribution
select
churn,
count(*) as customers
from telco_customer_churn
group by churn;

-- Overall Churn Rate
select 
round(
sum(Churn = 'Yes')* 100.0/ count(*),
2
)as churn_rate_percentage
from telco_customer_churn;

-- 3. CHURN BY CONTRACT
----------------------------
SELECT Contract,
COUNT(*) AS total_customers,
SUM(Churn = 'Yes') AS churned_customers,
ROUND(
SUM(Churn = 'Yes') * 100.0 / COUNT(*),
2
) AS churn_rate
FROM telco_customer_churn
GROUP BY Contract
ORDER BY churn_rate DESC;

-- 4. CHURN BY PAYMENT METHOD
--------------------------------
SELECT PaymentMethod,
COUNT(*) AS total_customers,
SUM(Churn = 'Yes') AS churned_customers,
ROUND(
SUM(Churn = 'Yes') * 100.0 / COUNT(*),
2
) AS churn_rate
FROM telco_customer_churn
GROUP BY PaymentMethod
ORDER BY churn_rate DESC;

-- 5. CHURN BY INTERNET SERVICE
---------------------------------
SELECT InternetService,
COUNT(*) AS total_customers,
SUM(Churn = 'Yes') AS churned_customers,
ROUND(
SUM(Churn = 'Yes') * 100.0 / COUNT(*),
2
) AS churn_rate
FROM telco_customer_churn
GROUP BY InternetService
ORDER BY churn_rate DESC;

-- 6. CHURN BY SENIOR CITIZEN STATUS
---------------------------------------
SELECT SeniorCitizen,
COUNT(*) AS total_customers,
SUM(Churn = 'Yes') AS churned_customers,
ROUND(
SUM(Churn = 'Yes') * 100.0 / COUNT(*),
2
) AS churn_rate
FROM telco_customer_churn
GROUP BY SeniorCitizen;

-- 7. ANALYZING TENURE
-------------------------
SELECT TenureGroup,
COUNT(*) AS total_customers,
SUM(Churn = 'Yes') AS churned_customers,
ROUND(
SUM(Churn = 'Yes') * 100.0 / COUNT(*),
2
) AS churn_rate
FROM telco_customer_churn
GROUP BY TenureGroup
ORDER BY churn_rate DESC;

-- 8. ANALYZING MONTHLY CHARGES
---------------------------------
SELECT Churn,
COUNT(*) AS customers,
ROUND(AVG(MonthlyCharges), 2) AS avg_monthly_charges
FROM telco_customer_churn
GROUP BY Churn;

-- 9. ANALYZING TOTAL CHARGES
--------------------------------
SELECT Churn,
COUNT(*) AS customers,
ROUND(AVG(TotalCharges), 2) AS avg_total_charges
FROM telco_customer_churn
GROUP BY Churn;

-- 10. CHURN BY GENDER
-------------------------------
SELECT Gender,
COUNT(*) AS total_customers,
SUM(Churn = 'Yes') AS churned_customers,
ROUND(
SUM(Churn = 'Yes') * 100.0 / COUNT(*),
2
) AS churn_rate
FROM telco_customer_churn
GROUP BY Gender
ORDER BY churn_rate DESC;

-- 11. CUSTOMER SEGMENTS WITH HIGH REVENUE AT RISK FROM CHURN
---------------------------------------------------------------
SELECT TenureGroup,
COUNT(*) AS total_customers,
SUM(Churn = 'Yes') AS churned_customers,

ROUND(
SUM(Churn = 'Yes') * 100.0 / COUNT(*),
2
) AS churn_rate,

ROUND(
SUM(MonthlyCharges),
2
) AS total_monthly_revenue,

ROUND(
SUM(CASE 
WHEN Churn = 'Yes' THEN MonthlyCharges 
ELSE 0 
END),
2
) AS monthly_revenue_at_risk
FROM telco_customer_churn
GROUP BY TenureGroup
ORDER BY monthly_revenue_at_risk DESC;


