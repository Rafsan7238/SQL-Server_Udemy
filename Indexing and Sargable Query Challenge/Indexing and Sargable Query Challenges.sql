/*
# Indexing and Sargable Query Challenges
*/

/*
\*\*Use SAMPLEDB Database\*\*
*/

USE SAMPLEDB
GO

/*
### **First Challenge** 

Challenge: Create a non-clustered index on the location\_id column in the oes.warehouses table. Also, specify warehouse\_name as a non-key included column.
*/

CREATE INDEX ix_warehouses_location_id_incl_warehouse_name ON oes.warehouses (location_id) INCLUDE (warehouse_name);

/*
### **Second Challenge** 

Challenge: Create a UNIQUE index on the product\_name column in the oes.products table.
*/

CREATE UNIQUE INDEX ui_products_product_name ON oes.products (product_name);

/*
### **Third Challenge**

Challenge: Rewrite the following query to make it sargable: 

```
SELECT order_id, order_date FROM oes.orders WHERE YEAR(order_date) = 2019;

```
*/

SELECT order_id, order_date 
FROM oes.orders 
WHERE order_date >= '20190101' AND order_date < '20200101';

/*
### **Fourth Challenge** 

Challenge: Most queries against the oes.orders table are for unshipped orders i.e. orders where the shipped\_date is null. Put an appropriate filtered index on the shipped\_date column.
*/

CREATE INDEX fx_orders_shipped_date ON oes.orders(shipped_date)
WHERE shipped_date IS NULL;

/*
### **Fifth Challenge**

Challenge: Rewrite the following query to make it sargable and create an index which covers the query, once rewritten: 

```
SELECT customer_id, first_name, last_name, email, street_address FROM oes.customers WHERE LEFT(first_name, 2) = 'Vi' AND last_name = 'Jones';
```
*/

SELECT customer_id, first_name, last_name, email, street_address 
FROM oes.customers 
WHERE first_name LIKE 'Vi%' AND last_name = 'Jones';

CREATE INDEX ix_first_name_last_name_incl_email_street_address ON oes.customers (first_name, last_name) INCLUDE (email, street_address);
	