with
    vbap as (select * from {{ ref("vbap") }}),
    sol as (
        select
            vbeln,
            cast(posnr as bigint) as posnr,
            matnr,
            matkl,
            arktx,
            {{ parse_sap_number('fmeng') }} as fmeng,
            spart,
            {{ parse_sap_number('netwr') }} as netwr,
            waerk,
            erdat,
            {{ parse_sap_number('netpr') }} as netpr,
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