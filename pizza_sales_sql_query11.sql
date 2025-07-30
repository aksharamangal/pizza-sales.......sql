-- Calculate the percentage contribution of each pizza type to total revenue.
SELECT 
    pt.category,
    ROUND(SUM(o.quantity * p.price) / (SELECT 
                    ROUND(SUM(o.quantity * p.price), 2) AS total_revenue
                FROM
                    order_details o
                        JOIN
                    pizzas p ON o.pizza_id = p.pizza_id) * 100,
            2) AS pizza_types_percentage_revenue
FROM
    pizza_types pt
        JOIN
    pizzas p ON pt.pizza_type_id = p.pizza_type_id
        JOIN
    order_details o ON o.pizza_id = p.pizza_id
GROUP BY pt.category
ORDER BY pizza_types_percentage_revenue DESC;
