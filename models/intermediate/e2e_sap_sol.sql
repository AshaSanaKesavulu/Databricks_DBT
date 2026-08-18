with
    vbap as (select * from {{ ref("vbap") }}),
    sol as (
        select
            vbeln,
            cast(posnr as bigint) as posnr,
            matnr,
            matkl,
            arktx,
            cast(regexp_replace(fmeng, ',', '') as float) as fmeng,
            spart,
            cast(regexp_replace(netwr, ',', '') as float) as netwr,
            waerk,
            erdat,
            cast(regexp_replace(netpr, ',', '') as float) as netpr,
            kpein,
            kmein,
            werks,
            kwmeng,
            vrkme,
            meins,
            null as ordertype,
            null as relatedordertype,
            null as bukrs_vf,
            cast(uepos as bigint) as uepos,
            source,
            region
        from vbap
    )

select * from sol