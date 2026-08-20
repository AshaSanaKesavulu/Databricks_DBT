with
    mara as (select * from {{ ref("mara") }}),

    makt as (select * from {{ ref("makt") }}),

    t023t as (select * from {{ ref("t023t") }}),

    matr as (

        select
            t2.matnr as mat_num,
            t2.ersda,
            t2.ernam,
            t2.aenam,
            t2.mtart,
            t2.matkl,
            t2.meins,
            t2.bstme,
            {{ parse_sap_number('t2.brgew') }} as brgew,
            {{ parse_sap_number('t2.ntgew') }} as ntgew,
            t2.gewei,
            {{ parse_sap_number('t2.volum') }} as volum,
            t2.voleh,
            t2.spart,
            t2.kunnr,
            t2.xchpf,
            t1.spras,
            t1.maktx,
            t0.wgbez,
            t2.source,
            t2.region

        from mara t2
        left outer join makt t1 on (t2.matnr = t1.matnr)
        left outer join t023t t0 on (t2.matkl = t0.matkl)
        where t0.spras = 'E' and t1.spras = 'E' and t2.matnr <> '0'

    )

select * from matr
