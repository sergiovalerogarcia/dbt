{{ config(
  materialized='incremental',
  post_hook=[
    "grant select on {{ this }} to postgres",
  ]
) 
}}

with source_data as (
      select 
      '20201128' as snapshot,
      '3qf4faf2fwd' as pnr_locator
)

select *
from source_data

{% if is_incremental() %}

      where snapshot > (select max(snapshot) from {{ this }})

{% endif %}