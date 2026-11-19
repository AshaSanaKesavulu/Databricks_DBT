with
    dn_so as (select * from {{ ref("e2e_sap_dn_so") }}),
    cust as (select * from {{ ref("e2e_sap_cust") }}),
    so_type as (select * from {{ ref("e2e_sap_so_type") }}),
    plant as (select * from {{ ref("e2e_sap_plant") }}),
    matr_type as (select * from {{ ref("e2e_sap_matr_type") }}),

    ag_mf_so as (

        select
            dn.cust_num as customer_number,
            count(*) as so_count,
            cu.cust_name1,
            dn.company_code,
            dn.mat_num,
            sum(dn.sol_netwr) as netwr,
            dn.plant_code,
            pl.plantname,
            so.so_type,
            mt.material_type,
            dn.source,
            dn.region
        from dn_so dn
        left outer join cust cu on (dn.cust_num = cu.cust_num)
        left outer join so_type so on (dn.sales_doc_num = so.sales_doc_num)
        left outer join plant pl on (dn.plant_code = pl.plant_code)
        left outer join matr_type mt on (dn.mat_num = mt.matnr and mt.matnr <> '0')
        where dn.sol_netwr > 0 and aedat is not null
        group by
            dn.cust_num,
            cu.cust_name1,
            dn.company_code,
            dn.mat_num,
            dn.plant_code,
            pl.plantname,
            so.so_type,
            mt.material_type,
            dn.source,
            dn.region

    )

select * from ag_mf_so
