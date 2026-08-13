with dn_po as (

select dn.ebeln,dn.matnr,mt.maktx,dn.menge,dn.ebelp,dn.lineitemdesc,dn.ekgrp, concat(substr(dn.aedat,6,2),'/',substr(dn.aedat,9, 2),'/',substr(dn.aedat,1,4)),dn.lifnr,dn.netwr,dn.netpr,dn.lmein,dn.ekorg,dn.zterm,ve.name1,ve.name2,ve.ort01,ve.ort02,ve.pstlz,ve.regio,ve.stras,ve.adrnr,pl.plantdesc,pl.stras,pl.pfach,pl.pstlz,pl.ort01,po.po_type,po.vbeln,po.aufnr,ma.budat,ms.bwart,ms.matnr,ms.charg,ms.menge,dn.source,dn.region
from {{ ref('e2e_sap_dn_po') }}

),

final as (

select * from dn_po dn
left outer join {{ ref('e2e_sap_po_type') }} po on (dn.ebeln=po.ebeln)
left outer join {{ ref('e2e_sap_matr_seg') }} ms on (po.aufnr=ms.aufnr and ms.aufnr is not null and ms.aufnr <> '')
left outer join {{ ref('e2e_sap_matr_dochdr') }} ma on ( ma.mblnr= ms.mblnr)
left outer join {{ ref('e2e_sap_plant') }} pl on (dn.werks=pl.werks)
left outer join {{ ref('e2e_sap_matr') }} mt on (dn.matnr=mt.matnr and mt.matnr<>'0')
left outer join {{ ref('e2e_sap_vend') }} ve on (dn.lifnr=ve.lifnr)

)

select * from final