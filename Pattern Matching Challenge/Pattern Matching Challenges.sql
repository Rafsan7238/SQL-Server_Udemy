/*
# Pattern Matching Challenges
*/

/*
\*\*Use SAMPLEDB Database\*\*
*/

USE SAMPLEDB 
GO

/*
### **First Challenge  
**

Challenge: Select countries from the hcm.countries table which start with the letter ‘N’.
*/

SELECT * FROM hcm.countries 
WHERE country_name LIKE 'N%';

/*
### **Second Challenge** 

Challenge: Select customers from the oes.customers table who have a Gmail email address.
*/

SELECT * FROM oes.customers 
WHERE email LIKE '%gmail%';

/*
### **Third Challenge** 

Challenge: Select product names from the oes.products table which contain the word ‘mouse’ anywhere within the product name.
*/

SELECT product_name 
FROM oes.products 
WHERE product_name LIKE '%mouse%';

/*
### **Fourth Challenge** 

Challenge: Select all product names from the oes.products table which end in a number.
*/

SELECT product_name 
FROM oes.products 
WHERE product_name LIKE '%[0-9]';