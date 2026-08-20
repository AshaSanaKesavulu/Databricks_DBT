with pol_failures as (

    select
        'e2e_sap_pol' as model_name,
        ebeln as document_number,
        ebelp as document_item,
        count(*) as row_count
    from {{ ref('e2e_sap_pol') }}
    group by
        ebeln,
        ebelp
    having count(*) <> 1

),

dn_po_failures as (

    select
        'e2e_sap_dn_po' as model_name,
        ebeln as document_number,
        ebelp as document_item,
        count(*) as row_count
    from {{ ref('e2e_sap_dn_po') }}
    group by
        ebeln,
        ebelp
    having count(*) <> 1

)

select * from pol_failures
union all
select * from dn_po_failures