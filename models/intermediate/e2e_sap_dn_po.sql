with pol as (

    select t1.ebeln,t2.aedat,t1.lifnr,t1.ekorg,t1.ekgrp,t2.ebelp,t2.lineitemdesc,t2.matnr,t2.bukrs,t2.werks,t2.menge,t2.meins,t2.netpr,t2.peinh,t2.netwr,t2.brtwr,t2.banfn,t2.mtart,t1.zterm,t2.lmein,t1.bsart,t1.wkurs,t2.source,t2.region
    from {{ ref('e2e_sap_pol') }}

),

dn_po as ( 

    select * from pol t2
    join {{ ref('e2e_sap_poh') }} t1 on (t2.ebeln = t1.ebeln)

)

select * from dn_po