/*
# Logical Operator Challenges
*/

/*
\*\*Use SampleDB Database\*\*
*/

USE SAMPLEDB 
GO

/*
### **First Challenge** 

Challenge: Select employees from the hcm.employees table who live in either Seattle or Sydney.
*/

SELECT * FROM hcm.employees 
WHERE city IN ('Seattle', 'Sydney');

/*
### **Second Challenge** 

Challenge: Select employees who live in any of the following cities: 

\- Seattle 

\- Sydney 

\- Ascot 

\- Hillston
*/

SELECT * FROM hcm.employees 
WHERE city IN ('Seattle', 'Sydney', 'Ascot', 'Hillston');

/*
### **Third Challenge** 

Challenge: Select employees from Sydney who have a salary greater than $200,000.
*/

SELECT * FROM hcm.employees 
WHERE city = 'Sydney' AND salary > 200000;

/*
### **Fourth Challenge** 

Challenge: Select employees who live in either Seattle or Sydney and were also hired on or after 1st January 2019.
*/

SELECT * FROM hcm.employees 
WHERE city IN ('Seattle', 'Sydney') AND hire_date >= '2019-01-01';

/*
### **Fifth Challenge** 

Challenge: Select products from the oes.products table which do not have a product category\_id of either 1, 2, or 5.
*/

SELECT * FROM oes.products 
WHERE category_id NOT IN (1, 2, 5);