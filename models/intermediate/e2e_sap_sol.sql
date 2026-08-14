with
    vbap as (select * from {{ ref("vbap") }}),
    sol as (
        select
            vbeln,
            cast(posnr as bigint) as posnr,
            matnr,
            matkl,
            arktx,
            cast(regexp_replace(fmeng, ',', '') as float),
            spart,
            cast(regexp_replace(netwr, ',', '') as float),
            waerk,
            erdat,
            cast(regexp_replace(netpr, ',', '') as float),
            kpein,
            kmein,
            werks,
            kwmeng,
            vrkme,
            meins,
            null,
            null,
            null,
            cast(uepos as bigint) as upeos,
            source,
            region
        from vbap
    )

select * from sol