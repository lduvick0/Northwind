select * from customers;

select distinct country from customers;

select * from customers where customer_id='BL%';

select * from orders limit 100;

select * from customers where postal_code in ('1010','3012','12209', '05023');

select * from orders where  ship_region is not NULL;

select * from customers
order by country,city;

select * from customers;

insert into customers (customer_id,company_name, contact_name, contact_title, address, city,region, postal_code,country, phone, fax )
values ('APAN','Grand Circus', 'Tom Seeber', 'Instructor', '1312 Taco Drive','Detroit',Null, 2322, 'United States',3332223333,'332-244');

--Update all ship_region to the value 'EuroZone' in the orders table, where the ship_country is 'France'.  
update orders 
set ship_region='Eurozone'
where ship_country='France';

delete from order_details where quantity=1;

--Calculate the average, max, and min of the quantity in the order_details table.
select min(quantity),max(quantity),avg(quantity)
from order_details;

select min(quantity),max(quantity),avg(quantity)
from order_details
group by order_id;

select customer_id from orders
where order_id=10290;

--Do an inner join, left join, right join on orders and customers tables. 
--(These are three separate queries, one for each type of join.)

select *
from customers
inner join orders on customers.customer_id = orders.customer_id;
select *
from customers
left join orders on customers.customer_id = orders.customer_id;
select *
from customers
right join orders on customers.customer_id = orders.customer_id;
--Use a join to get the ship_city and ship_country 
--of all the orders which are associated with an employee who is in London.
select city, orders.ship_city, orders.ship_country
from customers
inner join orders on customers.customer_id=orders.customer_id
where city='London';
--Use a join to get the ship_name of all orders that include a discontinued product. 
--(See orders, order_details, and products. 1 means discontinued.)
select ship_name,products.discontinued
from order_details
inner join orders on orders.order_id=order_details.order_id
inner join products on order_details.product_id=products.product_id
where products.discontinued=1;

select first_name from employees
where reports_to is null

select first_name from employees
where reports_to = 2;

--Write an SQL command to create an index on the CustomerID column in the Customers table.
create index customerID 
on customers(customer_id)