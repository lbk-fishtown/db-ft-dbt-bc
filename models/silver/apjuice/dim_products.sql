select
    pk,
    id,
    ingredients,
    name as product_name,
    _fivetran_deleted,
    _fivetran_synced
from {{ source('apjuice', 'products') }}