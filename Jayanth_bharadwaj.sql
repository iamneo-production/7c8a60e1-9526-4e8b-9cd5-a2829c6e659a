-- question1
select * from TELECOM where PRODUCT='Digital Subscriber Line';
--question2
select CUSTOMERID,"Customer Name" from TELECOM where "Customer Name" like 'sa%';
--question3
select CUSTOMERID,"Customer Name" from TELECOM where "Customer Segment"='gold';
--question4
select count(CUSTOMERID),PRODUCT from TELECOM group by PRODUCT;
--question5
select "Customer Name" from TELECOM where ZONE='Mountain';
