-- Identify the most common pizza size ordered.
SELECT 
    p.size, COUNT(o.order_details_id) AS count_orders
FROM
    pizzas p
        JOIN
    order_details o ON p.pizza_id = o.pizza_id
GROUP BY p.size
ORDER BY count_orders DESC;