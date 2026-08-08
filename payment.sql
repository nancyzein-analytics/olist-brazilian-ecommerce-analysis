Create View Payment_data as
select
    -- Payment
o.order_id,
p.payment_type,
p.payment_value

from orders o
left join order_payment p
on p.order_id = o.order_id 