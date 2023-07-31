--QUERIES BEFORE OPTIMIZATION--


/* 1)Write a SQL Query to find a list of customer names 
who are using the product Digital Subscriber Line?*/

SELECT "Customer Name" from TELECOM_CUSTOMER 
where Product='Digital Subscriber Line';

/* 2)Write a SQL Query to list a Customer id,customer name 
whose name starts with 'sa'?*/

SELECT CustomerId,"Customer Name" from TELECOM_CUSTOMER 
where "Customer Name" like 'sa%';

/* 3)Write a SQL Query to list the customer IDs and names 
for customers belonging to the gold customer segment?*/

SELECT CustomerId,"Customer Name" from TELECOM_CUSTOMER 
where "Service Segment"='Gold';

-- 4)Write a SQL Query to Count the Customer list product-wise?--

SELECT Product,count(Product)from TELECOM_CUSTOMER 
group by Product;

-- 5)Write a SQL Query to list the Customer name of zone='Mountain'?--

SELECT "Customer Name" from TELECOM_CUSTOMER 
where zone='Mountain';


--OPTIMIZED QUERIES USING INDEXING--
--Indexing provides direct and fast access without reading the entire table--


/* 1)Write a sql query to find a list of customer names
who are using the product Digital Subscriber Line? */

--creation of index on product column and customer name--

create index telecom_customer_name_product_idx on TELECOM_CUSTOMER("Customer Name",Product);

SELECT "Customer Name" from TELECOM_CUSTOMER
where Product='Digital Subscriber Line';

/* 2)Write a sql query to list a customerid,customer name
whose name starts with 'sa'? */

--Index creation on customer name column--

create index telecom_customer_name_idx on TELECOM_CUSTOMER("Customer Name");

SELECT CUSTOMERID,"Customer Name" from TELECOM_CUSTOMER
where "Customer Name" like 'sa%';

/* 3)Write a sql wuery to list the Customer IDs and names 
belonging to the gold customer segment?*/

--Index creation on service segment and customerid column--

create index telecom_customerid_servicesegment_idx on TELECOM_CUSTOMER("Service Segmnt","CustomerID","Customer Name");

select CUSTOMERID,"Customer Name" from TELECOM_CUSTOMER
where "Service Segment"='Gold';

/* 4) Write a sql query to count the
Customer list product-wise? */

--Index creation on product column--

create bitmap index telecom_product_idx ON TELECOM_CUSTOMER(product);

select Product,count(Product) from TELECOM_CUSTOMER
group by Product;

/* 5)Write a sql query to list the customer name
of zone = 'Mountain'?*/

--Index creation on zone and customer name--

create index telecom_customer_name_zone_idx on TELECOM_CUSTOMER("Customer Name","Zone");

select "Customer Name" from TELECOM_CUSTOMER
where "ZONE" = 'Mountain';




