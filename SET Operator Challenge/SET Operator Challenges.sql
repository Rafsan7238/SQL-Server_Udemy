/*
# Set Operator Challenges
*/

/*
\*\*Use SAMPLEDB Database\*\*
*/

USE SAMPLEDB 
GO

/*
### **First Challenge** 

Challenge: Return all rows from both the bird.california\_sightings table and the bird.arizona\_sightings table. Use column names from the bird.california\_sightings table.
*/

SELECT * FROM bird.california_sightings 
UNION ALL 
SELECT * FROM bird.arizona_sightings;

/*
### **Second Challenge** 

Challenge: Return all unique species - as identified by the scientific\_name column – for species which have been sighted in either California or Arizona. Use column names from the bird.california\_sightings table.
*/

SELECT scientific_name 
FROM bird.california_sightings
UNION
SELECT scientific_name
FROM bird.arizona_sightings;

/*
### **Third Challenge** 

Challenge: Return all unique combinations of species (scientific\_name) and state name. The state\_name will need to be added on as a new expression which gives the applicable state name. Use column names from the bird.california\_sightings table. Order by state\_name and then by scientific\_name in ascending order.
*/

SELECT scientific_name, 'California' AS state_name
FROM bird.california_sightings
UNION 
SELECT scientific_name, 'Arizona' AS state_name
FROM bird.arizona_sightings;

/*
### **Fourth Challenge** 

Challenge: Return all rows from all the bird sightings tables i.e. Arizona, California and Florida. Use column names from the bird.california\_sightings table.
*/

SELECT sighting_id, common_name, scientific_name, location_of_sighting, sighting_date, 'California' AS state_name
FROM bird.california_sightings
UNION ALL
SELECT sighting_id, common_name, scientific_name, sighting_location, sighting_date, 'Arizona'
FROM bird.arizona_sightings
UNION ALL
SELECT observation_id, NULL AS common_name, scientific_name, locality, sighting_datetime, 'Florida'
FROM bird.florida_sightings;

/*
### **Fifth Challenge** 

Challenge: Return all unique customer ids for customers who have placed orders.
*/

SELECT customer_id 
FROM oes.orders
INTERSECT
SELECT customer_id 
FROM oes.customers;

/*
### **Sixth Challenge** 

Challenge: Return all unique product ids for products that are currently not in stock.
*/

SELECT product_id 
FROM oes.products 
EXCEPT
SELECT product_id 
FROM oes.inventories;