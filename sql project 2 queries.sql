use superstores;

/* .1 write a query to display the customer_name and customer segment using alias name
     "customer name", "customer segment" from table cust_dimen?*/

select  customer_name as "customer name" ,customer_segment as "customer segment"
from cust_dimen;

/* .2 write a query to find all the details of the customer from the table cust_dimen
    order by desc.?*/
    
    select *
    from cust_dimen
    order by customer_name desc;
    
/* 3. write a query to get the order id, order date from table order_dimen where
   'order priority' is high.? */
   

select order_id,order_date
from orders_dimen
where order_priority = "high";


/* 4.find the total and the average sales (display total_sales and avg_sales?*/


select sum(sales) as total_sales, avg(sales) as avg_sales
from market_fact;



/* 5.write a query to get the maximum and minimum sales from market_fact table?*/


select max(sales) as maximum_sales, min(sales) as minimum_sales
from market_fact;



/* 6. display the number of customer in each region in decreasing order of 
no_of_customer. the result should contain column region, no_of_customer?*/

select region, count(*) as no_of_customer
from cust_dimen
group by region
order by no_of_customer desc;



/* 7.find the region having maximum customer(display the region name) and max(no_of_customers)?*/

select region, count(*) as no_of_customer
from cust_dimen
group by region
order by no_of_customer desc
limit 1;


/* 8.find all the customer from atlantic region who have ever purchased'tables' and the number of
table purchased (display the customer name , no_of_tables purchased)?*/

select c.customer_name, count(*) as no_of_table_purchased
from market_fact m
inner join
cust_dimen c on m.cust_id = c.cust_id
where c.region = 'atlantic'
and m.prod_id = (select
prod_id
from
prod_dimen
where
product_sub_category = 'tables')
group by m.cust_id, c.customer_name;



/* 9.find all the customer from ontario province who own small business. (display the customer name ,no of small business owner)?*/

select customer_name as "customer name", count(*) as "no of small business", province
from cust_dimen
where province = "ontario" and customer_segment = "small business"
group by cust_id, customer_name;

/* 10. find the number and id of products sold in decreasing order of product sold
  (display product id, no_of_product sold)?*/

select prod_id as product_id, count(*) as no_of_product_sold
from market_fact
group by prod_id
order by no_of_product_sold desc;



/* 11. display product id and product sub category whose product category belong to furniture and technology.
   the result should contain columns productid, product sub category.?*/
   
select prod_id as "product_id", product_sub_category, product_category
from prod_dimen
where product_category = "furniture" or product_category = "technology"
order by prod_id;
  


/* .12 display the product categories in descending order of profits(display the product category wise profit i.e.
   product_category,profits)?*/
   
select p.product_category, sum(m.profit) as profits
from market_fact m
inner join
prod_dimen p
on m.prod_id = p.prod_id   
group by p.product_category 
order by profits desc;


/* 13. display the product category , product sub category ,and the profit within each subcategory in three columns.?*/

select p.product_category, p.product_sub_category, sum(m.profit) as profits
from market_fact m
inner join
prod_dimen p
on m.prod_id = p.prod_id
group by p.product_category, p.product_sub_category;



/* 14.display the order date ,order quantity and the sales for order.?*/

select o.order_date, m.order_quantity, m.sales
from market_fact as m
left join
orders_dimen as o
on m.ord_id = o.ord_id
order by order_date;



/* 15.display the names of the customer whose name contain the 
 1) second letter as 'R'
 2)fourth letter as 'D' ?*/
 
select customer_name 
from cust_dimen
where customer_name like '_r_d%'; 



/* 16. write a sql query to make a list with cust_id ,sales ,customer name and their region where sales are between 1000 and 5000?*/


select m.cust_id, m.sales, c.customer_name, c.region
from market_fact m
left join
cust_dimen c
on m.cust_id = c.cust_id
where sales between 1000 and 5000;



/* 17. write a sql query to find the 3rd highest sales.?*/


select *
from market_fact
order by sales
desc limit 2, 1;



/* 18. where is the least profitable product subcategory shipped the most? for the least
 profitable product subcategory, display the region wise no_of_shipment and the profit made in each region
     in decreasing order of profit(i.e. region, no_of_shipments, profit in each region)?*/
     
select c.region, count(distinct s.ship_id) as no_of_shipment, sum(m.profit) as profit_in_each_region
from market_fact m
inner join
cust_dimen c on m.cust_id =c.cust_id
inner join 
shipping_dimen s on m.ship_id = s.ship_id
inner join 
prod_dimen p on m.prod_id = p.prod_id
where p.product_sub_category in
(select p.product_sub_category
  from market_fact m
  inner join 
  prod_dimen p on m.prod_id = p.prod_id
group by p.product_sub_category
having sum(m.profit) <=all
                   (select sum(m.profit)as profits
                   from market_fact m
                   inner join
                   prod_dimen p on m.prod_id = p.prod_id
                   group by p.product_sub_category))
group by c.region
order by profit_in_each_region desc;                   
                   
  
     
     
   
 





   
    



