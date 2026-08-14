with
    mkpf as (select * from {{ ref("mkpf") }}),
    matr_dochdr as (

        select
            mblnr,
            mjahr,
            blart,
            concat(
                substr(bldat, 6, 2), '/', substr(bldat, 9, 2), '/', substr(bldat, 1, 4)
            ) as bldat,
            concat(
                substr(budat, 6, 2), '/', substr(budat, 9, 2), '/', substr(budat, 1, 4)
            ) as budat,
            source,
            region
        from mkpf

    )

select * from matr_dochdr
