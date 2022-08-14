select 
    l.country_code, 
    date_format(sales.ts, 'yyyy-MM') as sales_month, 
    sum(product_cost) as total_sales, 
    count(distinct sale_id) as number_of_sales
from {{ ref('sales_items') }} s 
  join {{ ref('dim_locations') }} l on s.store_id = l.id
  join {{ ref('sales') }} sales on s.sale_id = sales.id
group by l.country_code, date_format(sales.ts, 'yyyy-MM');