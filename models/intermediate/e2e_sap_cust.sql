with
    kna1 as (select * from {{ ref("kna1") }}),

    cust as (
        select
            kunnr as cust_num,
            land1 as cust_country,
            name1 as cust_name1,
            name2 as cust_name2,
            ort01 as cust_city,
            pstlz as cust_postalcode,
            regio as cust_region,
            stras as cust_street,
            telf1 as cust_telephone,
            telfx as cust_fax,
            adrnr as cust_address,
            erdat,
            ernam,
            lifnr,
            vbund,
            source,
            region
        from kna1
    )

select * from cust