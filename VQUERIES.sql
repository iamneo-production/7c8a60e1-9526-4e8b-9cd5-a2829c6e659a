/*query for customer names who are using product digital subscriber line*/
select "Customer Name"
from TELECOM_CUSTOMER
where product='Digital Subscriber Line';
/*query for customerid and customer name whose name starts with 'sa'*/
select customerid, "Customer Name"
FROM TELECOM_CUSTOMER
where "Customer Name" like 'sa%';
/*another query for customerid and customer name whose name starts with 'sa'*/
select customerid,"Customer Name"
from TELECOM_CUSTOMER
where "Customer Name">='sa' and "Customer Name"<'sb';
/*customerid and customer names beloging to the gold customer segment*/
select customerid,"Customer Name"
from TELECOM_CUSTOMER
where "Service Segment"='Gold';
/*count the customer list product wise*/
select product, count(product) 
from TELECOM_CUSTOMER
group by product;
/*another query for count the customer list product wise*/
select product, count(*)
from TELECOM_CUSTOMER
group by product;
/*query to list the customer names of the zone mountain*/
select "Customer Name"
from TELECOM_CUSTOMER
where ZONE='Mountain';










