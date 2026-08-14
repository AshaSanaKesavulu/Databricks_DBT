with
    kna1 as (select * from {{ ref("kna1") }}),

    cust as (
        select
            kunnr,
            land1,
            name1,
            name2,
            ort01,
            pstlz,
            regio,
            stras,
            telf1,
            telfx,
            adrnr,
            erdat,
            ernam,
            lifnr,
            vbund,
            source,
            region
        from kna1
    )

select * from cust