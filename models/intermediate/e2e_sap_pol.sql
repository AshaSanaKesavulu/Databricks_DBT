with pol as (

  select ebeln,aedat,cast(ebelp as bigint),txz01,matnr,bukrs,werks,cast(regexp_replace(menge,',','') as float),meins,cast  (regexp_replace(netpr,',','') as float),cast(regexp_replace(peinh,',','') as float),cast(regexp_replace(netwr,',','') as float),  cast(regexp_replace(brtwr,',','') as float),banfn,mtart,lmein,null,null,source,region 
  from {{ ref('ekpo') }}

)

select * from pol