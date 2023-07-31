-- TELECOM SERVICE PROVIDER --
--Queries before Optimization--

set timing on; --it is SQL*PLUS command,we can measure run time for Oracle SQL--

/* 1.Write a SQL Query to find a list of customer names 
who are using the product Digital Subscriber Line?
select "Customer Name" from TELECOM_CUSTOMER 
where product='Digital Subscriber Line';*/

/* 2.Write a SQL Query to list a Customer id,customer name 
whose name starts with 'sa'?
select customerid,"Customer Name" from TELECOM_CUSTOMER
where "Customer Name" like 'sa%';*/

/* 3.Write a SQL Query to list the customer IDs and names 
for customers belonging to the gold customer segment?
select customerid,"Customer Name" from TELECOM_CUSTOMER 
where "Service Segment"='Gold';*/

/* 4.Write a SQL Query to Count the 
Customer list product-wise?
select product,count(product) from TELECOM_CUSTOMER 
group by product;*/

/* 5.Write a SQL Queryto list the Customer name
 of zone 'Mountain'?
select "Customer Name" from TELECOM_CUSTOMER 
where "ZONE"='Mountain';*/

--Queries after Optimization by using indexing--
--Indexing makes columns faster to query by creating pointers to where data is stored within a database--

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

-- cost of cpu% has been reduced by creating indexes--

--Oracle Performance Tuning Generating plan explanation with Index creation--

--set autotrace on explain statistics;--
/* This will give both explain plan and statistics but we need to run as a sys user 
which is a highly privileged user to run this we will need a DBA permissions*/

describe plan_table;

/* 1.Write a SQL plan Query to find a list of customer names
 who are using the product Digital Subscriber Line?*/
explain plan for select "Customer Name" from TELECOM_CUSTOMER 
where product='Digital Subscriber Line';
select PLAN_TABLE_OUTPUT from table(dbms_xplan.display());

/* 2.Write a SQL Query to list a Customer id,customer name 
whose name starts with 'sa'?*/
explain plan for select customerid,"Customer Name" from TELECOM_CUSTOMER 
where "Customer Name" like 'sa%';
select PLAN_TABLE_OUTPUT from table(dbms_xplan.display());

/* 3.Write a SQL Query to list the customer IDs and names 
for customers belonging to the gold customer segment?*/
explain plan for select customerid,"Customer Name" from TELECOM_CUSTOMER 
where "Service Segment"='Gold';
select PLAN_TABLE_OUTPUT from table(dbms_xplan.display());

/* 4.Write a SQL Query to Count the 
Customer list product-wise?*/
explain plan for select product,count(product) from TELECOM_CUSTOMER 
group by product;
select PLAN_TABLE_OUTPUT from table(dbms_xplan.display());

/* 5.Write a SQL Queryto list the Customer name
 of zone 'Mountain'?*/
explain plan for select "Customer Name" from TELECOM_CUSTOMER 
where "ZONE"='Mountain';
select PLAN_TABLE_OUTPUT from table(dbms_xplan.display());
