/*Table name: TELECOM_CUSTOMER

The table contains the following fields

CUSTOMER_ID,PRODUCT, CUSTOMER_NAME,CUSTOMER_SEGMENT,SERVICE_SEGM ENT,CUSTOMER_CLASS, CIRCLE,ZONE*/


/*1.Write a SQL Query to find a list of customer names who are using the product Digital Subscriber Line?*/
SELECT "Customer Name"
FROM TELECOM_CUSTOMER
WHERE PRODUCT = 'Digital Subscriber Line';


--2. Write a SQL Query to list a Customer id, customer name whose name starts with 'sa'?
SELECT CUSTOMERID, "Customer Name"
FROM TELECOM_CUSTOMER
WHERE "Customer Name" LIKE 'sa%';



--3. Write a SQL Query to list the customer IDs and names for customers belonging to the gold customer segment?

SELECT CUSTOMERID, "Customer Name"
FROM TELECOM_CUSTOMER
WHERE "Customer Segment" = 'Gold';




--4. Write a SQL Query to Count the Customer list product-wise?
SELECT PRODUCT, COUNT(*) AS Customer_Count
FROM TELECOM_CUSTOMER
GROUP BY PRODUCT;


--5.Write a SQL Query to List the Customer name of zone 'Mountain'?
SELECT "Customer Name"
FROM TELECOM_CUSTOMER
WHERE ZONE = 'Mountain';



/*Optional queries */

--6.List the customers in each CUSTOMER_CLASS along with the count of customers in each class

SELECT "Customer Class", COUNT(*) AS Customer_Count
FROM TELECOM_CUSTOMER
GROUP BY "Customer Class";


--7.Find the total count of customers in each CIRCLE
SELECT CIRCLE, COUNT(*) AS Total_Customers
FROM TELECOM_CUSTOMER
GROUP BY CIRCLE;


--8.List customers who are in the 'Corporate' Customer Class and using either 'Internet' or 'Voice' product
SELECT "Customer Name"
FROM TELECOM_CUSTOMER
WHERE "Customer Class" = 'Corporate' AND (Product = 'Internet' OR Product = 'Voice');

--9.Display the average number of customers per ZONE
SELECT ZONE, COUNT(*) AS Total_Customers, AVG(COUNT(*)) OVER() AS Avg_Customers_Per_Zone
FROM TELECOM_CUSTOMER
GROUP BY ZONE;

--10.Find the number of unique Products in each CIRCLE
SELECT CIRCLE, COUNT(DISTINCT Product) AS Unique_Product_Count
FROM TELECOM_CUSTOMER
GROUP BY CIRCLE;


--11.Find customers from the 'U.S' circle and retrieve their CUSTOMERID and Customer Name

SELECT CUSTOMERID, "Customer Name"
FROM TELECOM_CUSTOMER
WHERE CIRCLE = 'U.S';


--12.List customers whose service segment is 'Silver' and are in the 'Home' customer class. Retrieve their CUSTOMERID and Customer Name

SELECT CUSTOMERID, "Customer Name"
FROM TELECOM_CUSTOMER
WHERE "Service Segment" = 'Silver' AND "Customer Class" = 'Home';

--13.Find customers who have a 'Platinum' service segment or belong to the 'West' zone. Retrieve their CUSTOMERID and Customer Name

SELECT CUSTOMERID, "Customer Name"
FROM TELECOM_CUSTOMER
WHERE "Service Segment" = 'Platinum' OR ZONE = 'West';

--14.Find customers whose names have exactly 5 characters. Retrieve their CUSTOMERID and Customer Name

SELECT CUSTOMERID, "Customer Name"
FROM TELECOM_CUSTOMER
WHERE LENGTH("Customer Name") = 5;


