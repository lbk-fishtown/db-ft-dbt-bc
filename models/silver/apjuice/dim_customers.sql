select store_id || "_" || cast(id as string) as unique_id,pk, id, store_id, name, email
from {{ source("apjuice", "users") }}
