-- 1
CREATE OR REPLACE VIEW vw_revenue_by_gender AS
SELECT
    gender,
    SUM(purchase_amt) AS total_amount
FROM customer_behavior
GROUP BY gender;

-- 2
CREATE OR REPLACE VIEW vw_discounted_above_avg_spend AS
WITH avg_for_item AS
(
    SELECT
        item_purchased AS item,
        category,
        AVG(purchase_amt) AS avg_cost
    FROM customer_behavior
    GROUP BY item_purchased, category
)
SELECT
    c.customer_id,
    c.item_purchased AS item,
    c.purchase_amt,
    c.discount_applied
FROM customer_behavior c
JOIN avg_for_item a
    ON a.item = c.item_purchased
   AND c.purchase_amt >= (a.avg_cost + 5)
WHERE c.discount_applied = 'Yes';

-- 3
CREATE OR REPLACE VIEW vw_top_rated_products AS
SELECT
    item_purchased AS item,
    category,
    AVG(review_rating) AS avg_rating
FROM customer_behavior
GROUP BY item_purchased, category;

-- 4
CREATE OR REPLACE VIEW vw_shipping_cost_comparison AS
SELECT
    shipping_type,
    ROUND(AVG(purchase_amt),2) AS avg_cost
FROM customer_behavior
WHERE shipping_type IN ('Standard','Express')
GROUP BY shipping_type;

-- 5
CREATE OR REPLACE VIEW vw_subscriber_purchase_behavior AS
SELECT
    subscription_status,
    COUNT(customer_id) AS total_customers,
    ROUND(AVG(previous_purchases + 1)) AS avg_orders,
    ROUND(AVG(purchase_amt),2) AS avg_spent
FROM customer_behavior
GROUP BY subscription_status;

-- 6
CREATE OR REPLACE VIEW vw_discount_dependent_products AS
SELECT
    item_purchased,
    COUNT(*) AS total_purchases,
    SUM(CASE WHEN discount_applied='Yes' THEN 1 ELSE 0 END) AS discounted_purchases,
    ROUND(
        100.0 *
        SUM(CASE WHEN discount_applied='Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS perc_discount_purchase
FROM customer_behavior
GROUP BY item_purchased;

-- 7
CREATE OR REPLACE VIEW vw_customer_segments AS
WITH loyalty_tier AS
(
    SELECT
        customer_id,
        CASE
            WHEN previous_purchases <= 3 THEN 'New'
            WHEN previous_purchases <= 15 THEN 'Regular'
            ELSE 'Loyal'
        END AS tier
    FROM customer_behavior
)
SELECT
    COUNT(c.customer_id) AS total_customers,
    CONCAT(l.tier,'-',c.purchase_frequency_days,'-days') AS segment
FROM customer_behavior c
JOIN loyalty_tier l
ON c.customer_id = l.customer_id
GROUP BY c.purchase_frequency_days, l.tier;

-- 8
CREATE OR REPLACE VIEW vw_top3_products_per_category AS
WITH best_product AS
(
    SELECT
        item_purchased AS item,
        category,
        COUNT(*) AS times_bought
    FROM customer_behavior
    GROUP BY item_purchased, category
)
SELECT
    b1.item,
    b1.times_bought,
    b1.category
FROM best_product b1
LEFT JOIN best_product b2
    ON b2.times_bought > b1.times_bought
   AND b1.category = b2.category
GROUP BY b1.category, b1.item
HAVING COUNT(DISTINCT b2.times_bought) < 3;

-- 9
CREATE OR REPLACE VIEW vw_subscription_by_loyalty AS
WITH loyalty_tier AS
(
    SELECT
        customer_id,
        subscription_status,
        CASE
            WHEN previous_purchases <= 3 THEN 'New'
            WHEN previous_purchases <= 15 THEN 'Regular'
            ELSE 'Loyal'
        END AS tier
    FROM customer_behavior
)
SELECT
    tier,
    COUNT(*) AS total_customers,
    SUM(
        CASE
            WHEN subscription_status = 'Yes' THEN 1
            ELSE 0
        END
    ) AS subscribers,
    ROUND(
        100.0 *
        SUM(
            CASE
                WHEN subscription_status = 'Yes' THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS subscription_rate
FROM loyalty_tier
GROUP BY tier;

-- 10
CREATE OR REPLACE VIEW vw_orders_by_age_group AS
SELECT
    COUNT(*) AS total_orders,
    age_group
FROM customer_behavior
GROUP BY age_group;

-- 11
CREATE OR REPLACE VIEW vw_discount_vs_satisfaction AS
SELECT
    discount_applied,
    ROUND(AVG(review_rating),2) AS avg_rating
FROM customer_behavior
GROUP BY discount_applied;

-- 12
CREATE OR REPLACE VIEW vw_subscription_by_category AS
SELECT
    category,
    ROUND(
        100.0 * SUM(subscription_status='Yes')
        / COUNT(*),
        2
    ) AS subscription_rate
FROM customer_behavior
GROUP BY category;

-- 13
CREATE OR REPLACE VIEW vw_revenue_by_segment AS
WITH loyalty_tier AS
(
    SELECT
        customer_id,
        CASE
            WHEN previous_purchases <= 3 THEN 'New'
            WHEN previous_purchases <= 15 THEN 'Regular'
            ELSE 'Loyal'
        END AS tier
    FROM customer_behavior
)
SELECT
    CONCAT(l.tier,'-',c.purchase_frequency_days,'-days') AS segment,
    COUNT(c.customer_id) AS total_cust,
    ROUND(AVG(c.purchase_amt)) AS avg_spent,
    ROUND(SUM(c.purchase_amt)) AS total_spent
FROM customer_behavior c
JOIN loyalty_tier l
ON c.customer_id = l.customer_id
GROUP BY c.purchase_frequency_days, l.tier;

-- 14
CREATE OR REPLACE VIEW vw_age_category_distribution AS
SELECT
    age_group,
    category,
    ROUND(
        100.0 * COUNT(*) /
        SUM(COUNT(*)) OVER(PARTITION BY age_group),
        2
    ) AS pct_customers
FROM customer_behavior
GROUP BY age_group, category;
