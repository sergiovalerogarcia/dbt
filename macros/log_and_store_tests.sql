


{% macro log_and_store_tests(selected_tests, want_to_save=True) %}

  {{ log('\n' + ' TESTS '.center(80, '*'), info=True) }}

    {% for test_name in selected_tests %}

      {% set result = run_query(adapter.dispatch(test_name)() | as_text) %}

      {% if result.columns[0].values()[0] != 0 %}

        {% set result_info = ' [FAIL]' + ' (' + result.columns[0].values()[0] + ')' %}
      
      {% else %}
        
        {% set result_info = ' [PASS]' %}
      
      {% endif %}

      {{ log_info_test(test_name.ljust(69, '.') +  result_info ) }}

      {{ create_test_log(model.name, test_name, result_info) }}

      {% if not loop.last %} union all {% endif %}

    {% endfor %}

  {{ log(' END TESTS '.center(80, '*') + '\n', info=True) }}

{% endmacro %}