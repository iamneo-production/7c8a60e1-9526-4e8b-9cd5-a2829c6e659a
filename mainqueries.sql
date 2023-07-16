set timing on;
/* 1)Write a SQL query to find a list of customer names
 who are using  the product Digital Subscriber Line? */

 select "Customer Name" from TELECOM
 where PRODUCT='Digital Subscriber Line';

-- plan before index -- 

explain plan for
select "Customer Name" from TELECOM
where PRODUCT='Digital Subscriber Line';

select * from table(DBMS_XPLAN.display());

-- index on product & customer name column --

create index telecom_Customer_name_product_idx on telecom("Customer Name",product);
 
/* after index created */

select "Customer Name" from TELECOM
where PRODUCT='Digital Subscriber Line';

-- plan-- 

explain plan for
select "Customer Name" from TELECOM
where PRODUCT='Digital Subscriber Line';

select * from table(DBMS_XPLAN.display());


/* 2)Write a SQL query to  list a customerid, customer name
 whose name starts with 'sa'? */

select CUSTOMERID,"Customer Name" from TELECOM
 where "Customer Name" like 'sa%';

-- plan --

explain plan for
select CUSTOMERID,"Customer Name" from TELECOM
where "Customer Name" like 'sa%';
 
  
select * from table(DBMS_XPLAN.display());

/* Index on customer Name column */

create index telecom_Customer_name_idx on telecom("Customer Name");

/* after index created */

select CUSTOMERID,"Customer Name" from TELECOM
where "Customer Name" like 'sa%';

-- plan after index --

explain plan for
select CUSTOMERID,"Customer Name" from TELECOM
where "Customer Name" like 'sa%';
select * from table(DBMS_XPLAN.display());

/* 3)Write a SQL query to  list the Customer IDs and names 
belonging to the gold customer segment? */

select CUSTOMERID,"Customer Name" from TELECOM
where "Service Segment"='Gold';
-- plan --
explain plan for
select CUSTOMERID,"Customer Name" from TELECOM
where "Service Segment"='Gold';


select * from table(DBMS_XPLAN.display());

-- index on service segment & customer id column --

create index telecom_customerid_servicesegment_idx on telecom("Service Segment","CUSTOMERID","Customer Name");
-- after index --

select CUSTOMERID,"Customer Name" from TELECOM
where "Service Segment"='Gold';

-- plan after index  --
explain plan for
select CUSTOMERID,"Customer Name" from TELECOM
where "Service Segment"='Gold';
select * from table(DBMS_XPLAN.display());

/* 4) Write a SQL query to Count the Customer list product-wise?  */

select PRODUCT,count(PRODUCT) from TELECOM
group by PRODUCT;

-- plan --
explain plan for 
select PRODUCT,count(PRODUCT) from TELECOM
group by PRODUCT;

select * from table(DBMS_XPLAN.display());

-- index on product --

create index telecom_product_idx on telecom(product);

-- after index is created --;
select PRODUCT,count(PRODUCT) from TELECOM
group by PRODUCT;

-- plan --
explain plan for 
select PRODUCT,count(PRODUCT) from TELECOM
group by PRODUCT;

select * from table(DBMS_XPLAN.display());

/* 5) Write a SQL query to List the Customer name 
of zone = 'Mountain' ?*/
select "Customer Name" from  TELECOM
where ZONE in ('Mountain');

-- plan --
explain plan for
select "Customer Name" from  TELECOM
where ZONE in ('Mountain');

select * from table(DBMS_XPLAN.display());

-- index on zone & customer Name--

create index telecom_customer_name_zone_idx on telecom("Customer Name",zone);
 -- after index --

select "Customer Name" from  TELECOM
where ZONE in ('Mountain');

-- after index plan --
explain plan for
select "Customer Name" from  TELECOM
where ZONE in ('Mountain');

select * from table(DBMS_XPLAN.display());



 