--Queries--

/* 1.Write a SQL Query to find a list of customer names who are using the product Digital Subscriber Line?*/
select "Customer Name" from TELECOM_CUSTOMER where product = 'Digital Subscriber Line';

/* 2.Write a SQL Query to list a Customer id,customer name whose name starts with 'sa'?*/
select customerid,"Customer Name" from TELECOM_CUSTOMER where "Customer Name" like 'sa%';

/* 3.Write a SQL Query to list the customer IDs and names for customers belonging to the gold customer segment?*/
select customerid,"Customer Name" from TELECOM_CUSTOMER where "Service Segment" = 'Gold';

/* 4.Write a SQL Query to Count the Customer list product-wise?*/
select count(customerid),product from TELECOM_CUSTOMER group by product;

/* 5.Write a SQL Queryto list the Customer name of zone 'Mountain'?*/
select "Customer Name" from TELECOM_CUSTOMER where "ZONE" = 'Mountain';

--Oracle Performance Tuning Generate Explain Plan with index creation--

--set autotrace on explain statistics;--
/* This will give both explain plan and statistics but we need to run as a sys user which is a highly privileged user to run this we will need a DBA permissions*/

describe plan_table;

create index telecom_customer_name_idx on TELECOM_CUSTOMER("Customer Name",product);
--1.plan explanation--
/* 1.Write a SQL plan Query to find a list of customer names who are using the product Digital Subscriber Line?*/
explain plan for select "Customer Name" from TELECOM_CUSTOMER where product = 'Digital Subscriber Line';
select * from table(dbms_xplan.display());

create index telecom_customerid_customer_name_idx on TELECOM_CUSTOMER(customerid,"Customer Name");
--2.plan explanation--
/* 2.Write a SQL Query to list a Customer id,customer name whose name starts with 'sa'?*/
explain plan for select customerid,"Customer Name" from TELECOM_CUSTOMER where "Customer Name" like 'sa%';
select * from table(dbms_xplan.display());

create index telecom_customer_id_name_service_segment on TELECOM_CUSTOMER(customerid,"Customer Name","Service Segment");
--3.plan explanation--
/* 3.Write a SQL Query to list the customer IDs and names for customers belonging to the gold customer segment?*/
explain plan for select customerid,"Customer Name" from TELECOM_CUSTOMER where "Service Segment" = 'Gold';
select * from table(dbms_xplan.display());

create index telecom_customerid_product_idx on TELECOM_CUSTOMER(customerid,product);
--4.plan explanation--
/* 4.Write a SQL Query to Count the Customer list product-wise?*/
explain plan for select count(customerid),product from TELECOM_CUSTOMER group by product;
select * from table(dbms_xplan.display());

create index telecom_customer_name_zone_idx on TELECOM_CUSTOMER("Customer Name","ZONE");
--5.plan explanation--
/* 5.Write a SQL Queryto list the Customer name of zone 'Mountain'?*/
explain plan for select "Customer Name" from TELECOM_CUSTOMER where "ZONE" = 'Mountain';
select * from table(dbms_xplan.display());