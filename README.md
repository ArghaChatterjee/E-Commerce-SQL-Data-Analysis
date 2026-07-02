# E-Commerce-SQL-Data-Analysis
SQL-based analysis of the "Olist E-Commerce dataset" to evaluate order fulfilment, customer satisfaction, seller performance, and payment behaviour.

📌 Problem Statement
An e-commerce company wants to evaluate its order fulfilment performance and customer satisfaction levels. The company receives thousands of orders from customers across different regions and works with multiple sellers and products.
The objective of this project is to analyse order status, delivery performance, customer reviews, payment behaviour, product categories, and seller activity using SQL Server. The analysis aims to identify patterns that affect customer satisfaction and provide actionable insights to improve operational efficiency and business performance.

🔍 Research Questions
These are the business questions your SQL analysis will answer.
Order Fulfilment Analysis
1.	What percentage of orders are successfully delivered? 
2.	What are the most common order statuses? 
3.	How long does it take, on average, to deliver an order? 
4.	Which orders experience the longest delivery times? 
Customer Satisfaction Analysis
5.	What is the average customer review score? 
6.	How are review scores distributed across orders? 
7.	Does longer delivery time lead to lower review scores? 
8.	Which delivery performance factors influence customer satisfaction? 
Product Analysis
9.	Which product categories have the highest number of orders? 
10.	Which product categories receive the highest customer ratings? 
11.	Are there product categories associated with lower customer satisfaction? 
Seller Analysis
12.	Which sellers process the highest number of orders? 
13.	Which sellers receive the best customer ratings? 
14.	Are some sellers associated with slower deliveries? 
Payment Analysis
15.	What payment methods are most frequently used? 
16.	What is the average payment value per order? 
17.	Do payment methods differ across customer purchasing behaviour?

📌 Detailed Analysis
1. Order Fulfilment Analysis: -
Research Question 1
Out of 99,441 total orders, 96,478 orders were successfully delivered, resulting in a 97.02% delivery success rate. This indicates that the vast majority of customer orders were completed successfully and reached their destination.
 
Business Insight
The e-commerce platform demonstrates strong operational and logistics performance, with more than 97% of orders delivered successfully.

---------------------------------------------------------------------------------------------------------------------------------------------------
Research Question 2
The most common order status is "delivered" with 96,478 orders, accounting for the vast majority of transactions. Other statuses such as shipped, cancelled, and unavailable occur much less frequently.
 
Business Insight
A very high number of delivered orders indicates strong order fulfilment performance. Since cancelled and unavailable orders represent a small proportion of total orders, the company appears to maintain efficient inventory and logistics operations.

---------------------------------------------------------------------------------------------------------------------------------------------------
Research Question 3
The average delivery time for completed orders was 12 days. This indicates that customers generally received their orders within approximately two weeks of placing them.
 
Business Insight
Delivery speed is a critical factor affecting customer satisfaction. An average delivery time of 12 days suggests that the company maintains a relatively efficient logistics network. However, reducing delivery times further may improve customer experience and increase positive review scores.

---------------------------------------------------------------------------------------------------------------------------------------------------
Research Question 4
The longest-delivered orders required more than 200 days to reach customers. These orders represent extreme delivery delays and may indicate logistics disruptions, inventory shortages, transportation issues, or operational inefficiencies.
 
Business Insight
While the average delivery time may be reasonable, a small number of orders experienced exceptionally long delays. These outliers can significantly affect customer satisfaction and may contribute to negative reviews. Investigating the root causes of these delayed deliveries could help improve service quality and reduce customer complaints.

---------------------------------------------------------------------------------------------------------------------------------------------------
2. Customer Satisfaction Analysis: -
Research Question 5
The average customer review score was 4.09 out of 5, indicating that customers were generally satisfied with their purchasing experience on the platform.
 
Business Insight
A review score above 4.0 suggests a positive customer experience and reflects effective order fulfilment, product quality, and customer service.

---------------------------------------------------------------------------------------------------------------------------------------------------
Research Question 6
The distribution of review scores shows that 5-star and 4-star ratings account for the majority of customer reviews, indicating generally positive customer experiences. Lower ratings (1-star and 2-star) represent a smaller proportion of total reviews, suggesting that only a limited number of customers reported dissatisfaction.
 
Business Insight
Review score distribution provides more detail than the average score alone.

---------------------------------------------------------------------------------------------------------------------------------------------------
Research Question 7
Orders with lower review scores generally experienced longer delivery times. Customers who waited longer for their orders were more likely to provide negative feedback, suggesting a relationship between delivery speed and customer satisfaction.
 
