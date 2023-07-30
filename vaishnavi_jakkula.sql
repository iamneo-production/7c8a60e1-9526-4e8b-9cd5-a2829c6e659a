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


-----optimized queries-----

/* 1)Write a SQL query to find a list of customer names 
who are using  the product Digital Subscriber Line? */

-- Index creation on Customer Name & product column --
create index telecom_Customer_name_product_idx
 on TELECOM_CUSTOMER("Customer Name",product);

select "Customer Name" from TELECOM_CUSTOMER
where product='Digital Subscriber Line';

/* 2)Write a SQL query to  list a customerid, customer name
 whose name starts with 'sa'? */

 -- Index creation on Customer Name column --
create index telecom_Customer_name_idx on TELECOM_CUSTOMER("Customer Name");

select customerid,"Customer Name" from TELECOM_CUSTOMER
where "Customer Name" like 'sa%';

/* 3)Write a SQL query to  list the Customer IDs and names
 belonging to the gold customer segment? */

--Index creation on Service Segment & customerid & Customer Name column --

create index telecom_customerid_servicesegment_idx on TELECOM_CUSTOMER("Service Segment","customerid","Customer Name");

select CUSTOMERID,"Customer Name" from TELECOM_CUSTOMER
where "Service Segment"='Gold';

/* 4) Write a SQL query to Count the 
Customer list product-wise? */

 --Index creation on product --
CREATE BITMAP INDEX telecom_product_idx ON TELECOM_CUSTOMER(product);

select product,count(product) from TELECOM_CUSTOMER
group by product;

/* 5) Write a SQL query to List the Customer name
 of zone = 'Mountain'?*/

--Index creation on Customer Name & ZONE--
create index telecom_customer_name_zone_idx on TELECOM_CUSTOMER("Customer Name","ZONE");
 
select "Customer Name" from  TELECOM_CUSTOMER
where "ZONE"='Mountain';
 