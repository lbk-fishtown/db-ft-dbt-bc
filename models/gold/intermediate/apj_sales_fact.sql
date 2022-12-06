With customers as (

    select * from {{ ref('dim_customers') }}
),

locations as (

   select * from {{ ref('dim_locations') }}

),    

sales as (
  select * from {{ ref('sales') }} 
),
final as (
    select 
        
sales.id as sale_id, 
sales.ts, 
sales.order_source, 
sales.order_state, 
sales.unique_customer_id, 
sales.store_id,
customers.pk as customer_skey, 
locations.pk as slocation_skey
from sales 

join customers
on sales.unique_customer_id = customers.unique_id

join locations 
on sales.store_id = locations.id

)
select * from final