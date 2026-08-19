{% macro formatty_date(column_name) %}
    concat(
        substr({{ column_name }}, 6, 2),
        '/',
        substr({{ column_name }}, 9, 2),
        '/',
        substr({{ column_name }}, 1, 4)
    )
{% endmacro %}