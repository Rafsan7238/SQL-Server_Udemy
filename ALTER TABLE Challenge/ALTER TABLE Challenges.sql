/*
# ALTER TABLE Challenges
*/

/*
\*\*Use SAMPLEDB Database\*\*
*/

USE SAMPLEDB
GO

/*
### **First Challenge** 

Challenge: Add a new column called ‘termination\_date’ onto the hcm.employees table. Give this new column a data type of DATE.
*/

ALTER TABLE hcm.employees 
ADD termination_date DATE;

/*
### **Second Challenge** 

Challenge: Write two SQL statements to change the data type of the first\_name and last\_name columns to NVARCHAR(60) in the oes.customers table.
*/

ALTER TABLE oes.customers 
ALTER COLUMN first_name NVARCHAR(60); 

ALTER TABLE oes.customers 
ALTER COLUMN last_name NVARCHAR(60);

/*
### **Third Challenge** 

Challenge: Use sp\_rename to rename the column name 'phone' to 'main\_phone' in the oes.customers table. Note that this challenge does not use an ALTER TABLE statement.
*/

sp_rename 'oes.customers.phone', 'main_phone', 'COLUMN';