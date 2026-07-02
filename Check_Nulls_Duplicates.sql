CREATE DATABASE ecommerce_analysis;
USE ecommerce_analysis;

-- Count rows in each table
SELECT COUNT(*) AS Customers FROM olist_customers_dataset;
SELECT COUNT(*) AS Geolocation FROM olist_geolocation_dataset;
SELECT COUNT(*) AS Order_items FROM olist_order_items_dataset;
SELECT COUNT(*) AS Order_payments FROM olist_order_payments_dataset;
SELECT COUNT(*) AS Order_reviews FROM olist_order_reviews_dataset;
SELECT COUNT(*) AS Orders FROM olist_orders_dataset;
SELECT COUNT(*) AS Products FROM olist_products_dataset;
SELECT COUNT(*) AS Sellers FROM olist_sellers_dataset;
SELECT COUNT(*) AS Category_name FROM product_category_name_translation;

--------------------------------------------------------------------------------
-- Check Duplicate Entry Exists or not (Using Primary Key)
-- Orders
SELECT order_id, COUNT(*)
FROM olist_orders_dataset
GROUP BY order_id
HAVING COUNT(*) > 1;

-- Customers
SELECT customer_id, COUNT(*)
FROM olist_customers_dataset
GROUP BY customer_id
HAVING COUNT(*) > 1;

-- Products
SELECT product_id, COUNT(*)
FROM olist_products_dataset
GROUP BY product_id
HAVING COUNT(*) > 1;

-- Sellers
SELECT seller_id, COUNT(*)
FROM olist_sellers_dataset
GROUP BY seller_id
HAVING COUNT(*) > 1;
------------------------------------------------------------------------------

-- Check Data Types
SELECT TABLE_NAME, COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME IN (
'olist_orders_dataset',
'olist_order_items_dataset',
'olist_order_payments_dataset',
'olist_order_reviews_dataset',
'olist_products_dataset'
)
ORDER BY TABLE_NAME;

-------------------------------------------------------------------------------

-- Check NULL Values

-- Check Missing Product Category
SELECT COUNT(*) AS 'Missing Category'
FROM olist_products_dataset
WHERE product_category_name IS NULL;

-- UPDATE The Products Null Values
UPDATE olist_products_dataset
SET product_category_name = 'Unknown'
WHERE product_category_name IS NULL;

-- Check review comment NULLs
SELECT COUNT(*) AS 'Missing Comments'
FROM olist_order_reviews_dataset
WHERE review_comment_message IS NULL;

-- Don't Update 'Null Values' 
-- Because Customers often leave only a rating and no comment.
-- These NULLs are valid business data.

-- Orders
SELECT order_status, COUNT(*) AS 'Total Orders'
FROM olist_orders_dataset
WHERE order_delivered_customer_date IS NULL
GROUP BY order_status
ORDER BY [Total Orders] DESC;

--------------------------------------------------------------------------------