select 
store_id || '-' || id as unique_id, 
id, pk, store_id, name, email 
from {{ source('apjuice', 'users') }}