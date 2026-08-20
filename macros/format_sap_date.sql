{% macro format_sap_date(column_name) -%}

    case
        when {{ column_name }} is null then null
        when trim(cast({{ column_name }} as string)) in (
            '',
            '00000000',
            '0000-00-00'
        ) then null
        else concat(
            substr({{ column_name }}, 6, 2),
            '/',
            substr({{ column_name }}, 9, 2),
            '/',
            substr({{ column_name }}, 1, 4)
        )
    end

{%- endmacro %}