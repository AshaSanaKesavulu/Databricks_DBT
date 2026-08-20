with sol_failures as (

    select
        'e2e_sap_sol' as model_name,
        vbeln as document_number,
        posnr as document_item,
        count(*) as row_count
    from {{ ref('e2e_sap_sol') }}
    group by
        vbeln,
        posnr
    having count(*) <> 1

),

dn_so_failures as (

    select
        'e2e_sap_dn_so' as model_name,
        sales_doc_num as document_number,
        sales_doc_item as document_item,
        count(*) as row_count
    from {{ ref('e2e_sap_dn_so') }}
    group by
        sales_doc_num,
        sales_doc_item
    having count(*) <> 1

)

select * from sol_failures
union all
select * from dn_so_failures