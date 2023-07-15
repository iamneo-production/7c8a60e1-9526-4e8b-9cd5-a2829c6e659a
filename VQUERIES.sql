/*query for customer names who are using product digital subscriber line*/
select "Customer Name"
from TELECOM
where product='Digital Subscriber Line';
/*query for customerid and customer name whose name starts with 'sa'*/
select customerid, "Customer Name"
FROM TELECOM
where "Customer Name" like 'sa%';
/*another query for customerid and customer name whose name starts with 'sa'*/
select customerid,"Customer Name"
from TELECOM
where "Customer Name">='sa' and "Customer Name"<'sb';
/*customerid and customer names beloging to the gold customer segment*/
select customerid,"Customer Name"
from TELECOM
where "Service Segment"='Gold';
/*count the customer list product wise*/
select product, count(product) 
from TELECOM
group by product;
/*another query for count the customer list product wise*/
select product, count(*)
from TELECOM
group by product;






