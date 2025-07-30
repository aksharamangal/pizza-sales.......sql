-- List the top 5 most ordered pizza types along with their quantities.
SELECT 
    pt.name, SUM(o.quantity) AS total_order_quantity
FROM
    pizza_types pt
        JOIN
    pizzas p ON pt.pizza_type_id = p.pizza_type_id
        JOIN
    order_details o ON o.pizza_id = p.pizza_id
GROUP BY pt.name
ORDER BY total_order_quantity DESC
LIMIT 5;
