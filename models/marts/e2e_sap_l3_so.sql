with dn_so as (

select dn.vbeln,dn.posnr,dn.kunnr,dn.matnr,mt.maktx,dn.arktx,dn.sol_netwr,dn.kwmeng,dn.vrkme,dn.meins,dn.netpr,dn.kmein,cu.land1,cu.name1,cu.name2,cu.ort01,cu.pstlz,cu.regio,cu.stras,cu.telf1,cu.telfx,cu.adrnr,dn.xblnr, concat(substr(dn.audat,6,2),'/',substr(dn.audat,9,2),'/',substr(dn.audat,1,4)),so.so_type,so.ebeln,dn.werks,plb.werks,dn.source,dn.region 
from e2e_sap_dn_so

),

final as (

select * from dn_so dn
left outer join {{ ref('e2e_sap_so_type') }} so on (dn.vbeln=so.vbeln)
left outer join {{ ref('e2e_sap_cust') }} cu on (dn.kunnr= cu.kunnr)
left outer join {{ ref('e2e_sap_matr') }}  mt on (dn.matnr=mt.matnr and mt.matnr<>'0')
left outer join {{ ref('e2e_sap_plant') }} plb on(plb.werks = dn.werks )

)

select * from final

