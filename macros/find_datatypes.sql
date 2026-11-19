{% macro find_datatypes(model) %}

    {% if execute %}
        {% set columns = adapter.get_columns_in_relation(model) %}
    {% else %}
        {% set columns = [] %}
    {% endif %}

    {% if columns %}
        {% for column in columns %}

            select
                '{{ column.name | lower }}' as column_name,
                '{{ column.dtype | lower }}' as data_type

            {% if not loop.last %}
                union all
            {% endif %}

        {% endfor %}
    {% else %}

        select
            cast(null as {{ dbt.type_string() }}) as column_name,
            cast(null as {{ dbt.type_string() }}) as data_type
        where 1 = 0

    {% endif %}

{% endmacro %}

{# {{ find_datatypes(ref('dim_product_supplies')) }} #}
