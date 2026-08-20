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
            {{ parse_sap_number('menge') }} as menge,
            meins,
            {{ parse_sap_number('bualt') }} as bualt,
            bukrs,
            aufnr,
            source,
            region
        from mseg

    )

select * from matr_seg