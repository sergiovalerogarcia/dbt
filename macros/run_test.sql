{% macro run_test(tests) %}

  {{ log_and_store_tests(tests, want_to_save=Flase) }}

{% endmacro %}