select count(*) from TELECOM;

select product,count(product) from Telecom group by product;

select CUSTOMERID from telecom;

desc telecom;

select circle,count(*) from Telecom group by circle;

create index ids on telecom(zone);
select product from telecom order by zone;