select "Customer Name" from TELECOM
where Product='Digital Subscriber Line';
select CustomerId, "Customer Name" from TELECOM
where "Customer Name" like 'sa%';
select CustomerId, "Customer Name" from TELECOM
where "Service Segment"='Gold';
select Product, count(Product) from TELECOM
group by Product;
select "Customer Name" from TELECOM 
where Zone='Mountain';