--Queries--

/* 1.Write a SQL Query to find a list of customer names who are using the product Digital Subscriber Line?*/
select "Customer Name" from TELECOM where product = 'Digital Subscriber Line';

/* 2.Write a SQL Query to list a Customer id,customer name whose name starts with 'sa'?*/
select customerid,"Customer Name" from TELECOM where "Customer Name" like 'sa%';

/* 3.Write a SQL Query to list the customer IDs and names for customers belonging to the gold customer segment?*/
select customerid,"Customer Name" from TELECOM where "Service Segment" = 'Gold';

/* 4.Write a SQL Query to Count the Customer list product-wise?*/
select count(customerid),product from TELECOM group by product;

/* 5.Write a SQL Queryto list the Customer name of zone 'Mountain'?*/
select "Customer Name" from TELECOM where "ZONE" = 'Mountain';

--Oracle Performance Tuning Generate Explain Plan--

--set autotrace on explain statistics;--/* This will give both explain plan and statistics but we need to run
 as a sys user which is a highly privileged user to run this we will need a DBA permissions*/

describe plan_table;

--1.plan explanation--
/* 1.Write a SQL plan Query to find a list of customer names who are using the product Digital Subscriber Line?*/
explain plan for select "Customer Name" from TELECOM where product = 'Digital Subscriber Line';
select * from table(dbms_xplan.display());

--2.plan explanation--
/* 2.Write a SQL Query to list a Customer id,customer name whose name starts with 'sa'?*/
explain plan for select customerid,"Customer Name" from TELECOM where "Customer Name" like 'sa%';
select * from table(dbms_xplan.display());

--3.plan explanation--
/* 3.Write a SQL Query to list the customer IDs and names for customers belonging to the gold customer segment?*/
explain plan for select customerid,"Customer Name" from TELECOM where "Service Segment" = 'Gold';
select * from table(dbms_xplan.display());

--4.plan explanation--
/* 4.Write a SQL Query to Count the Customer list product-wise?*/
explain plan for select count(customerid),product from TELECOM group by product;
select * from table(dbms_xplan.display());

--5.plan explanation--
/* 5.Write a SQL Queryto list the Customer name of zone 'Mountain'?*/
explain plan for select "Customer Name" from TELECOM where "ZONE" = 'Mountain';
select * from table(dbms_xplan.display());