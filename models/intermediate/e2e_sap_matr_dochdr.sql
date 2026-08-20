with
    mkpf as (select * from {{- ref("mkpf") -}}),
    matr_dochdr as (

        select
            mblnr,
            mjahr,
            blart,
            {{- format_sap_date('bldat') -}} as bldat,
            {{- format_sap_date('budat') -}} as budat,
            source,
            region
        from mkpf

    )

select * from matr_dochdr
