with
    ekko as (select * from {{ ref("ekko") }}),
    poh as (

        select
            ebeln,
            bukrs,
            aedat,
            cast(lifnr as VARCHAR(16777216)) as lifnr,
            ekorg,
            ekgrp,
            zterm,
            bsart,
            {{ parse_sap_number('wkurs') }} as wkurs,
            source,
            region
        from ekko

    )

select * from poh
