
Alter View Orders_Items_Sellers_data as

WITH CategoryRevenue AS
(
    SELECT
        g.product_category_name,
        SUM(i.price) AS Revenue
    FROM order_items i
    INNER JOIN products g
        ON g.product_id = i.product_id
    GROUP BY g.product_category_name
),

CategoryRank AS
(
    SELECT
        product_category_name,
        Revenue,
        DENSE_RANK() OVER(ORDER BY Revenue DESC) AS Category_Rank
    FROM CategoryRevenue
),

CategoryGroup AS
(
    SELECT
        product_category_name,
        CASE
            WHEN Category_Rank <= CEILING((SELECT COUNT(*) FROM CategoryRevenue) * 0.20)
                THEN 'Top 20% Categories'
            ELSE 'Remaining 80% Categories'
        END AS Category_Group
    FROM CategoryRank
)

select
o.order_id,
i.product_id,
i.price,
i.freight_value,
g.product_category_name,
t.product_category_name_english,
s.seller_id,
s.seller_city,
s.seller_state,
i.shipping_limit_date,
 cg.Category_Group,

    -- Average price for the same product
    AVG(i.price) OVER(PARTITION BY i.product_id) AS avg_product_price,

    -- Price classification
    CASE
        WHEN i.price > AVG(i.price) OVER(PARTITION BY i.product_id)
            THEN 'Above Average'
        WHEN i.price < AVG(i.price) OVER(PARTITION BY i.product_id)
            THEN 'Below Average'
        ELSE 'Equal Average'
    END AS price_level,

case
        when 
        DATEDIFF(DAY,shipping_limit_date,order_delivered_carrier_date) > 0 then DATEDIFF( DAY, shipping_limit_date,order_delivered_carrier_date) 
        else Null
End AS seller_delay_days,

case
        when c.customer_city<>s.seller_city and o.order_delivered_carrier_date  <= i.shipping_limit_date then 'Not_related'
        when c.customer_city<>s.seller_city and o.order_delivered_carrier_date  > i.shipping_limit_date then 'related'
        else 'N/A'
     end as different_city_delay

from customers c
left join orders o
on c.customer_id =o.customer_id
left join order_items i
on i.order_id = o.order_id
left join sellers s
on s.seller_id = i.seller_id
left join products g
on g.product_id = i.product_id
left join product_category_name_translation t
on t.product_category_name =g.product_category_name
LEFT JOIN CategoryGroup cg
    ON cg.product_category_name = g.product_category_name
