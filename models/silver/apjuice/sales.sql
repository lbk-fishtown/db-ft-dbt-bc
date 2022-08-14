
with records as (
    select
        saleID as id,
        from_unixtime(ts) as ts,
        Location as store_id,
        CustomerID as customer_id,
        location || "-" || cast(CustomerID as string) as unique_customer_id,
        OrderSource as order_source,
        STATE as order_state,
        SaleItems as sale_items
    from
        {{ source('apjuice', 'sales2021') }}
)

select
    *,
    sha2(concat_ws(*, '||'), 256) as row_hash -- add a hash of all values to easily pick up changed rows
from
records