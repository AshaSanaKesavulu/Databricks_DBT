with expected as (

    select
        ebeln,
        ebelp,
        count(*) as expected_rows
    from {{ ref('e2e_sap_dn_po') }}
    group by
        ebeln,
        ebelp

),

actual as (

    select
        ebeln,
        ebelp,
        count(*) as actual_rows
    from {{ ref('e2e_sap_l3_po') }}
    group by
        ebeln,
        ebelp

)

select
    coalesce(expected.ebeln, actual.ebeln) as ebeln,
    coalesce(expected.ebelp, actual.ebelp) as ebelp,
    coalesce(expected.expected_rows, 0) as expected_rows,
    coalesce(actual.actual_rows, 0) as actual_rows
from expected
full outer join actual
    on expected.ebeln = actual.ebeln
    and expected.ebelp = actual.ebelp
where coalesce(expected.expected_rows, 0)
    <> coalesce(actual.actual_rows, 0)