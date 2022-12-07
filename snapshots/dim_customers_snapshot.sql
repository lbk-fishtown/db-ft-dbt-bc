{% snapshot dim_customers_snapshot %}

    {{
        config(
          unique_key='unique_id',
          strategy='check',
          check_cols='all'
        )
    }}

    select * from {{ ref('dim_customers') }}

{% endsnapshot %}