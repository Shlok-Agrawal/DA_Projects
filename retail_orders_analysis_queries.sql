
-- 📌 Query 1: Top 10 highest revenue-generating products
SELECT product_id, SUM(sale_price) AS sales
FROM df
GROUP BY product_id
ORDER BY sales DESC
LIMIT 10;


-- 📌 Query 2: Top 5 highest selling products in each region
WITH cte AS (
    SELECT region, product_id, SUM(sale_price) AS sales
    FROM df
    GROUP BY region, product_id
),
ranked AS (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY region ORDER BY sales DESC) AS rn
    FROM cte
)
SELECT *
FROM ranked
WHERE rn <= 5;


-- 📌 Query 3: Month-over-Month growth comparison (2022 vs 2023)
WITH cte AS (
    SELECT YEAR(order_date) AS order_year,
           MONTH(order_date) AS order_month,
           SUM(sale_price) AS sales
    FROM df
    GROUP BY YEAR(order_date), MONTH(order_date)
)
SELECT order_month,
       SUM(CASE WHEN order_year = 2022 THEN sales ELSE 0 END) AS sales_2022,
       SUM(CASE WHEN order_year = 2023 THEN sales ELSE 0 END) AS sales_2023
FROM cte
GROUP BY order_month
ORDER BY order_month;


-- 📌 Query 4: For each category, find the month with the highest sales
WITH cte AS (
    SELECT category,
           DATE_FORMAT(order_date, '%Y%m') AS order_year_month,
           SUM(sale_price) AS sales
    FROM df
    GROUP BY category, DATE_FORMAT(order_date, '%Y%m')
),
ranked AS (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY category ORDER BY sales DESC) AS rn
    FROM cte
)
SELECT *
FROM ranked
WHERE rn = 1;


-- 📌 Query 5: Sub-category with highest YoY sales growth (2023 vs 2022)
WITH cte AS (
    SELECT sub_category,
           YEAR(order_date) AS order_year,
           SUM(sale_price) AS sales
    FROM df
    GROUP BY sub_category, YEAR(order_date)
),
cte2 AS (
    SELECT sub_category,
           SUM(CASE WHEN order_year = 2022 THEN sales ELSE 0 END) AS sales_2022,
           SUM(CASE WHEN order_year = 2023 THEN sales ELSE 0 END) AS sales_2023
    FROM cte
    GROUP BY sub_category
)
SELECT sub_category, sales_2022, sales_2023, (sales_2023 - sales_2022) AS growth
FROM cte2
ORDER BY growth DESC
LIMIT 1;
