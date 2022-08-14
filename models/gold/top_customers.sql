select 
  s.store_id, 
  ss.unique_customer_id, 
  c.name, 
  sum(product_cost) total_spend 
from 
  {{ ref('sales_items') }} s 
  join {{ ref('sales') }} ss        on s.sale_id = ss.id
  join {{ ref('dim_customers') }} c on ss.unique_customer_id = c.unique_id
where 
  ss.unique_customer_id is not null 
group by s.store_id, ss.unique_customer_id, c.name
order by total_spend
limit 100