# 🛒 Olist Brazilian E-Commerce Project
An end-to-end e-commerce data analysis project using SQL Server and Power BI to analyze sales performance, customer behavior, shipping efficiency, product performance, and customer reviews.

---

## 📌 Project Overview

This project analyzes the Brazilian Olist e-commerce dataset to uncover actionable business insights across different areas of the customer journey.

The analysis focuses on five main business areas:

- 📊 Overall business performance
- 👥 Customer behavior and segmentation
- ⭐ Customer reviews and support response
- 🚚 Shipping and delivery performance
- 🛍️ Product, category, and seller performance

The project combines **SQL data preparation and transformation** with an interactive **Power BI dashboard** to turn raw e-commerce data into business insights.

---

## 🎯 Business Objectives

The main objectives of this project were to answer questions such as:

- How is the business performing in terms of revenue and order volume?
- How concentrated is revenue across product categories?
- What percentage of customers are returning customers?
- Which payment methods are most commonly used?
- How efficient is the delivery process?
- How frequently are orders delayed?
- Does delivery delay have an impact on customer reviews?
- Which products and categories perform best?
- How do sellers and product prices relate to sales performance?

---

## 🛠️ Tools & Technologies

- **SQL Server** – Data preparation, transformation, aggregation, and business logic
- **Power BI** – Data modeling, DAX measures, interactive dashboards, and visualization
- **DAX** – KPI calculations and business metrics
- **Power Query** – Data preparation and transformation

---

# 🔄 Data Preparation & SQL

SQL Server was used to prepare the data before building the Power BI model.

The transformation process included:

- Joining related datasets using business keys such as order_id, customer_id, seller_id, and product_id
- Creating analytical views
- Calculating delivery and shipping metrics
- Categorizing customer reviews
- Categorizing review response time
- Preparing payment information
- Creating seller and product-level analytical data
- Handling null values and business conditions
- Ensuring metrics were calculated at the appropriate business grain

### SQL Queries

- [Customers & Orders Analysis](Customers_Orders.sql)
- [Orders, Products & Sellers Analysis](Orders_Products_Sellers.sql)
- [Reviews Analysis](Reviews.sql)
- [Payment Analysis](Payments.sql)

# 📊 Power BI Dashboard

The final Power BI report contains four interactive analytical pages.

## 1️⃣ Overview

The Overview page provides a high-level view of business performance.

### Key KPIs

- **Net Revenue:** 15.74M
- **Orders:** 99.44K
- **Customers:** 96.10K
- **AOV:** $160.99
- **Average Delivery Time:** 12.5 days
- **Average Review Score:** 4.09
- **Returning Customer Rate:** 3.12%

### Analysis includes:

- Customer segmentation
- Customer geographical distribution
- Payment type distribution
- Undelivered order status
- Revenue and order trends over time

![Overview Dashboard](images/overview.png)
<img width="1420" height="800" alt="Screenshot 2026-08-08 032946" src="https://github.com/user-attachments/assets/0e8e1e5a-13a1-4e5b-b20b-c13bd6066d05" />

---

## 2️⃣ Reviews & Customer Experience

This page focuses on customer satisfaction and post-purchase experience.

### Key KPIs

- **Average Review Score:** 4.09
- **Negative Review Rate:** 14.58%
- **Average Review Response Time:** 2.58 days

### Analysis includes:

- Review score distribution
- Negative review rate over time
- Review score by state
- Positive and negative product categories
- Customer feedback classification
- Review response-time performance

The analysis also explores the relationship between **delivery delay and review scores**, helping identify how operational performance can influence customer experience.

![Reviews Dashboard](images/reviews.png)
<img width="1423" height="802" alt="Screenshot 2026-08-08 033014" src="https://github.com/user-attachments/assets/f95ec005-c89e-4eeb-b653-be10923c9100" />

---

## 3️⃣ Shipping Performance

The Shipping page analyzes delivery efficiency and operational performance.

### Key KPIs

- **Average Delivery Time:** 12.5 days
- **Average Seller Processing Time:** 2.71 days
- **Average Company Shipping Time:** 9.28 days
- **Average Delay:** 10.6 days
- **Delay Rate:** 6.77%
- **Delivered Orders:** 96.48K
- **Non-delivered Orders:** 1,428

### Analysis includes:

- Delay rate by state
- Average delivery time by state
- Delivery time distribution
- Freight cost vs. delivery performance
- Shipping performance over time

This page helps identify geographical and operational differences in delivery performance.

![Shipping Dashboard](images/shipping.png)
<img width="1423" height="801" alt="Screenshot 2026-08-08 033043" src="https://github.com/user-attachments/assets/09f693ea-664d-45a8-a753-61b8ec67337b" />

---

## 4️⃣ Products & Sellers

The Products & Sellers page focuses on product, category, and seller performance.

### Key KPIs

- **Average Product Price:** $120.65
- **Total Products:** 32.95K
- **Total Categories:** 73
- **Total Sellers:** 3,096
- **Units Sold:** 113K

### Analysis includes:

- Top categories by quantity
- Top categories by revenue
- Top products by sales volume
- Top products by revenue
- Seller performance
- Product price levels
- Revenue concentration by category
- Unavailable products

### Key Finding

The **top 20% of product categories generated 76.29% of total revenue**, showing a strong concentration of revenue within a relatively small group of categories.

![Products & Sellers Dashboard](images/products.png)
<img width="1426" height="800" alt="Screenshot 2026-08-08 033117" src="https://github.com/user-attachments/assets/d87faeff-ab34-4e5e-b3b6-bafe746527d3" />

---

# 💡 Key Business Insights

### 1. Revenue is highly concentrated

The top 20% of product categories generate **76.29% of total revenue**, indicating that a relatively small group of categories contributes the majority of business revenue.

### 2. Customer retention is relatively low

The returning customer rate is **3.12%**, indicating that most customers made a one-time purchase during the analyzed period.

This highlights a potential opportunity to improve customer retention and repeat purchases.

### 3. Delivery performance is an important operational challenge

The overall delivery delay rate is **6.77%**, while the average delivery time is **12.5 days**.

The state-level analysis also shows significant differences in delay rates across locations.

### 4. Customer satisfaction is generally positive

The average review score is **4.09/5**, although **14.58% of reviews are negative**, indicating that there is still a meaningful portion of customers experiencing dissatisfaction.

### 5. Customer Feedback & No-Comment Reviews

Most reviews with no written comments were positive, suggesting that customers often expressed satisfaction through their rating even without leaving additional feedback.

### 6. Product and seller performance varies

The Products & Sellers analysis shows differences in:

- Product prices
- Units sold
- Revenue
- Seller performance

This allows the business to identify high-performing products and categories as well as opportunities for seller and pricing optimization.
