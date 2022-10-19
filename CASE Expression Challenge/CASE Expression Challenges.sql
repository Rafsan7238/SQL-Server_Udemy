/*
# CASE Expression Challenges
*/

/*
\*\*Use SAMPLEDB Database\*\*
*/

USE SAMPLEDB
GO

/*
### First Challenge  

Challenge: Select the following columns from the oes.products table: 

• product\_id 

• product\_name 

• discontinued 

Include a CASE expression in the SELECT statement called discontinued\_description. Give this expression the string ‘No’ when the discontinued column equals 0 and a string of ‘Yes’ when the discontinued column equals 1. In all other cases give the expression the string of ‘unknown’.
*/

SELECT product_id, product_name, discontinued,
CASE discontinued 
    WHEN 0 THEN 'No'
    ELSE 'Yes'
END AS discontinued_description
FROM oes.products;

/*
### **Second Challenge** 

Challenge: Select the following columns from the oes.products table: 

• product\_id 

• product\_name 

• list\_price 

Include a CASE expression in the SELECT statement called price\_grade. For this expression.. 

• If list\_price is less than 50 then give the string ‘Low’. 

• If list\_price is greater than or equal to 50 and list\_price is less than 250 then give the string ‘Medium’. 

• If list\_price is greater than or equal to 250 then give the string ‘High’. 

• In all other cases, give the expression the string of ‘unknown’.
*/

SELECT product_id, product_name, list_price,
CASE 
    WHEN list_price < 50 THEN 'Low'
    WHEN list_price >= 50 AND list_price < 250 THEN 'Medium'
    WHEN list_price >= 250 THEN 'High'
    ELSE 'unknown'
END AS price_grade 
FROM oes.products;

/*
### **Third Challenge** 

Challenge: Select the following columns from the oes.orders table: 

• order\_id 

• order\_date 

• shipped\_date 

Include a CASE expression called shipping\_status which determines the difference in days between the order\_date and the shipped\_date. 

• When this difference is less than or equal to 7 then give the string value ‘Shipped within one week’. 

• If the difference is greater than 7 days, then give the string ‘Shipped over a week later’. 

• If shipped\_date is null then give the string ‘Not yet shipped’.
*/

SELECT order_id, order_date, shipped_date, 
CASE 
    WHEN DATEDIFF(day, order_date, shipped_date) <= 7 THEN 'Shipped within one week'
    WHEN DATEDIFF(day, order_date, shipped_date) > 7 THEN 'Shipped over a week later'
    ELSE 'Not yet shipped'
END AS shipping_status
FROM oes.orders;

/*
### **Fourth Challenge** 

Challenge: Repeat the third challenge to derive the shipping\_status expression, but this time get the count of orders by the shipping\_status expression.
*/

WITH shipping_time AS
(SELECT CASE 
    WHEN DATEDIFF(day, order_date, shipped_date) <= 7 THEN 'Shipped within one week'
    WHEN DATEDIFF(day, order_date, shipped_date) > 7 THEN 'Shipped over a week later'
    ELSE 'Not yet shipped'
END AS shipping_status
FROM oes.orders)
SELECT st.shipping_status, COUNT(*) AS order_count_by_status
FROM shipping_time st 
GROUP BY st.shipping_status;