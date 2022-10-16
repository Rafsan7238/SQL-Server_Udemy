/*
# Join Challenges
*/

/*
\*\*Use SAMPLEDB Database\*\*
*/

USE SAMPLEDB 
GO


/*
### **First Challenge**

Challenge: Write a query to return the following attributes for employees who belong to a department:  

\- employee\_id   
\- first\_name   
\- last\_name   
\- salary   
\- department\_name
*/

SELECT e.employee_id, e.first_name, e.last_name, e.salary, d.department_name
FROM hcm.employees e INNER JOIN hcm.departments d 
ON e.department_id = d.department_id;

/*
### **Second Challenge**

Challenge: Write a query to return the following attributes for all employees, including employees who do not belong to a department: 

\- employee\_id 

\- first\_name 

\- last\_name 

\- salary 

\- department\_name
*/

SELECT e.employee_id, e.first_name, e.last_name, e.salary, d.department_name
FROM hcm.employees e LEFT JOIN hcm.departments d 
ON e.department_id = d.department_id;

/*
### **Third Challenge** 

Challenge: Write a query to return the total number of employees in each department. Include the department\_name in the query result. Also, include employees who have not been assigned to a department.
*/

SELECT d.department_name, COUNT(*) AS employee_count
FROM hcm.employees e LEFT JOIN hcm.departments d
ON e.department_id = d.department_id 
GROUP BY d.department_name;