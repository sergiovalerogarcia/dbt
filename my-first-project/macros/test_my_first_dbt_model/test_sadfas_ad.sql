

{% macro test_sadfas_ad(model, column_name) %}

select 0 as a

{% endmacro %}

{% macro default__test_sadfas_ad(model, column_name) %}

{{ test_sadfas_ad(model, column_name) }}

{% endmacro %}