select 
si.store_id, s.unique_customer_id, name, sum(product_cost) as total_spend
from 
{{ref('sales_items')}} si join {{ref('sales')}} s on si.sale_id = s.id
join {{ref('dim_customers')}} c on s.unique_customer_id = c.unique_id

group by si.store_id, unique_customer_id, name
order by total_spend limit 100