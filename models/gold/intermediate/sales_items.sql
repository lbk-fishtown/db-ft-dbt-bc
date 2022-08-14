with itemised_records as (
  select
    *,
    posexplode(
      from_json(
        sale_items,
        'array<struct<id:string,size:string,notes:string,cost:double,ingredients:array<string>>>'
      )
    )
  from
    {{ ref('sales') }}
),
all_records as (
  select
    id || "-" || cast(pos as string) as id,
    id as sale_id,
    store_id,
    pos as item_number,
    col.id as product_id,
    col.size as product_size,
    col.notes as product_notes,
    col.cost as product_cost,
    col.ingredients as product_ingredients
  from
    itemised_records
)
select
  *,
  sha2(concat_ws(*, '||'), 256) as row_hash
from
  all_records
