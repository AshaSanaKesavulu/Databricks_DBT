{% snapshot e2e_sap_plant_snapshot %}

{{
    config(
        target_schema='snapsot_demo',
        unique_key='plant_code',
        strategy='check',
        check_cols='all'
    )
}}

select *
from {{ ref('e2e_sap_plant') }}

{% endsnapshot %}