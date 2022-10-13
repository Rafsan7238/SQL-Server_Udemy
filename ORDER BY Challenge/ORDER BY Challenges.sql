/*
# ORDER BY Challenges
*/

/*
\*\*Use SAMPLEDB Database\*\*
*/

USE SAMPLEDB
GO

/*
### **First Challenge**  

Challenge: Write a query that returns all employees ordered alphabetically by their last name from A to Z.
*/

SELECT * FROM hcm.employees
ORDER BY last_name ASC;

/*
### **Second Challenge**  

Challenge: Write a query that returns all employees ordered by salary from highest to lowest.
*/

SELECT * FROM hcm.employees 
ORDER BY salary DESC;

/*
### **Third Challenge**  

Challenge: Write a query to return all employees ordered by most recently hired to longest serving.
*/

SELECT * FROM hcm.employees 
ORDER BY hire_date DESC;

/*
### **Fourth Challenge**  

Challenge: Write a query to return all employees ordered by department\_id in ascending order and within each department\_id, order by salary from highest to lowest.
*/

SELECT * FROM hcm.employees 
ORDER BY department_id, salary DESC;

/*
### **Fifth Challenge**  

Challenge: Write a query to return the employee\_id, first\_name, last\_name and salary for the top 10 employees who get paid the most.
*/

SELECT TOP (10) employee_id, first_name, last_name, salary 
FROM hcm.employees 
ORDER BY salary DESC;

/*
### **Sixth Challenge**  

Challenge: Write a query to return the employee\_id, first\_name, last\_name and salary for the employee or employees who get paid the least.
*/

SELECT TOP (1) WITH TIES employee_id, first_name, last_name, salary 
FROM hcm.employees 
ORDER BY salary;