/* TELECOM SERVICE PROVIDER PROJECT */
-- QUERIES BEFORE OPTIMIZATION --

set timing on; -- Displays the elapsed time --

/* 1)Write a SQL query to find a list of customer names
 who are using  the product Digital Subscriber Line? */

select "Customer Name" from TELECOM_CUSTOMER 
where Product='Digital Subscriber Line';
 
/* 2)Write a SQL query to  list a customerid, customer name
 whose name starts with 'sa'? */

select CustomerId,"Customer Name" from TELECOM_CUSTOMER
where "Customer Name" like 'sa%';

/* 3)Write a SQL query to  list the Customer IDs and names 
belonging to the gold customer segment? */

/* Note : The customer segment has no attribute called gold 
but the attribute gold is in service segment so we have done in this way */

select CustomerId,"Customer Name" from TELECOM_CUSTOMER
where "Service Segment"='Gold';
 
/* 4)Write a SQL query to Count the Customer list product-wise?  */

select count(CustomerId),product from TELECOM_CUSTOMER 
group by Product;

/* 5)Write a SQL query to List the Customer name 
of zone = 'Mountain' ?*/

select "Customer Name" from TELECOM_CUSTOMER
where Zone='Mountain';


-- OPTIMIZED QUERIES -- 

/* An index provides direct and fast access without reading the entire table.
So, we created indexes to retrieve data from the database more quickly. */

/* 1)Write a SQL query to find a list of customer names
who are using  the product Digital Subscriber Line? */

-- index on product & customer name column --

create index telecom_Customer_name_product_idx on TELECOM_CUSTOMER("Customer Name",Product);

select "Customer Name" from TELECOM_CUSTOMER
where Product='Digital Subscriber Line';

-- cost of the query has been reduced by creating telecom_Customer_name_product_idx index --


/* 2)Write a SQL query to  list a customerid, customer name
whose name starts with 'sa'? */

-- Index on customer name column --

create index telecom_Customer_name_idx on TELECOM_CUSTOMER("Customer Name");

select CUSTOMERID,"Customer Name" from TELECOM_CUSTOMER
where "Customer Name" like 'sa%';

-- cost of the query has reduced by creating telecom_Customer_name_idx --


/* 3)Write a SQL query to  list the Customer IDs and names 
belonging to the gold customer segment? */

-- Index on service segment & customerid column --

create index telecom_customerid_servicesegment_idx on TELECOM_CUSTOMER("Service Segment","CustomerId","Customer Name");

select CUSTOMERID,"Customer Name" from TELECOM_CUSTOMER
where "Service Segment"='Gold';

-- cost of the query has been reduced by creating  index  telecom_customerid_servicesegment_idx --


/* 4) Write a SQL query to Count the 
Customer list product-wise?  */
 
-- Index on customerid and product column --

create index Telecom_CustomerId_Product_idx on TELECOM_CUSTOMER(customerid,product);

select count(CustomerId),product from TELECOM_CUSTOMER 
group by Product;


/* 5) Write a SQL query to List the Customer name 
of zone = 'Mountain' ?*/

-- Index on zone & customer Name--

create index Telecom_Customer_Name_Zone_idx on TELECOM_CUSTOMER("Customer Name",zone);
 
select "Customer Name" from TELECOM_CUSTOMER
where Zone ='Mountain';

-- cost of the query has been reduced by creating  telecom_customer_name_zone_idx index --