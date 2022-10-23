/*
# UNIQUE Constraint Challenge
*/

/*
\*\*Use SAMPLEDB Database\*\*
*/

USE SAMPLEDB
GO

/*
### **Challenge**

Use an ALTER TABLE statement to add a UNIQUE constraint to the department\_name column in the hcm.departments table.
*/

ALTER TABLE hcm.departments 
ADD CONSTRAINT uk_dept_department_name UNIQUE (department_name);