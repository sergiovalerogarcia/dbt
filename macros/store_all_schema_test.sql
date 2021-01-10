{% macro store_all_schema_test(list_of_ref_model_dependencies) %}

  {% if execute %}

    {% set all_tests = [] %}

      {% for key, value in graph.nodes.items() %}
        {% if key[-1] == '_' %}
          {% set test_name = 'test_' + value.test_metadata.name %}
          {% set all_tests = all_tests.append(test_name)  %}
        {% endif %}
      {% endfor %}

      {{ log_and_store_tests(all_tests) }}

  {% endif %}

{% endmacro %}