-- Determine the distribution of orders by hour of the day.
SELECT 
    HOUR(time) AS hours, COUNT(order_id) AS count_orders
FROM
    orders
GROUP BY hours;