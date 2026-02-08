/* =========================================
   BANK LOAN REPORT
   KPI VALIDATION & DASHBOARD QUERIES
   ========================================= */

/* =========================
   DASHBOARD 1: CORE KPIs
   ========================= */

-- Total Loan Applications
SELECT COUNT(id) AS Total_Loan_Applications
FROM bank_loan_data;

-- Month-to-Date (MTD) Loan Applications - December 2021
SELECT COUNT(id) AS MTD_Total_Loan_Applications
FROM bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021;

-- Previous Month-to-Date (PMTD) Loan Applications - November 2021
SELECT COUNT(id) AS PMTD_Total_Loan_Applications
FROM bank_loan_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021;

-- Total Funded Amount
SELECT SUM(loan_amount) AS Total_Funded_Amount
FROM bank_loan_data;

-- MTD Total Funded Amount - December 2021
SELECT SUM(loan_amount) AS MTD_Total_Funded_Amount
FROM bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021;

-- PMTD Total Funded Amount - November 2021
SELECT SUM(loan_amount) AS PMTD_Total_Funded_Amount
FROM bank_loan_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021;

-- Total Amount Received
SELECT SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data;

-- MTD Total Amount Received - December 2021
SELECT SUM(total_payment) AS MTD_Total_Amount_Received
FROM bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021;

-- PMTD Total Amount Received - November 2021
SELECT SUM(total_payment) AS PMTD_Total_Amount_Received
FROM bank_loan_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021;

-- Average Interest Rate
SELECT ROUND(AVG(int_rate),4) * 100 AS Avg_Interest_Rate
FROM bank_loan_data;

-- MTD Average Interest Rate - December 2021
SELECT ROUND(AVG(int_rate),4) * 100 AS MTD_Avg_Interest_Rate
FROM bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021;

-- PMTD Average Interest Rate - November 2021
SELECT ROUND(AVG(int_rate),4) * 100 AS PMTD_Avg_Interest_Rate
FROM bank_loan_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021;

-- Average Debt-to-Income (DTI)
SELECT ROUND(AVG(dti),4) * 100 AS Avg_DTI
FROM bank_loan_data;

-- MTD Average DTI - December 2021
SELECT ROUND(AVG(dti),4) * 100 AS MTD_Avg_DTI
FROM bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021;

-- PMTD Average DTI - November 2021
SELECT ROUND(AVG(dti),4) * 100 AS PMTD_Avg_DTI
FROM bank_loan_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021;


/* =========================
   LOAN QUALITY ANALYSIS
   ========================= */

-- Good Loan Percentage
SELECT
  CONCAT(
    COUNT(CASE WHEN loan_status IN ('Fully Paid','Current') THEN id END) * 100.0
    / COUNT(id), '%'
  ) AS Good_Loan_Percentage
FROM bank_loan_data;

-- Good Loan Applications
SELECT COUNT(id) AS Good_Loan_Applications
FROM bank_loan_data
WHERE loan_status IN ('Fully Paid','Current');

-- Good Loan Funded Amount
SELECT SUM(loan_amount) AS Good_Loan_Funded_Amount
FROM bank_loan_data
WHERE loan_status IN ('Fully Paid','Current');

-- Good Loan Amount Received
SELECT SUM(total_payment) AS Good_Loan_Received_Amount
FROM bank_loan_data
WHERE loan_status IN ('Fully Paid','Current');

-- Bad Loan Percentage
SELECT
  CONCAT(
    COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END) * 100.0
    / COUNT(id), '%'
  ) AS Bad_Loan_Percentage
FROM bank_loan_data;

-- Bad Loan Applications
SELECT COUNT(id) AS Bad_Loan_Applications
FROM bank_loan_data
WHERE loan_status = 'Charged Off';

-- Bad Loan Funded Amount
SELECT SUM(loan_amount) AS Bad_Loan_Funded_Amount
FROM bank_loan_data
WHERE loan_status = 'Charged Off';

-- Bad Loan Amount Received
SELECT SUM(total_payment) AS Bad_Loan_Received_Amount
FROM bank_loan_data
WHERE loan_status = 'Charged Off';

--Loan Status Grid View
SELECT 
	loan_status AS Loan_Status,
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Received_Amount,
	CONCAT(ROUND(AVG( int_rate)*100,2),'%') AS Avg_Interest_Rate,
	CONCAT(ROUND(AVG(dti)*100,2),'%') AS Avg_DTI
FROM bank_loan_data
GROUP BY loan_status;

--Loan Status MTD
SELECT
	loan_status AS Loan_Status,
	SUM(loan_amount) AS MTD_Total_Funded_Amount,
	SUM(total_payment) AS MTD_Total_Amount_Received
FROM bank_loan_data
WHERE MONTH(issue_date)=12
GROUP BY loan_status;


--Loan Status PMTD

SELECT
	loan_status AS Loan_Status,
	SUM(loan_amount) AS PMTD_Total_Funded_Amount,
	SUM(total_payment) AS PMTD_Total_Amount_Received
FROM bank_loan_data
WHERE MONTH(issue_date)=11
GROUP BY loan_status;


/* =========================
   DASHBOARD 2: SEGMENTATION
   ========================= */

-- Monthly Trend
SELECT
  MONTH(issue_date) AS Month_Number,
  DATENAME(MONTH, issue_date) AS Month_Name,
  COUNT(id) AS Total_Applications,
  SUM(loan_amount) AS Total_Funded_Amount,
  SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY MONTH(issue_date), DATENAME(MONTH, issue_date)
ORDER BY Month_Number;

-- State-wise Distribution
SELECT
  address_state AS State,
  COUNT(id) AS Total_Applications,
  SUM(loan_amount) AS Total_Funded_Amount,
  SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY address_state
ORDER BY Total_Applications DESC;

-- Loan Term Distribution
SELECT
  term AS Loan_Term,
  COUNT(id) AS Total_Applications,
  SUM(loan_amount) AS Total_Funded_Amount,
  SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY term
ORDER BY Total_Applications DESC;

-- Employee Length Distribution
SELECT
  emp_length AS Employee_Length,
  COUNT(id) AS Total_Applications,
  SUM(loan_amount) AS Total_Funded_Amount,
  SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY emp_length
ORDER BY Total_Applications DESC;

-- Home Ownership Distribution
SELECT
  home_ownership AS Home_Ownership,
  COUNT(id) AS Total_Applications,
  SUM(loan_amount) AS Total_Funded_Amount,
  SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY home_ownership
ORDER BY Total_Applications DESC;
