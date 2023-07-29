set timing on;


/* 1)Write a SQL query to find a list of customer names
 who are using  the product Digital Subscriber Line? */

select "Customer Name" 
from TELECOM_CUSTOMER
where PRODUCT='Digital Subscriber Line';


/* 2)Write a SQL query to  list a customerid, customer name
 whose name starts with 'sa'? */

select CUSTOMERID,"Customer Name" 
from TELECOM_CUSTOMER
where "Customer Name" like'sa%';


/* 3)Write a SQL query to  list the Customer IDs and names 
belonging to the gold customer segment? */

select CUSTOMERID,"Customer Name"
 from TELECOM_CUSTOMER
where "Service Segment"='Gold';


/* 4) Write a SQL query to Count the 
Customer list product-wise?  */

select PRODUCT, count(PRODUCT) 
from TELECOM_CUSTOMER
group by PRODUCT;


/* 5) Write a SQL query to List the Customer name 
of zone = 'Mountain' ?*/

select "Customer Name" 
from TELECOM_CUSTOMER
where ZONE='Mountain';
