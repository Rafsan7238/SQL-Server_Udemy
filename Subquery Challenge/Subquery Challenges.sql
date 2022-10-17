/*
# Subquery Challenges
*/

/*
\*\*Use SAMPLEDB Database\*\*
*/

USE SAMPLEDB 
GO

/*
### **First Challenge**

Challenge: Return the following product details for the cheapest product(s) in the oes.products table: 

\- product\_id 

\- product\_name 

\- list\_price 

\- category\_id
*/

SELECT product_id, product_name, list_price, category_id 
FROM oes.products 
WHERE list_price = (SELECT MIN(list_price) FROM oes.products);

/*
### **Second Challenge**

Challenge: Use a correlated subquery to return the following product details for the cheapest product(s) in each product category as given by the category\_id column: 

\- product\_id 

\- product\_name 

\- list\_price 

\- category\_id
*/

SELECT p.product_id, p.product_name, p.list_price, p.category_id 
FROM oes.products p 
WHERE p.list_price = 
(SELECT MIN(p2.list_price) 
FROM oes.products p2
WHERE p.category_id = p2.category_id);

/*
### **Third Challenge** 

Challenge: Return the same result as challenge 2 i.e. the cheapest product(s) in each product category except this time by using an inner join to a derived table.
*/

SELECT p.product_id, p.product_name, p.list_price, p.category_id 
FROM oes.products p 
INNER JOIN 
(SELECT category_id, MIN(list_price) as min_list_price
FROM oes.products 
GROUP BY category_id) p2
ON p.category_id = p2.category_id 
WHERE p.list_price = p2.min_list_price;

/*
### **Fourth Challenge** 

Challenge: Return the same result as challenge 2 and 3 i.e. the cheapest product(s) in each product category except this time by using a common table expression.
*/

WITH min_price_cat AS
(SELECT category_id, MIN(list_price) as min_list_price
FROM oes.products 
GROUP BY category_id)
SELECT p.product_id, p.product_name, p.list_price, p.category_id 
FROM oes.products p, min_price_cat
WHERE p.category_id = min_price_cat.category_id AND p.list_price = min_price_cat.min_list_price;

/*
### **Fifth Challenge** 

Challenge: Repeat challenge 4, except this time include the product category name as given in the oes.product\_categories table.
*/

WITH min_price_cat AS
(SELECT category_id, MIN(list_price) as min_list_price
FROM oes.products 
GROUP BY category_id)
SELECT p.product_id, p.product_name, p.list_price, p.category_id, pc.category_name 
FROM oes.products p, min_price_cat, oes.product_categories pc
WHERE p.category_id = min_price_cat.category_id AND p.list_price = min_price_cat.min_list_price AND p.category_id = pc.category_id;

/*
### **Sixth Challenge** 

Background: The employee\_id column in the oes.orders table gives the employee\_id of the salesperson who made the sale. 

  

Challenge: Use the NOT IN operator to return all employees who have never been the salesperson for any customer order. Include the following columns from hcm.employees: 

\- employee\_id 

\- first\_name 

\- last\_name
*/

SELECT e.employee_id, e.first_name, e.last_name 
FROM hcm.employees e
WHERE e.employee_id NOT IN 
(SELECT employee_id 
FROM oes.orders
WHERE employee_id IS NOT NULL);

/*
### **Seventh Challenge** 

Challenge: Return the same result as challenge 6, except use WHERE NOT EXISTS
*/

SELECT e.employee_id, e.first_name, e.last_name 
FROM hcm.employees e
WHERE NOT EXISTS
(SELECT employee_id 
FROM oes.orders o
WHERE e.employee_id = o.employee_id);

/*
### **Eighth Challenge** 

Challenge: Return unique customers who have ordered the 'PBX Smart Watch 4’. Include: 

\- customer\_id 

\- first\_name 

\- last\_name 

\- email
*/

SELECT DISTINCT c.customer_id, c.first_name, c.last_name, c.email
FROM oes.customers c 
INNER JOIN oes.orders o 
ON c.customer_id = o.customer_id 
INNER JOIN oes.order_items oi 
ON o.order_id = oi.order_id 
INNER JOIN oes.products p 
ON oi.product_id = p.product_id 
WHERE p.product_name = 'PBX Smart Watch 4';