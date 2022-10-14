/*
# GROUP BY Challenges
*/

/*
\*\*Use SAMPLEDB Database\*\*
*/

USE SAMPLEDB 
GO

/*
### **First Challenge** 

Challenge: Write query to give the total number of employees in each department as given by the department\_id column in the hcm.employees table.
*/

SELECT department_id, COUNT(*) AS total_employees
FROM hcm.employees 
GROUP BY department_id;

/*
### **Second Challenge** 

Challenge: Write a query to give the average salary in each department as given by the department\_id column in the hcm.employees table. Order the query result by average salary from highest to lowest.
*/

SELECT department_id, AVG(salary) AS average_salary
FROM hcm.employees 
GROUP BY department_id 
ORDER BY average_salary DESC;

/*
### **Third Challenge** 

Challenge: Write a query to give the total number of products on hand at each warehouse as given by the warehouse\_id column in the oes.inventories table. Also, limit the result to only warehouses which have greater than 5,000 product items on hand.
*/

SELECT warehouse_id, SUM(quantity_on_hand) AS total_products
FROM oes.inventories
GROUP BY warehouse_id
HAVING SUM(quantity_on_hand) > 5000;

/*
### **Fourth Challenge** 

Challenge: What is the date of the most recent population count at each locality in the bird.antarctic\_populations table?
*/

SELECT locality, MAX(date_of_count) as recent_count_date 
FROM bird.antarctic_populations
GROUP BY locality;

/*
### **Fifth Challenge** 

Challenge: What is the date of the most recent population count for each species at each locality in the bird.antarctic\_populations table?
*/

SELECT species_id, locality, MAX(date_of_count) as recent_count_date 
FROM bird.antarctic_populations
GROUP BY species_id, locality;