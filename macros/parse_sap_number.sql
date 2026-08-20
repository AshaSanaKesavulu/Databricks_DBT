{% macro parse_sap_number(column_name, data_type='float') -%}

    cast(
        nullif(
            replace(
                trim(cast({{ column_name }} as string)),
                ',',
                ''
            ),
            ''
        ) as {{ data_type }}
    )

{%- endmacro %}