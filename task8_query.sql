----having subquery task

select s.order_line,s.sales,c.customer_name from sales as s
inner join customer as c
on s.customer_id=c.customer_id

select order_line,sales,
   (select customer_name from customer as c where s.customer_id =c.customer_id)from sales as s

select sum(sales),product_id,
    (select product_name from product as p where p.product_id=s.product_id)
     from sales as s group by product_id having sum(sales)>144

-----view task

create view sales_customer_product_details as
select s.product_id,p.product_name,s.customer_id,c.customer_name ,
sum(s.sales) as "sum_of_sales",sum(s.profit) as "sum_of_profit", sum(s.quantity) as "sum_of_quantity",sum(s.discount) as "sum_of_discount"
from sales as s
inner join customer as c
on s.customer_id = c.customer_id
inner join product as p
on s.product_id=p.product_id
group by s.product_id, p.product_name,s.customer_id,c.customer_name
order by sum(sales)

select * from sales_customer_product_details

---alter, drop
alter table sales_customer_product_details
add column total_quantity double precision

---update
update sales_customer_product_details
set product_name = 'chris'
where product_id = 'OFF-BI-10004022'

---insert
insert into sales_customer_product_details(product_id,product_name,customer_id,customer_name,sum_of_sales,sum_of_profit,sum_of_quantity,sum_of_discount)
values('OFF-AZ-10001202','xyz','CD-678','accd',134,67,2,96)

--delete
delete from sales_customer_product_details
where customer_name='accd'

