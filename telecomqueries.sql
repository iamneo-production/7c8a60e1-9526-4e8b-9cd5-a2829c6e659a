/* 1.Write a SQL Query to find a list of customer names who are using the product Digital Subscriber Line?*/
select "Customer Name" from TELECOM where product = 'Digital Subscriber Line';
/* 2.Write a SQL Query to list a Customer id,customer name whose name starts with 'sa'?*/
select customerid,"Customer Name" from TELECOM where "Customer Name" like 'sa%';
/* 3.Write a SQL Query to list the customer IDs and names for customers belonging to the gold customer segment?*/
select customerid,"Customer Name" from TELECOM where "Customer Segment" = 'Gold';
/* 4.Write a SQL Query to Count the Customer list product-wise?*/
select count(customerid),product from TELECOM group by product;
/* 5.Write a SQL Queryto list the Customer name of zone 'Mountain'?*/
select "Customer Name" from TELECOM where "ZONE" = 'Mountain';