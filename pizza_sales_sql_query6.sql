-- Join the necessary tables to find the total quantity of each pizza category ordered.
SELECT 
    pt.category, SUM(o.quantity) AS total_quantity
FROM
    pizza_types pt
        JOIN
    pizzas p ON pt.pizza_type_id = p.pizza_type_id
        JOIN
    order_details o ON o.pizza_id = p.pizza_id
GROUP BY pt.category
ORDER BY total_quantity;