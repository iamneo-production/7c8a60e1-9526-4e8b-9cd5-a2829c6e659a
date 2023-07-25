desc TELECOM_CUSTOMER;
select "Customer Name" from TELECOM_CUSTOMER where product = 'Digital Subscriber Line';
SELECT * FROM TELECOM_CUSTOMER;
select customerid,"Customer Name" from TELECOM_CUSTOMER where "Customer Name" like 'sa%';
select customerid,"Customer Name" from TELECOM_CUSTOMER where "Customer Segment" = 'Gold';
select count(customerid),product from TELECOM_CUSTOMER group by product;
select "Customer Name" from TELECOM_CUSTOMER where zone = 'Mountain';

explain plan for select "Customer Name" from TELECOM_CUSTOMER where product = 'Digital Subscriber Line';
select * from table(dbms_xplan.display());

create index telecom_idx on telecom_customer(customerid,product,"Customer Name"
,"Service Segment",ZONE);
create index telecom_cust_prod_idx on telecom_customer("Customer Name",product);