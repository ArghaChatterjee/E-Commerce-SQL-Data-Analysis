USE ecommerce_analysis;

-- Order Fulfilment Analysis

-- 1. What percentage of orders are successfully delivered?
SELECT ROUND(
		100.0 * SUM(CASE WHEN order_status = 'delivered' THEN 1 ELSE 0 END) / COUNT(*),
		2) AS 'Delivered Rate'
FROM olist_orders_dataset;

-- 2. What are the most common order statuses?
SELECT 
	order_status,
	COUNT(*) AS 'Total_Orders'
FROM olist_orders_dataset
GROUP BY order_status
ORDER BY Total_Orders DESC;

-- 3. How long does it take, on average, to deliver an order?
SELECT AVG(
		DATEDIFF(
			DAY,
			order_purchase_timestamp,
			order_delivered_customer_date)) AS 'avg_delivery_days'
FROM olist_orders_dataset
WHERE order_status = 'delivered' AND order_delivered_customer_date IS NOT NULL;

-- 4. Which orders experience the longest delivery times?
SELECT TOP 10
	order_id,
	order_purchase_timestamp,
	order_delivered_customer_date,
	DATEDIFF(DAY, order_purchase_timestamp, order_delivered_customer_date) AS 'delivered_days'
FROM olist_orders_dataset
WHERE order_status = 'delivered' AND order_delivered_customer_date IS NOT NULL
ORDER BY delivered_days DESC;

--------------------------------------------------------------------------------------------------------

-- Customer Satisfaction Analysis

-- 5. What is the average customer review score?
SELECT 
	ROUND(
		AVG(CAST(review_score AS FLOAT)), 
		2) AS avg_review_score 
FROM olist_order_reviews_dataset;

-- 6. How are review scores distributed across orders?
SELECT
	review_score,
	COUNT(*) AS 'total_reviews',
	ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER(), 2) AS 'reviews_%'
FROM olist_order_reviews_dataset
GROUP BY review_score
ORDER BY review_score DESC;

-- 7. Does longer delivery time lead to lower review scores?
SELECT
	review_score,
	ROUND(
		AVG(
			CAST(
				DATEDIFF(DAY, order_purchase_timestamp, order_delivered_customer_date) AS FLOAT
				)
			), 2) AS avg_delivery_day
FROM olist_orders_dataset od 
JOIN olist_order_reviews_dataset ord 
ON od.order_id = ord.order_id
WHERE order_status = 'delivered'
AND order_delivered_customer_date IS NOT NULL
GROUP BY review_score
ORDER BY review_score DESC;

-- 8. Which delivery performance factors influence customer satisfaction?
SELECT
	CASE WHEN order_delivered_customer_date <= order_estimated_delivery_date
		THEN 'On Time' ELSE 'Late' END AS 'delivered_status',

	ROUND(AVG(CAST(review_score AS FLOAT)), 2) AS 'avg_review_score',

	COUNT(*) AS 'total_orders'
FROM olist_orders_dataset o
JOIN olist_order_reviews_dataset r
ON o.order_id = r.order_id
WHERE order_status = 'delivered'
AND order_delivered_customer_date IS NOT NULL
GROUP BY CASE WHEN order_delivered_customer_date <= order_estimated_delivery_date THEN 'On Time' ELSE 'Late' END;

--------------------------------------------------------------------------------------------------------------------

-- Product Analysis
-- 9. Which product categories have the highest number of orders?

SELECT TOP 10
	product_category_name,
	COUNT(order_id) AS 'total_orders'
FROM olist_products_dataset p
JOIN olist_order_items_dataset oi
ON p.product_id = oi.product_id
GROUP BY product_category_name
ORDER BY total_orders DESC;

-- 10. Which product categories receive the highest customer ratings?

SELECT TOP 10
	product_category_name,
	ROUND(AVG(CAST(review_score AS FLOAT)), 2) AS avg_review_score,
	COUNT(*) AS 'total_reviews'
