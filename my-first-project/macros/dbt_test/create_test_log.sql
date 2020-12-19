

{% macro create_test_log(test_model, test_name, test_result, test_details) %}

select 
  now() as run_time,
  '{{ test_model }}' as model,
  '{{ test_name }}' as test_name,
  '{{ test_result }}' as test_result

{% endmacro %}