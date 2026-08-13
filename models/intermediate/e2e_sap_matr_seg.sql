with matr_seg as (

    select mblnr,ebeln,bwart,matnr,werks,charg,shkzg,cast(regexp_replace(menge,',','') as float),meins,cast
    (regexp_replace(bualt,',', '') as float),bukrs,aufnr,source,region 
    from {{ ref('mseg') }}

)

select * from matr_seg