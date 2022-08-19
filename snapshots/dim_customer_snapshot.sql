{% snapshot snapshot_name %}
   {{
        config(
            unique_key='unique_id',
            strategy='check',
            check_cols='all'
        )
    }}

    select unique_id
        , id
        , store_id
        , name
        , email
    from {{ ref('dim_customer') }}
    where store_id <> 'BNE02'

    union all 
   
    select unique_id
        , id
        , store_id
        , name
        , 'corrected_email@gmail.com' as email
    from {{ ref('dim_customer') }} 
    where store_id = 'BNE02'



 {% endsnapshot %}