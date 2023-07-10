select "Customer Name" from TELECOM 
where PRODUCT='Digital Subscriber Line';
select CUSTOMERID,"Customer Name" from TELECOM
where "Customer Name" like'sa%';
select CUSTOMERID,"Customer Name" from TELECOM
where "Service Segment"='Gold';
select PRODUCT, count(PRODUCT) from TELECOM
group by PRODUCT;
select "Customer Name" from TELECOM
where "ZONE"='EASTERN';