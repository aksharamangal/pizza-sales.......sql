

-- Determine the top 3 most ordered pizza types based on revenue for each pizza category.
-- Using subquery

select 
name, 
revenue from
(select category, name, revenue, rank() over(partition by category order by revenue) as rn from
(select pt.category, pt.name, sum(o.quantity * p.price)as revenue from pizza_types pt
join pizzas p 
on pt.pizza_type_id = p.pizza_type_id 
join order_details o 
on o.pizza_id = p.pizza_id 
group by pt.category, pt.name) as a) as b
where rn<=3;