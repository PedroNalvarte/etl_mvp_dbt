

select distinct
  r.id_region as region_id,
  r.nombre_region as region,
  p.nombre_pais as country
from "etl-server"."staging"."stg_region" r
join "etl-server"."staging"."stg_pais" p on r.id_region = p.id_region