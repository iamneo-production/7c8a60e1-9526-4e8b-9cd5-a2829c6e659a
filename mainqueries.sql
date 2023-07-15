set timing on;

/* Write a SQL query to find a list of customer names
 who are using  the product Digital Subscriber Line? */

 select "Customer Name" from TELECOM
 where PRODUCT='Digital Subscriber Line';

-- plan-- 

explain plan for
select "Customer Name" from TELECOM
where PRODUCT='Digital Subscriber Line';

select * from table(DBMS_XPLAN.display());

/* Write a SQL query to  list a customerid, customer name
 whose name starts with 'sa'? */

 select CUSTOMERID,"Customer Name" from TELECOM
 where "Customer Name" like 'sa%';

-- plan --

explain plan for
select CUSTOMERID,"Customer Name" from TELECOM
where "Customer Name" like 'sa%';

select * from table(DBMS_XPLAN.display());

/* Write a SQL query to  list the Customer IDs and names 
belonging to the gold customer segment? */

select CUSTOMERID,"Customer Name" from TELECOM
where "Service Segment"='Gold';
 
-- plan --
explain plan for
select CUSTOMERID,"Customer Name" from TELECOM
where "Service Segment"='Gold';

select * from table(DBMS_XPLAN.display());


/* Write a SQL query to Count the Customer list product-wise?  */

select PRODUCT,count(PRODUCT) from TELECOM
group by PRODUCT;

-- plan --
explain plan for 
select PRODUCT,count(PRODUCT) from TELECOM
group by PRODUCT;

select * from table(DBMS_XPLAN.display());


/*  Write a SQL query to List the Customer name 
of zone = 'Mountain' ?*/

select "Customer Name" from  TELECOM
where ZONE in ('Mountain');

-- plan --
explain plan for
select "Customer Name" from  TELECOM
where ZONE in ('Mountain');

select * from table(DBMS_XPLAN.display());


--other queries--

/* Count the Customers list of each Zone */

select zone ,count(zone) from telecom
group by zone;

-- plan --
explain plan for
select zone ,count(zone) from telecom
group by zone;
select * from table(DBMS_XPLAN.display());

/* Display the Digital Subscriber Line product customers' names 
in descending order */

SELECT "Customer Name"
FROM TELECOM
WHERE PRODUCT = 'Digital Subscriber Line'
ORDER BY "Customer Name" DESC;

-- plan --
explain plan for
SELECT "Customer Name"
FROM TELECOM
WHERE PRODUCT = 'Digital Subscriber Line'
ORDER BY "Customer Name" DESC;
select * from table(DBMS_XPLAN.display());




