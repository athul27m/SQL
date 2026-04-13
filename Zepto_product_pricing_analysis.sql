SELECT * FROM zepto.zepto_v2;

-- Q1. How many products are currently out of stock vs in stock?
SELECT COUNT(*) AS product_count, outOfStock
FROM zepto_v2
GROUP BY outOfStock;


-- Q2. List all products where discount is 0% — no deal at all.
SELECT DISTINCT name, category, mrp / 100.0 AS mrp_rupees
FROM zepto_v2
WHERE discountPercent = 0
ORDER BY mrp_rupees DESC;


-- Q3. Which products have the biggest gap between MRP and selling price?
SELECT DISTINCT name, category,
ROUND(mrp / 100.0, 2) AS mrp_rupees,
ROUND(discountedSellingPrice / 100.0, 2) AS selling_price,
ROUND((mrp - discountedSellingPrice) / 100.0, 2) AS discount_amount
FROM zepto_v2
ORDER BY discount_amount DESC
LIMIT 10;


-- Q4. Which categories drive the most estimated live revenue (in-stock only)?
SELECT category,
ROUND(SUM(discountedSellingPrice / 100.0 * availableQuantity), 2) AS live_inventory_value
FROM zepto_v2
WHERE outOfStock = FALSE
GROUP BY category
ORDER BY live_inventory_value DESC;


-- Q5. Rank products by discount within each category
SELECT name, category, discountPercent,
RANK() OVER (PARTITION BY category ORDER BY discountPercent DESC) AS discount_rank
FROM zepto_v2
WHERE outOfStock = FALSE;


-- Q6. For each category, find the single highest-MRP product
WITH ranked AS (
SELECT name, category,
ROUND(mrp / 100.0, 2) AS mrp_rupees,
ROW_NUMBER() OVER (PARTITION BY category ORDER BY mrp DESC) AS row_num
FROM zepto_v2
)
SELECT name, category, mrp_rupees
FROM ranked
WHERE row_num = 1;

-- Q7. Running total of inventory value by category (cumulative)
SELECT name, category,
ROUND(discountedSellingPrice / 100.0 * availableQuantity, 2) AS product_value,
ROUND(SUM(discountedSellingPrice / 100.0 * availableQuantity)
OVER (PARTITION BY category ORDER BY name), 2) AS running_total
FROM zepto_v2
WHERE outOfStock = FALSE;


-- Q8. Which weight bucket (Light/Medium/Heavy) has the best average discount?
SELECT
CASE
    WHEN weightInGms < 500 THEN 'Light (< 500g)'
    WHEN weightInGms BETWEEN 500 AND 2000 THEN 'Medium (500g–2kg)'
    ELSE 'Heavy (> 2kg)'
END AS weight_bucket,
ROUND(AVG(discountPercent), 2) AS avg_discount,
COUNT(*) AS product_count
FROM zepto_v2
GROUP BY weight_bucket
ORDER BY avg_discount DESC;