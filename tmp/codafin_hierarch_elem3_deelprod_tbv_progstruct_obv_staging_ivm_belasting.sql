-- Filenaam: codafin_hierarch_elem3_deelprod_tbv_progstruct_obv_staging_ivm_belasting.sql
-- Functie: query deelproduct hierarchie tbv programmastructuur 
--          query omgeboud van bron op staging database DWH zodat bron net wordt belast
--          Deze query gebrukt staging DWH


-- use codafin
use DWH_STG;
go

-- check ook de queries in SSRS rapporten
-- Referentie DWH sem.SV_DEELPRODUCT

-- vergelijk uitkomst van deze query met queryMajidProgrammaHierarchieElement3.sql

select     element.code,
           element.name,
           grplist.cmpcode,
           grplist.code,
           grplist.grpcode,
           CAST(himlist.code AS VARCHAR(20)) AS hierarchie,
           himlist.l1name,
           himlist.l1hdrtxt,
           himlist.l1order,
           himlist.l2name,
           himlist.l2hdrtxt,
           himlist.l2order,
           himlist.leafname,
           himlist.leafhdrtxt,
           himlist.leaforder
-- from codafin.dbo.oas_element element
from dwh_stg.codafin12.oas_element element
-- left join codafin.dbo.oas_grplist grplist
left join dwh_stg.codafin12.oas_grplist grplist
      on (
          element.cmpcode  = grplist.cmpcode
      and element.code     = grplist.code
      and element.elmlevel = grplist.elmlevel
      )
--inner join codafin.dbo.oas_himlist himlist
inner join dwh_stg.codafin12.oas_himlist himlist
      on (
          himlist.cmpcode = grplist.cmpcode
      and himlist.grpcode = grplist.grpcode     
      )     
where 1=1
  and element.elmlevel = 3 -- deelproduct
go
