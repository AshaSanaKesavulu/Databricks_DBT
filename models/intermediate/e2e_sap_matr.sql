with mara as (

  select t2.matnr,t2.ersda,t2.ernam,t2.aenam,t2.mtart,t2.matkl,t2.meins,t2.bstme,cast(regexp_replace(t2.brgew,',','') as float),cast  (regexp_replace(t2.ntgew,',','') as float),t2.gewei,cast(regexp_replace(t2.volum,',','') as float),t2.voleh,t2.spart,t2.kunnr,t2.  xchpf,t1.spras,t1.maktx,t0.wgbez,t2.source,t2.region
  from {{ ref('mara') }}

),

matr as (

  select * from mara t2 
  left outer join {{ ref('makt') }} t1 on (t2.matnr=t1.matnr )
  left outer join {{ ref('t023t') }} t0 on (t2.matkl=t0.matkl )
  where t0.spras="e" and t1.spras="e" and t2.matnr <>'0'

)

select * from matr