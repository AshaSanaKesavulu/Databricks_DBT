with
    t001w as (select * from {{ ref("t001w") }}),
    plant as (

        select
            werks as plant_code,
            name1 as plantname,
            bwkey,
            kunnr,
            lifnr,
            name2,
            stras as pl_street,
            pfach as pl_pobox,
            pstlz as pl_postalcode,
            ort01 as pl_city,
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