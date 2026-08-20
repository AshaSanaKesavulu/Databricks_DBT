with expected as (

    select
        sales_doc_num,
        sales_doc_item,
        count(*) as expected_rows
    from {{ ref('e2e_sap_dn_so') }}
    group by
        sales_doc_num,
        sales_doc_item

),

actual as (

    select
        sales_doc_num,
        sales_doc_item,
        count(*) as actual_rows
    from {{ ref('e2e_sap_l3_so') }}
    group by
        sales_doc_num,
        sales_doc_item

)

select
    coalesce(expected.sales_doc_num, actual.sales_doc_num) as sales_doc_num,
    coalesce(expected.sales_doc_item, actual.sales_doc_item) as sales_doc_item,
    coalesce(expected.expected_rows, 0) as expected_rows,
    coalesce(actual.actual_rows, 0) as actual_rows
from expected
full outer join actual
    on expected.sales_doc_num = actual.sales_doc_num
    and expected.sales_doc_item = actual.sales_doc_item
where coalesce(expected.expected_rows, 0)
    <> coalesce(actual.actual_rows, 0)