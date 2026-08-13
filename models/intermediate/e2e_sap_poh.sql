with poh as (
    
    select ebeln,bukrs,aedat,lifnr,ekorg,ekgrp,zterm,bsart,cast(regexp_replace(wkurs,',','') as float),source,region 
    from {{ ref('ekko') }}

)

select * from poh