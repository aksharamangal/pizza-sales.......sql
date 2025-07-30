-- Determine the top 3 most ordered pizza types based on revenue.
SELECT 
    pt.name,
    SUM(o.quantity * p.price) AS pizzas_types_total_revenue
FROM
    pizza_types pt
        JOIN
    pizzas p ON pt.pizza_type_id = p.pizza_type_id
        JOIN
    order_details o ON o.pizza_id = p.pizza_id
GROUP BY pt.name
ORDER BY pizzas_types_total_revenue DESC
LIMIT 3;
