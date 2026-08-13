with lfa1 as (

select lifnr,land1,name1,name2,ort01,ort02,pfach,pstlz,regio,stras,adrnr,erdat,ernam,ktokk,kunnr,
spras,telf1,telfx,vbund,werks,txjcd,source,region 
from {{ ref('lfa1') }}

)

select * from lfa1

