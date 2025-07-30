-- Analyze the cumulative revenue generated over time.
-- Using subquery
select 
date, 
round(sum(revenue) over(order by date), 2) as cumulative_revenue from
(select os.date, sum(o.quantity * p.price) as revenue
 from order_details o
join pizzas
 p on o.pizza_id = p.pizza_id 
 join orders os 
 on o.order_id = os.order_id
 group by os.date) as c;