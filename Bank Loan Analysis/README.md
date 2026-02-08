# 📊 Bank Loan Analysis Project (EXCEL, SQL & Power BI)

## 📌 Project Overview
This project provides a comprehensive analysis of a bank’s loan portfolio to monitor **loan performance, credit risk, and repayment trends**. 
Using **SQL** for data extraction and **Power BI** for advanced visualization, the analysis tracks **38,576 loan applications** totaling **$435.8M** in funded value.

The objective is to deliver **data-driven insights** that empower stakeholders to optimize lending strategies and mitigate default risks.

---

## 🔗 Live Dashboard
👉 **[View Interactive Power BI Report](https://app.powerbi.com/view?r=eyJrIjoiMmMwNmNjNDUtMWMzZi00MmQ5LTg2MWItMTQ0YmUyOThkYjBhIiwidCI6IjJmY2Q2MDIxLTI1NjEtNDM5Yy1hN2JmLWFlNmUxOGYyNzQ5MSJ9)**

---

## 📈 Executive Summary (Summary View)
![Summary Dashboard](Dashbord_Images/Summary.PNG)

### Key Portfolio Metrics
- **Total Loan Applications:** **38.6K**
  - Month-to-Date (MTD): **4.3K** (6.9% MoM ↑)
- **Total Funded Amount:** **$435.8M** (13.0% MoM ↑)
- **Total Amount Received:** **$473.1M** (15.8% MoM ↑)
- **Average Interest Rate:** **12.0%**

---

## 🩺 Financial Health & Risk Analysis (DTI)
A critical component of this analysis was evaluating the **Financial Health** of borrowers using the **Debt-to-Income (DTI)** ratio.

- **Portfolio Average DTI:** **13.3%**
- **Good Loan DTI (13.1%):** Borrowers with lower debt burdens show a high repayment success rate, contributing to the **86.2% Good Loan** status.
- **Bad Loan DTI (14.0%):** A clear correlation exists between higher DTI ratios and default risk. Charged-off loans exhibit higher average DTIs, signaling that increased debt-to-income pressure is a primary driver of credit risk.

📌 *Monitoring DTI trends allows the bank to tighten lending criteria for applicants nearing the 14% threshold to minimize future losses.*

---

## 📊 Trends and Distribution (Overview View)
![Overview Dashboard](Dashbord_Images/Overview.PNG)

- **Seasonality:** Consistent growth throughout the year, peaking in **December (4.3K apps)**.
- **Loan Term:** **73.2%** of borrowers preferred **36-month terms**, indicating a preference for shorter debt cycles.
- **Stable Segments:** Borrowers with **10+ years of employment** represent the largest and most reliable applicant group.

---

## 📑 Transactional Details (Details View)
![Details Dashboard](Dashbord_Images/Details.PNG)

## 📄 Transactional Details (Details View)

The **Details View** provides a granular look into the loan portfolio, moving beyond high-level KPIs to show individual loan performance. This view is essential for auditing specific records and understanding the raw data driving the executive metrics.

### **Key Functionalities**
* **Granular Analysis:** Access to row-level data including Loan IDs, specific purposes, and issue dates.
* **Comprehensive Filtering:** Multi-select slicers for **State**, **Grade**, and **Loan Status** to isolate specific segments of the portfolio.
* **Risk Assessment:** Allows for a direct comparison between borrower debt-to-income (DTI) ratios and interest rates.

### **Data Dictionary**

| Column Name | Description |
| :--- | :--- |
| **Loan ID** | Unique identifier for each loan application. |
| **Purpose** | The category of the loan (e.g., Debt Consolidation, Credit Card, Home Improvement). |
| **Home Ownership** | The housing status of the borrower (Mortgage, Rent, Own). |
| **Grade / Sub-Grade** | Risk classifications assigned based on the borrower's creditworthiness. |
| **Issue Date** | The date the loan was officially funded. |
| **DTI (Debt-to-Income)** | The ratio of a borrower's total monthly debt to their monthly gross income. |
| **Amount Received** | Total payments collected from the borrower to date. |

---
---

## 🧰 Tools & Technologies
- **SQL (SQL Server)** – Data cleaning, MTD/MoM growth calculations, and status classification,etc.
- **Power BI** – DAX measures, data modeling, and interactive visualization.
- **Excel** – Initial data audit and validation.

---

## 📁 Repository Structure
```text
├── Dashbord_Images/
│   ├── Summary.PNG              # Executive KPIs
│   ├── Overview.PNG             # Trends and Distributions
│   └── Details.PNG              # Transactional grid view
├── SQL_Query_Results/           # Query outputs
├── Bank_Loan_Dashboard.pbix     # Power BI Project File
├── KPI_and_Dashboard_Queries.sql # SQL code for all KPIs
└── README.md
