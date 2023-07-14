set timing on;

/* Write a SQL query to find a list of customer names
 who are using  the product Digital Subscriber Line? */

 select "Customer Name" from TELECOM
 where PRODUCT='Digital Subscriber Line';
 

/* Write a SQL query to  list a customerid, customer name
 whose name starts with 'sa'? */

 select CUSTOMERID,"Customer Name" from TELECOM
 where "Customer Name" like 'sa%';


/* Write a SQL query to  list the Customer IDs and names 
belonging to the gold customer segment? */

select CUSTOMERID,"Customer Name" from TELECOM
 where "Service Segment"='Gold';

  
/* Write a SQL query to Count the Customer list product-wise?  */

 select PRODUCT,count(PRODUCT) from TELECOM
 group by PRODUCT;


/*  Write a SQL query to List the Customer name 
of zone = 'Mountain' ?*/

select "Customer Name" from  TELECOM
where ZONE='Mountain';

--other queries--


/* List the Customer name in each zone */

select "Customer Name",zone from telecom order by zone;

/* Count the Customer's list in each customer class */

select "Customer Class",count("Customer Class") from telecom
group by "Customer Class";

/* Count the Customers list of each Zone */

select zone ,count(zone) from telecom
group by zone;

/* Display the Digital Subscriber Line product customers' names 
in descending order */

SELECT "Customer Name"
FROM TELECOM
WHERE PRODUCT = 'Digital Subscriber Line'
ORDER BY "Customer Name" DESC;
-- Elapsed:  00:00:00:12 --
--with index--
create index pro_cus_name on telecom("Customer Name",product);

SELECT "Customer Name"
FROM TELECOM
WHERE PRODUCT = 'Digital Subscriber Line'
ORDER BY "Customer Name" DESC;
-- Elapsed:  00:00:00:10 --