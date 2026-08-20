with
    ekpo as (select * from {{ ref("ekpo") }}),
    pol as (

        select
            ebeln,
            aedat,
            cast(ebelp as bigint) as ebelp,
            txz01 as lineitemdesc,
            matnr,
            bukrs,
            werks,
            {{ parse_sap_number('menge') }} as menge,
            meins,
            {{ parse_sap_number('netpr') }} as netpr,
            {{ parse_sap_number('peinh') }} as peinh,
            {{ parse_sap_number('netwr') }} as netwr,
            {{ parse_sap_number('brtwr') }} as brtwr,
            banfn,
            mtart,
            lmein,
            null as ordertype,
            null as relatedordertype,
            source,
            region
        from ekpo

    )

select * from pol