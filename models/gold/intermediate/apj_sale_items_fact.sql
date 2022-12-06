With products as (

    select * from {{ ref('dim_products') }}
),

locations as (

   select * from {{ ref('dim_locations') }}

),    

sales as (
  select * from {{ ref('sales') }} 
),

sales_items as (
  select * from {{ ref('sales_items') }} 
),

final as (
    Select 
        sales_items.sale_id, 
        sales_items.product_id, 
        sales_items.store_id, 
        sales_items.product_size, 
        sales_items.product_cost, 
        sales_items.product_ingredients,
        products.pk as product_skey, 
        locations.pk as slocation_skey, 
        sales.unique_customer_id
 from 
 sales_items
 inner join products
    on sales_items.product_id = products.id
inner join locations
  on sales_items.store_id = locations.id
inner join sales
on sales_items.sale_id = sales.id
)
select * from final