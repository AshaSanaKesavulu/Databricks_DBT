with
    t001w as (select * from {{ ref("t001w") }}),
    plant as (

        select
            werks,
            name1,
            bwkey,
            kunnr,
            lifnr,
            name2,
            stras,
            pfach,
            pstlz,
            ort01,
            ekorg,
            vkorg,
            land1,
            regio,
            counc,
            cityc,
            adrnr,
            txjcd,
            vtweg,
            spart,
            spras,
            source,
            region
        from t001w

    )

select * from plant