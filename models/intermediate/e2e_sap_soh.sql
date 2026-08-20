with
    vbak as (select * from {{ ref("vbak") }}),
    soh as (
        select
            vbeln,
            erdat,
            audat,
            auart,
            {{ parse_sap_number('netwr') }} as netwr,
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