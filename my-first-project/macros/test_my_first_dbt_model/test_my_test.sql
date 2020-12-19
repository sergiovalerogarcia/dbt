
{% macro test_my_test(model, column_name) %}

select 'Juan, pascual' as a

{% endmacro %}


{% macro default__test_my_test(model, column_name) %}

{{ test_my_test(model, column_name) }}

{% endmacro %}