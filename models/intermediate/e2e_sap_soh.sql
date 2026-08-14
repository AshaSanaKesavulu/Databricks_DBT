with
    vbak as (select * from {{ ref("vbak") }}),
    soh as (
        select
            vbeln,
            erdat,
            audat,
            auart,
            cast(regexp_replace(netwr, ',', '') as float) as netwr,
            vkorg,
            vtweg,
            spart,
            vkgrp,
            knumv,
            kunnr,
            aedat,
            bukrs_vf,
            xblnr,
            augru,
            source,
            region
        from vbak
    )

select * from soh