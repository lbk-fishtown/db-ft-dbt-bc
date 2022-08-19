{{
    config(
        materialized='view'
    )
}}

select 
    store_id || "-" || cast(id as string) as unique_id
    , id
    , store_id
    , name
    , email
from {{ source('apjuice', 'users') }}  