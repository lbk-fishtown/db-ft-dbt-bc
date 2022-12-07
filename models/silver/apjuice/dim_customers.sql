select 
    store_id || "-" || cast(id as string) as unique_id
    , store_id || "-" || cast(id as string) as pk
    , id
    , store_id
    , name
    , email
from {{ source('apjuice', 'users') }} 