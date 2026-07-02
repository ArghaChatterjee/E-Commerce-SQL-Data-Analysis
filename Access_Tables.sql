USE ecommerce_analysis;

SELECT * FROM olist_customers_dataset;
SELECT * FROM olist_geolocation_dataset;
SELECT * FROM olist_order_items_dataset;
SELECT * FROM olist_order_payments_dataset;
SELECT * FROM olist_order_reviews_dataset;
SELECT * FROM olist_orders_dataset;
SELECT * FROM olist_products_dataset;
SELECT * FROM olist_sellers_dataset;
SELECT * FROM product_category_name_translation;

ALTER TABLE product_category_name_translation
ADD ProductID INT IDENTITY(1,1) NOT NULL;

EXEC sp_rename 'product_category_name_translation.column1', 'product_category_name', 'COLUMN';

EXEC sp_rename 'product_category_name_translation.column2', 'product_category_name_english', 'COLUMN';

-- Delete from product_category_name_translation where ProductID= 1;

ALTER TABLE product_category_name_translation
DROP COLUMN ProductID;