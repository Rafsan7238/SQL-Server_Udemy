/*
# Function Challenges
*/

/*
\*\*Use SAMPLEDB Database\*\*
*/

USE SAMPLEDB
GO

/*
### **First Challenge**

Challenge: Concatenate the first name and last name of each employee. Include a single space between the first and last name. Name the new expression employee\_name. Include: 

\- employee\_id 

\- first\_name 

\- last\_name 

\- employee\_name
*/

SELECT employee_id, first_name, last_name, first_name + ' ' + last_name AS employee_name
FROM hcm.employees ;

/*
### **Second Challenge**

Challenge: Concatenate the first name, middle name, and last name of each employee. Include a single space between each of the names. Name the new expression employee\_name. Include: 

\- employee\_id 

\- first\_name 

\- last\_name 

\- employee\_name
*/

SELECT employee_id, first_name, last_name, first_name + ISNULL(' ' + middle_name, '') + ' ' + last_name AS employee_name
FROM hcm.employees;

/*
### **Third Challenge** 

Challenge: Extract the genus name from the scientific\_name as given in the bird.antarctic\_species table.
*/

SELECT LEFT(scientific_name, CHARINDEX(' ', scientific_name) - 1) AS genus_name
FROM  bird.antarctic_species;

/*
### **Fourth Challenge** 

Challenge: Extract the species name from the scientific\_name as given in the bird.antarctic\_species table.
*/

SELECT SUBSTRING(scientific_name, CHARINDEX(' ', scientific_name) + 1, LEN(scientific_name)) AS species_name
FROM bird.antarctic_species;

/*
### **Fifth Challenge**

Challenge: Return the age in years for all employees. Name this expression as employee\_age. Include: 

\- employee\_id 

\- first\_name 

\- last\_name 

\- birth\_date 

\- employee\_age
*/

SELECT employee_id, first_name, last_name, birth_date, DATEDIFF(year, birth_date, CURRENT_TIMESTAMP) AS employee_age 
FROM hcm.employees;

/*
### **Sixth Challenge** 

Challenge: Assuming an estimated shipping date of 7 days after the order date, add a column expression called estimated\_shipping\_date for all unshipped orders. Include: 

\- order\_id 

\- order\_date 

\- estimated\_shipping\_date
*/

SELECT order_id, order_date, DATEADD(day, 7, order_date) AS estimated_shipping_date
FROM oes.orders
WHERE shipped_date IS NULL;

/*
### **Seventh Challenge** 

Challenge: Calculate the average number of days it takes each shipping company to ship an order. Call this expression avg\_shipping\_days. Include: 

\- company\_name 

\- avg\_shipping\_days
*/

SELECT s.company_name, AVG(DATEDIFF(day, o.order_date, o.shipped_date)) AS avg_shipping_days
FROM oes.orders o
INNER JOIN oes.shippers s 
ON o.shipper_id = s.shipper_id 
WHERE shipped_date IS NOT NULL
GROUP BY s.company_name;