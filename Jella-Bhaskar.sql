-- sql queries  before optimization --

/* 1)Write a SQL query to find a list of customer names
 who are using  the product Digital Subscriber Line? */

 set timing on; --- to get timing --

select "Customer Name" from TELECOM_CUSTOMER
 where PRODUCT='Digital Subscriber Line';

/* 2)Write a SQL query to  list a customerid, customer name
 whose name starts with 'sa'? */

 select CUSTOMERID,"Customer Name" from TELECOM_CUSTOMER
 where "Customer Name" like 'sa%';

 /* 3)Write a SQL query to  list the Customer IDs and names 
belonging to the gold customer segment? */

--Note : as customer segment have no attribute gold but service segmnt so we have done in this way;

select CUSTOMERID,"Customer Name" from TELECOM_CUSTOMER
where "Service Segment"='Gold';

/* 4) Write a SQL query to Count the Customer list 
product-wise?  */

select PRODUCT,count(PRODUCT) from TELECOM_CUSTOMER
group by PRODUCT;

/* 5) Write a SQL query to List the Customer name 
of zone = 'Mountain' ?*/

select "Customer Name" from  TELECOM_CUSTOMER
where ZONE in ('Mountain');
 

 ----------- optimized queries -------------- 

/* 1)Write a SQL query to find a list of customer names
 who are using  the product Digital Subscriber Line? */

 -- index on product & customer name column --

create index telecom_Customer_name_product_idx on TELECOM_CUSTOMER("Customer Name",product);

select "Customer Name" from TELECOM_CUSTOMER
where PRODUCT='Digital Subscriber Line';

-- cost of the query has been reduced by creating  telecom_Customer_name_product_idx index --


/* 2)Write a SQL query to  list a customerid, customer name
 whose name starts with 'sa'? */

 -- Index on customer Name column --

create index telecom_Customer_name_idx on TELECOM_CUSTOMER("Customer Name");

select CUSTOMERID,"Customer Name" from TELECOM_CUSTOMER
 where "Customer Name" like 'sa%';

-- cost of the query has reduced by creating telecom_Customer_name_idx --

/* 3)Write a SQL query to  list the Customer IDs and names 
belonging to the gold customer segment? */

-- index on service segment & customer id & name column --

create index telecom_customerid_servicesegment_idx on TELECOM_CUSTOMER("Service Segment","CUSTOMERID","Customer Name");

select CUSTOMERID,"Customer Name" from TELECOM_CUSTOMER
where "Service Segment"='Gold';

-- cost of the query has been reduced by creating  index  telecom_customerid_servicesegment_idx --

/* 4) Write a SQL query to Count the 
Customer list product-wise?  */
 
 -- index on product --
CREATE BITMAP INDEX telecom_product_idx ON TELECOM_CUSTOMER(PRODUCT);

select PRODUCT,count(PRODUCT) from TELECOM_CUSTOMER
group by PRODUCT;

-- cost of the query has been reduced by creating a bit map index  as product have different categories --

/* 5) Write a SQL query to List the Customer name 
of zone = 'Mountain' ?*/

-- index on zone & customer Name--
create index telecom_customer_name_zone_idx on telecom_customer("Customer Name",zone);
 
select "Customer Name" from  TELECOM_CUSTOMER
where ZONE in ('Mountain');

--- cost(%cpu) has been reduced by creating  telecom_customer_name_zone_idx index  ---
-------------------------  x   ------------------------------------


