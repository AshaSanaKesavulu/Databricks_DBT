with
    sol as (select * from {{ ref("e2e_sap_sol") }}),

    soh as (select * from {{ ref("e2e_sap_soh") }}),

    dn_so as (
        select
            t1.vbeln,
            t2.erdat,
            t2.audat,
            t2.auart,
            t2.netwr,
            t2.vkorg,
            t2.vtweg,
            t2.spart,
            t2.vkgrp,
            t2.knumv,
            t2.kunnr,
            t2.aedat,
            t2.bukrs_vf,
            t2.xblnr,
            t1.posnr,
            t1.matnr,
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
            t1.werks,
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
