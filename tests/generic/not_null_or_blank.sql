{% test not_null_or_blank(model, column_name) %}

    select *
    from {{ model }}
    where {{ column_name }} is null
       or trim(cast({{ column_name }} as string)) = ''

{% endtest %}