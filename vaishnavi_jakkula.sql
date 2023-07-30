
set timing on;

---Query1---
select "Customer Name" 
from TELECOM_CUSTOMER
where PRODUCT='Digital Subscriber Line';

---Query2---
select CUSTOMERID,"Customer Name" 
from TELECOM_CUSTOMER
where "Customer Name" like'sa%';

---Query3---
select CUSTOMERID,"Customer Name"
 from TELECOM_CUSTOMER
where "Service Segment"='Gold';

---Query4---
select PRODUCT, count(PRODUCT) 
from TELECOM_CUSTOMER
group by PRODUCT;

---Query5---
select "Customer Name" 
from TELECOM_CUSTOMER
where ZONE in ('Mountain');


-----optimized queries-----

---Query-1---
create index telecom_Customer_name_product_idx on TELECOM_CUSTOMER("Customer Name",product);
select "Customer Name"
from TELECOM_CUSTOMER
where PRODUCT='Digital Subscriber Line';

---Query2---
create index telecom_Customer_name_idx on TELECOM_CUSTOMER("Customer Name");
select CUSTOMERID,"Customer Name"
from TELECOM_CUSTOMER
where "Customer Name" like 'sa%';

---Query3---
create index telecom_customerid_servicesegment_idx on TELECOM_CUSTOMER("Service Segment","CUSTOMERID","Customer Name");
select CUSTOMERID,"Customer Name"
from TELECOM_CUSTOMER
where "Service Segment"='Gold';

---Query4---
create bitmap index telecom_product_idx on TELECOM_CUSTOMER(PRODUCT);
select PRODUCT,count(PRODUCT)
from TELECOM_CUSTOMER
group by PRODUCT;

---Query5---
create index telecom_customer_name_zone_idx on TELECOM_CUSTOMER("Customer Name",zone);
select "Customer Name"
from TELECOM_CUSTOMER
where ZONE in ('Mountain');
 