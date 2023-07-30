--query for customer names who are using product digital subscriber line
select "Customer Name"
from TELECOM_CUSTOMER
where product='Digital Subscriber Line';

--query for customerid and customer name whose name starts with 'sa'
select customerid,"Customer Name"
from TELECOM_CUSTOMER
where "Customer Name">='sa' and "Customer Name"<'sb';

--customerid and customer names beloging to the gold customer segment
select customerid,"Customer Name"
from TELECOM_CUSTOMER
where "Service Segment"='Gold';

--query for count the customer list product wise
select product, count(*)
from TELECOM_CUSTOMER
group by product;

--query to list the customer names of the zone mountain
select "Customer Name"
from TELECOM_CUSTOMER
where ZONE='Mountain';

--optimization of queries using indexing

--query for customer names who are using product digital subscriber line
CREATE INDEX IDX_CNP ON TELECOM_CUSTOMER("Customer Name",PRODUCT);

SELECT "Customer Name" 
FROM TELECOM_CUSTOMER
WHERE Product= 'Digital Subscriber Line';

--query for customerid and customer name whose name starts with 'sa'
CREATE INDEX IDX_CIN ON TELECOM_CUSTOMER(customerid,"Customer Name");

SELECT customerid, "Customer Name"
FROM TELECOM_CUSTOMER
WHERE "Customer Name">='sa' AND "Customer Name"<'sb';

--customerid and customer names beloging to the gold customer segment
CREATE INDEX IDX_CS ON TELECOM_CUSTOMER(customerid,"Customer Name","Service Segment");

SELECT customerid, "Customer Name"
FROM TELECOM_CUSTOMER
WHERE "Service Segment"='gold';

--query count the customer list product wise
CREATE INDEX IDX_P ON TELECOM_CUSTOMER(product);

SELECT PRODUCT,COUNT(*)
FROM TELECOM_CUSTOMER
GROUP BY PRODUCT;

--query to list the customer names of the zone mountain
CREATE INDEX IDX_Z ON TELECOM_CUSTOMER("Customer Name",ZONE);

SELECT "Customer Name"
FROM TELECOM_CUSTOMER
WHERE ZONE='Mountain';


--plan explaination
DESCRIBE PLAN_TABLE;

--query for customer names who are using product digital subscriber line
EXPLAIN PLAN FOR
SELECT "Customer Name" 
FROM TELECOM_CUSTOMER
WHERE Product= 'Digital Subscriber Line';

select PLAN_TABLE_OUTPUT 
from table(DBMS_XPLAN.DISPLAY());

--query for customerid and customer name whose name starts with 'sa'
EXPLAIN PLAN FOR
SELECT customerid, "Customer Name"
FROM TELECOM_CUSTOMER
WHERE "Customer Name">='sa' AND "Customer Name"<'sb';

select PLAN_TABLE_OUTPUT 
from table(DBMS_XPLAN.DISPLAY());

--customerid and customer names beloging to the gold customer segment
EXPLAIN PLAN FOR
SELECT customerid, "Customer Name"
FROM TELECOM_CUSTOMER
WHERE "Service Segment"='gold';

select PLAN_TABLE_OUTPUT 
from table(DBMS_XPLAN.DISPLAY());

--query for count the customer list product wise
EXPLAIN PLAN FOR
SELECT PRODUCT,COUNT(*)
FROM TELECOM_CUSTOMER
GROUP BY PRODUCT;

select PLAN_TABLE_OUTPUT 
from table(DBMS_XPLAN.DISPLAY());

--query to list the customer names of the zone mountain
EXPLAIN PLAN FOR
SELECT "Customer Name"
FROM TELECOM_CUSTOMER
WHERE ZONE='Mountain';

select PLAN_TABLE_OUTPUT 
from table(DBMS_XPLAN.DISPLAY());













