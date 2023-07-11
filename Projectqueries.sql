/* Write a SQL query to find a list of customer names
 who are using  the product Digital Subscriber Line? */

select "Customer Name" from TELECOM
where Product='Digital Subscriber Line';
 

/* Write a SQL query to  list a customerid, customer name
 whose name starts with 'sa'? */

select CustomerId,"Customer Name" from TELECOM
where "Customer Name" like 'sa%';


/* Write a SQL query to  list the Customer IDs and names 
belonging to the gold customer segment? */

select CustomerId,"Customer Name" from TELECOM
where "Service Segment"='Gold';

  
/* Write a SQL query to Count the Customer list product-wise?  */

select Product,count(Product) from TELECOM
group by Product;


/*  Write a SQL query to List the Customer name 
of zone = 'Mountain' ?*/

select "Customer Name" from  TELECOM
where Zone='Mountain';