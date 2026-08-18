select 
    vbeln as sales_doc_num,
    so_type,
    ebeln
 from {{ source('silver', 'e2e_sap_so_type') }}