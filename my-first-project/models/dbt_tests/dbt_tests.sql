{{ config(
  materialized='incremental'
) 
}}

{{ store_all_test([
  ref('my_first_dbt_model')
]) }}


