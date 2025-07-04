# 🛍️ Sales Data Analysis (Python + SQL)

A complete data analytics project combining **Pandas-based EDA** and **MySQL querying** to generate business insights from retail order data.

---

## 📦 Dataset

The dataset is sourced from Kaggle:

> [ankitbansal06/retail-orders](https://www.kaggle.com/datasets/ankitbansal06/retail-orders)

It contains order-level data with columns like:
- `order_date`, `ship_mode`, `region`, `product_id`, `category`, `sub_category`, `sale_price`, etc.

---

## 🧪 EDA (Exploratory Data Analysis)

Performed using **Pandas** library.

### ✅ Key Steps:
- Installed and used **Kaggle API** to download dataset
- Standardized column names (lowercase, underscore-separated)
- Handled null values (`'Not Available'`, `'unknown'`)
- Basic exploratory checks (`.info()`, `.describe()`, `.isnull().sum()`)


---

## 🧾 SQL Analysis (MySQL Compatible)

Includes advanced MySQL queries using `GROUP BY`, `JOIN`, `WINDOW FUNCTIONS`, and `CTEs`.

### 🔍 Key Business Questions Answered:
| Query | Description |
|-------|-------------|
| Top Products | Find top 10 highest revenue-generating products |
| Regional Rankings | Top 5 selling products in each region using window functions |
| MoM Growth | Compare month-over-month sales of 2022 vs 2023 |
| Category Trends | Month with highest sales for each product category |
| Sub-category Growth | Identify which sub-category had highest YoY growth in 2023 |

---

## 🛠️ Technologies Used

| Tool | Purpose |
|------|---------|
| **Python (Pandas)** | Data Cleaning, Manipulation, Aggregation |
| **MySQL** | Complex queries for deep business insights |
| **Jupyter Notebook** | Interactive EDA |
| **Kaggle API** | Dataset Download |
