/*
# WHERE Clause Challenges
*/

/*
\*\*Use SAMPLEDB Database\*\*
*/

USE SAMPLEDB 
GO

/*
### **First Challenge**  

Challenge: Select products from the oes.products table which have a price greater than $100.
*/

SELECT * FROM oes.products 
WHERE list_price > 100;

/*
### **Second Challenge**  

Challenge: Select all orders from the oes.orders table which have not yet been shipped.
*/

SELECT * FROM oes.orders
WHERE shipped_date IS NULL;

/*
### **Third Challenge**  

Challenge: Select all orders from the oes.orders table which were placed on the 26th of February 2020.
*/

SELECT * FROM oes.orders
WHERE order_date = '2020-02-26';

/*
### **Fourth Challenge**

Challenge: Select all orders from the oes.orders table which were placed on or after the 1st of January 2020.
*/

SELECT * FROM oes.orders
WHERE order_date >= '2020-01-01';