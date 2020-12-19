{% macro store_all_test(list_of_ref_model_dependencies) %}

  {% if execute %}

    {% set all_tests = [] %}

      {% for key, value in graph.nodes.items() %}
        {% if key[-1] == '_' %}
          {% set test_name = 'test_' + value.test_metadata.name %}
          {% set all_tests = all_tests.append(test_name)  %}
        {% endif %}
      {% endfor %}

      {{ log('\n' + ' TESTS '.center(80, '*'), info=True) }}

      {% for test_name in all_tests %}

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
  {% endif %}

{% endmacro %}