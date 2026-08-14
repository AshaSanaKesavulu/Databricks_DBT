with
    mseg as (select * from {{ ref("mseg") }}),
    matr_seg as (

        select
            mblnr,
            ebeln,
            bwart,
            matnr,
            werks,
            charg,
            shkzg,
            cast(regexp_replace(menge, ',', '') as float) as menge,
            meins,
            cast(regexp_replace(bualt, ',', '') as float) as bualt,
            bukrs,
            aufnr,
            source,
            region
        from mseg

    )

select * from matr_seg