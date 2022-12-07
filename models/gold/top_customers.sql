select 
    s.store_id
    , ss.unique_customer_id
    , c.name
    , sum(product_cost) as total_spend

from {{ ref('sales_items') }} as s 
join {{ ref('sales') }} as ss on s.sale_id = ss.id
join {{ ref('dim_customers') }} as c on ss.unique_customer_id = c.unique_id

where 
    ss.unique_customer_id is not null
group by s.store_id, ss.unique_customer_id, c.name
order by total_spend desc
limit 100