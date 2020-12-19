{% macro log_info_test(msg) -%}
    {{ log(modules.datetime.datetime.now().strftime('%H:%M:%S') +  " | " + msg, info=True) }}
{%- endmacro %}