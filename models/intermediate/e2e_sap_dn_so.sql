with
    sol as (select * from {{ ref("e2e_sap_sol") }}),

    soh as (select * from {{ ref("e2e_sap_soh") }}),

    dn_so as (
        select
            t1.vbeln as sales_doc_num,
            t2.erdat,
            concat(
                substr(t2.audat, 6, 2),
                '/',
                substr(t2.audat, 9, 2),
                '/',
                substr(t2.audat, 1, 4)
            ) as documentdate,
            t2.auart,
            t2.netwr,
            t2.vkorg,
            t2.vtweg,
            t2.spart,
            t2.vkgrp,
            t2.knumv,
            t2.kunnr as cust_num,
            t2.aedat,
            t2.bukrs_vf as company_code,
            t2.xblnr as reference,
            t1.posnr as sales_doc_item,
            t1.matnr as mat_num,
            t1.matkl,
            t1.arktx,
            t1.fmeng,
            t1.spart as sol_spart,
            t1.netwr as sol_netwr,
            t1.waerk,
            t1.erdat as sol_erdat,
            t1.netpr,
            t1.kpein,
            t1.kmein,
            t1.werks as plant_code,
            t1.kwmeng,
            t1.vrkme,
            t1.meins,
            t2.augru,
            t1.uepos,
            t1.source,
            t1.region
        from sol t1
        join soh t2 on (t1.vbeln = t2.vbeln)
    )

select * from dn_so