FROM olist_products_dataset p
JOIN olist_order_items_dataset oi
ON p.product_id = oi.product_id
JOIN olist_order_reviews_dataset r
ON oi.order_id = r.order_id
GROUP BY product_category_name
HAVING COUNT(*) >= 30
ORDER BY avg_review_score DESC;

-- 11. Are there product categories associated with lower customer satisfaction?

SELECT TOP 10
	product_category_name,
	ROUND(AVG(CAST(review_score AS FLOAT)), 2) AS avg_review_score,
	COUNT(*) AS 'total_reviews'
FROM olist_products_dataset p
JOIN olist_order_items_dataset oi
ON p.product_id = oi.product_id
JOIN olist_order_reviews_dataset r
ON oi.order_id = r.order_id
GROUP BY product_category_name
HAVING COUNT(*) >= 30
ORDER BY avg_review_score ASC;

--------------------------------------------------------------------------------------------------------------------

-- Seller Analysis
-- 12. Which sellers process the highest number of orders?

SELECT TOP 10
	s.seller_id,
	COUNT(DISTINCT i.order_id) AS 'total_orders'
FROM olist_sellers_dataset s
JOIN olist_order_items_dataset i
ON s.seller_id = i.seller_id
GROUP BY s.seller_id
ORDER BY total_orders DESC;

-- 13. Which sellers receive the best customer ratings?

SELECT TOP 10
	s.seller_id,
	ROUND(AVG(CAST(r.review_score AS FLOAT)), 2) AS 'avg_review_score',
	COUNT(DISTINCT oi.order_id) AS 'total_orders'
FROM olist_sellers_dataset s
JOIN olist_order_items_dataset oi
ON s.seller_id = oi.seller_id
JOIN olist_order_reviews_dataset r ON oi.order_id = r.order_id
GROUP BY s.seller_id
HAVING COUNT(DISTINCT oi.order_id) >= 30
ORDER BY avg_review_score DESC;

-- 14. Are some sellers associated with slower deliveries?

SELECT TOP 10
	s.seller_id,
	COUNT(DISTINCT oi.order_id) AS 'total_orders',
	ROUND(
		AVG(CAST(
				DATEDIFF(
					DAY,
					o.order_purchase_timestamp,
					o.order_delivered_customer_date)
			AS FLOAT)
		), 2) AS 'avg_delivery_day'
FROM
olist_sellers_dataset s
JOIN olist_order_items_dataset oi
ON s.seller_id = oi.seller_id
JOIN olist_orders_dataset o ON oi.order_id = o.order_id
WHERE o.order_status = 'delivered' AND o.order_delivered_customer_date IS NOT NULL
GROUP BY s.seller_id
HAVING COUNT(DISTINCT oi.order_id) >= 30
ORDER BY avg_delivery_day DESC;

--------------------------------------------------------------------------------------------------------------------

-- Payment Analysis
-- 15. What payment methods are most frequently used?

SELECT
	payment_type,
	COUNT(*) AS 'total_orders',
	ROUND(100 * COUNT(*) / SUM(COUNT(*)) OVER(), 2) AS 'percentage'
FROM olist_order_payments_dataset
GROUP BY payment_type
ORDER BY total_orders DESC;

-- 16. What is the average payment value per order?
SELECT
	ROUND(AVG(payment_value), 2) AS 'avg_payment_value'
FROM olist_order_payments_dataset;

-- SELECT
-- 	ROUND(AVG(total_payment), 2) AS 'avg_payment_value'
-- FROM (
--	SELECT
--		order_id,
--		SUM(payment_value) AS 'total_payment'
--	FROM olist_order_payments_dataset op
--	GROUP BY order_id
--	) AS payments;


-- 17. Do payment methods differ across customer purchasing behaviour?
SELECT
	payment_type,
	COUNT(DISTINCT order_id) AS 'total_orders',
	ROUND(AVG(payment_value), 2) AS 'avg_payment_value',
	ROUND(MAX(payment_value), 2) AS 'max_payment_value',
	ROUND(MIN(payment_value), 2) AS 'min_payment_value'
FROM olist_order_payments_dataset
GROUP BY payment_type
ORDER BY avg_payment_value DESC;