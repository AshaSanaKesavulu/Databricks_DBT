with matr_dochdr as (

  select mblnr,mjahr,blart,concat(substr(bldat,6,2),'/',substr(bldat,9,2),'/',substr(bldat,1,4)),concat(substr(budat,6,2),'/',substr(budat,9,2),'/',substr(budat,1,4)),source,region 
  from {{ ref('mkpf') }}

)

select * from matr_dochdr