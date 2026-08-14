with
    ekpo as (select * from {{ ref("ekpo") }}),
    pol as (

        select
            ebeln,
            aedat,
            cast(ebelp as bigint),
            txz01,
            matnr,
            bukrs,
            werks,
            cast(regexp_replace(menge, ',', '') as float) as menge,
            meins,
            cast(regexp_replace(netpr, ',', '') as float) as netpr,
            cast(regexp_replace(peinh, ',', '') as float) as peinh,
            cast(regexp_replace(netwr, ',', '') as float) as netwr,
            cast(regexp_replace(brtwr, ',', '') as float) as brtwr,
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