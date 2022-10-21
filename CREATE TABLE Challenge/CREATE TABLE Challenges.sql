/*
# CREATE TABLE Challenges
*/

/*
\*\*Use SAMPLEDB Database\*\*
*/

USE SAMPLEDB
GO

/*
### **First Challenge** 

Challenge: Create a table called dept in the dbo schema. Specify the following columns: 

\- dept\_id INT 

\- dept\_name VARCHAR(50) 

Give the IDENTITY property to the dept\_id column. Also, put a primary key constraint on the dept\_id column. Put a NOT NULL constraint on the dept\_name column.
*/

CREATE TABLE dbo.dept (
    dept_id INT IDENTITY(1,1),
    dept_name VARCHAR(50) NOT NULL,
    CONSTRAINT pk_dept_dept_id PRIMARY KEY (dept_id)
);

/*
### **Second Challenge** 

Challenge: Write an insert statement to insert the following row into the dbo.dept table: 

| dept\_id | dept\_name |
| :-------- | :---------- |
| 1 | Business Intelligence |
*/

INSERT INTO dbo.dept (dept_name)
VALUES ('Business Intelligence');

SELECT * FROM dbo.dept;

/*
### **Third Challenge** 

Challenge: Populate the dbo.dept table with more rows: Insert all department names from the hcm.departments table.
*/

INSERT INTO dbo.dept (dept_name)
SELECT department_name 
FROM hcm.departments;

SELECT * FROM dbo.dept;

/*
### **Fourth Challenge** 

Challenge: Create a table called emp in the dbo schema. Specify the following columns: 

\- emp\_id INT 

\- first\_name VARCHAR(50) 

\- last\_name VARCHAR(50) 

\- hire\_date DATE 

\- dept\_id INT 

Give the IDENTITY property to the emp\_id column. Also, put a primary key constraint on the emp\_id column. Put NOT NULL constraints on any columns you think need them. Put a foreign key constraint on the dept\_id column which references back to the dept\_id column from the dbo.dept table.
*/

CREATE TABLE dbo.emp(
    emp_id INT IDENTITY(1,1) PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    hire_date DATE NOT NULL,
    dept_id INT FOREIGN KEY REFERENCES dbo.dept(dept_id)
)

/*
### **Fifth Challenge** 

Challenge: Populate the dbo.emp table with the following two employees: 

| emp\_id | first\_name | last\_name | hire\_date | dept\_id |
| ------- | ----------- | ---------- | ---------- | -------- |
| 1 | Scott | Davis | Dec-11-2020 | 1 |
| 2 | Miriam | Yardley | Dec-05-2020 | 1 |
*/

INSERT INTO dbo.emp (first_name, last_name, hire_date, dept_id)
VALUES
    ('Scott', 'Davis', '20201211', 1),
    ('Miriam', 'Yardley', '20201205', 1);

SELECT * FROM dbo.emp;