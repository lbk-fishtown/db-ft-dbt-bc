select 
    id,
    name,
    email,
    city,
    hq_address as hq,
    phone_number,
    case 
        when id in ('SYD01', 'MEL01', 'BNE02', 'MEL02', 'PER01', 'CBR01') then 'AUS'
        when id in ('AKL01', 'AKL02', 'WLG01') then 'NZL'
    end as country_code
from {{ source('apjuice', 'stores') }}