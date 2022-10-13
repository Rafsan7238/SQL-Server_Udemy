/*
# SELECT DISTINCT Challenges
*/

/*
\*\*Use SAMPLEDB Database\*\*
*/

USE SAMPLEDB
GO

/*
### **First Challenge**  

Challenge: Use a SELECT DISTINCT statement to get the distinct (i.e. unique) values that occur in the locality column from the bird.antarctic\_populations table.
*/

SELECT DISTINCT locality
FROM bird.antarctic_populations;

/*
### **Second Challenge**  

Challenge: Use a SELECT DISTINCT statement to get the distinct combinations of values for both the locality and species\_id columns from the bird.antarctic\_populations table.
*/

SELECT DISTINCT locality, species_id
FROM bird.antarctic_populations;