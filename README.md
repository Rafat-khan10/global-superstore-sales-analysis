# 🛒 Global Superstore Sales & Customer Analysis


---

## 📌 Project Overview

This project analyzes **4 years of transaction data (2011–2014)** from Global Superstore — an international retail company selling Furniture, Office Supplies, and Technology products.

Using **SQL (PostgreSQL)** and **Power BI**, the analysis uncovers revenue trends, customer behavior, profitability drivers, and operational inefficiencies to support better business decision-making.

---

## 📊 Dataset

| Property | Details |
|---|---|
| Source | Global Superstore Sales Dataset |
| Period | 2011 – 2014 |
| Total Rows | 51,290 |
| Total Customers | 4,446 |
| Total Orders | 51,290 |
| Total Revenue | $12.6M |
| Categories | 3 (Furniture, Office Supplies, Technology) |

---

## 🛠️ Tools Used

| Tool | Purpose |
|---|---|
| PostgreSQL | Data storage & SQL queries |
| pgAdmin 4 | Query execution & output |
| Power BI | Dashboard & visualization |
| Canva | Presentation slides |

---

## ❓ Key Business Questions

1. How does revenue change month-over-month?
2. How does customer count grow month-over-month?
3. Which customers contribute the most revenue?
4. How are customers segmented using RFM analysis?
5. What is the customer retention rate over time?
6. Which product categories are most profitable?
7. How do discounts impact profitability?
8. How does delivery time vary by shipping mode?
9. Which shipping mode delivers the best value?
10. ...and more explored through 12+ SQL queries

---

## 🔍 Key Findings

- 📉 **95% of customers** never return after their first purchase
- 💰 **High discounts** are causing **$814K in profit losses**
- 📦 **Furniture profit margin is only 1.42%** despite generating $20M in revenue
- ⭐ **Top 10% of customers** drive **37% of total revenue**
- 🚚 **First Class shipping cost** is nearly **2x the profit** it generates for Furniture
- 📈 **Revenue grew 87%** from 2011 to 2014
- 📅 **January & July** show consistent revenue drops every year
- 🎯 **41% of customers** fall in the "Needs Attention" RFM segment — biggest opportunity

---

## 💡 Business Recommendations

1. **Launch a 30-day onboarding email campaign** to reduce Month 1 churn (currently 95%)
2. **Cap discounts at 20% maximum** — Medium & High discounts are generating losses
3. **Review Furniture pricing strategy** — highest revenue category but lowest margin (1.42%)
4. **Protect Champion segment (19%)** with exclusive VIP loyalty program
5. **Switch Furniture orders to Standard Class shipping** to reduce costs
6. **Run promotional campaigns in June & December** before seasonal revenue drops
7. **Win-back campaign for At Risk + Lost customers (23%)** with personalized offers

---

## 📁 Project Structure

```
global-superstore-sales-analysis/
│
├── data/
│   └── Global_Superstore.csv
│
├── queries/
│   ├── 01_data_overview.sql
│   ├── 02_mom_revenue_growth.sql
│   ├── 03_mom_customer_growth.sql
│   ├── 04_high_value_customers.sql
│   ├── 05_rfm_segmentation.sql
│   ├── 06_profit_margin.sql
│   ├── 07_discount_impact.sql
│   ├── 08_shipping_cost_analysis.sql
│   ├── 09_delivery_time_analysis.sql
│   ├── 10_customer_retention.sql
│   └── 11_churn_analysis.sql
│
├── presentation/
│   └── global_superstore_analysis.pdf
│
├── screenshots/
│   ├── mom_revenue.png
│   ├── high_value_customers.png
│   ├── rfm_segmentation.png
│   ├── profit_margin.png
│   ├── discount_impact.png
│   └── customer_retention.png
│
└── README.md
```

---

## 📸 Project Snapshots

### 📈 Month-Over-Month Revenue Growth
![MOM Revenue](screenshots/mom_revenue.png)

### 👥 High Value Customer Analysis
![High Value](screenshots/high_value_customers.png)

### 🎯 RFM Customer Segmentation
![RFM](screenshots/rfm_segmentation.png)

### 💰 Discount Impact on Profitability
![Discount](screenshots/discount_impact.png)

### 📦 Profit Margin by Category
![Profit](screenshots/profit_margin.png)

### 🔄 Customer Retention Analysis
![Retention](screenshots/customer_retention.png)

---

## ▶️ How to Run

1. Clone this repository
2. Download dataset from `data/` folder
3. Create a new database in PostgreSQL
4. Import `Global_Superstore.csv` into a table named `orders`
5. Run queries from `queries/` folder in order (01 → 11)

---

## 📬 Connect With Me

**Rafat Khan** — Aspiring Data Analyst

- 💼 LinkedIn: [Your LinkedIn URL]
- 🐙 GitHub: [github.com/Rafat-khan10](https://github.com/Rafat-khan10)
- 📧 Email: [Your Email]
