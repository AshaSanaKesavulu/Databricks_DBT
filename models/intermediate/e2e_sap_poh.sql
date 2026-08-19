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
            cast(regexp_replace(wkurs, ',', '') as float) as wkurs,
            source,
            region
        from ekko

    )

select * from poh
