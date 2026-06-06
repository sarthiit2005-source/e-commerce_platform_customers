# Retail Customer Behavior Analysis

## Overview

This project explores customer purchasing behavior using Python, MySQL, and Power BI to uncover meaningful business insights from retail transaction data.

The analysis focuses on:

- Customer segmentation and loyalty
- Revenue generation patterns
- Product performance
- Subscription behavior
- Discount effectiveness
- Customer preferences across demographics

The project follows a complete analytics workflow:

```text
Raw Dataset
→ Data Cleaning & Feature Engineering (Python)
→ SQL Analysis (MySQL)
→ Interactive Dashboard (Power BI)
→ Business Insights & Recommendations
```

---

## Dataset

The dataset contains customer shopping behavior information including:

- Customer demographics
- Product categories and purchased items
- Purchase amount
- Subscription status
- Discounts and promotions
- Purchase frequency
- Previous purchases
- Product ratings
- Seasonal information

---

## Tools Used

- Python (Pandas)
- Jupyter Notebook
- MySQL
- Power BI

---

## Data Cleaning & Feature Engineering

Initial preprocessing was performed using Python and Pandas before loading the data into MySQL.

Key steps included:

- Inspecting and validating data quality
- Checking for missing values
- Standardizing column names
- Creating age-group buckets
- Verifying discount and promotion fields
- Creating derived analytical features
- Exporting the cleaned dataset for SQL analysis

📓 Notebook:

[Jupyter Notebook](Jupyter Notebook/Feature_Engineering.ipynb)

---

## SQL Analysis

The complete SQL workflow, including customer segmentation, product ranking, subscription analysis, revenue analysis, and discount analysis, can be found here:

📄 [View SQL Queries](Queries/sql_queries.sql)

---

# Business Questions & Findings

## 1. Which Product Categories Generate the Most Revenue?

Revenue was aggregated across all product categories to identify the highest-performing business segments.

### Finding

- Clothing generated the highest overall revenue.
- Accessories generated the lowest overall revenue.

### Business Value

Understanding category-level revenue helps prioritize inventory planning and marketing investments.

---

## 2. How Do Customer Preferences Vary Across Age Groups?

Customer distributions were analyzed across categories for different age groups.

### Finding

- Clothing remained the most popular category across all age groups.
- Older customer groups showed relatively stronger interest in Footwear and Outerwear compared to younger customers.

### Business Value

Supports demographic-specific marketing campaigns and inventory planning.

---

## 3. How Can Customers Be Segmented Based on Loyalty and Purchase Frequency?

Customers were classified into:

- New Customers
- Regular Customers
- Loyal Customers

using purchase history and purchase frequency.

These groups were further transformed into business-friendly segments such as:

- VIP Active
- VIP Occasional
- VIP Dormant
- Regular Active
- Regular Occasional
- New Active

### Finding

The customer base was heavily concentrated among loyal customer groups.

### Business Value

Provides a framework for personalized marketing and customer retention strategies.

---

## 4. Which Customer Segments Generate the Most Revenue?

Revenue contribution was analyzed for each customer segment.

### Finding

- Regular Active customers generated the highest revenue.
- VIP Active customers represented another highly valuable customer segment.
- New customer segments contributed significantly less revenue.

### Business Value

High-value customer groups can be targeted with retention and loyalty programs.

---

## 5. Which Products Are the Top Sellers Within Their Category?

Products were ranked against other products belonging to the same category based on purchase counts.

### Finding

The analysis identified the three best-performing products in each category.

### Business Value

Useful for inventory prioritization, merchandising decisions, and promotional planning.

---

## 6. Which Products Are Most Dependent on Discounts?

The percentage of purchases occurring during discount periods was calculated for each product.

### Finding

Products such as:

- Shorts
- Jeans
- Blouses
- Sweaters

showed particularly high discount dependency.

### Business Value

These products are strong candidates for promotional campaigns and seasonal discount strategies.

---

## 7. How Likely Are Customers to Subscribe?

Subscription behavior was analyzed across the customer base.

### Finding

Approximately 40% of customers were subscribers.

### Business Value

The subscription program demonstrates meaningful adoption and provides opportunities for expansion.

---

# Power BI Dashboard

The project dashboard was designed to provide business stakeholders with a high-level overview of customer behavior and business performance.

📊 Dashboard File:

[dashboard1.pbix](Power Bi Dashboard/dashboard1.pbix)

---

## Dashboard Pages

### Executive Overview

Provides a high-level snapshot of business performance.

Includes:

- Total Customers
- Total Revenue
- Subscription Rate
- Average Purchase Amount
- Revenue by Category
- Category Preferences Across Age Groups

---

### Customer Segmentation

Analyzes customer groups based on loyalty and purchasing behavior.

Includes:

- Customer Segment Distribution
- Loyalty Tier Distribution
- Revenue by Segment

---

### Product & Discount Analysis

Focuses on product performance and promotional effectiveness.

Includes:

- Top 3 Products by Category
- Discount Dependency Analysis

---

# Key Insights

### Customer Loyalty Drives Revenue

The majority of revenue originates from active and loyal customer segments, highlighting the importance of customer retention.

---

### Clothing Dominates Overall Revenue

Among all categories, Clothing generated the highest revenue contribution.

---

### Customer Preferences Differ Across Demographics

Although Clothing remains the dominant category, customer preferences vary across age groups, particularly for Footwear and Outerwear.

---

### Certain Products Rely Heavily on Discounts

Products such as Shorts, Jeans, and Blouses exhibited strong discount dependency, suggesting that targeted promotions can significantly influence purchasing behavior.

---

### Customer Segmentation Reveals High-Value Groups

Active customer segments consistently outperformed dormant and new customer groups in revenue generation.

---

# Recommendations

### Invest in Customer Retention

Develop loyalty programs aimed at retaining active and high-spending customer segments.

### Expand Subscription Programs

Focus subscription campaigns on highly engaged customer groups to increase adoption.

### Use Targeted Promotions

Apply discounts strategically to products that have demonstrated strong promotional responsiveness.

### Optimize Inventory Planning

Prioritize inventory allocation for top-performing products identified within each category.

### Leverage Customer Segmentation

Use segment-specific marketing campaigns to improve engagement and conversion rates.

---

# Future Improvements

Potential next steps include:

- Customer Lifetime Value (CLV) analysis
- Churn prediction modeling
- Time-series revenue forecasting
- Transaction-level behavioral analysis
- Deployment of an interactive web dashboard

---

## Repository Structure

```text
Retail-Customer-Behavior-Analysis/
│
├── Jupyter Notebook/
│   └── Feature_Engineering.ipynb
│
├── Queries/
│   └── sql_queries.sql
│
├── Power Bi Dashboard/
│   └── dashboard1.pbix
│
├── Dataset/
│   └── customer_behavior.csv
│
└── README.md
```