Business Insight
This analysis helps determine whether logistics performance directly impacts customer satisfaction.

---------------------------------------------------------------------------------------------------------------------------------------------------
Research Question 8
On-time deliveries received significantly higher customer ratings than late deliveries. Customers whose orders arrived on or before the estimated delivery date were generally more satisfied than customers who experienced delivery delays.
 
Business Insight
This analysis demonstrates that delivery punctuality is a major driver of customer satisfaction.

---------------------------------------------------------------------------------------------------------------------------------------------------
3. Product Analysis: -
Research Question 9
The product categories with the highest number of orders were cama_mesa_banho, beleza_saude, and esporte_lazer. These categories generated the largest share of customer demand and represent key revenue-driving segments for the e-commerce platform.
 
Business Insight
High-demand product categories should be prioritized for inventory planning, marketing campaigns, and supply chain management. Maintaining product availability in these categories can help maximize sales and improve customer satisfaction.

---------------------------------------------------------------------------------------------------------------------------------------------------
Research Question 10
The analysis revealed that the highest-rated product categories achieved average review scores above 4.2 out of 5. These categories consistently received positive customer feedback and demonstrated strong customer satisfaction levels.
 
Business Insight
Highly rated categories likely meet customer expectations in terms of product quality, packaging, and delivery experience. These categories can serve as benchmarks for improving lower-performing categories.

---------------------------------------------------------------------------------------------------------------------------------------------------
Research Question 11
The analysis identified several product categories with below-average customer ratings. These categories received lower review scores compared to other product segments, indicating potential issues related to product quality, delivery experience, seller performance, or customer expectations.
 
Business Insight
Product categories with consistently low ratings may contribute to customer dissatisfaction and negative platform perception. Investigating these categories can help identify recurring issues and improve the overall customer experience.

---------------------------------------------------------------------------------------------------------------------------------------------------
4. Seller Analysis: -
Research Question 12
The analysis identified the top-performing sellers based on the number of unique orders processed. These sellers handled the highest order volumes on the platform, demonstrating strong operational capacity and significant contribution to overall sales.
 
Business Insight
Sellers with high order volumes are key contributors to the platform's success. These sellers may require additional inventory support and logistics resources. Their performance can serve as a benchmark for other sellers on the platform.

---------------------------------------------------------------------------------------------------------------------------------------------------
Research Question 13
The analysis identified the sellers with the highest average customer ratings. These sellers consistently received positive customer feedback while processing a substantial number of orders, indicating strong performance in product quality, order fulfilment, and customer service.
 
Business Insight
Sellers with consistently high ratings contribute significantly to customer satisfaction. Their practices can be studied and used as benchmarks for improving the performance of other sellers. High-rated sellers are valuable partners and should be retained through incentive and support programs.

---------------------------------------------------------------------------------------------------------------------------------------------------
Research Question 14
The analysis identified several sellers with significantly higher average delivery times than others. These sellers consistently required more time to deliver customer orders, indicating possible inefficiencies in shipping, inventory management, or logistics.
 
Business Insight
Sellers with longer delivery times may contribute to lower customer satisfaction. Slow deliveries can increase negative reviews and reduce customer trust. Monitoring seller-level delivery performance helps identify operational issues and opportunities for improvement.

---------------------------------------------------------------------------------------------------------------------------------------------------
4. Payment Analysis: -
Research Question 15
The analysis shows that Credit Card is the most frequently used payment method, accounting for the largest proportion of transactions. Boleto is the second most popular payment method, followed by Voucher and Debit Card. This indicates that customers prefer flexible and convenient digital payment options.
 
Business Insight
Credit cards are the preferred payment option among customers. Alternative payment methods such as Boleto and Voucher remain important for a portion of customers. Understanding payment preferences helps the company optimize its checkout process and improve customer convenience.

---------------------------------------------------------------------------------------------------------------------------------------------------
Research Question 16
The average payment value per order was ₹154.10. This represents the typical amount customers spent on a single order.
 
Business Insight
The average payment value helps estimate customer spending behaviour. It can be used to track changes in customer purchasing patterns over time. Businesses can use this metric to measure the impact of promotions, pricing strategies, and product mix on revenue.

---------------------------------------------------------------------------------------------------------------------------------------------------
Research Question 17
The analysis indicates that customer purchasing behaviour differs across payment methods. Customers using Credit Card tend to spend more on average per order than those using Voucher or Debit Card. This suggests that payment preferences are associated with different spending patterns.
 
Business Insight
Credit card users generally place higher-value orders. Voucher payments are more common for lower-value purchases. Understanding these spending patterns can help the business design targeted promotions and payment-specific offers.
