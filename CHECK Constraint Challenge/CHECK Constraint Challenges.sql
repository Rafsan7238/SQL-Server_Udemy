/*
# CHECK Constraint Challenge
*/

/*
\*\*Use SAMPLEDB Database\*\*
*/

USE SAMPLEDB
GO

/*
### **Challenge**

Use an ALTER TABLE statement to add a CHECK constraint on the salary column in the hcm.employees table to ensure that salary is greater than or equal to zero.
*/

ALTER TABLE hcm.employees 
ADD CONSTRAINT chk_employees_salary CHECK (salary >= 0);