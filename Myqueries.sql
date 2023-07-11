select "Customer Name" from TELECOM
where Product='Digital Subscriber Line';
select CustomerId, "Customer Name" from TELECOM
where "Customer Name" like 'sa%';
select CustomerId, "Customer Name" from TELECOM
where "Service Segment"='Gold';
select Product, count(Product) from TELECOM
group by Product;
<<<<<<< HEAD
select "customer Name" from TELECOM 
=======
select "Customer Name" from TELECOM 
>>>>>>> origin/main
where ZONE='Mountain';
