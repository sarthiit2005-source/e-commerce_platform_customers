# Retail Customer Behavior Analysis

## Overview

This project explores customer purchasing behavior using SQL, Python, MySQL, and Power BI.

The objective was to identify patterns in:

- Customer loyalty
- Subscription behavior
- Product preferences
- Revenue generation
- Discount effectiveness

The project follows a complete analytics workflow:

Raw Data → Data Cleaning → SQL Analysis → Power BI Dashboard → Business Insights

---

## Dataset

The dataset contains customer shopping behavior information including:

- Customer demographics
- Product categories
- Purchase amount
- Subscription status
- Discounts and promotions
- Purchase frequency
- Previous purchases
- Product ratings

---

## Tools Used

- Python (Pandas)
- Jupyter Notebook
- MySQL
- Power BI

---

## Data Cleaning

Initial preprocessing was performed in Jupyter Notebook before loading the dataset into MySQL.

Cleaning tasks included:

- Checking missing values
- Validating discount and promotion fields
- Creating age-group buckets
- Standardizing column names
- Verifying data consistency

Notebook:

[Data Cleaning Notebook](NOTEBOOK_LINK_HERE)

---

## Dashboard

Interested in exploring the interactive dashboard?

📊 Dashboard File:

[dashboard1.pbix](dashboards/dashboard1.pbix)

Open using Microsoft Power BI Desktop.

---

# Business Questions

### 1. Which product categories generate the most revenue?

Revenue was aggregated by category to identify the most valuable product groups.

Example SQL:

```sql
SELECT
    category,
    SUM(purchase_amt) AS revenue
FROM customer_behavior
GROUP BY category;
```

### Result

- Clothing generated the highest revenue.
- Accessories generated the lowest revenue.

---

### 2. How does customer preference vary across age groups?

Customer distribution was compared across categories for different age groups.

### Result

- Clothing remained the most popular category across all age groups.
- Older customers showed relatively higher interest in Outerwear and Footwear compared to younger customers.

---

### 3. How can customers be segmented based on loyalty and purchase frequency?

Customers were segmented using:

- Previous purchase history
- Purchase frequency

Segments included:

- VIP Active
- VIP Occasional
- VIP Dormant
- Regular Active
- Regular Occasional
- New Active

### Result

The customer base was heavily concentrated among loyal customer groups.

---

### 4. Which customer segments generate the most revenue?

Revenue was analyzed for each customer segment.

### Result

- Regular Active customers generated the highest revenue.
- VIP Active customers represented another high-value customer segment.
- New customer segments contributed relatively little revenue.

### Business Value

Retention strategies should focus on high-performing active customer groups.

---

### 5. Which products are the top sellers within their category?

Products were ranked within each category based on purchase counts.

### Method

Products were compared only against other products belonging to the same category.

### Result

The analysis identified the three highest-performing products in each category.

### Business Value

Useful for inventory prioritization and product promotion planning.

---

### 6. Which products are most dependent on discounts?

Products were evaluated based on the percentage of purchases made under discount periods.

Example SQL:

```sql
SELECT
    item_purchased,
    COUNT(*) AS total_purchases,
    SUM(CASE WHEN discount_applied='Yes' THEN 1 ELSE 0 END)
FROM customer_behavior
GROUP BY item_purchased;
```

### Result

Products such as Shorts, Jeans, Blouses, and Sweaters showed high discount dependency.

### Business Value

These products are strong candidates for promotional campaigns.

---

### 7. How likely are customers to subscribe?

Subscription rate was calculated across the customer base.

### Result

Approximately 40% of customers were subscribers.

### Business Value

The subscription program has meaningful adoption and can be expanded through targeted campaigns.

---

# Dashboard Pages

## Executive Overview

Provides a high-level summary of business performance.

Includes:

- Total Customers
- Total Revenue
- Subscription Rate
- Average Purchase Amount
- Revenue by Category
- Customer Preference by Age Group

---

## Customer Segmentation

Analyzes customer groups based on loyalty and purchasing behavior.

Includes:

- Customer Segment Distribution
- Loyalty Tier Distribution
- Revenue by Segment

---

## Product & Discount Analysis

Focuses on product performance and discount effectiveness.

Includes:

- Top 3 Products by Category
- Discount Dependency Analysis

---

# Key Insights

### Customer loyalty is strongly linked to revenue

Most revenue originates from active and loyal customer segments.

### Clothing dominates overall revenue

Clothing generated the highest revenue among all categories.

### Customer behavior differs by age group

While Clothing remains dominant, category preferences vary across demographics.

### Certain products rely heavily on discounts

Products such as Shorts, Jeans, and Blouses exhibited high discount dependency.

### Customer segmentation reveals high-value groups

Active customer segments significantly outperform dormant and new customer groups.

---

# Recommendations

### Focus on retention

Invest in loyalty programs targeting active and high-spending customer segments.

### Expand successful subscription initiatives

Target customer groups with high engagement and purchase frequency.

### Use targeted discount campaigns

Apply discounts strategically to products that demonstrate strong discount responsiveness.

### Optimize inventory planning

Prioritize top-performing products identified within each category.

### Personalize marketing efforts

Leverage customer segmentation to create tailored promotions and customer experiences.

---

# Future Improvements

- Use transactional order-level data instead of customer snapshots
- Perform customer lifetime value (CLV) analysis
- Build churn prediction models
- Incorporate time-series forecasting
- Deploy an interactive web dashboard
