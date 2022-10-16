/*
# Advanced Join Challenges
*/

/*
\*\*Use SAMPLEDB Database\*\*
*/

USE SAMPLEDB 
GO

/*
### **First Challenge** 

Challenge: Write a query to return employee details for all employees as well as the first and last name of each employee's manager. Include the following columns: 

\- employee\_id 

\- first\_name 

\- last\_name 

\- manager\_first\_name (alias for first\_name) 

\- manager\_last\_name (alias for last\_name)
*/

SELECT e.employee_id, e.first_name, e.last_name, e2.first_name AS manager_first_name, e2.last_name AS manager_last_name
FROM hcm.employees e LEFT JOIN hcm.employees e2
ON e.manager_id = e2.employee_id;

/*
### **Second Challenge** 

Challenge: Write a query to return all the products at each warehouse. Include the following attributes: 

\- product\_id 

\- product\_name 

\- warehouse\_id 

\- warehouse\_name 

\- quantity\_on\_hand
*/

SELECT i.product_id, p.product_name, i.warehouse_id, w.warehouse_name, i.quantity_on_hand 
FROM oes.inventories i INNER JOIN oes.products p
ON i.product_id = p.product_id 
INNER JOIN oes.warehouses w
ON i.warehouse_id = w.warehouse_id;

SELECT i.product_id, p.product_name, i.warehouse_id, w.warehouse_name, i.quantity_on_hand 
FROM oes.inventories i, oes.products p, oes.warehouses w
WHERE i.product_id = p.product_id AND i.warehouse_id = w.warehouse_id;

/*
### **Third Challenge** 

Challenge: Write a query to return the following attributes for all employees from Australia: 

\- employee\_id 

\- first\_name 

\- last\_name 

\- department\_name 

\- job\_title 

\- state\_province
*/

SELECT e.employee_id, e.first_name, e.last_name, d.department_name, j.job_title, e.state_province 
FROM hcm.employees e LEFT JOIN hcm.departments d
ON e.department_id = d.department_id 
INNER JOIN hcm.jobs j 
ON e.job_id = j.job_id 
INNER JOIN hcm.countries c 
ON e.country_id = c.country_id 
WHERE c.country_name = 'Australia';

/*
### **Fourth Challenge** 

Challenge: Return the total quantity ordered of each product in each category. Do not include products which have never been ordered. Include the product name and category name in the query. Order the results by category name from A to Z and then within each category name order by product name from A to Z.
*/

SELECT pc.category_name, p.product_name, SUM(o.quantity) AS total_quantity_ordered
FROM oes.order_items o INNER JOIN oes.products p 
ON o.product_id = p.product_id 
INNER JOIN oes.product_categories pc 
ON p.category_id = pc.category_id 
GROUP BY pc.category_name, p.product_name
ORDER BY pc.category_name, p.product_name;

/*
### **Fifth Challenge** 

Challenge: Return the total quantity ordered of each product in each category. Include products which have never been ordered and give these a total quantity ordered of 0. Include the product name and category name in the query. Order the results by category name from A to Z and then within each category name order by product name from A to Z.
*/

SELECT pc.category_name, p.product_name, ISNULL(SUM(o.quantity), 0) AS total_quantity_ordered
FROM oes.order_items o RIGHT JOIN oes.products p 
ON o.product_id = p.product_id 
INNER JOIN oes.product_categories pc 
ON p.category_id = pc.category_id 
GROUP BY pc.category_name, p.product_name
ORDER BY pc.category_name, p.product_name;