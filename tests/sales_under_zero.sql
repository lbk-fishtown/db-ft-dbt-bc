{{
    config(
        error_if = '>10'
        , warn_if = '>0'
    )
}}

select *
from {{ ref('sales_items') }}
where product_cost < 0