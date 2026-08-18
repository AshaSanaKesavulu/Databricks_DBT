with
    dn_so as (select * from {{ ref("e2e_sap_dn_so") }}),
    so_type as (select * from {{ ref("e2e_sap_so_type") }}),
    cust as (select * from {{ ref("e2e_sap_cust") }}),
    matr as (select * from {{ ref("e2e_sap_matr") }}),
    plant as (select * from {{ ref("e2e_sap_plant") }}),

    l3_so as (

        select
            dn.vbeln,
            dn.posnr,
            dn.kunnr,
            dn.matnr,
            mt.maktx,
            dn.arktx,
            dn.sol_netwr as netwr,
            dn.kwmeng,
            dn.vrkme,
            dn.meins,
            dn.netpr,
            dn.kmein,
            cu.land1 as cust_country,
            cu.name1 as cust_name1,
            cu.name2 as cust_name2,
            cu.ort01 as cust_city,
            cu.pstlz as cust_postalcode,
            cu.regio as cust_region,
            cu.stras as cust_street,
            cu.telf1 as cust_telephone,
            cu.telfx as cust_fax,
            cu.adrnr as cust_address,
            dn.xblnr as reference,
            concat(
                substr(dn.audat, 6, 2),
                '/',
                substr(dn.audat, 9, 2),
                '/',
                substr(dn.audat, 1, 4)
            ) as documentdate,
            so.so_type,
            so.ebeln,
            dn.werks as sendingplant,
            plb.werks as receivingplant,
            dn.source,
            dn.region

        from dn_so dn

        left outer join so_type so on dn.vbeln = so.vbeln
        left outer join cust cu on dn.kunnr = cu.kunnr
        left outer join matr mt on dn.matnr = mt.matnr and mt.matnr <> '0'
        left outer join plant plb on plb.werks = dn.werks

    )

select * from l3_so