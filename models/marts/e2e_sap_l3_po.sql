with
    dn_po as (select * from {{ ref("e2e_sap_dn_po") }}),
    po_type as (select * from {{ ref("e2e_sap_po_type") }}),
    po_type as (select * from {{ ref("e2e_sap_matr_seg") }}),
    matr_dochdr as (select * from {{ ref("e2e_sap_matr_dochdr") }}),
    plant as (select * from {{ ref("e2e_sap_plant") }}),
    matr as (select * from {{ ref("e2e_sap_matr") }}),
    vend as (select * from {{ ref("e2e_sap_vend") }}),

    l3_po as (

        select
            dn.ebeln,
            dn.matnr,
            mt.maktx,
            dn.menge,
            dn.ebelp,
            dn.lineitemdesc,
            dn.ekgrp,
            concat(
                substr(dn.aedat, 6, 2),
                '/',
                substr(dn.aedat, 9, 2),
                '/',
                substr(dn.aedat, 1, 4)
            ) as aedat,
            dn.lifnr,
            dn.netwr,
            dn.netpr,
            dn.lmein,
            dn.ekorg,
            dn.zterm,
            ve.name1,
            ve.name2,
            ve.ort01,
            ve.ort02,
            ve.pstlz,
            ve.regio,
            ve.stras,
            ve.adrnr,
            pl.plantdesc,
            pl.stras,
            pl.pfach,
            pl.pstlz,
            pl.ort01,
            po.po_type,
            po.vbeln,
            po.aufnr,
            ma.budat,
            ms.bwart,
            ms.matnr,
            ms.charg,
            ms.menge,
            dn.source,
            dn.region
        from dn_po dn
        left outer join po_type po on (dn.ebeln = po.ebeln)
        left outer join matr_seg ms on (po.aufnr = ms.aufnr and ms.aufnr is not null and ms.aufnr <> '')
        left outer join matr_dochdr ma on (ma.mblnr = ms.mblnr)
        left outer join plant pl on (dn.werks = pl.werks)
        left outer join matr mt on (dn.matnr = mt.matnr and mt.matnr <> '0')
        left outer join vend ve on (dn.lifnr = ve.lifnr)

    )

select * from l3_po
