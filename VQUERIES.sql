/*query for customer names who are using product digital subscriber line*/
select "Customer Name"
from TELECOM
where product='Digital Subscriber Line';
/*query for customerid and customer name whose name starts with sa'*/
select customerid, "Customer Name"
FROM TELECOM
where "Customer Name" like 'sa%';







