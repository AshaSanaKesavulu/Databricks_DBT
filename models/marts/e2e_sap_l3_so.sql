with
    dn_so as (select * from {{ ref("e2e_sap_dn_so") }}),
    so_type as (select * from {{ ref("e2e_sap_so_type") }}),
    cust as (select * from {{ ref("e2e_sap_cust") }}),
    matr as (select * from {{ ref("e2e_sap_matr") }}),
    plant as (select * from {{ ref("e2e_sap_plant") }}),
    comcd as (select * from {{ref("e2e_sap_comcd")}}),

    l3_so as (

        select
            dn.sales_doc_num,
            dn.sales_doc_item,
            dn.cust_num,
            dn.mat_num,
            mt.maktx,
            dn.arktx,
            dn.sol_netwr as netwr,
            dn.kwmeng,
            dn.vrkme,
            dn.meins,
            dn.netpr,
            dn.kmein,
            cu.cust_country,
            cu.cust_name1,
            cu.cust_name2,
            cu.cust_city,
            cu.cust_postalcode,
            cu.cust_region,
            cu.cust_street,
            cu.cust_telephone,
            cu.cust_fax,
            cu.cust_address,
            dn.reference,
            dn.documentdate,
            so.so_type,
            so.ebeln,
            dn.plant_code as sendingplant,
            plb.plant_code as receivingplant,
            dn.source,
            dn.region,
            dn.company_code

        from dn_so dn

        left outer join so_type so on dn.sales_doc_num = so.sales_doc_num
        left outer join cust cu on dn.cust_num = cu.cust_num
        left outer join matr mt on dn.mat_num = mt.mat_num and mt.mat_num <> '0'
        left outer join plant plb on plb.plant_code = dn.plant_code
        left outer join comcd cc on dn.company_code = cc.bukrs

    )

select * from l3_so