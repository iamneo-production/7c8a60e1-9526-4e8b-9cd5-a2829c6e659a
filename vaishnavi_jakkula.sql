/* Query-1*/
select "Customer Name" 
from TELECOM_CUSTOMER
where PRODUCT='Digital Subscriber Line';
/*Query-2*/
select CUSTOMERID,"Customer Name" 
from TELECOM_CUSTOMER
where "Customer Name" like'sa%';
/*Query-3*/
select CUSTOMERID,"Customer Name"
 from TELECOM_CUSTOMER
where "Service Segment"='Gold';
/*Query-4*/
select PRODUCT, count(PRODUCT) 
from TELECOM_CUSTOMER
group by PRODUCT;
/*Query-5*/
select "Customer Name" 
from TELECOM_CUSTOMER
where ZONE='Mountain';