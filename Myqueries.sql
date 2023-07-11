select "CUSTOMER NAME" from TELECOM
where Product='Digital Subscriber Line';
select CustomerId, "Customer Name" from TELECOM
<<<<<<< HEAD
where "CUSTOMER NAME" like 'sa%';
select CustomerId, "CUSTOMER NAME" from TELECOM
where "Service Segment"='Gold';
select Product, count(Product) from TELECOM
group by Product;
select "CUSTOMER NAME" from TELECOM 
where ZONE='Mountain';
=======
where "Customer Name" like 'sa%';
select CustomerId, "Customer Name" from TELECOM
where "Service Segment"='GOLD';
select Product, count(Product) from TELECOM
group by Product;
select "Customer Name" from TELECOM 
where ZONE='Mountain';
>>>>>>> f1b06f6a42997323b5e0bebbff197649d36300a3
