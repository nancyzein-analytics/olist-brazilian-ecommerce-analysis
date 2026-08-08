Alter View Customers_Orders_data as
--CTE 1
WITH customer_stats AS (SELECT
        c.customer_unique_id,
        COUNT(o.order_id) AS num_orders
    FROM customers c
    LEFT JOIN orders o
        ON c.customer_id = o.customer_id
    GROUP BY c.customer_unique_id
)
--CTE 2
, customer_segment AS (SELECT
        customer_unique_id,
        num_orders,
        CASE
            WHEN num_orders = 1 THEN 'One-Time'
            WHEN num_orders BETWEEN 2 AND 3 THEN 'Repeat'
            WHEN num_orders BETWEEN 4 AND 5 THEN 'Frequent'
            ELSE 'Loyal'
        END AS customer_Category
    FROM customer_stats
)
--Main Query
select 
    -- Customer
c.customer_unique_id,
c.customer_city,
c.customer_state,

-- Order
o.order_id,
o.order_status,
cast(o.order_purchase_timestamp as date)as order_purchase_timestamp,
cast(o.order_delivered_customer_date as date)as order_delivered_customer_date,
cast(o.order_delivered_carrier_date as date)as order_delivered_carrier_date,
cast(o.order_approved_at as date) as order_approved_at,
cast(o.order_estimated_delivery_date as date)as order_estimated_delivery_date ,

--Customer Segmentation
cs.num_orders,
cs.customer_category,

DATEDIFF(day,o.order_purchase_timestamp,o.order_delivered_customer_date)as Delivery_Time,
DATEDIFF(day,o.order_delivered_carrier_date,o.order_delivered_customer_date)as Company_shipping_time,
DATEDIFF(day,o.order_approved_at,o.order_delivered_carrier_date)as seller_processing_time,

case
        when 
        DATEDIFF(DAY,o.order_estimated_delivery_date,o.order_delivered_customer_date) > 0 then DATEDIFF( DAY, o.order_estimated_delivery_date,o.order_delivered_customer_date) 
        else Null
End AS Shipping_Delay

     from customers c
left join orders o
on c.customer_id =o.customer_id
left join customer_segment cs
on c.customer_unique_id = cs.customer_unique_id

