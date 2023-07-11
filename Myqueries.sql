select "CUSTOMER NAME" from TELECOM
where Product='Digital Subscriber Line';
select CustomerId, "Customer Name" from TELECOM
where "CUSTOMER NAME" like 'sa%';
select CustomerId, "CUSTOMER NAME" from TELECOM
where "Service Segment"='Gold';
select Product, count(Product) from TELECOM
group by Product;
select "CUSTOMER NAME" from TELECOM 
where ZONE='Mountain';
