-- Group the orders by date and calculate the average number of pizzas ordered per day.-- 
-- using subquery

SELECT 
    ROUND(AVG(sum_quantity), 0) AS avg_pizza_ordered_per_Day
FROM
    (SELECT 
        os.date, SUM(o.quantity) AS sum_quantity
    FROM
        orders os
    JOIN order_details o ON os.order_id = o.order_id
    GROUP BY os.date) AS b;


