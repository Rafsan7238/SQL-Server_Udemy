/*
# **SELECT Challenges**
*/

/*
\*\*Use the SAMPLEDB database\*\*
*/

USE SAMPLEDB
GO

/*
### **First SELECT Challenge**

Challenge: Use a SELECT statement to get the first\_name and last\_name of all employees.
*/

SELECT first_name, last_name
FROM hcm.employees;

/*
### **Second SELECT Challenge**  

Challenge: Use a SELECT statement to get the last\_name and city of all customers. Alias the last\_name to customer\_last\_name in the query.
*/

SELECT last_name as customer_last_name, city
FROM oes.customers;

/*
### **Third SELECT Challenge**  

Challenge: Use a SELECT statement to select all columns from the oes.order\_items table.
*/

SELECT * FROM oes.order_items;