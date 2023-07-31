--- 1. List the count of Customer  in each zone? ---

select zone,count(zone) as NO_OF_Customer from TELECOM_CUSTOMER group by zone;


--- 2. List the Customer name in each zone
SELECT ZONE,"Customer Name" FROM TELECOM_CUSTOMER ORDER BY ZONE ASC;


--- 3. List the Customer's name in each Service Segment? 
SELECT "Service Segment", "Customer Name" FROM TELECOM_CUSTOMER ORDER BY "Service Segment" Asc;

-- 4. List the count of Customer  in each Customer class?

select "Customer Class",count("Customer Class") from TELECOM_CUSTOMER group by "Customer Class";

-- 5. List the count of Customer  in Circle?

select Circle,count(CIRCLE) as No_of_Customer from TELECOM_CUSTOMER group by Circle;

-- 6. Display the Customerid of Customer Chares David?

select CUSTOMERID from TELECOM_CUSTOMER where "Customer Name" in ('Chares David');

-- 7.Find the total count of customers using Voice Product & INAMA:
select count(CUSTOMERID) as no_of_customer from TELECOM_CUSTOMER where product in ('Voice','INAMA');

-- 8. Find the count of customer in each product 
select product,count(product) as no_of_customer from telecom_customer group by product;

--9. Display the total customer name in ascending order?

select "Customer Name" from Telecom_customer order by "Customer Name";

--10. Display the Customer name in U.S Zone

select "Customer Name" from telecom_customer where zone in ('U.S');

--11.Display the Digital Subscriber Line product customers' names in descending order?

SELECT "Customer Name" FROM TELECOM_CUSTOMER WHERE PRODUCT in ('Digital Subscriber Line') ORDER BY "Customer Name" DESC;
 
 ----